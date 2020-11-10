<?php
#app/Http/Admin/Controllers/ShopOrderController.php
namespace App\Admin\Controllers;

use App\Admin\Admin;
use App\Http\Controllers\Controller;
use App\Models\ShopAttributeGroup;
use App\Models\ShopCountry;
use App\Models\ShopCurrency;
use App\Models\ShopOrder;
use App\Models\ShopOrderDetail;
use App\Models\ShopOrderStatus;
use App\Models\ShopOrderTotal;
use App\Models\ShopPaymentStatus;
use App\Models\ShopProduct;
use App\Models\ShopProvider;
use App\Models\ShopProviderOrder;
use App\Models\ShopProviderRoleOrder;
use App\Models\ShopShippingStatus;
use App\Models\ShopUser;

use App\Models\ShopOrderDivide;
use App\Models\ShopOrderDivideProduct;

use DB;
use Illuminate\Http\Request;
use Pusher\Pusher;
use Validator;

use App\Models\ShopOrderHistoryPayment;


class ShopOrderController extends Controller
{
    public $statusPayment,
        $statusOrder,
        $statusShipping,
        $statusOrderMap,
        $statusShippingMap,
        $statusPaymentMap,
        $currency,
        $country,
        $countryMap;

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

    /**
     * Index interface.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
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
            'status' => trans('order.admin.status'),
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
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $obj = $obj->orderBy($field, $sort_field);

        } else {
            $obj = $obj->orderBy('id', 'desc');
        }
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
                'status' => $styleStatus[$row['status']],
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
        $statusOrderMap = $this->statusOrder;
        foreach ($orderStatus as $key => $status) {
            if (ShopOrder::where('status', $key)->get()->count()) {
                if (Admin::user()->provider_id) {
                    $dataTable[$status] = ShopOrder::where('status', $key)->where('provider_id', Admin::user()->provider_id)->orderBy('id', 'desc')->get();
                } else {
                    $dataTable[$status] = ShopOrder::where('status', $key)->orderBy('id', 'desc')->get();
                }
            } else {
                $dataTable[$status] = null;
            }
        }

        // Modify Order Status And Not Allow For Previous State
        if (Admin::user()->provider_role) {
            $providerOrderRole = ShopProviderRoleOrder::with('orderStatus')->where('role_id', Admin::user()->provider_role)->get();
            $statusOrderMap = [];
            foreach ($providerOrderRole as $key => $status) {
                $statusOrderMap[$status->orderStatus->id] = $status->orderStatus->name;
            }
        }

        return view('admin.screen.list-order', ['orderStatus' => $orderStatus, 'dataTable' => $dataTable, "statusOrderMap" => $statusOrderMap])
            ->with($data);
    }

    /**
     * Form create new order in admin
     * @return [type] [description]
     */
    public function create()
    {
        $data = [
            'title' => trans('order.admin.add_new_title'),
            'subTitle' => '',
            'title_description' => trans('order.admin.add_new_des'),
            'icon' => 'fa fa-plus',
        ];
        $paymentMethodTmp = sc_get_plugin_installed('payment', $onlyActive = false);
        foreach ($paymentMethodTmp as $key => $value) {
            $paymentMethod[$key] = sc_language_render($value->detail);
        }
        $shippingMethodTmp = sc_get_plugin_installed('shipping', $onlyActive = false);
        foreach ($shippingMethodTmp as $key => $value) {
            $shippingMethod[$key] = trans($value->detail);
        }
        $orderStatus = $this->statusOrder;
        $currencies = $this->currency;
        $countries = $this->country;
        $currenciesRate = json_encode(ShopCurrency::getListRate());
        $users = ShopUser::getList();
        $data['users'] = $users;
        $data['currencies'] = $currencies;
        $data['countries'] = $countries;
        $data['orderStatus'] = $orderStatus;
        $data['currenciesRate'] = $currenciesRate;
        $data['paymentMethod'] = $paymentMethod;
        $data['shippingMethod'] = $shippingMethod;

        return view('admin.screen.order_add')
            ->with($data);
    }

    /**
     * Post create new order in admin
     * @return [type] [description]
     */
    public function postCreate()
    {
        $users = ShopUser::getList();
        $data = request()->all();
        $validate = [
            'first_name' => 'required|max:100',
            'address1' => 'required|max:100',
            'exchange_rate' => 'required',
//            'status' => 'required',
            'payment_method' => 'required',
            'shipping_method' => 'required',
        ];
        if (sc_config('customer_lastname')) {
            $validate['last_name'] = 'required|max:100';
        }
        if (sc_config('customer_address2')) {
            $validate['address2'] = 'required|max:100';
        }
        if (sc_config('customer_phone')) {
            $validate['phone'] = 'required|regex:/^0[^0][0-9\-]{7,13}$/';
        }
        if (sc_config('customer_country')) {
            $validate['country'] = 'required|min:2';
        }
        if (sc_config('customer_postcode')) {
            $validate['postcode'] = 'required|min:5';
        }
        if (sc_config('customer_company')) {
            $validate['company'] = 'required|min:3';
        }
        $messages = [
            'last_name.required' => trans('validation.required', ['attribute' => trans('cart.last_name')]),
            'first_name.required' => trans('validation.required', ['attribute' => trans('cart.first_name')]),
            'email.required' => trans('validation.required', ['attribute' => trans('cart.email')]),
            'address1.required' => trans('validation.required', ['attribute' => trans('cart.address1')]),
            'address2.required' => trans('validation.required', ['attribute' => trans('cart.address2')]),
            'phone.required' => trans('validation.required', ['attribute' => trans('cart.phone')]),
            'country.required' => trans('validation.required', ['attribute' => trans('cart.country')]),
            'postcode.required' => trans('validation.required', ['attribute' => trans('cart.postcode')]),
            'company.required' => trans('validation.required', ['attribute' => trans('cart.company')]),
            'sex.required' => trans('validation.required', ['attribute' => trans('cart.sex')]),
            'birthday.required' => trans('validation.required', ['attribute' => trans('cart.birthday')]),
            'email.email' => trans('validation.email', ['attribute' => trans('cart.email')]),
            'phone.regex' => trans('validation.regex', ['attribute' => trans('cart.phone')]),
            'postcode.min' => trans('validation.min', ['attribute' => trans('cart.postcode')]),
            'country.min' => trans('validation.min', ['attribute' => trans('cart.country')]),
            'first_name.max' => trans('validation.max', ['attribute' => trans('cart.first_name')]),
            'email.max' => trans('validation.max', ['attribute' => trans('cart.email')]),
            'address1.max' => trans('validation.max', ['attribute' => trans('cart.address1')]),
            'address2.max' => trans('validation.max', ['attribute' => trans('cart.address2')]),
            'last_name.max' => trans('validation.max', ['attribute' => trans('cart.last_name')]),
            'birthday.date' => trans('validation.date', ['attribute' => trans('cart.birthday')]),
            'birthday.date_format' => trans('validation.date_format', ['attribute' => trans('cart.birthday')]),
            'shipping_method.required' => trans('cart.validation.shippingMethod_required'),
            'payment_method.required' => trans('cart.validation.paymentMethod_required'),
        ];


        $validator = Validator::make($data, $validate, $messages);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
//Create new order
        $dataInsert = [
            'user_id' => $data['user_id'],
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'] ?? '',
            'status' => 1,
            'currency' => $data['currency'],
            'address1' => $data['address1'],
            'address2' => $data['address2'] ?? '',
            'address3' => $data['address3'] ?? '',
            'country' => $data['country'] ?? 'VN',
            'company' => $data['company'] ?? '',
            'postcode' => $data['postcode'] ?? '',
            'phone' => $data['phone'] ?? '',
            'payment_method' => $data['payment_method'],
            'shipping_method' => $data['shipping_method'],
            'exchange_rate' => $data['exchange_rate'],
            'email' => $users[$data['user_id']]['email'],
            'comment' => $data['comment'],
        ];
        $order = ShopOrder::create($dataInsert);
        ShopOrderTotal::insert([
            ['code' => 'subtotal', 'value' => 0, 'title' => 'Subtotal', 'sort' => 1, 'order_id' => $order->id],
            ['code' => 'tax', 'value' => 0, 'title' => 'Tax', 'sort' => 2, 'order_id' => $order->id],
            ['code' => 'shipping', 'value' => 0, 'title' => 'Shipping', 'sort' => 10, 'order_id' => $order->id],
            ['code' => 'discount', 'value' => 0, 'title' => 'Discount', 'sort' => 20, 'order_id' => $order->id],
            ['code' => 'total', 'value' => 0, 'title' => 'Total', 'sort' => 100, 'order_id' => $order->id],
            ['code' => 'received', 'value' => 0, 'title' => 'Received', 'sort' => 200, 'order_id' => $order->id],
        ]);

//
        return redirect()->route('admin_order.index')->with('success', trans('order.admin.create_success'));

    }

    /**
     * Order detail
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function detail($id)
    {

        $order = ShopOrder::find($id);
        if ($order === null) {
            return 'no data';
        }
        if (Admin::user()->provider_id) {
            if ($order->provider_id != Admin::user()->provider_id) {
                return 'You have not permission to change this record!';
            }
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
        $statusOrderMap = ShopOrderStatus::all();
        return view('admin.screen.order_edit')->with(
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
     * [getInfoUser description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function getInfoUser()
    {
        $id = request('id');
        return ShopUser::find($id)->toJson();
    }

    /**
     * [getInfoProduct description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function getInfoProduct()
    {
        $id = request('id');
        $order_id = request('order_id');
        $oder = ShopOrder::find($order_id);
        if ($id) {
            $product = (new ShopProduct)->getDetail($id);
        } else {
            $product = (new ShopProduct)->getDetail('sku', $type = 'sku');
        }
        $arrayReturn = $product->toArray();
        $arrayReturn['renderAttDetails'] = $product->renderAttributeDetailsAdmin($oder->currency, $oder->exchange_rate);
        $arrayReturn['price_final'] = $product->getFinalPrice();
        return response()->json($arrayReturn);
    }

    /**
     * process update order
     * @return [json]           [description]
     */
    public function postOrderUpdate()
    {
        $id = request('pk');
        $code = request('name');
        $value = request('value');

        $orderTmp = ShopOrder::find($id);
        if (Admin::user()->provider_id) {
            if ($orderTmp->provider_id != Admin::user()->provider_id) {
                return 'You have not permission to change this record!';
            }
        }
        if ($code == 'shipping' || $code == 'discount' || $code == 'received') {
            if ($code == 'discount' || $code == 'received') {
                $value < 0 ? $value = 0 : $value;
            }
            $order_total_origin = ShopOrderTotal::find($id);
            $order_id = $order_total_origin->order_id;
            $oldValue = $order_total_origin->value;
            $order = ShopOrder::find($order_id);
            $rowTotal = [
                'id' => $id,
                'code' => $code,
                'value' => $value,
                'text' => sc_currency_render_symbol($value, $order->currency),
            ];
            ShopOrderTotal::updateRowTotal($rowTotal);
        } else {
            $order_id = $id;
            $order = ShopOrder::find($order_id);
            $oldValue = $order->{$code};
            $order->update([$code => $value]);
        }

        //Add history
        $dataHistory = [
            'order_id' => $order_id,
            'content' => 'Change <b>' . $code . '</b> from <span style="color:blue">\'' . $oldValue . '\'</span> to <span style="color:red">\'' . $value . '\'</span>',
            'admin_id' => Admin::user()->id,
            'order_status_id' => $order->status,
        ];
        (new ShopOrder)->addOrderHistory($dataHistory);

        $orderUpdated = ShopOrder::find($order_id);
        if ($orderUpdated->balance == 0 && $orderUpdated->total != 0) {
            $style = 'style="color:#0e9e33;font-weight:bold;"';
        } else
            if ($orderUpdated->balance < 0) {
                $style = 'style="color:#ff2f00;font-weight:bold;"';
            } else {
                $style = 'style="font-weight:bold;"';
            }
        $blance = '<tr ' . $style . ' class="data-balance"><td>' . trans('order.balance') . ':</td><td align="right">' . sc_currency_format($orderUpdated->balance) . '</td></tr>';
        return response()->json(['error' => 0, 'detail' =>
            [
                'total' => sc_currency_format($orderUpdated->total),
                'subtotal' => sc_currency_format($orderUpdated->subtotal),
                'tax' => sc_currency_format($orderUpdated->tax),
                'shipping' => sc_currency_format($orderUpdated->shipping),
                'discount' => sc_currency_format($orderUpdated->discount),
                'received' => sc_currency_format($orderUpdated->received),
                'balance' => $blance,
            ],
            'msg' => trans('order.admin.update_success')
        ]);
    }

    /**
     * [postAddItem description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function postAddItem()
    {
        $data = request()->all();
        $add_id = request('add_id');
        $add_price = request('add_price');
        $add_qty = request('add_qty');
        $add_att = request('add_att');
        $add_tax = request('add_tax');
        $order_id = request('order_id');
        $items = [];
        $order = ShopOrder::find($order_id);
        foreach ($add_id as $key => $id) {
            //where exits id and qty > 0
            if ($id && $add_qty[$key]) {
                $product = (new ShopProduct)->getDetail($id);
                $pAttr = json_encode($add_att[$id] ?? []);
                $items[] = array(
                    'order_id' => $order_id,
                    'product_id' => $id,
                    'name' => $product->name,
                    'qty' => $add_qty[$key],
                    'price' => $add_price[$key],
                    'total_price' => $add_price[$key] * $add_qty[$key],
                    'sku' => $product->sku,
                    'tax' => $add_tax[$key],
                    'attribute' => $pAttr,
                    'currency' => $order->currency,
                    'exchange_rate' => $order->exchange_rate,
                    'created_at' => date('Y-m-d H:i:s'),
                );
            }
        }
        if ($items) {
            try {
                (new ShopOrderDetail)->addNewDetail($items);
                //Add history
                $dataHistory = [
                    'order_id' => $order_id,
                    'content' => "Add product: <br>" . implode("<br>", array_column($items, 'name')),
                    'admin_id' => Admin::user()->id,
                    'order_status_id' => $order->status,
                ];
                (new ShopOrder)->addOrderHistory($dataHistory);

                ShopOrderTotal::updateSubTotal($order_id);
                //end update total price
                return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
            } catch (\Exception $e) {
                return response()->json(['error' => 1, 'msg' => 'Error: ' . $e->getMessage()]);
            }

        }
        return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
    }

    /**
     * [postEditItem description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function postEditItem()
    {
        try {
            $id = request('pk');
            $field = request('name');
            $value = request('value');
            $item = ShopOrderDetail::find($id);
            $fieldOrg = $item->{$field};
            $orderID = $item->order_id;
            $item->{$field} = $value;
            $item->total_price = $value * (($field == 'qty') ? $item->price : $item->qty);
            $item->save();
            $item = $item->fresh();
            $order = ShopOrder::find($orderID);
            if (Admin::user()->provider_id) {
                if ($order->provider_id != Admin::user()->provider_id) {
                    return 'You have not permission to change this record!';
                }
            }
            //Add history
            $dataHistory = [
                'order_id' => $orderID,
                'content' => trans('product.edit_product') . ' #' . $id . ': ' . $field . ' from ' . $fieldOrg . ' -> ' . $value,
                'admin_id' => Admin::user()->id,
                'order_status_id' => $order->status,
            ];
            (new ShopOrder)->addOrderHistory($dataHistory);

            //Update stock
            if ($field == 'qty') {
                $checkQty = $value - $fieldOrg;
                //Update stock, sold
                ShopProduct::updateStock($item->product_id, $checkQty);
            }

            //Update total price
            ShopOrderTotal::updateSubTotal($orderID);
            //end update total price

            //refresh order info after update
            $orderUpdated = $order->fresh();

            if ($orderUpdated->balance == 0 && $orderUpdated->total != 0) {
                $style = 'style="color:#0e9e33;font-weight:bold;"';
            } else
                if ($orderUpdated->balance < 0) {
                    $style = 'style="color:#ff2f00;font-weight:bold;"';
                } else {
                    $style = 'style="font-weight:bold;"';
                }
            $blance = '<tr ' . $style . ' class="data-balance"><td>' . trans('order.balance') . ':</td><td align="right">' . sc_currency_format($orderUpdated->balance) . '</td></tr>';
            $arrayReturn = ['error' => 0, 'detail' => [
                'total' => sc_currency_format($orderUpdated->total),
                'subtotal' => sc_currency_format($orderUpdated->subtotal),
                'tax' => sc_currency_format($orderUpdated->tax),
                'shipping' => sc_currency_format($orderUpdated->shipping),
                'discount' => sc_currency_format($orderUpdated->discount),
                'received' => sc_currency_format($orderUpdated->received),
                'item_total_price' => sc_currency_render_symbol($item->total_price, $item->currency),
                'item_id' => $id,
                'balance' => $blance,
            ], 'msg' => trans('order.admin.update_success')
            ];
        } catch (\Exception $e) {
            $arrayReturn = ['error' => 1, 'msg' => $e->getMessage()];
        }
        return response()->json($arrayReturn);
    }

    /**
     * [postDeleteItem description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function postDeleteItem()
    {
        try {
            $data = request()->all();
            $pId = $data['pId'] ?? 0;
            $itemDetail = (new ShopOrderDetail)->where('id', $pId)->first();
            $order_id = $itemDetail->order_id;
            $product_id = $itemDetail->product_id;
            $qty = $itemDetail->qty;
            $itemDetail->delete(); //Remove item from shop order detail
            $order = ShopOrder::find($order_id);
            if (Admin::user()->provider_id) {
                if ($order->provider_id != Admin::user()->provider_id) {
                    return 'You have not permission to change this record!';
                }
            }
            //Update total price
            ShopOrderTotal::updateSubTotal($order_id);
            //Update stock, sold
            ShopProduct::updateStock($product_id, -$qty);

            //Add history
            $dataHistory = [
                'order_id' => $order_id,
                'content' => 'Remove item pID#' . $pId,
                'admin_id' => Admin::user()->id,
                'order_status_id' => $order->status,
            ];
            (new ShopOrder)->addOrderHistory($dataHistory);
            return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
        } catch (\Exception $e) {
            return response()->json(['error' => 1, 'msg' => 'Error: ' . $e->getMessage()]);

        }
    }

    /*
    Delete list order ID
    Need mothod destroy to boot deleting in model
     */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => 'Method not allow!']);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            ShopOrder::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
        }
    }

    /*
    Export order detail order
     */
    public function exportDetail()
    {
        $type = request('type');
        $order_id = request('order_id') ?? 0;
        $order = ShopOrder::with(['details', 'orderTotal'])->find($order_id);
        if ($order) {
            $data = array();
            $data['name'] = $order['first_name'] . ' ' . $order['last_name'];
            $data['address'] = $order['address1'] . ', ' . $order['address2'] . ', ' . $order['country'];
            $data['phone'] = $order['phone'];
            $data['email'] = $order['email'];
            $data['comment'] = $order['comment'];
            $data['payment_method'] = $order['payment_method'];
            $data['shipping_method'] = $order['shipping_method'];
            $data['created_at'] = $order['created_at'];
            $data['currency'] = $order['currency'];
            $data['exchange_rate'] = $order['exchange_rate'];
            $data['subtotal'] = $order['subtotal'];
            $data['tax'] = $order['tax'];
            $data['shipping'] = $order['shipping'];
            $data['discount'] = $order['discount'];
            $data['total'] = $order['total'];
            $data['received'] = $order['received'];
            $data['balance'] = $order['balance'];
            $data['id'] = $order->id;
            $data['details'] = [];

            $attributesGroup = ShopAttributeGroup::pluck('name', 'id')->all();

            if ($order->details) {
                foreach ($order->details as $key => $detail) {
                    $arrAtt = json_decode($detail->attribute, true);
                    if ($arrAtt) {
                        $htmlAtt = '';
                        foreach ($arrAtt as $groupAtt => $att) {
                            $htmlAtt .= $attributesGroup[$groupAtt] . ':' . sc_render_option_price($att, $order['currency'], $order['exchange_rate']);
                        }
                        $name = $detail->name . '(' . strip_tags($htmlAtt) . ')';
                    } else {
                        $name = $detail->name;
                    }
                    $data['details'][] = [
                        $key + 1, $detail->sku, $name, $detail->qty, $detail->price, $detail->total_price,
                    ];
                }
            }
            $options = ['filename' => 'Order ' . $order_id];
            return \Export::export($type, $data, $options);

        }
    }

    public function changeStatus(Request $request)
    {
        $id = $request->id;
        $status = $request->status;
        $order = ShopOrder::findOrFail($id);
        $order->status = $status;
        $order->save();
        if ($order->status == 2) {
            //send notify to admin and supplier product.
            $notify['title'] = 'Có một đơn hàng mới cần được phê duyệt!';
            $notify['url'] = '/sc_admin/manager/confirm/' . $order->id;
            $notify['account'] = 'manager';
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
        return redirect()->route('admin_order.index');
    }

    public function changeStatusProviderOrder(Request $request)
    {
        $id = $request->id;
        $status = $request->status;
        $order = ShopProviderOrder::findOrFail($id);
        $order->status = $status;
        $order->save();
        if ($order->status == 2) {
            //send notify to admin and supplier product.
            $notify['title'] = 'Có một đơn hàng mới cần được phê duyệt!';
            $notify['url'] = '/sc_admin/manager/provider_order/confirm/' . $order->id;
            $notify['account'] = 'manager';
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
        return redirect()->route('provider_order.index');
    }

    public function showOrder($id)
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
        $statusOrderMap = ShopOrderStatus::all();

        //get data divide
        $divide = ShopOrderDivide::where('order_id', $order->id)->get();

        return view('admin.screen.order_show')->with([
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
            'divide' => $divide,
        ]);
    }

    public function postAddItemPayment(Request $request)
    {
        $order_id = $request->order_id;
        $add_cost = $request->cost;
        $add_date = $request->date;
        $add_note = $request->note;

        $sum_received = array_sum($request->cost);

        $order = ShopOrder::find($order_id);
        $order->received += $sum_received;
        $order->balance -= $sum_received;
        $order->save();
        $total = ShopOrderTotal::where('order_id', $order_id)->where('code', 'received')->first();
        $total->value += $sum_received;
        $total->save();
        try {
            foreach ($add_cost as $key => $id) {
                if (is_null($add_date[$key]) || is_null($add_cost[$key])) continue;
                $data = new ShopOrderHistoryPayment();
                $data->order_id = $order_id;
                $data->date = $add_date[$key];
                $data->cost = $add_cost[$key];
                $data->note = $add_note[$key];
                $data->save();

                //Add history
                $dataHistory = [
                    'order_id' => $order_id,
                    'content' => 'Thêm thanh toán ngày: '. date('d-m-Y', strtotime($add_date[$key])).', Số tiền: '. number_format($add_cost[$key], 0) . ' VND, ghi chú: '. $add_note[$key],
                    'admin_id' => Admin::user()->id,
                    'order_status_id' => $order->status,
                ];
                (new ShopOrder)->addOrderHistory($dataHistory);
            }
            return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
        } catch (\Exception $e) {
            return response()->json(['error' => 1, 'msg' => 'Error: ' . $e->getMessage()]);
        }
    }

    /**
     * [postDeleteItemPayment description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function postDeleteItemPayment()
    {
        $data = request()->all();
        $pId = $data['pId'] ?? 0;
        try {
            $itemDetail = ShopOrderHistoryPayment::find($pId);
            $order_id = $itemDetail->order_id;
            $cost = $itemDetail->cost;
            //Update total price
            $order = ShopOrder::find($order_id);
            $order->received -= $cost;
            $order->balance += $cost;
            $order->save();
            $total = ShopOrderTotal::where('order_id', $order_id)->where('code', 'received')->first();
            $total->value -= $cost;
            $total->save();
            $itemDetail->delete(); //Remove item from shop order detail

            //Add history
            $dataHistory = [
                'order_id' => $order_id,
                'content' => 'Xóa thanh toán ngày: '. date('d-m-Y', strtotime($itemDetail->date)).', Số tiền: '. number_format($cost, 0). ' VND, ghi chú: '. $itemDetail->note,
                'admin_id' => Admin::user()->id,
                'order_status_id' => $order->status,
            ];
            (new ShopOrder)->addOrderHistory($dataHistory);
            return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
        } catch (\Exception $e) {
            return response()->json(['error' => 1, 'msg' => 'Error: ' . $e->getMessage()]);

        }
    }

}
