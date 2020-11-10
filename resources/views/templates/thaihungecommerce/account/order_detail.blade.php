@php
    /*
    $layout_page = shop_profile
    $statusOrder
    $statusShipping
    */
@endphp

@extends($templatePath.'.layout')

@section('main')
    <div class="container">
        <div class="row">
            {{-- <div class="col-12">
              <h2 class="title-page">{{ trans('account.my_profile') }}</h2>
            </div> --}}
{{--            <div class="col-12 col-sm-12 col-md-3">--}}
{{--                @include($templatePath.'.account.nav_customer')--}}
{{--            </div>--}}
            <div class="col-12 col-sm-12 col-md-12 min-height-37vh">
                <h3 class="title-optoins-customer">{{ $title }}</h3>
                @if (!$order)
                    <div class="text-danger">
                        {{ trans('account.order_detail_not_exist') }}
                    </div>
                @else
                        <div class="p-20 not-print" style="text-align: center">
                            @if($order->status == 6)
                                <button class="btn btn-danger" style="padding: 10px; margin: 15px;">Đơn hàng đã bị lỗi thực hiện</button>
                            @elseif($order->status == 7)
                                <button class="btn btn-danger" style="padding: 10px; margin: 15px;">Đơn hàng đã bị hủy bỏ</button>
                            @else
                                <div class="kt-grid__item">
                                    <!--begin: Form Wizard Nav -->
                                    <div class="kt-wizard-v1__nav">
                                        <!--doc: Remove "kt-wizard-v1__nav-items--clickable" class and also set 'clickableSteps: false' in the JS init to disable manually clicking step titles -->
                                        <div class="kt-wizard-v1__nav-items kt-wizard-v1__nav-items--clickable">
                                            <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step" @if($order->status > 0 ) data-ktwizard-state="current" @endif >
                                                <div class="kt-wizard-v1__nav-body">
                                                    <div class="kt-wizard-v1__nav-icon">
                                                        <i class="fa fa-id-card-o"></i>
                                                    </div>
                                                    <div class="kt-wizard-v1__nav-label">
                                                        1. Khởi tạo
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step" @if($order->status > 1 ) data-ktwizard-state="current" @endif >
                                                <div class="kt-wizard-v1__nav-body">
                                                    <div class="kt-wizard-v1__nav-icon">
                                                        <i class="fa fa-pencil-square-o"></i>
                                                    </div>
                                                    <div class="kt-wizard-v1__nav-label">
                                                        2. Đã xác nhận
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step" @if($order->status > 2 ) data-ktwizard-state="current" @endif >
                                                <div class="kt-wizard-v1__nav-body">
                                                    <div class="kt-wizard-v1__nav-icon">
                                                        <i class="fa fa-desktop"></i>
                                                    </div>
                                                    <div class="kt-wizard-v1__nav-label">
                                                        3. Đã phê duyệt
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step" @if($order->status > 3 ) data-ktwizard-state="current" @endif >
                                                <div class="kt-wizard-v1__nav-body">
                                                    <div class="kt-wizard-v1__nav-icon">
                                                        <i class="fa fa-truck"></i>
                                                    </div>
                                                    <div class="kt-wizard-v1__nav-label">
                                                        4. Đang thực hiện
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step"  @if($order->status > 4 ) data-ktwizard-state="current" @endif >
                                                <div class="kt-wizard-v1__nav-body">
                                                    <div class="kt-wizard-v1__nav-icon">
                                                        <i class="fa fa-check-square-o"></i>
                                                    </div>
                                                    <div class="kt-wizard-v1__nav-label">
                                                        5. Hoàn thành
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--end: Form Wizard Nav -->
                                </div>
                                <br>
                            @endif
                        </div>
                        <br>
                    <div class="row" id="order-body">
                        <div class="col-sm-6">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="td-title">{{ trans('order.shipping_first_name') }}:</td><td>{!! $order->first_name !!}</td>
                                </tr>

                                @if (sc_config('customer_lastname'))
                                    <tr>
                                        <td class="td-title">{{ trans('order.shipping_last_name') }}:</td><td>{!! $order->last_name !!}</td>
                                    </tr>
                                @endif

                                @if (sc_config('customer_phone'))
                                    <tr>
                                        <td class="td-title">{{ trans('order.shipping_phone') }}:</td><td>{!! $order->phone !!}</td>
                                    </tr>
                                @endif

                                <tr>
                                    <td class="td-title">{{ trans('order.email') }}:</td><td>{!! empty($order->email)?'N/A':$order->email!!}</td>
                                </tr>

                                @if (sc_config('customer_company'))
                                    <tr>
                                        <td class="td-title">{{ trans('order.company') }}:</td><td>{!! $order->company !!}</td>
                                    </tr>
                                @endif

                                @if (sc_config('customer_postcode'))
                                    <tr>
                                        <td class="td-title">{{ trans('order.postcode') }}:</td><td>{!! $order->postcode !!}</td>
                                    </tr>
                                @endif

                                <tr>
                                    <td class="td-title">{{ trans('order.shipping_address1') }}:</td><td>{!! $order->address1 !!}</td>
                                </tr>

                                @if (sc_config('customer_address2'))
                                    <tr>
                                        <td class="td-title">{{ trans('order.shipping_address2') }}:</td><td>{!! $order->address2 !!}</td>
                                    </tr>
                                @endif

                                @if (sc_config('customer_country'))
                                    <tr>
                                        <td class="td-title">{{ trans('order.country') }}:</td><td>{!! $countries[$order->country] ?? $order->country !!}</td>
                                    </tr>
                                @endif

                            </table>
                        </div>


                        <div class="col-sm-6">
                            <table  class="table table-bordered">
                                <tr><td class="td-title">{{ trans('order.order_status') }}:</td><td>{{ $statusOrder[$order->status] }}</td></tr>
                                <tr><td>{{ trans('order.order_shipping_status') }}:</td><td>{{ $statusShipping[$order->shipping_status]??'' }}</td></tr>
                                <tr><td>{{ trans('order.shipping_method') }}:</td><td>{{ $order->shipping_method }}</td></tr>
                                <tr><td>{{ trans('order.payment_method') }}:</td><td>{{ $order->payment_method }}</td></tr>
                                <tr>
                                    <td class="td-title">{{ trans('order.currency') }}:</td><td>{{ $order->currency }}</td>
                                </tr>
                                <tr>
                                    <td class="td-title">{{ trans('order.exchange_rate') }}:</td><td>{{ ($order->exchange_rate)??1 }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="box collapsed-box">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>{{ trans('product.name') }}</th>
                                            <th>{{ trans('product.sku') }}</th>
                                            <th class="product_price">{{ trans('product.price') }}</th>
                                            <th class="product_qty">{{ trans('product.quantity') }}</th>
                                            <th class="product_total">{{ trans('product.total_price') }}</th>
                                            <th class="product_tax">{{ trans('product.tax') }}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach ($order->details as $item)
                                            <tr>
                                                <td>{{ $item->name }}
                                                    @php
                                                        $html = '';
                                                          if($item->attribute && is_array(json_decode($item->attribute,true))){
                                                            $array = json_decode($item->attribute,true);
                                                                foreach ($array as $key => $element){
                                                                  $html .= '<br><b>'.$attributesGroup[$key].'</b> : <i>'.$element.'</i>';
                                                                }
                                                          }
                                                    @endphp
                                                    {!! $html !!}
                                                </td>
                                                <td>{{ $item->sku }}</td>
                                                <td class="product_price">{{ $item->price }}</td>
                                                <td class="product_qty">x  {{ $item->qty }}</td>
                                                <td class="product_total item_id_{{ $item->id }}">{{ sc_currency_render_symbol($item->total_price,$order->currency)}}</td>
                                                <td class="product_tax">{{ $item->tax }}</td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>

                    @php
                        $dataTotal = \App\Models\ShopOrderTotal::getTotal($order->id)
                    @endphp
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box collapsed-box">
                                <table   class="table table-bordered">
                                    @foreach ($dataTotal as $element)
                                        @if ($element['code'] =='subtotal')
                                            <tr><td  class="td-title-normal">{!! $element['title'] !!}:</td><td style="text-align:right" class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td></tr>
                                        @endif
                                        @if ($element['code'] =='tax')
                                            <tr><td  class="td-title-normal">{!! $element['title'] !!}:</td><td style="text-align:right" class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td></tr>
                                        @endif

                                        @if ($element['code'] =='shipping')
                                            <tr><td>{!! $element['title'] !!}:</td><td style="text-align:right">{{ sc_currency_format($element['value']) }}</td></tr>
                                        @endif
                                        @if ($element['code'] =='discount')
                                            <tr><td>{!! $element['title'] !!}(-):</td><td style="text-align:right">{{ sc_currency_format($element['value']) }}</td></tr>
                                        @endif

                                        @if ($element['code'] =='total')
                                            <tr style="background:#f5f3f3;font-weight: bold;"><td>{!! $element['title'] !!}:</td><td style="text-align:right" class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td></tr>
                                        @endif

                                        @if ($element['code'] =='received')
                                            <tr><td>{!! $element['title'] !!}(-):</td><td style="text-align:right">{{ sc_currency_format($element['value']) }}</td></tr>
                                        @endif

                                    @endforeach

                                    <tr class="data-balance"><td>{{ trans('order.balance') }}:</td><td style="text-align:right">{{ sc_currency_format($order->total) }}</td></tr>
                                </table>
                            </div>

                        </div>
                    </div>


                @endif
            </div>
        </div>
    </div>

        <style type="text/css">
            .history {
                max-height: 50px;
                max-width: 300px;
                overflow-y: auto;
            }

            .td-title {
                width: 35%;
                font-weight: bold;
            }

            .td-title-normal {
                width: 35%;
            }

            .product_qty {
                width: 80px;
                text-align: right;
            }

            .product_price, .product_total {
                width: 120px;
                text-align: right;
            }
            .kt-wizard-v1__nav {
                border-bottom: 1px solid #eeeef4;
            }
            *, *::before, *::after {
                box-sizing: border-box;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item[data-ktwizard-state="done"]:after, .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item[data-ktwizard-state="current"]:after {
                color: #5d78ff;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 95%;
                margin: 0 auto;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item:after {
                font-family: FontAwesome;
                font-style: normal;
                font-weight: normal;
                font-variant: normal;
                line-height: 1;
                text-decoration: inherit;
                text-rendering: optimizeLegibility;
                text-transform: none;
                -moz-osx-font-smoothing: grayscale;
                -webkit-font-smoothing: antialiased;
                font-smoothing: antialiased;
                content: "\f054";
                font-size: 0.9rem;
                color: #a2a5b9;
                margin-left: 0.5rem;
                margin-right: 0.5rem;
            }
            .kt-wizard-v1__nav-item:last-child:after{
                display: none;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items.kt-wizard-v1__nav-items--clickable .kt-wizard-v1__nav-item {
                cursor: pointer;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-wrap: wrap;
                flex: 1;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item .kt-wizard-v1__nav-body {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 2rem 1rem;
                text-align: center;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items.kt-wizard-v1__nav-items--clickable .kt-wizard-v1__nav-item {
                cursor: pointer;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item[data-ktwizard-state="done"] .kt-wizard-v1__nav-body .kt-wizard-v1__nav-icon, .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item[data-ktwizard-state="current"] .kt-wizard-v1__nav-body .kt-wizard-v1__nav-icon {
                color: #5d78ff;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item .kt-wizard-v1__nav-body .kt-wizard-v1__nav-icon {
                font-size: 3.0rem;
                color: #a2a5b9;
                margin-bottom: 0.5rem;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item .kt-wizard-v1__nav-body {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 2rem 1rem;
                text-align: center;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items.kt-wizard-v1__nav-items--clickable .kt-wizard-v1__nav-item {
                cursor: pointer;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item[data-ktwizard-state="done"] .kt-wizard-v1__nav-body .kt-wizard-v1__nav-label, .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item[data-ktwizard-state="current"] .kt-wizard-v1__nav-body .kt-wizard-v1__nav-label {
                color: #5d78ff;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item .kt-wizard-v1__nav-body .kt-wizard-v1__nav-label {
                font-size: 1.2rem;
                font-weight: 500;
                color: #74788d;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items .kt-wizard-v1__nav-item .kt-wizard-v1__nav-body {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 2rem 1rem;
                text-align: center;
            }
            .kt-wizard-v1__nav .kt-wizard-v1__nav-items.kt-wizard-v1__nav-items--clickable .kt-wizard-v1__nav-item {
                cursor: pointer;
            }
        </style>
        <!-- Ediable -->
        <link rel="stylesheet" href="{{ asset('admin/plugin/bootstrap-editable.css')}}">


@endsection


@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
            <li><a href="{{ route('member.index') }}">{{ trans('front.my_account') }}</a></li>
            <li><a href="{{ route('member.order_list') }}">{{ trans('account.order_list') }}</a></li>
            <li class="active">{{ $title }}</li>
        </ol>
    </div>
@endsection