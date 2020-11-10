<?php
#app/Http/Admin/Controllers/ShopCategoryController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopCategory;
use App\Models\ShopCategoryDescription;
use App\Models\ShopLanguage;
use App\Models\ShopTag;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Validator;

class ShopTagController extends Controller
{
    public $languages;

    public function __construct()
    {
        $this->languages = ShopLanguage::getList();

    }

    public function index()
    {
        $data = [
            'title' => trans('category.admin.list'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => route('admin_tag.delete'),
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
            'id' => trans('category.id'),
            'title' => trans('category.title'),
            'slug' => 'Slug',
            'status' => trans('category.status'),
            'action' => trans('category.admin.action'),
        ];
        $sort_order = request('sort_order') ?? 'id_desc';
        $keyword = request('keyword') ?? '';
        $arrSort = [
            'id__desc' => trans('category.admin.sort_order.id_desc'),
            'id__asc' => trans('category.admin.sort_order.id_asc'),
            'title__desc' => trans('category.admin.sort_order.title_desc'),
            'title__asc' => trans('category.admin.sort_order.title_asc'),
        ];

        $obj = new ShopTag();

        /*$obj = $obj
            ->leftJoin(SC_DB_PREFIX.'shop_category_description', SC_DB_PREFIX.'shop_category_description.category_id', SC_DB_PREFIX.'shop_category.id')
            ->where(SC_DB_PREFIX.'shop_category_description.lang', sc_get_locale());
        if ($keyword) {
            $obj = $obj->whereRaw('(id = ' . (int) $keyword . ' OR '.SC_DB_PREFIX.'shop_category_description.title like "%' . $keyword . '%" )');
        }
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $obj = $obj->orderBy($field, $sort_field);

        } else {
            $obj = $obj->orderBy('id', 'desc');
        }*/
        $dataTmp = $obj->paginate(20);

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataTr[] = [
                'id' => $row['id'],
                'title' => $row['title'],
                'slug'=>$row['slug'],
                'status' => $row['status'] ? '<span class="label label-success">ON</span>' : '<span class="label label-danger">OFF</span>',
                'action' => '
                    <a href="' . route('admin_tag.edit', ['id' => $row['id']]) . '"><span title="' . trans('category.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

                    <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>'
                ,
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('category.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);


//menuRight
        $data['menuRight'][] = '<a href="' . route('admin_tag.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
        <i class="fa fa-plus" title="'.trans('admin.add_new').'"></i>
        </a>';
//=menuRight

//menuSort        
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('admin_category.index');
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch        
        $data['topMenuRight'][] = '
                <form action="' . route('admin_tag.index') . '" id="button_search">
                   <div onclick="$(this).submit();" class="btn-group pull-right">
                           <a class="btn btn-flat btn-primary" title="Refresh">
                              <i class="fa  fa-search"></i>
                           </a>
                   </div>
                   <div class="btn-group pull-right">
                         <div class="form-group">
                           <input type="text" name="keyword" class="form-control" placeholder="' . trans('category.admin.search_place') . '" value="' . $keyword . '">
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
            'title' => 'Thêm tag mới',
            'subTitle' => '',
            'title_description' => 'Tạo mới một tag',
            'icon' => 'fa fa-plus',
            'languages' => $this->languages,
            'tag' => [],
            'tags' => ShopTag::where('status',1)->get(),
            'url_action' => route('admin_tag.create'),

        ];

        return view('admin.screen.tag')
            ->with($data);
    }

/**
 * Post create new order in admin
 * @return [type] [description]
 */
    public function postCreate()
    {
        $data = request()->all();
        $validator = Validator::make($data, [
            'title' => 'required|unique:sc_shop_tags,title',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput($data);
        }

        $dataInsert = [
            'title' => $data['title'],
            'slug' => Str::slug($data['title']),
            'status' => !empty($data['status']) ? 1 : 0,
        ];
        ShopTag::create($dataInsert);

        return redirect()->route('admin_tag.index')->with('success', 'Thêm tag thành công');

    }

/**
 * Form edit
 */
    public function edit($id)
    {
        $tag = ShopTag::find($id);
        if ($tag === null) {
            return 'no data';
        }
        $data = [
            'title' => 'Thêm tag mới',
            'subTitle' => '',
            'title_description' => 'Tạo mới một tag',
            'icon' => 'fa fa-plus',
            'languages' => $this->languages,
            'tag' => $tag,
            'tags' => ShopTag::where('status',1)->get(),
            'url_action' => route('admin_tag.edit', ['id'=>$id]),
        ];
        return view('admin.screen.tag')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit($id)
    {
        $tag = ShopTag::find($id);
        $data = request()->all();

        $validator = Validator::make($data, [
            'title' => 'required|'.Rule::unique('sc_shop_tags','title',$id),
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput($data);
        }
//Edit

        $dataUpdate = [
            'title' => $data['title'],
            'slug' => Str::slug($data['title']),
            'status' => empty($data['status']) ? 0 : 1,
        ];

        $tag->update($dataUpdate);

//
        return redirect()->route('admin_tag.index')->with('success', 'Sửa tag thành công');

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
            ShopTag::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

}
