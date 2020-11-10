<?php
#app/Http/Admin/Controllers/ShopProviderController.php
namespace App\Admin\Controllers;

use App\Admin\Admin;
use App\Http\Controllers\Controller;
use App\Models\ShopDebtProvider;
use App\Models\ShopDebtProviderDiscription;
use App\Models\ShopProduct;
use App\Models\ShopProvider;
use App\Models\ShopProviderOrder;
use App\Models\ShopProviderOrderHistoryPayment;
use App\Models\ShopProviderOrderTotal;
use App\Models\ShopSupplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use phpDocumentor\Reflection\Type;
use Validator;

class ShopDebtProviderController extends Controller
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
            'email' => trans('supplier.email'),
            'phone' => trans('supplier.phone'),
            'province' => 'Tỉnh',
            'debt' => 'Tổng nợ',
            'total_sale' => 'Tổng bán',
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
        if (Admin::user()->provider_id) {
            $obj = $obj->where('Type', 0)->whereRaw('id = ' . Admin::user()->provider_id);
        }
        if ($keyword) {
            $obj = $obj->where('Type', 0)->whereRaw('(email like "%' . $keyword . '%" OR name like "%' . $keyword . '%" )');
        }

        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $obj = $obj->where('Type', 0)->orderBy($field, $sort_field);

        } else {
            $obj = $obj->where('Type', 0)->orderBy('id', 'desc');
        }
        $dataTmp = $obj->paginate(20);

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataTr[] = [
                'id' => $row['id'],
                'name' => $row['name'],
                'email' => $row['email'],
                'phone' => $row['phone'],
                'province' => $row['province'],
                'debt' => $row['debt'],
                'total_sale' => $row['total_sale'],
                'action' => '
                    <a href="' . route('admin_provider_debt.detail_provider_debt', ['id' => $row['id']]) . '"><span title="' . 'Xem công nợ' . '" type="button" class="btn btn-flat btn-warning"><i class="fa fa-book"></i></span></a>&nbsp;
                ',
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('supplier.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);

//menuRight
        $data['menuRight'][] = '';
//        $data['menuRight'][] = '<a href="' . route('admin_provider.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
//        <i class="fa fa-plus" title="'.trans('admin.add_new').'"></i>
//                           </a>';
//=menuRight

//menuSort
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('admin_provider_debt.index');
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch
        $data['topMenuRight'][] = '
                <form action="' . route('admin_provider_debt.index') . '" id="button_search">
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
        //
    }

    /**
     * Post create new order in admin
     * @return [type] [description]
     */
    public function postCreate()
    {
        $data = request()->all();

        // cap nhat lai cong no cho dai ly
        $debtProvider= ShopProvider::find($data['provider_id']);
        $debtProvider->debt = $data['no_sau'];
        $debtProvider->save();

        // luu thong tin lan thanh toan cong no
        $debtProvider= new ShopDebtProvider();
        $debtProvider->provider_id = $data['provider_id'];
        $debtProvider->provider_order_id = 0;
        $debtProvider->type = "Thanh toán";
        $debtProvider->time = $data['date'];
        $debtProvider->total = $data['value_debt'];
        $debtProvider->value = $data['thu_tu_khach'];
        $debtProvider->outstanding_customer_debt = $data['no_sau'];
        $debtProvider->note = $data['note'];
        $debtProvider->save();
        // sua lai thong tin thanh toan cho don hang
        if (count($data['debt_provider']) > 0){
            foreach ($data['debt_provider'] as $key => $data_debt){
                if($data_debt==null ||$data_debt=='' ||$data_debt== 0){
                    continue;
                }
                $provider_order= ShopProviderOrder::find($key);

                // luu lai chi tiet thanh toan cong no
                $debtProviderDescription= new ShopDebtProviderDiscription();
                $debtProviderDescription->debt_provider_id = $debtProvider->id;
                $debtProviderDescription->provider_order_id = $key;
                $debtProviderDescription->date = date("Y/m/d");
                $debtProviderDescription->total = $provider_order->total;
                $debtProviderDescription->received = $provider_order->received;
                $debtProviderDescription->collect_more = $data_debt;
                $debtProviderDescription->save();

                // sua lai cong no cua don hang
                $provider_order->received = $provider_order->received + $data_debt;
                $provider_order->balance = $provider_order->total - $provider_order->received;
                $provider_order->save();
                $provider_order_total= ShopProviderOrderTotal::where('order_id', $provider_order->id)->where('code', 'received')->first();
                $provider_order_total->value = $provider_order->received;
                $provider_order_total->text = number_format($provider_order->received)."đ";
                $provider_order_total->save();

                // luu lai lich su thanh toan cho don hang
                $provider_order_history_payment= new ShopProviderOrderHistoryPayment();
                $provider_order_history_payment->provider_order_id= $key;
                $provider_order_history_payment->date= date("Y/m/d");
                $provider_order_history_payment->cost= $data_debt;
                $provider_order_history_payment->note= $data['note'];
                $provider_order_history_payment->save();
            }
        }

        return back()->with('success', trans('supplier.admin.create_success'));

    }

    /**
     * Form edit
     */
    public function edit($id)
    {
        //
    }

    /**
     * update status
     */
    public function postEdit($id)
    {
        //
    }

    /*
    Delete list item
    Need mothod destroy to boot deleting in model
     */
    public function deleteList($id)
    {
        $ShopDebtProvider= ShopDebtProvider::find($id);
//        dd($ShopDebtProvider);
        // cap nhat lai cong no cho dai ly
        $debtProvider= ShopProvider::find($ShopDebtProvider->provider_id);
        $debtProvider->debt = $debtProvider->debt + $ShopDebtProvider->value;
        $debtProvider->save();

        // sua lai thong tin thanh toan cho don hang
        $debt_provider_description= ShopDebtProviderDiscription::where('debt_provider_id', $ShopDebtProvider->id)->get();
        if (count($debt_provider_description) > 0){
            foreach ($debt_provider_description as $key => $data_debt_des) {
//                dd($data_debt_des);
                // sua lai cong no cua don hang
                $provider_order = ShopProviderOrder::find($data_debt_des->provider_order_id);
                if ($provider_order){
                    $provider_order->received = $data_debt_des->received;
                    $provider_order->balance = $data_debt_des->total - $data_debt_des->received;
                    $provider_order->save();

                    $provider_order_total= ShopProviderOrderTotal::where('order_id', $provider_order->id)->where('code', 'received')->first();
                    $provider_order_total->value = $provider_order->received;
                    $provider_order_total->text = number_format($provider_order->received)."đ";
                    $provider_order_total->save();

                    // luu lai lich su thanh toan cho don hang
                    $provider_order_history_payment= new ShopProviderOrderHistoryPayment();
                    $provider_order_history_payment->provider_order_id= $key;
                    $provider_order_history_payment->date= date("Y/m/d");
                    $provider_order_history_payment->cost= $data_debt_des->received;
                    $provider_order_history_payment->note= "Cập nhật lại thông tin đơn hàng do công nợ bị thay đổi";
                    $provider_order_history_payment->save();
                }
                // luu lai chi tiet thanh toan cong no
                $debtProviderDescription= ShopDebtProviderDiscription::find($data_debt_des->id);
                $debtProviderDescription->delete();
            }
        }
        $ShopDebtProvider->delete();

        return back()->with('success', trans('Xóa dữ liệu thành công'));
    }

    public function show($id)
    {
        $data['debt_provider'] = ShopDebtProvider::find($id);
        $data['debt_provider_description'] = ShopDebtProviderDiscription::where('debt_provider_id', $data['debt_provider']->id)->get();
        return $data;
    }

    public function show_order($id)
    {
        $data['debt_provider'] = ShopDebtProvider::find($id);
        $data['provider_order'] = ShopProviderOrder::find($data['debt_provider']->provider_order_id);
        return $data;
    }

    public function postShow($id)
    {
        //
    }

    public function detail_provider_debt($id)
    {
        $provider = ShopProvider::find($id);
        $debt_provider_list= ShopProviderOrder::where('provider_id', $provider->id)->where('balance', '>', 0)->where('status', '>', 2)->get();

        if ($provider === null) {
            return 'no data';
        }
//        $debt_provider = ShopDebtProvider::where('provider_id', $id)->get();

        $data = [
            'title' => 'Công nợ đại lý: ' . $provider->name,
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
            'time' => 'Thời gian',
            'type' => 'Loại',
            'debt' => 'Giá trị',
            'outstanding_customer_debt' => 'Dư nợ',
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
        $obj = new ShopDebtProvider;
        $obj = $obj->where('provider_id', $id);

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
//dd($dataTmp);
        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            if ($row['type'] == "Đơn hàng") {
                $dataTr[] = [
                    'id' => $row['id'],
                    'time' => $row['time'],
                    'type' => $row['type'],
                    'debt' => number_format($row['value']),
                    'outstanding_customer_debt' => number_format($row['outstanding_customer_debt']),
                    'action' => '
                    <span title="Chi tiết" type="button" data-id="' . $row['id'] . '" class="btn btn-flat btn-warning view_order" data-toggle="modal" data-target="#view_order"><i class="fa fa-eye"></i></span>&nbsp;
                    <a href="/sc_admin/debt/delete/' . $row['id'] . '" class="btn  btn-danger  btn-flat" title="Xóa" onclick="return confirm(`Dữ liệu này sẽ bị xóa!`)">
                        <i class="fa fa-trash" title="' . trans('admin.delete') . '"></i>
                    </a>                    
                ',
                ];
//                <a href="/sc_admin/debt/delete/' . $row['id'] . '" class="btn  btn-danger  btn-flat" title="Xóa" onclick="return confirm(`Dữ liệu này sẽ bị xóa!`)">
//                        <i class="fa fa-trash" title="' . trans('admin.delete') . '"></i>
//                    </a>
            }else{
                $dataTr[] = [
                    'id' => $row['id'],
                    'time' => $row['time'],
                    'type' => $row['type'],
                    'debt' => number_format($row['value']),
                    'outstanding_customer_debt' => number_format($row['outstanding_customer_debt']),
                    'action' => '
                    <span title="Chi tiết" type="button" data-id="' . $row['id'] . '" class="btn btn-flat btn-warning view_debt" data-toggle="modal" data-target="#view_debt"><i class="fa fa-eye"></i></span>&nbsp;
                    <a href="/sc_admin/debt/delete/' . $row['id'] . '" class="btn  btn-danger  btn-flat" title="Xóa" onclick="return confirm(`Dữ liệu này sẽ bị xóa!`)">
                        <i class="fa fa-trash" title="' . trans('admin.delete') . '"></i>
                    </a>
                ',
                ];
//                <a href="/sc_admin/debt/delete/' . $row['id'] . '" class="btn  btn-danger  btn-flat" title="Xóa" onclick="return confirm(`Dữ liệu này sẽ bị xóa!`)">
//                        <i class="fa fa-trash" title="' . trans('admin.delete') . '"></i>
//                    </a>
            }
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('supplier.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);

//menuRight
//        $data['menuRight'][] = '';
        $data['menuRight'][] = '
        <a href="" class="btn  btn-success  btn-flat" title="New" id="button_create_new" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-plus" title="' . trans('admin.add_new') . '"></i>
        </a>';
//=menuRight

//menuSort
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('admin_provider_debt.detail_provider_debt', $id);
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch
//        dd($provider);
        $data['topMenu'][] = '
            <div class="row">
            <div class="col-md-4">
                <p><b>Tên: </b>'.$provider->name.'</p>
                <p><b>Số điện thoại: </b>'.$provider->phone.'</p>
                <p><b>Email: </b>'.$provider->email.'</p>
            </div>
            <div class="col-md-4">
                <p><b>Địa chỉ: </b>'.$provider->address .',  '.$provider->ward .',  '.$provider->district .'</p>
                <p><b>Tỉnh: </b>'.$provider->province.'</p>
            </div>
            <div class="col-md-4">
                <p><b>Tổng công nợ: </b>'.number_format($provider->debt).'</p>
                <p><b>Tổng tiền giao dịch: </b>'.number_format($provider->total_payment).'</p>
            </div>
        </div>
        ';
        $data['debt_provider_list'] = $debt_provider_list;
        $data['provider'] = $provider;
//=menuSearch
//dd($debt_provider_list);
        return view('admin.screen.list_debt_provider')->with($data);
    }

    public function create_debt_provider(Request $request)
    {
        return back();
    }

}
