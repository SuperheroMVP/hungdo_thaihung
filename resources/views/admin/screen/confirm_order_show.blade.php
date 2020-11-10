@extends('admin.layout')

@section('main')
    <div class="row">
        <div class="col-md-12">
            <div class="box">
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
                <div class="box-header with-border">
                    <h3 class="box-title">{{ trans('order.order_detail') }} #{{ $order->id }}</h3>
                    <div class="box-tools not-print">
                        <div class="btn-group pull-right" style="margin-right: 0px">
                            <a href="{{ route('manager.confirm.index') }}" class="btn btn-sm btn-flat btn-default"><i
                                        class="fa fa-list"></i>&nbsp;{{ trans('admin.list') }}</a>
                        </div>
                        <div class="btn-group pull-right" style="margin-right: 10px">
                            <a href="{{ route('admin_order.export_detail').'?order_id='.$order->id.'&type=invoice' }}"
                               class="btn btn-sm btn-flat btn-twitter" title="Export"><i class="fa fa-file-excel-o"></i><span
                                        class="hidden-xs"> Excel</span></a>
                        </div>
                        {{--                   <div class="btn-group pull-right" style="margin-right: 10px">
                                              <a href="{{ route('admin_order.export_detail').'?order_id='.$order->id.'&type=pdf' }}" class="btn btn-sm btn-flat btn-warning" title="Export"><i class="fa fa-file-pdf-o"></i><span class="hidden-xs"> PDF</span></a>
                                          </div> --}}
                        <div class="btn-group pull-right" style="margin-right: 10px;border:1px solid #c5b5b5;">
                            <a class="btn btn-sm btn-flat" title="Export" onclick="order_print()"><i
                                        class="fa fa-print"></i><span class="hidden-xs"> Print</span></a>
                        </div>
                    </div>
                </div>

                <div class="row" id="order-body">
                    <div class="col-sm-6">
                        <table class="table table-bordered">
                            <tr>
                                <td class="td-title">{{ trans('order.shipping_first_name') }}:</td>
                                <td><a href="#" class="updateInfoRequired" data-name="first_name" data-type="text"
                                       data-pk="{{ $order->id }}" data-url="{{ route("admin_order.update") }}"
                                       data-title="{{ trans('order.shipping_first_name') }}">{!! $order->first_name !!}</a>
                                </td>
                            </tr>

                            @if (sc_config('customer_lastname'))
                                <tr>
                                    <td class="td-title">{{ trans('order.shipping_last_name') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="last_name" data-type="text"
                                           data-pk="{{ $order->id }}" data-url="{{ route("admin_order.update") }}"
                                           data-title="{{ trans('order.shipping_last_name') }}">{!! $order->last_name !!}</a>
                                    </td>
                                </tr>
                            @endif

                            @if (sc_config('customer_phone'))
                                <tr>
                                    <td class="td-title">{{ trans('order.shipping_phone') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="phone" data-type="text"
                                           data-pk="{{ $order->id }}" data-url="{{ route("admin_order.update") }}"
                                           data-title="{{ trans('order.shipping_phone') }}">{!! $order->phone !!}</a>
                                    </td>
                                </tr>
                            @endif

                            <tr>
                                <td class="td-title">{{ trans('order.email') }}:</td>
                                <td>{!! empty($order->email)?'N/A':$order->email!!}</td>
                            </tr>

                            @if (sc_config('customer_company'))
                                <tr>
                                    <td class="td-title">{{ trans('order.company') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="company" data-type="text"
                                           data-pk="{{ $order->id }}" data-url="{{ route("admin_order.update") }}"
                                           data-title="{{ trans('order.company') }}">{!! $order->company !!}</a></td>
                                </tr>
                            @endif

                            @if (sc_config('customer_postcode'))
                                <tr>
                                    <td class="td-title">{{ trans('order.postcode') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="postcode" data-type="text"
                                           data-pk="{{ $order->id }}" data-url="{{ route("admin_order.update") }}"
                                           data-title="{{ trans('order.postcode') }}">{!! $order->postcode !!}</a></td>
                                </tr>
                            @endif

                            <tr>
                                <td class="td-title">{{ trans('order.shipping_address1') }}:</td>
                                <td><a href="#" class="updateInfoRequired" data-name="address1" data-type="text"
                                       data-pk="{{ $order->id }}" data-url="{{ route("admin_order.update") }}"
                                       data-title="{{ trans('order.address1') }}">{!! $order->address1 !!}</a></td>
                            </tr>

                            @if (sc_config('customer_address2'))
                                <tr>
                                    <td class="td-title">{{ trans('order.shipping_address2') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="address2" data-type="text"
                                           data-pk="{{ $order->id }}" data-url="{{ route("admin_order.update") }}"
                                           data-title="{{ trans('order.address2') }}">{!! $order->address2 !!}</a></td>
                                </tr>
                            @endif

                            @if (sc_config('customer_country'))
                                <tr>
                                    <td class="td-title">{{ trans('order.country') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="country" data-type="select"
                                           data-source="{{ json_encode($countryMap) }}" data-pk="{{ $order->id }}"
                                           data-url="{{ route("admin_order.update") }}"
                                           data-title="{{ trans('order.country') }}"
                                           data-value="{!! $order->country !!}"></a></td>
                                </tr>
                            @endif

                        </table>
                    </div>
                    <div class="col-sm-6">
                        <table class="table table-bordered">

                            <tr>
                                <td class="td-title">{{ trans('order.order_status') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="status" data-type="select"
                                       data-source="{{ json_encode($statusOrderMap) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->status !!}" data-url="{{ route("admin_order.update") }}"
                                       data-title="{{ trans('order.order_status') }}">{{ $statusOrder[$order->status] }}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ trans('order.order_shipping_status') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="shipping_status" data-type="select"
                                       data-source="{{ json_encode($statusShippingMap) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->shipping_status !!}"
                                       data-url="{{ route("admin_order.update") }}"
                                       data-title="{{ trans('order.order_shipping_status') }}">{{ $statusShipping[$order->shipping_status]??'' }}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ trans('order.order_payment_status') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="payment_status" data-type="select"
                                       data-source="{{ json_encode($statusPaymentMap) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->payment_status !!}"
                                       data-url="{{ route("admin_order.update") }}"
                                       data-title="{{ trans('order.order_payment_status') }}">{{ $statusPayment[$order->payment_status]??'' }}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ trans('order.shipping_method') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="shipping_method" data-type="select"
                                       data-source="{{ json_encode($shippingMethod) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->shipping_method !!}"
                                       data-url="{{ route("admin_order.update") }}"
                                       data-title="{{ trans('order.shipping_method') }}">{{ $order->shipping_method }}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ trans('order.payment_method') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="payment_method" data-type="select"
                                       data-source="{{ json_encode($paymentMethod) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->payment_method !!}"
                                       data-url="{{ route("admin_order.update") }}"
                                       data-title="{{ trans('order.payment_method') }}">{{ $order->payment_method }}</a>
                                </td>
                            </tr>
                        </table>
                        <table class="table table-bordered">
                            <tr>
                                <td class="td-title">
                                    Nhà bán hàng:
                                </td>
                                <td>
                                    @if($provider)<a
                                            href="{{ route('agency.show', ['alias' => $provider->alias]) }}">{{ $provider->name }}</a>@else
                                        Không tồn tại @endif
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>

                @php
                    if($order->balance == 0){
                        $style = 'style="color:#0e9e33;font-weight:bold;"';
                    }else
                        if($order->balance < 0){
                        $style = 'style="color:#ff2f00;font-weight:bold;"';
                    }else{
                        $style = 'style="font-weight:bold;"';
                    }
                @endphp

                <form id="form-add-item" action="" method="">
                    @csrf
                    <input type="hidden" name="order_id" value="{{ $order->id }}">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="box collapsed-box">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>{{ trans('product.name') }}</th>
                                            <th>{{ trans('product.sku') }}</th>
                                            <th>Đơn vị tính</th>
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
                                                                  $html .= '<br><b>'.$attributesGroup[$key].'</b> : <i>'.sc_render_option_price($element, $order->currency, $order->exchange_rate).'</i>';
                                                                }
                                                          }
                                                    @endphp
                                                    {!! $html !!}
                                                </td>
                                                <td>{{ $item->sku }}</td>
                                                <td>{{ $item->get_dvt($item->product_id) ?? '' }}</td>
                                                <td class="product_price"><a href="#" class="edit-item-detail"
                                                                             data-value="{{ $item->price }}"
                                                                             data-name="price" data-type="number" min=0
                                                                             data-pk="{{ $item->id }}"
                                                                             data-url="{{ route("admin_order.edit_item") }}"
                                                                             data-title="{{ trans('product.price') }}">{{ $item->price }}</a>
                                                </td>
                                                <td class="product_qty">x <a href="#" class="edit-item-detail"
                                                                             data-value="{{ $item->qty }}"
                                                                             data-name="qty" data-type="number" min=0
                                                                             data-pk="{{ $item->id }}"
                                                                             data-url="{{ route("admin_order.edit_item") }}"
                                                                             data-title="{{ trans('order.qty') }}"> {{ $item->qty }}</a>
                                                </td>
                                                <td class="product_total item_id_{{ $item->id }}">{{ sc_currency_render_symbol($item->total_price,$order->currency)}}</td>
                                                <td class="product_tax"><a href="#" class="edit-item-detail"
                                                                           data-value="{{ $item->tax }}" data-name="tax"
                                                                           data-type="number" min=0
                                                                           data-pk="{{ $item->id }}"
                                                                           data-url="{{ route("admin_order.edit_item") }}"
                                                                           data-title="{{ trans('order.tax') }}"> {{ $item->tax }}</a>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>

                <div class="row">
                    {{-- Total --}}
                    <div class="col-sm-6">
                        <div class="box collapsed-box">
                            <table class="table table-bordered">
                                @foreach ($dataTotal as $element)
                                    @if ($element['code'] =='subtotal')
                                        <tr>
                                            <td class="td-title-normal">{!! $element['title'] !!}:</td>
                                            <td style="text-align:right"
                                                class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                        </tr>
                                    @endif
                                    @if ($element['code'] =='tax')
                                        <tr>
                                            <td class="td-title-normal">{!! $element['title'] !!}:</td>
                                            <td style="text-align:right"
                                                class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                        </tr>
                                    @endif

                                    @if ($element['code'] =='shipping')
                                        <tr>
                                            <td>{!! $element['title'] !!}:</td>
                                            <td style="text-align:right">{{$element['value'] }}</td>
                                        </tr>
                                    @endif
                                    @if ($element['code'] =='discount')
                                        <tr>
                                            <td>{!! $element['title'] !!}(-):</td>
                                            <td style="text-align:right">{{$element['value'] }}</td>
                                        </tr>
                                    @endif

                                    @if ($element['code'] =='total')
                                        <tr style="background:#f5f3f3;font-weight: bold;">
                                            <td>{!! $element['title'] !!}:</td>
                                            <td style="text-align:right"
                                                class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                        </tr>
                                    @endif

                                    @if ($element['code'] =='received')
                                        <tr>
                                            <td>{!! $element['title'] !!}(-):</td>
                                            <td style="text-align:right">{{$element['value'] }}</td>
                                        </tr>
                                    @endif
                                @endforeach

                                <tr {!! $style !!}  class="data-balance">
                                    <td>{{ trans('order.balance') }}:</td>
                                    <td style="text-align:right">{{($order->balance === NULL)?sc_currency_format($order->total):sc_currency_format($order->balance) }}</td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    {{-- //End total --}}

                    {{-- History --}}
                    <div class="col-sm-6">
                        <div class="box collapsed-box">
                            <table class="table box table-bordered">
                                <tr>
                                    <td class="td-title">{{ trans('order.order_note') }}:</td>
                                    <td>
                                        <a href="#" class="updateInfo" data-name="comment" data-type="text"
                                           data-pk="{{ $order->id }}" data-url="{{ route("admin_order.update") }}"
                                           data-title="">{{ $order->comment }}
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="box collapsed-box not-print">
                            <div class="box-header with-border">
                                <h3 class="box-title">{{ trans('order.order_history') }}</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                                class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="box-body table-responsive no-padding box-primary">
                                @if (count($order->history))
                                    <table class="table table-bordered" id="history">
                                        <tr>
                                            <th>{{ trans('order.history_staff') }}</th>
                                            <th>{{ trans('order.history_content') }}</th>
                                            <th>{{ trans('order.history_time') }}</th>
                                        </tr>
                                        @foreach ($order->history->sortKeysDesc()->all() as $history)
                                            <tr>
                                                <td>{{ \App\Admin\Models\AdminUser::find($history['admin_id'])->name??'' }}</td>
                                                <td>
                                                    <div class="history">{!! $history['content'] !!}</div>
                                                </td>
                                                <td>{{ $history['add_date'] }}</td>
                                            </tr>
                                        @endforeach
                                    </table>
                                @endif
                            </div>
                        </div>

                    </div>
                    {{-- //End history --}}
                    <div class="col-md-12 float-right not-print">
                        <form action="{{route('manager.confirm.store')}}" method="post" style="float: right; padding: 10px;">
                            @csrf
                            <input type="hidden" name="id" value="{{ $order->id }}">
                            <input type="hidden" name="action" value="1">
                            <input class="btn btn-success" onclick="return confirm('Bạn chắc chắn muốn phê duyệt đơn hàng này không?')" type="submit" value="Phê duyệt">
                        </form>
                        <input class="btn btn-warning" type="submit" value="Yêu cầu kiểm tra lại" data-toggle="modal"
                               data-target="#exampleModalCenter" style="float: right; margin: 10px;">
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <form action="{{route('manager.confirm.store')}}" method="post">
                                @csrf
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="exampleModalLongTitle"
                                                style="width: 95%; float: left;">Yêu cầu nhân viên kiểm tra lại đơn
                                                hàng!</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-body">
                                            <div>
                                                <h4>Nhập yêu cầu của bạn! </h4>
                                                <textarea name="comment" rows="4" style="width: 100%;"></textarea>
                                                <input type="hidden" name="id" value="{{ $order->id }}">
                                                <input type="hidden" name="status" value="1">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy
                                            </button>
                                            <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <form action="{{route('manager.confirm.store')}}" method="post" style="float: right; padding: 10px;">
                            @csrf
                            <input type="hidden" name="action" value="0">
                            <input type="hidden" name="id" value="{{ $order->id }}">
                            <input class="btn btn-danger" onclick="return confirm('Bạn chắc chắn muốn hủy đơn hàng này không?')" type="submit" value="Hủy bỏ">
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection


@push('styles')
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
            width: 70%;
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
            font-size: 1.25rem;
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
            font-size: 4.8rem;
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
            font-size: 1.6rem;
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
@endpush

@push('scripts')
    {{-- //Pjax --}}
    <script src="{{ asset('admin/plugin/jquery.pjax.js')}}"></script>

    <!-- Ediable -->
    <script src="{{ asset('admin/plugin/bootstrap-editable.min.js')}}"></script>



    <script type="text/javascript">


        $(document).ready(function () {
            // does current browser support PJAX
            if ($.support.pjax) {
                $.pjax.defaults.timeout = 2000; // time in milliseconds
            }

        });

        function order_print() {
            $('.not-print').hide();
            window.print();
            $('.not-print').show();
        }
    </script>

@endpush
