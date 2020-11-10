<?php
#app/Http/Admin/Controllers/ShopProviderController.php
namespace App\Admin\Controllers;

use App\Admin\Admin;
use App\Http\Controllers\Controller;
use App\Models\ShopDebtProvider;
use App\Models\ShopDebtProviderDiscription;
use App\Models\ShopDebtUser;
use App\Models\ShopDebtUserDescription;
use App\Models\ShopOrder;
use App\Models\ShopOrderHistoryPayment;
use App\Models\ShopOrderTotal;
use App\Models\ShopProduct;
use App\Models\ShopProvider;
use App\Models\ShopProviderOrder;
use App\Models\ShopProviderOrderHistoryPayment;
use App\Models\ShopProviderOrderTotal;
use App\Models\ShopUser;
use App\Models\ShopSupplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;

class ShopDebtUserController extends Controller
{
    protected $userProvider;


    public function index()
    {
        $data = [
            'title' => 'Danh sách khách hàng',
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => route('admin_user.delete'),
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
            'name' => 'Tên khách hàng',
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
        $obj = new ShopUser();
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
            $dataTr[] = [
                'id' => $row['id'],
                'name' => $row['first_name'],
                'email' => $row['email'],
                'phone' => $row['phone'],
                'province' => $row['address2'],
                'debt' => number_format($row['debt']),
                'total_payment' => number_format($row['total_payment']),
                'action' => '
                    <a href="' . route('admin_user_debt.detail_user_debt', ['id' => $row['id']]) . '"><span title="' . 'Xem công nợ' . '" type="button" class="btn btn-flat btn-warning"><i class="fa fa-book"></i></span></a>&nbsp;
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

        $data['urlSort'] = route('admin_user_debt.index');
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch
        $data['topMenuRight'][] = '
                <form action="' . route('admin_user_debt.index') . '" id="button_search">
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
//        dd($data);
        // cap nhat lai cong no cho dai ly
        $User= ShopUser::find($data['user_id']);
        $User->debt = $data['no_sau'];
        $User->save();

        // luu thong tin lan thanh toan cong no
        $debtUser= new ShopDebtUser();
        $debtUser->user_id = $data['user_id'];
        $debtUser->type = "Thanh toán";
        $debtUser->time = $data['date'];
        $debtUser->total = $data['value_debt'];
        $debtUser->value = $data['thu_tu_khach'];
        $debtUser->outstanding_customer_debt = $data['no_sau'];
        $debtUser->note = $data['note'];
        $debtUser->save();
        // sua lai thong tin thanh toan cho don hang
        if (count($data['debt_user']) > 0){
            foreach ($data['debt_user'] as $key => $data_debt){
                if($data_debt==null ||$data_debt=='' ||$data_debt== 0){
                    continue;
                }
                $user_order= ShopOrder::find($key);

                // luu lai chi tiet thanh toan cong no
                $ShopDebtUserDescription= new ShopDebtUserDescription();
                $ShopDebtUserDescription->debt_user_id = $debtUser->id;
                $ShopDebtUserDescription->user_order_id = $key;
                $ShopDebtUserDescription->date = date("Y/m/d");
                $ShopDebtUserDescription->total = $user_order->total;
                $ShopDebtUserDescription->received = $user_order->received;
                $ShopDebtUserDescription->collect_more = $data_debt;
                $ShopDebtUserDescription->save();

                // sua lai cong no cua don hang
                $user_order->received = $user_order->received + $data_debt;
                $user_order->balance = $user_order->total - $user_order->received;
                $user_order->save();
                $user_order_total= ShopOrderTotal::where('order_id', $user_order->id)->where('code', 'received')->first();
                $user_order_total->value = $user_order->received;
                $user_order_total->text = number_format($user_order->received)."đ";
                $user_order_total->save();

                // luu lai lich su thanh toan cho don hang
                $user_order_history_payment= new ShopOrderHistoryPayment();
                $user_order_history_payment->order_id= $key;
                $user_order_history_payment->date= date("Y/m/d");
                $user_order_history_payment->cost= $data_debt;
                $user_order_history_payment->note= $data['note'];
                $user_order_history_payment->save();
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
        $ShopDebtUser= ShopDebtUser::find($id);
//        dd($ShopDebtProvider);
        // cap nhat lai cong no cho dai ly
        $user= ShopUser::find($ShopDebtUser->user_id);
        $user->debt = $user->debt + $ShopDebtUser->value;
        $user->save();

        // sua lai thong tin thanh toan cho don hang
        $debt_user_description= ShopDebtUserDescription::where('debt_user_id', $ShopDebtUser->id)->get();
        if (count($debt_user_description) > 0){
            foreach ($debt_user_description as $key => $data_debt_des){
//                dd($data_debt_des);
                // sua lai cong no cua don hang
                $order= ShopOrder::find($data_debt_des->user_order_id);
                if ($order) {
                    $order->received = $data_debt_des->received;
                    $order->balance = $data_debt_des->total - $data_debt_des->received;
                    $order->save();
                    $user_order_total = ShopOrderTotal::where('order_id', $order->id)->where('code', 'received')->first();
                    $user_order_total->value = $order->received;
                    $user_order_total->text = number_format($order->received) . "đ";
                    $user_order_total->save();

                    // luu lai lich su thanh toan cho don hang
                    $user_order_history_payment = new ShopOrderHistoryPayment();
                    $user_order_history_payment->order_id = $key;
                    $user_order_history_payment->date = date("Y/m/d");
                    $user_order_history_payment->cost = $data_debt_des->received;
                    $user_order_history_payment->note = "Cập nhật lại thông tin đơn hàng do công nợ bị thay đổi";
                    $user_order_history_payment->save();
                }
                // luu lai chi tiet thanh toan cong no
                $debtUserDescription= ShopDebtUserDescription::find($data_debt_des->id);
                $debtUserDescription->delete();
            }
        }
        $ShopDebtUser->delete();

        return back()->with('success', trans('Xóa dữ liệu thành công'));
    }

    public function show($id)
    {
        $data['debt_provider'] = ShopDebtUser::find($id);
        $data['debt_provider_description'] = ShopDebtUserDescription::where('debt_user_id', $data['debt_provider']->id)->get();
        return $data;
    }

    public function show_order($id)
    {
        $data['debt_user'] = ShopDebtUser::find($id);
        $data['user_order'] = ShopOrder::find($data['debt_user']->order_id);
        return $data;
    }

    public function postShow($id)
    {
        //
    }

    public function detail_user_debt($id)
    {
        $user = ShopUser::find($id);
        $debt_user_list= ShopOrder::where('balance', '>', 0)->where('status', '>', 2)->get();

        if ($user === null) {
            return 'no data';
        }
//        $debt_provider = ShopDebtProvider::where('provider_id', $id)->get();

        $data = [
            'title' => 'Công nợ khách hàng: ' . $user->name,
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
        $obj = new ShopDebtUser();
        $obj = $obj->where('user_id', $id);

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
                    <a href="/sc_admin/debt_user/delete/' . $row['id'] . '" class="btn  btn-danger  btn-flat" title="Xóa" onclick="return confirm(`Dữ liệu này sẽ bị xóa!`)">
                        <i class="fa fa-trash" title="' . trans('admin.delete') . '"></i>
                    </a>                    
                ',
                ];
//                <a href="/sc_admin/debt_user/delete/' . $row['id'] . '" class="btn  btn-danger  btn-flat" title="Xóa" onclick="return confirm(`Dữ liệu này sẽ bị xóa!`)">
//                        <i class="fa fa-trash" title="' . trans('admin.delete') . '"></i>
//                    </a>
            }else {
                $dataTr[] = [
                    'id' => $row['id'],
                    'time' => $row['time'],
                    'type' => $row['type'],
                    'debt' => number_format($row['value']),
                    'outstanding_customer_debt' => number_format($row['outstanding_customer_debt']),
                    'action' => '
                    <span title="Chi tiết" type="button" data-id="' . $row['id'] . '" class="btn btn-flat btn-warning view_debt" data-toggle="modal" data-target="#view_debt"><i class="fa fa-eye"></i></span>&nbsp;
                    <a href="/sc_admin/debt_user/delete/' . $row['id'] . '" class="btn  btn-danger  btn-flat" title="Xóa" onclick="return confirm(`Dữ liệu này sẽ bị xóa!`)">
                        <i class="fa fa-trash" title="' . trans('admin.delete') . '"></i>
                    </a>                    
                ',
                ];
//                <a href="/sc_admin/debt_user/delete/' . $row['id'] . '" class="btn  btn-danger  btn-flat" title="Xóa" onclick="return confirm(`Dữ liệu này sẽ bị xóa!`)">
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

        $data['urlSort'] = route('admin_user_debt.detail_user_debt', $id);
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch
//        dd($user);
        $data['topMenu'][] = '
            <div class="row">
            <div class="col-md-4">
                <p><b>Tên: </b>'.$user->name.'</p>
                <p><b>Số điện thoại: </b>'.$user->phone.'</p>
                <p><b>Email: </b>'.$user->email.'</p>
            </div>
            <div class="col-md-4">
                <p><b>Địa chỉ: </b>'.$user->address .',  '.$user->address1 .',  '.$user->address2 .'</p>
                <p><b>Tỉnh: </b>'.$user->address2.'</p>
            </div>
            <div class="col-md-4">
                <p><b>Tổng công nợ: </b>'.number_format($user->debt).'</p>
                <p><b>Tổng tiền giao dịch: </b>'.number_format($user->total_payment).'</p>
            </div>
        </div>
        ';
        $data['debt_provider_list'] = $debt_user_list;
        $data['provider'] = $user;
//=menuSearch
//dd($debt_user_list);
        return view('admin.screen.list_debt_user')->with($data);
    }

    public function create_debt_provider(Request $request)
    {
        return back();
    }

}
