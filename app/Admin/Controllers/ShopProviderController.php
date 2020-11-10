<?php
#app/Http/Admin/Controllers/ShopProviderController.php
namespace App\Admin\Controllers;

use App\Admin\Admin;
use App\Http\Controllers\Controller;
use App\Models\ShopProduct;
use App\Models\ShopProvider;
use App\Models\ShopSupplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;

class ShopProviderController extends Controller
{
    protected $userProvider;


    public function index()
    {
        $data = [
            'title' => 'Danh sách Đại lý',
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => route('admin_provider.delete'),
            'removeList' => 0, // 1 - Enable function delete list item
            'buttonRefresh' => 0, // 1 - Enable button refresh
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
            'id' => 'ID',
            'name' => 'Tên đại lý',
            'avatar' => 'Ảnh đại diện',
            'email' => trans('supplier.email'),
            'phone' => trans('supplier.phone'),
            'province' => 'Tỉnh',
            'action' => trans('supplier.admin.action'),
        ];

        $sort_order = request('sort_order') ?? 'id_desc';
        $keyword = request('keyword') ?? '';
        $arrSort = [
            'id__desc' => trans('supplier.admin.sort_order.id_desc'),
            'id__asc' => trans('supplier.admin.sort_order.id_asc'),
            'name__desc' => trans('supplier.admin.sort_order.name_desc'),
            'name__asc' => trans('supplier.admin.sort_order.name_asc'),
            'email__desc' => trans('supplier.admin.sort_order.email_desc'),
            'email__asc' => trans('supplier.admin.sort_order.email_asc'),
        ];
        $obj = new ShopProvider;
        if (Admin::user()->provider_id){
            $obj = $obj->whereRaw('id = '. Admin::user()->provider_id);
        }
        if ($keyword) {
            $obj = $obj->whereRaw('(email like "%' . $keyword . '%" OR name like "%' . $keyword . '%" )');
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
            $dataTr[] = [
                'id' => $row['id'],
                'name' => $row['name'],
                'avatar' => sc_image_render($row->getThumb(), '50px', '50px', $row['name']),
                'email' => $row['email'],
                'phone' => $row['phone'],
                'province' => $row['province'],
                'action' => '
                    <a href="' . route('admin_provider.edit', ['id' => $row['id']]) . '"><span title="' . trans('supplier.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;
                    <a href="' . route('admin_provider.show', ['id' => $row['id']]) . '"><span title="' . 'Chỉnh sửa sản phẩm' . '" type="button" class="btn btn-flat btn-warning"><i class="fa fa-book"></i></span></a>&nbsp;

                  <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('supplier.admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>
                  ',
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('supplier.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);

//menuRight
        $data['menuRight'][] = '<a href="' . route('admin_provider.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
        <i class="fa fa-plus" title="'.trans('admin.add_new').'"></i>
                           </a>';
//=menuRight

//menuSort        
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('admin_provider.index');
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch        
            $data['topMenuRight'][] = '
                <form action="' . route('admin_provider.index') . '" id="button_search">
                   <div onclick="$(this).submit();" class="btn-group pull-right">
                           <a class="btn btn-flat btn-primary" title="Refresh">
                              <i class="fa  fa-search"></i>
                           </a>
                   </div>
                   <div class="btn-group pull-right">
                         <div class="form-group">
                           <input type="text" name="keyword" class="form-control" placeholder="' . trans('supplier.admin.search_place') . '" value="' . $keyword . '">
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
        $data = [
            'title' => 'Tạo đại lý',
            'subTitle' => '',
            'title_description' => 'Tạo đại lý',
            'icon' => 'fa fa-plus',
            'supplier' => [],
            'url_action' => route('admin_provider.create'),
        ];
        return view('admin.screen.provider')
            ->with($data);
    }

/**
 * Post create new order in admin
 * @return [type] [description]
 */
    public function postCreate()
    {
        $data = request()->all();

        $data['alias'] = !empty($data['alias'])?$data['alias']:$data['name'];
        $data['alias'] = sc_word_format_url($data['alias']);
        $data['alias'] = sc_word_limit($data['alias'], 100);

        $validator = Validator::make($data, [
            'avatar' => 'required',
            'cover' => 'required',
            'name' => 'required|string|max:100',
            'alias' => 'required|regex:/(^([0-9A-Za-z\-_]+)$)/|unique:'.SC_DB_PREFIX.'shop_providers,alias|string|max:100',
            'phone' => 'numeric|required',
            'email' => 'email|required',
            'province' => 'required',
            'type' => 'required',
        ],[
            'name.required' => trans('validation.required', ['attribute' => trans('supplier.name')]),
            'alias.regex' => trans('supplier.alias_validate'),
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput($data);
        }

        $dataInsert = [
            'avatar' => $data['avatar'],
            'cover' => $data['cover'],
            'name' => $data['name'],
            'alias' => $data['alias'],
            'email' => $data['email'],
            'province' => $data['province'],
            'district' => $data['district'],
            'ward' => $data['ward'],
            'address' => $data['address'],
            'phone' => $data['phone'],
            'type' => $data['type'],
            'lat' => $data['lat'],
            'lng' => $data['lng'],
        ];
        ShopProvider::create($dataInsert);

        return redirect()->route('admin_provider.index')->with('success', trans('supplier.admin.create_success'));

    }

/**
 * Form edit
 */
    public function edit($id)
    {
        $supplier = ShopProvider::find($id);
        if ($supplier === null) {
            return 'no data';
        }
        if (Admin::user()->provider_id){
            if ($supplier->id != Admin::user()->provider_id){
                return 'You have not permission to change this record!';
            }
        }
        $data = [
            'title' => trans('supplier.admin.edit'),
            'subTitle' => '',
            'title_description' => '',
            'icon' => 'fa fa-pencil-square-o',
            'supplier' => $supplier,
            'url_action' => route('admin_provider.edit', ['id' => $supplier['id']]),
        ];
        return view('admin.screen.provider')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit($id)
    {
        $supplier = ShopProvider::find($id);
        if (Admin::user()->provider_id){
            if ($supplier->id != Admin::user()->provider_id){
                return 'You have not permission to change this record!';
            }
        }
        $data = request()->all();
        $langFirst = array_key_first(sc_language_all()->toArray()); //get first code language active
        $data['alias'] = !empty($data['alias'])?$data['alias']:$data['descriptions'][$langFirst]['name'];
        $data['alias'] = sc_word_format_url($data['alias']);
        $data['alias'] = sc_word_limit($data['alias'], 100);
//        $data['alias'] = !empty($data['alias'])?$data['alias']:$data['name'];
//        $data['alias'] = sc_word_format_url($data['alias']);
//        $data['alias'] = sc_word_limit($data['alias'], 100);

        $validator = Validator::make($data, [
            'avatar' => 'required',
            'cover' => 'required',
            'name' => 'required|string|max:100',
            'alias' => 'required|regex:/(^([0-9A-Za-z\-_]+)$)/|unique:'.SC_DB_PREFIX.'shop_providers,alias,'.$supplier->id.',id|string|max:100',
            'phone' => 'numeric|required',
            'email' => 'email|required',
            'province' => 'required',
            'type' => 'required',
        ],[
            'name.required' => trans('validation.required', ['attribute' => trans('supplier.name')]),
            'alias.regex' => trans('supplier.alias_validate'),
        ]);
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput($data);
        }
//Edit
        $dataUpdate = [
            'avatar' => $data['avatar'],
            'cover' => $data['cover'],
            'name' => $data['name'],
            'alias' => $data['alias'],
            'email' => $data['email'],
            'province' => $data['province'],
            'district' => $data['district'],
            'ward' => $data['ward'],
            'address' => $data['address'],
            'phone' => $data['phone'],
            'type' => $data['type'],
            'lat' => $data['lat'],
            'lng' => $data['lng'],
        ];
        $supplier->update($dataUpdate);

//
        return redirect()->route('admin_provider.index')->with('success', trans('supplier.admin.edit_success'));

    }

/*
Delete list item
Need mothod destroy to boot deleting in model
 */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => 'Method not allow!']);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            ShopProvider::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

    public function show($id)
    {
        $supplier = ShopProvider::find($id);
        if ($supplier === null) {
            return 'no data';
        }
        if (Admin::user()->provider_id){
            if ($supplier->id != Admin::user()->provider_id){
                return 'You have not permission to change this record!';
            }
        }
        $data = [
            'title' => 'Chỉnh sửa sản phẩm đại lý',
            'subTitle' => '',
            'title_description' => '',
            'icon' => 'fa fa-pencil-square-o',
            'supplier' => $supplier,
            'url_action' => route('admin_provider.show', ['id' => $supplier['id']]),
            'products' => $products = (new ShopProduct)->getData(),
        ];

        return view('admin.screen.provider-product')
            ->with($data);
    }

    public function postShow($id)
    {
        $provider = ShopProvider::find($id);
        if ($provider === null) {
            return 'no data';
        }
        if (Admin::user()->provider_id){
            if ($provider->id != Admin::user()->provider_id){
                return 'You have not permission to change this record!';
            }
        }
        $data = request()->all();
        $dataUpdate = [
            'products' => $data['products'],
        ];

        $provider->update($dataUpdate);

        return redirect()->route('admin_provider.index')->with('success', trans('supplier.admin.edit_success'));
    }

}
