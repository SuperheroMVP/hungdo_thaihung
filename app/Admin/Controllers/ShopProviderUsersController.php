<?php
#app/Http/Admin/Controllers/UsersController.php
namespace App\Admin\Controllers;

use App\Admin\Admin;
use App\Admin\Models\AdminPermission;
use App\Admin\Models\AdminRole;
use App\Admin\Models\AdminUser;
use App\Http\Controllers\Controller;
use App\Models\ShopProvider;
use App\Models\ShopProviderRole;
use Illuminate\Http\Request;
use Validator;

class ShopProviderUsersController extends Controller
{
//    Extend Auth/UsersController
    public function index()
    {
        $data = [
            'title' => trans('user.admin.list'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => route('admin_provider_user.delete'),
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
            'id' => trans('user.id'),
            'username' => trans('user.user_name'),
            'name' => trans('user.name'),
            'provider' => 'Thuộc đại lý',
            'permission' => 'Chức vụ',
            'created_at' => trans('user.created_at'),
            'action' => trans('user.admin.action'),
        ];
        $sort_order = request('sort_order') ?? 'id_desc';
        $keyword = request('keyword') ?? '';
        $arrSort = [
            'id__desc' => trans('user.admin.sort_order.id_desc'),
            'id__asc' => trans('user.admin.sort_order.id_asc'),
            'username__desc' => trans('user.admin.sort_order.username_desc'),
            'username__asc' => trans('user.admin.sort_order.username_asc'),
            'name__desc' => trans('user.admin.sort_order.name_desc'),
            'name__asc' => trans('user.admin.sort_order.name_asc'),
        ];
//        $obj = (new AdminUser)->with('providerRole')->whereNotNull('provider_id');
        $obj = (new AdminUser)->with('providerRole')->where('provider_id', Admin::user()->provider_id);

        if ($keyword) {
            $obj = $obj->whereRaw('(id = ' . (int) $keyword . '  OR name like "%' . $keyword . '%" OR username like "%' . $keyword . '%"  )');
        }
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
            $showRoles = '';
            if ($row['provider_id']) {
                $providerName = ShopProvider::where('id', $row['provider_id'])->first()->name;
            }
            $dataTr[] = [
                'id' => $row['id'],
                'username' => $row['username'],
                'name' => $row['name'],
                'provider' => ($providerName)?? 'N/A',
                'permission' => ($row->providerRole) ? '<span class="label label-info">' . $row->providerRole->name . '</span> ' : '',
                'created_at' => $row['created_at'],
                'action' => '
                    <a href="' . route('admin_provider_user.edit', ['id' => $row['id']]) . '"><span title="' . trans('user.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;
                    ' . ((Admin::user()->id == $row['id'] || in_array($row['id'], SC_GUARD_ADMIN)) ? '' : '<span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>')
                ,
            ];
        }
        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('user.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);

//menuRight
        $data['menuRight'][] = '<a href="' . route('admin_provider_user.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
                           <i class="fa fa-plus" title="'.trans('admin.add_new').'"></i>
                           </a>';
//=menuRight

//menuSort
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('admin_provider_user.index');
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch
        $data['topMenuRight'][] = '
                <form action="' . route('admin_provider_user.index') . '" id="button_search">
                   <div onclick="$(this).submit();" class="btn-group pull-right">
                           <a class="btn btn-flat btn-primary" title="Refresh">
                              <i class="fa  fa-search"></i>
                           </a>
                   </div>
                   <div class="btn-group pull-right">
                         <div class="form-group">
                           <input type="text" name="keyword" class="form-control" placeholder="' . trans('user.admin.search_place') . '" value="' . $keyword . '">
                         </div>
                   </div>
                </form>';
//=menuSearch


        return view('admin.screen.list')
            ->with($data);
    }

/**
 * Form create new order in admin
 * @return [type] [description]
 */
    public function create()
    {
        $providers = ShopProvider::where('status',1)->get();
        $providerRole = ShopProviderRole::all();
        $data = [
            'title' => trans('user.admin.add_new_title'),
            'subTitle' => '',
            'title_description' => trans('user.admin.add_new_des'),
            'icon' => 'fa fa-plus',
            'user' => [],
            'providers' => $providers,
            'roles' => $providerRole,
            'url_action' => route('admin_provider_user.create'),

        ];

        return view('admin.screen.provider_user')
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
            'name' => 'required|string|max:100',
            'username' => 'required|regex:/(^([0-9A-Za-z@\._]+)$)/|unique:'.SC_DB_PREFIX.'admin_user,username|string|max:100|min:3',
            'avatar' => 'nullable|string|max:255',
            'password' => 'required|string|max:60|min:6|confirmed',
            'email' => 'required|string|email|max:255|unique:'.SC_DB_PREFIX.'admin_user,email',
            'provider_role' => 'required|numeric',
        ], [
            'username.regex' => trans('user.username_validate'),
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        if (!Admin::user()->provider_id || Admin::user()->provider_role != 1){
            return redirect()->route('admin_provider_user.index')->with('error', 'Bạn không có quyền thêm thông tin!');
        }

        $dataInsert = [
            'name' => $data['name'],
            'username' => strtolower($data['username']),
            'avatar' => $data['avatar'],
            'email' => strtolower($data['email']),
            'password' => bcrypt($data['password']),
            'provider_id' => (Admin::user()->provider_id) ?? null,
            'provider_role' => ($data['provider_role']) ?? null,
        ];

        $user = AdminUser::createUser($dataInsert);

        // Chọn mặc định cho Module với quyền có ID = 7 Trong bảng sc_admin_role
        $user->roles()->attach(7);

        return redirect()->route('admin_provider_user.index')->with('success', trans('user.admin.create_success'));

    }

/**
 * Form edit
 */
    public function edit($id)
    {
        $user = AdminUser::find($id);
        $providers = ShopProvider::where('status',1)->get();
        $providerRole = ShopProviderRole::all();
        if ($user === null) {
            return 'no data';
        }
        $data = [
            'title' => trans('user.admin.edit'),
            'subTitle' => '',
            'title_description' => '',
            'icon' => 'fa fa-pencil-square-o',
            'user' => $user,
            'providers' => $providers,
            'roles' => $providerRole,
//            'roles' => (new AdminRole)->pluck('name', 'id')->all(),
//            'permission' => (new AdminPermission)->pluck('name', 'id')->all(),
            'url_action' => route('admin_provider_user.edit', ['id' => $user['id']]),
        ];
        return view('admin.screen.provider_user')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit($id)
    {
        $user = AdminUser::find($id);
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'name' => 'required|string|max:100',
            'username' => 'required|regex:/(^([0-9A-Za-z@\._]+)$)/|unique:'.SC_DB_PREFIX.'admin_user,username,' . $user->id . '|string|max:100|min:3',
            'avatar' => 'nullable|string|max:255',
            'password' => 'nullable|string|max:60|min:6|confirmed',
            'email' => 'required|string|email|max:255|unique:'.SC_DB_PREFIX.'admin_user,email,' . $user->id,
        ], [
            'username.regex' => trans('user.username_validate'),
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
//Edit
        if (!Admin::user()->provider_id || Admin::user()->provider_role != 1){
            return redirect()->route('admin_provider_user.index')->with('error', 'Bạn không có quyền sửa thông tin!');
        }

        $dataUpdate = [
            'name' => $data['name'],
            'username' => strtolower($data['username']),
            'avatar' => $data['avatar'],
            'email' => strtolower($data['email']),
            'provider_role' => $data['provider_role'],

        ];
        if ($data['password']) {
            $dataUpdate['password'] = bcrypt($data['password']);
        }
        AdminUser::updateInfo($dataUpdate, $id);

        if(!in_array($user->id, SC_GUARD_ADMIN)) {
            $user->roles()->detach();
            $user->roles()->attach(7);
        }


//
        return redirect()->route('admin_provider_user.index')->with('success', trans('user.admin.edit_success'));

    }

/*
Delete list Item
Need mothod destroy to boot deleting in model
 */
    public function deleteList()
    {
        if (!request()->ajax() || !Admin::user()->provider_id || Admin::user()->provider_role != 1) {
            return response()->json(['error' => 1, 'msg' => 'Bạn không có quyền để xóa!']);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            $arrID = array_diff($arrID, SC_GUARD_ADMIN);
            AdminUser::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

}
