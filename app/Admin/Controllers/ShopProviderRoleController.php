<?php
#app/Http/Admin/Controllers/ShopProviderRoleController.php
namespace App\Admin\Controllers;

use App\Admin\Admin;
use App\Admin\Models\AdminPermission;
use App\Http\Controllers\Controller;
use App\Models\ShopOrderStatus;
use App\Models\ShopProviderRole;
use App\Models\ShopProviderRoleOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Validator;

class ShopProviderRoleController extends Controller
{


    public function index()
    {
        $data = [
            'title' => trans('permission.admin.list'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => route('provider_role.delete'),
            'removeList' => 1, // 1 - Enable function delete list item
            'buttonRefresh' => 1, // 1 - Enable button refresh
            'buttonSort' => 1, // 1 - Enable button sort
            'css' => '', 
            'js' => '',
        ];
        //Process add content
        $data['menuRight'] = sc_config_group('menuRight', \Request::route()->getName());
        $data['menuLeft'] = sc_config_group('menuLeft', \Request::route()->getName());
        $data['topMenuRight'] = sc_config_group('topMenuRight', \Request::route()->getName());
        $data['topMenuLeft'] = sc_config_group('topMenuLeft', \Request::route()->getName());
        $data['blockBottom'] = sc_config_group('blockBottom', \Request::route()->getName());

        $listTh = [
            'id' => trans('permission.id'),
            'name' => trans('permission.name'),
            'slug' => trans('permission.slug'),
            'permission' => 'Quyền hạn',
            'created_at' => 'Tạo lúc',
            'action' => trans('permission.admin.action'),
        ];
        $sort_order = request('sort_order') ?? 'id_desc';
        $arrSort = [
            'id__desc' => trans('permission.admin.sort_order.id_desc'),
            'id__asc' => trans('permission.admin.sort_order.id_asc'),
            'name__desc' => trans('permission.admin.sort_order.name_desc'),
            'name__asc' => trans('permission.admin.sort_order.name_asc'),
        ];
        $obj = new ShopProviderRole;
        $obj = $obj->with('roleOrder');
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $obj = $obj->orderBy($field, $sort_field);

        } else {
            $obj = $obj->orderBy('id', 'desc');
        }
        $dataTmp = $obj->paginate(20);

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $providerRoles = [];
            foreach ($row->roleOrder as $role){
                array_push($providerRoles, $role->orderStatus->name);
            }
            $providerRoles = implode(', ', $providerRoles);
            $dataTr[] = [
                'id' => $row['id'],
                'name' => $row['name'],
                'slug' => $row['slug'],
                'permission' => $providerRoles,
                'created_at' => date_format($row['created_at'],'H:i:s - d/m/Y'),
                'action' => '
                    <a href="' . route('provider_role.edit', ['id' => $row['id']]) . '"><span title="' . trans('permission.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;
                    <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>'
                ,
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('permission.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);

//menuRight
        $data['menuRight'][] = '<a href="' . route('provider_role.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
                           <i class="fa fa-plus" title="'.trans('admin.add_new').'"></i>
                           </a>';
//=menuRight

//menuSort
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('provider_role.index');
        $data['optionSort'] = $optionSort;
//=menuSort

        return view('admin.screen.list')
            ->with($data);
    }

/**
 * Form create new order in admin
 * @return [type] [description]
 */
    public function create()
    {

        $orderStatus = ShopOrderStatus::all();

        $data = [
            'title' => trans('permission.admin.add_new_title'),
            'subTitle' => '',
            'title_description' => trans('permission.admin.add_new_des'),
            'icon' => 'fa fa-plus',
            'permission' => [],
            'orderStatus' => $orderStatus,
            'arrStatusSelected' => array(),
            'url_action' => route('provider_role.create'),

        ];

        return view('admin.screen.provider_role')
            ->with($data);
    }

/**
 * Post create new order in admin
 * @return [type] [description]
 */
    public function postCreate()
    {
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'name' => 'required|string|max:50|unique:'.SC_DB_PREFIX.'provider_role,name',
            'slug' => 'required|regex:/(^([0-9A-Za-z\._\-]+)$)/|unique:'.SC_DB_PREFIX.'provider_role,slug|string|max:50|min:3',
        ], [
            'slug.regex' => trans('permission.slug_validate'),
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        $dataInsert = [
            'name' => $data['name'],
            'slug' => $data['slug'],
        ];
        $permission = ShopProviderRole::createPermission($dataInsert);
        if ($data['order_status']){
            for ($i = 0; $i < count($data['order_status']); $i++){
                $roleOrder = new ShopProviderRoleOrder;
                $roleOrder->role_id = $permission->id;
                $roleOrder->order_status_id = $data['order_status'][$i];
                $roleOrder->save();
            }
        }

        return redirect()->route('provider_role.index')->with('success', trans('permission.admin.create_success'));

    }

/**
 * Form edit
 */
    public function edit($id)
    {
        $permission = ShopProviderRole::with('roleOrder')->where('id', $id)->first();

        if ($permission === null) {
            return 'no data';
        }

        $orderStatus = ShopOrderStatus::all();
        $arrStatusSelected = [];
        foreach ($permission->roleOrder as $status){
            array_push($arrStatusSelected, $status->order_status_id);
        }

        $data = [
            'title' => trans('permission.admin.edit'),
            'subTitle' => '',
            'title_description' => '',
            'icon' => 'fa fa-pencil-square-o',
            'permission' => $permission,
            'orderStatus' => $orderStatus,
            'arrStatusSelected' => $arrStatusSelected,
            'url_action' => route('provider_role.edit', ['id' => $permission['id']]),
        ];
        return view('admin.screen.provider_role')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit($id)
    {
        $permission = ShopProviderRole::find($id);
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'name' => 'required|string|max:50|unique:'.SC_DB_PREFIX.'provider_role,name,' . $permission->id . '',
            'slug' => 'required|regex:/(^([0-9A-Za-z\._\-]+)$)/|unique:'.SC_DB_PREFIX.'provider_role,slug,' . $permission->id . '|string|max:50|min:3',
        ], [
            'slug.regex' => trans('permission.slug_validate'),
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
//Edit

        $dataUpdate = [
            'name' => $data['name'],
            'slug' => $data['slug'],
        ];

        $permission->update($dataUpdate);

        // Change Provider_Role_Order_Model
        if ($data['order_status']){
            ShopProviderRoleOrder::where('role_id', $id)->delete();
            for ($i = 0; $i < count($data['order_status']); $i++){
                $roleOrder = new ShopProviderRoleOrder;
                $roleOrder->role_id = $permission->id;
                $roleOrder->order_status_id = $data['order_status'][$i];
                $roleOrder->save();
            }
        }
//
        return redirect()->route('provider_role.index')->with('success', trans('permission.admin.edit_success'));

    }

/*
Delete list Item
Need mothod destroy to boot deleting in model
 */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => 'Method not allow!']);
        } else {
            $ids = request('ids');

            $arrID = explode(',', $ids);
            ShopProviderRole::destroy($arrID);
            ShopProviderRoleOrder::where('role_id', $arrID)->delete();
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

    public function without()
    {
        $prefix = SC_ADMIN_PREFIX?SC_ADMIN_PREFIX.'/':'';
        return [
            $prefix . 'login',
            $prefix . 'logout',
            $prefix . 'forgot',
            $prefix . 'deny',
            $prefix . 'locale',
            $prefix . 'uploads',
        ];
    }

}
