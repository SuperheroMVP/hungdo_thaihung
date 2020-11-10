<?php

namespace App\Admin\Controllers;

use App\Admin\Admin;
use App\Http\Controllers\Controller;
use App\Models\ShopAttributeGroup;
use App\Models\ShopCountry;
use App\Models\ShopCurrency;
use App\Models\ShopDebtUser;
use App\Models\ShopOrder;
use App\Models\ShopOrderStatus;
use App\Models\ShopPaymentStatus;
use App\Models\ShopProduct;
use App\Models\ShopProvider;
use App\Models\ShopProviderOrder;
use App\Models\ShopProviderOrderTotal;
use App\Models\ShopProviderRoleOrder;
use App\Models\ShopShippingStatus;
use App\Models\ShopDebtProvider;
use App\Models\ShopUser;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use App\Models\ShopOrderTotal;
use Pusher\Pusher;


class ManagerConfirmController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     *
     */

    public function __construct()
    {
        $this->statusOrder = ShopOrderStatus::getListStatus();
        $this->statusOrderMap = ShopOrderStatus::mapValue();
        $this->currency = ShopCurrency::getList();
        $this->country = ShopCountry::getArray();
        $this->countryMap = ShopCountry::mapValue();
        $this->statusPayment = ShopPaymentStatus::getListStatus();
        $this->statusShipping = ShopShippingStatus::getListStatus();
        $this->statusShippingMap = ShopShippingStatus::mapValue();
        $this->statusPaymentMap = ShopPaymentStatus::mapValue();

    }

    public function index()
    {
        $data = [
            'title' => trans('order.admin.list'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => route('admin_order.delete'),
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
            'id' => trans('order.admin.id'),
            'first_name' => 'Tên',
            'phone' => 'Số ĐT',
            'email' => trans('order.admin.email'),
            'subtotal' => trans('order.admin.subtotal'),
            'shipping' => trans('order.admin.shipping'),
            'discount' => trans('order.admin.discount'),
            'total' => trans('order.admin.total'),
            'created_at' => trans('order.admin.created_at'),
            'action' => trans('order.admin.action'),
        ];
        $sort_order = request('sort_order') ?? 'id_desc';
        $keyword = request('keyword') ?? '';
        $order_status = request('order_status') ?? '';
        $arrSort = [
            'id__desc' => trans('order.admin.sort_order.id_desc'),
            'id__asc' => trans('order.admin.sort_order.id_asc'),
            'email__desc' => trans('order.admin.sort_order.email_desc'),
            'email__asc' => trans('order.admin.sort_order.email_asc'),
            'created_at__desc' => trans('order.admin.sort_order.date_desc'),
            'created_at__asc' => trans('order.admin.sort_order.date_asc'),
        ];
        $obj = new ShopOrder;
        if (Admin::user()->provider_id) {
            $obj = $obj->whereRaw('provider_id = ' . Admin::user()->provider_id);
        }
        if ($keyword) {
            $obj = $obj->whereRaw('(id = ' . (int)$keyword . ' OR email like "%' . $keyword . '%" )');
        }
        if ((int)$order_status) {
            $obj = $obj->where('status', (int)$order_status);
        }
//        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
//            $field = explode('__', $sort_order)[0];
//            $sort_field = explode('__', $sort_order)[1];
//            $obj = $obj->orderBy($field, $sort_field);
//
//        } else {
        $obj = $obj->where('status', 2)->orderBy('id', 'desc');
//        }
        $dataTmp = $obj->paginate(0);
        $styleStatus = $this->statusOrder;
        array_walk($styleStatus, function (&$v, $k) {
            $v = '<span class="label label-' . (ShopOrder::$mapStyleStatus[$k] ?? 'default') . '">' . $v . '</span>';
        });
        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataTr[] = [
                'id' => $row['id'],
                'first_name' => $row['first_name'],
                'phone' => $row['phone'] ?? 'N/A',
                'email' => $row['email'] ?? 'N/A',
                'subtotal' => sc_currency_render_symbol($row['subtotal'] ?? 0, $row['currency']),
                'shipping' => sc_currency_render_symbol($row['shipping'] ?? 0, $row['currency']),
                'discount' => sc_currency_render_symbol($row['discount'] ?? 0, $row['currency']),
                'total' => sc_currency_render_symbol($row['total'] ?? 0, $row['currency']),
                'created_at' => $row['created_at'],
                'action' => '
                                <a href="' . route('admin_order.detail', ['id' => $row['id']]) . '"><span title="' . trans('order.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

                                <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>'
                ,
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('order.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);


//menuRight
        $data['menuRight'][] = '<a href="' . route('admin_order.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
                           <i class="fa fa-plus" title="' . trans('admin.add_new') . '"></i>
                           </a>';
//=menuRight

//menuSort
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('admin_order.index');
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch
        $optionStatus = '';
        foreach ($this->statusOrder as $key => $status) {
            $optionStatus .= '<option  ' . (($order_status == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }
        $data['topMenuRight'][] = '
                <form action="' . route('admin_order.index') . '" id="button_search">
                   <div onclick="$(this).submit();" class="btn-group pull-right">
                           <a class="btn btn-flat btn-primary" title="Refresh">
                              <i class="fa  fa-search"></i>
                           </a>
                   </div>
                   <div class="btn-group pull-right">
                         <div class="form-group">
                           <input type="text" name="keyword" class="form-control" placeholder="' . trans('order.admin.search_place') . '" value="' . $keyword . '">
                         </div>
                   </div>

                   <div class="btn-group pull-right"  style="margin-right: 10px">
                        <div class="form-group">
                           <select class="form-control" name="order_status">
                             <option value="">' . trans('order.admin.search_order.status') . '</option>
                             ' . $optionStatus . '
                            </select>
                        </div>
                    </div>
                </form>';
//=menuSearch

        // Custom Order
        $orderStatus = $this->statusOrder;
        $statusOrderMap = $this->statusOrderMap;
//        foreach ($orderStatus as $key => $status) {
        $dataDaily = ShopProviderOrder::where('status', 2)->get();
        $dataLe = ShopOrder::where('status', 2)->get();
//            if (ShopOrder::where('status', $key)->get()->count()){
//                if (Admin::user()->provider_id){
//                    $dataTable[$status] = ShopOrder::where('status', $key)->where('provider_id',Admin::user()->provider_id)->orderBy('id', 'desc')->get();
//                }
//                else{
//                    $dataTable[$status] = ShopOrder::where('status', $key)->orderBy('id', 'desc')->get();
//                }
//            }
//            else{
//                $dataTable[$status] = null;
//            }
//        }

        // Modify Order Status And Not Allow For Previous State
        if (Admin::user()->provider_role) {
            $providerOrderRole = ShopProviderRoleOrder::with('orderStatus')->where('role_id', Admin::user()->provider_role)->get();
            $statusOrderMap = [];
            foreach ($providerOrderRole as $key => $status) {
                $statusOrderMap[$status->orderStatus->id] = $status->orderStatus->name;
            }
        }

        return view('admin.screen.confirm-order', ['orderStatus' => $orderStatus, 'dataDaily' => $dataDaily, 'dataLe' => $dataLe, "statusOrderMap" => $statusOrderMap])
            ->with($data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $id = $request->id;
        if ($request->status == 1) {
            $order = ShopOrder::findOrFail($id);
            $order->status = $request->status;
            $order->comment = $request->comment;
            $order->save();

            //send notify to admin and supplier product.
            $notify['title'] = 'Có một đơn hàng mới cần được xem lại!';
            $notify['url'] = '/sc_admin/order/detail/'. $order->id;
            $notify['account'] = 'telesale';
            $optionsNotify = array(
                'cluster' => 'ap1',
                'encrypted' => true
            );
            $pusher = new Pusher(
                'f870174d851ebfccd4a3',
                '998357dece219ddb630b',
                '1036425',
                $optionsNotify
            );
            $pusher->trigger('NotificationNewOrder', 'send-message', $notify);
            //dd($pusher);

        } else {
            $order = ShopOrder::findOrFail($id);
//            dd($order);
            if ($request->action == 1 && $order->status == 2) {
                $order->status = 3;
                $user= ShopUser::find($order->user_id);
                $user->debt += $order->balance;
                $user->total_payment += $order->total;
                $user->save();

                $debt_user_order= new ShopDebtUser();
                $debt_user_order->user_id= $order->user_id;
                $debt_user_order->order_id= $order->id;
                $debt_user_order->type= "Đơn hàng";
                $debt_user_order->time= date("Y/m/d H:i:s");
                $debt_user_order->total= 0;
                $debt_user_order->value= $order->total;
                $debt_user_order->outstanding_customer_debt= $user->debt;
                $debt_user_order->save();
//                dd("fjhsdgflkdhjflsdfkdslf");
            } else {
                $order->status = 7;
            }
            $order->save();
            if ($order->status == 3) {
                //send notify to admin and supplier product.
                $notify['title'] = 'Có một đơn hàng mới được phê duyệt!';
                $notify['url'] = '/sc_admin/order/show/' . $order->id;
                $notify['account'] = 'telesale';
                $optionsNotify = array(
                    'cluster' => 'ap1',
                    'encrypted' => true
                );
                $pusher = new Pusher(
                    'f870174d851ebfccd4a3',
                    '998357dece219ddb630b',
                    '1036425',
                    $optionsNotify
                );
                $pusher->trigger('NotificationNewOrder', 'send-message', $notify);
                //dd($pusher);
            }
        }
        return redirect()->route('manager.confirm.index');
    }

    public function managerCheckProviderOrder(Request $request)
    {
        $id = $request->id;
        if ($request->status == 1) {
            $order = ShopProviderOrder::findOrFail($id);
            $order->status = $request->status;
            $order->comment = $request->comment;
            $order->save();

            //send notify to admin and supplier product.
            $notify['title'] = 'Có một đơn hàng mới cần được xem lại!';
            $notify['url'] = '/sc_admin/provider_order/detail/' . $order->id;
            $notify['account'] = 'telesale';
            $optionsNotify = array(
                'cluster' => 'ap1',
                'encrypted' => true
            );
            $pusher = new Pusher(
                'f870174d851ebfccd4a3',
                '998357dece219ddb630b',
                '1036425',
                $optionsNotify
            );
            $pusher->trigger('NotificationNewOrder', 'send-message', $notify);
            //dd($pusher);

        } else {
            $order = ShopProviderOrder::findOrFail($id);
//            dd($order);
            $provider = ShopProvider::findOrFail($order->provider_id);
            $order->status = $request->status;
            $order->save();

            $debt_provider_order= new ShopDebtProvider();
            $debt_provider_order->provider_id= $order->provider_id;
            $debt_provider_order->provider_order_id= $order->id;
            $debt_provider_order->type= "Đơn hàng";
            $debt_provider_order->time= date("Y/m/d H:i:s");
            $debt_provider_order->total= 0;
            $debt_provider_order->value= $order->total;
            $debt_provider_order->outstanding_customer_debt= $provider->debt + $debt_provider_order->outstanding_customer_debt;
            $debt_provider_order->save();

            $provider->debt= $provider->debt + $order->balance;
            $provider->total_payment= $provider->total_payment + $order->total;
            $provider->save();
//            dd($debt_provider_order);

            if ($order->status == 3) {
                //send notify to admin and supplier product.
                $notify['title'] = 'Có một đơn hàng mới được phê duyệt!';
                $notify['url'] = '/sc_admin/provider_order/show/' . $order->id;
                $notify['account'] = 'telesale';
                $optionsNotify = array(
                    'cluster' => 'ap1',
                    'encrypted' => true
                );
                $pusher = new Pusher(
                    'f870174d851ebfccd4a3',
                    '998357dece219ddb630b',
                    '1036425',
                    $optionsNotify
                );
                $pusher->trigger('NotificationNewOrder', 'send-message', $notify);
                //dd($pusher);
            }
        }
        return redirect()->route('manager.confirm.index');
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $order = ShopOrder::find($id);
        if ($order === null) {
            return 'no data';
        }
        $products = ShopProduct::getArrayProductName();
        $paymentMethodTmp = sc_get_plugin_installed('payment', $onlyActive = false);
        foreach ($paymentMethodTmp as $key => $value) {
            $paymentMethod[$key] = sc_language_render($value->detail);
        }
        $shippingMethodTmp = sc_get_plugin_installed('shipping', $onlyActive = false);
        foreach ($shippingMethodTmp as $key => $value) {
            $shippingMethod[$key] = sc_language_render($value->detail);
        }
        // Modify Order Status And Not Allow For Previous State
        $statusOrderMap = $this->statusOrderMap;
        $providerOrderRole = ShopProviderRoleOrder::with('orderStatus')->get();
        $statusOrderMap = [];
        foreach ($providerOrderRole as $key => $status) {
            if ($status->orderStatus->sort >= ShopOrderStatus::where('id', $order->status)->first()->sort) {
                $statusOrderMap[$status->orderStatus->id] = $status->orderStatus->name;
            }
        }
        return view('admin.screen.confirm_order_show')->with(
            [
                "title" => trans('order.order_detail'),
                "subTitle" => '',
                'icon' => 'fa fa-file-text-o',
                "order" => $order,
                "products" => $products,
                "statusOrder" => $this->statusOrder,
                "statusPayment" => $this->statusPayment,
                "statusShipping" => $this->statusShipping,
                "statusOrderMap" => $statusOrderMap,
                "statusShippingMap" => $this->statusShippingMap,
                "statusPaymentMap" => $this->statusPaymentMap,
                'dataTotal' => ShopOrderTotal::getTotal($id),
                'attributesGroup' => ShopAttributeGroup::pluck('name', 'id')->all(),
                'paymentMethod' => $paymentMethod,
                'shippingMethod' => $shippingMethod,
                'countryMap' => $this->countryMap,
                'provider' => ShopProvider::where('id', $order->provider_id)->first(),
            ]);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function showProviderOrder($id)
    {
        $order = ShopProviderOrder::find($id);
        if ($order === null) {
            return 'no data';
        }
        $products = ShopProduct::getArrayProductName();
        $paymentMethodTmp = sc_get_plugin_installed('payment', $onlyActive = false);
        foreach ($paymentMethodTmp as $key => $value) {
            $paymentMethod[$key] = sc_language_render($value->detail);
        }
        $shippingMethodTmp = sc_get_plugin_installed('shipping', $onlyActive = false);
        foreach ($shippingMethodTmp as $key => $value) {
            $shippingMethod[$key] = sc_language_render($value->detail);
        }
        // Modify Order Status And Not Allow For Previous State
        $statusOrderMap = $this->statusOrderMap;
        $providerOrderRole = ShopProviderRoleOrder::with('orderStatus')->get();
        $statusOrderMap = ShopOrderStatus::all();
        foreach ($providerOrderRole as $key => $status) {
            if ($status->orderStatus->sort >= ShopOrderStatus::where('id', $order->status)->first()->sort) {
                $statusOrderMap[$status->orderStatus->id] = $status->orderStatus->name;
            }
        }
        return view('admin.screen.confirm_provider_order_show')->with(
            [
                "title" => trans('order.order_detail'),
                "subTitle" => '',
                'icon' => 'fa fa-file-text-o',
                "order" => $order,
                "products" => $products,
                "statusOrder" => $this->statusOrder,
                "statusPayment" => $this->statusPayment,
                "statusShipping" => $this->statusShipping,
                "statusOrderMap" => $statusOrderMap,
                "statusShippingMap" => $this->statusShippingMap,
                "statusPaymentMap" => $this->statusPaymentMap,
                'dataTotal' => ShopProviderOrderTotal::getTotal($id),
                'attributesGroup' => ShopAttributeGroup::pluck('name', 'id')->all(),
                'paymentMethod' => $paymentMethod,
                'shippingMethod' => $shippingMethod,
                'countryMap' => $this->countryMap,
                'provider' => ShopProvider::where('id', $order->provider_id)->first(),
            ]
        );
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        return "update" . $id;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return "delete" . $id;
    }
}
