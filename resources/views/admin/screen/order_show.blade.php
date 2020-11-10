@extends('admin.layout')

@section('main')
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="p-20 not-print" style="text-align: center">
                    @if($order->status == 6)
                        <button class="btn btn-danger" style="padding: 10px; margin: 15px;">Đơn hàng đã bị lỗi thực
                            hiện
                        </button>
                    @elseif($order->status == 7)
                        <button class="btn btn-danger" style="padding: 10px; margin: 15px;">Đơn hàng đã bị hủy bỏ
                        </button>
                    @else
                        <div class="kt-grid__item">
                            <!--begin: Form Wizard Nav -->
                            <div class="kt-wizard-v1__nav">
                                <!--doc: Remove "kt-wizard-v1__nav-items--clickable" class and also set 'clickableSteps: false' in the JS init to disable manually clicking step titles -->
                                <div class="kt-wizard-v1__nav-items kt-wizard-v1__nav-items--clickable">
                                    <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step"
                                         @if($order->status > 0 ) data-ktwizard-state="current" @endif >
                                        <div class="kt-wizard-v1__nav-body">
                                            <div class="kt-wizard-v1__nav-icon">
                                                <i class="fa fa-id-card-o"></i>
                                            </div>
                                            <div class="kt-wizard-v1__nav-label">
                                                1. Khởi tạo
                                            </div>
                                        </div>
                                    </div>
                                    <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step"
                                         @if($order->status > 1 ) data-ktwizard-state="current" @endif >
                                        <div class="kt-wizard-v1__nav-body">
                                            <div class="kt-wizard-v1__nav-icon">
                                                <i class="fa fa-pencil-square-o"></i>
                                            </div>
                                            <div class="kt-wizard-v1__nav-label">
                                                2. Đã xác nhận
                                            </div>
                                        </div>
                                    </div>
                                    <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step"
                                         @if($order->status > 2 ) data-ktwizard-state="current" @endif >
                                        <div class="kt-wizard-v1__nav-body">
                                            <div class="kt-wizard-v1__nav-icon">
                                                <i class="fa fa-desktop"></i>
                                            </div>
                                            <div class="kt-wizard-v1__nav-label">
                                                3. Đã phê duyệt
                                            </div>
                                        </div>
                                    </div>
                                    <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step"
                                         @if($order->status > 3 ) data-ktwizard-state="current" @endif >
                                        <div class="kt-wizard-v1__nav-body">
                                            <div class="kt-wizard-v1__nav-icon">
                                                <i class="fa fa-truck"></i>
                                            </div>
                                            <div class="kt-wizard-v1__nav-label">
                                                4. Đang thực hiện
                                            </div>
                                        </div>
                                    </div>
                                    <div class="kt-wizard-v1__nav-item" data-ktwizard-type="step"
                                         @if($order->status > 4 ) data-ktwizard-state="current" @endif >
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
                            <a href="{{ route('admin_order.index') }}" class="btn btn-sm btn-flat btn-default"><i
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
                                       data-pk="{{ $order->id }}" data-url=""
                                       data-title="{{ trans('order.shipping_first_name') }}">{!! $order->first_name !!}</a>
                                </td>
                            </tr>

                            @if (sc_config('customer_lastname'))
                                <tr>
                                    <td class="td-title">{{ trans('order.shipping_last_name') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="last_name" data-type="text"
                                           data-pk="{{ $order->id }}" data-url=""
                                           data-title="{{ trans('order.shipping_last_name') }}">{!! $order->last_name !!}</a>
                                    </td>
                                </tr>
                            @endif

                            @if (sc_config('customer_phone'))
                                <tr>
                                    <td class="td-title">{{ trans('order.shipping_phone') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="phone" data-type="text"
                                           data-pk="{{ $order->id }}" data-url=""
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
                                           data-pk="{{ $order->id }}" data-url=""
                                           data-title="{{ trans('order.company') }}">{!! $order->company !!}</a></td>
                                </tr>
                            @endif

                            @if (sc_config('customer_postcode'))
                                <tr>
                                    <td class="td-title">{{ trans('order.postcode') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="postcode" data-type="text"
                                           data-pk="{{ $order->id }}" data-url=""
                                           data-title="{{ trans('order.postcode') }}">{!! $order->postcode !!}</a></td>
                                </tr>
                            @endif

                            <tr>
                                <td class="td-title">{{ trans('order.shipping_address1') }}:</td>
                                <td><a href="#" class="updateInfoRequired" data-name="address1" data-type="text"
                                       data-pk="{{ $order->id }}" data-url=""
                                       data-title="{{ trans('order.address1') }}">{!! $order->address1 !!}</a></td>
                            </tr>

                            @if (sc_config('customer_address2'))
                                <tr>
                                    <td class="td-title">{{ trans('order.shipping_address2') }}:</td>
                                    <td><a href="#" class="updateInfoRequired" data-name="address2" data-type="text"
                                           data-pk="{{ $order->id }}" data-url=""
                                           data-title="{{ trans('order.address2') }}">{!! $order->address2 !!}</a></td>
                                </tr>
                            @endif

                            <tr>
                                <td class="td-title">Địa chỉ:</td>
                                <td><a href="#" class="updateInfoRequired" data-name="address3" data-type="text"
                                       data-pk="{{ $order->id }}" data-url=""
                                       data-title="{{ trans('order.address3') }}">{!! $order->address3 !!}</a></td>
                            </tr>

                        </table>
                    </div>
                    <div class="col-sm-6">
                        <table class="table table-bordered">
                            <tr>
                                <td class="td-title">{{ trans('order.order_status') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="status" data-type="select"
                                       data-source="{{ json_encode($statusOrderMap) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->status !!}" data-url=""
                                       data-title="{{ trans('order.order_status') }}">{{ $statusOrder[$order->status] }}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ trans('order.order_shipping_status') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="shipping_status" data-type="select"
                                       data-source="{{ json_encode($statusShippingMap) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->shipping_status !!}"
                                       data-url=""
                                       data-title="{{ trans('order.order_shipping_status') }}">{{ $statusShipping[$order->shipping_status]??'' }}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ trans('order.order_payment_status') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="payment_status" data-type="select"
                                       data-source="{{ json_encode($statusPaymentMap) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->payment_status !!}"
                                       data-url=""
                                       data-title="{{ trans('order.order_payment_status') }}">{{ $statusPayment[$order->payment_status]??'' }}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ trans('order.shipping_method') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="shipping_method" data-type="select"
                                       data-source="{{ json_encode($shippingMethod) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->shipping_method !!}"
                                       data-url=""
                                       data-title="{{ trans('order.shipping_method') }}">{{ $order->shipping_method }}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>{{ trans('order.payment_method') }}:</td>
                                <td><a href="#" class="updateStatus" data-name="payment_method" data-type="select"
                                       data-source="{{ json_encode($paymentMethod) }}" data-pk="{{ $order->id }}"
                                       data-value="{!! $order->payment_method !!}"
                                       data-url=""
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
                                    @if($provider)
                                        <a target="_blank"
                                           href="{{ route('agency.show', ['alias' => $provider->alias]) }}">{{ $provider->name }}</a>
                                    @else
                                        Không tồn tại
                                    @endif
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
                                    <h4>Danh sách đơn hàng</h4>
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>{{ trans('product.name') }}</th>
                                            <th>{{ trans('product.sku') }}</th>
                                            <th>Đơn vị tính</th>
                                            <th class="product_price">{{ trans('product.price') }}</th>
                                            <th class="product_qty">{{ trans('product.quantity') }}</th>
                                            <th class="product_total">{{ trans('product.total_price') }}</th>
                                            {{--                                            <th class="product_total">Đơn vị tính</th>--}}
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
                                                <td>{{ $item->get_dvt($item->product_id) }}</td>
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
                                                <td class="product_total item_id_{{ $item->id }}">{{ sc_currency_render_symbol($item->total_price,$order->currency) }}</td>
                                                {{--                                                <td class="product_total item_id_{{ $item->id }}">{{ $item->unit }}</td>--}}
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
                    {{-- History shipping--}}
                    <div class="col-sm-6">
                        <div class="box collapsed-box">
                            <h4>Lịch sử vận chuyển đơn hàng</h4>
                            <table class="table box table-bordered">
                                <tr>
                                    <th>Lần giao</th>
                                    <th>Ngày giao</th>
                                    <th>Thao tác</th>
                                </tr>
                                @foreach($divide as $key => $value)
                                <tr>
                                    <td>Lần {{$key+1}}</td>
                                    <td>{{$value->created_at}}</td>
                                    <td>
                                        <button type="button" class="btn btn-flat btn-primary btn-xs"
                                                data-toggle="modal"
                                                data-target="#view_divide">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="view_divide" tabindex="-1" role="dialog"
                                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 55%;">
                                                <div class="modal-content">
                                                    <div class="modal-header not-print ">
                                                        <h3 class="modal-title not-print " id="exampleModalCenterTitle"
                                                            style="width: 95%; float: left;">Chi tiết đơn hàng vận chuyển</h3>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <form action="{{route('order_divide.save')}}" method="post">
                                                        @csrf
                                                        <div class="modal-body">
                                                            <div class="row" id="order-body">
                                                                <div class="col-sm-6">
                                                                    <div class="box collapsed-box">
                                                                        <table class="table table-bordered">
                                                                            <tr>
                                                                                <td class="td-title">{{ trans('order.shipping_first_name') }}
                                                                                    :
                                                                                </td>
                                                                                <td>{!! $order->first_name !!}
                                                                                </td>
                                                                            </tr>

                                                                            @if (sc_config('customer_lastname'))
                                                                                <tr>
                                                                                    <td class="td-title">{{ trans('order.shipping_last_name') }}
                                                                                        :
                                                                                    </td>
                                                                                    <td>{!! $order->last_name !!}
                                                                                    </td>
                                                                                </tr>
                                                                            @endif

                                                                            @if (sc_config('customer_phone'))
                                                                                <tr>
                                                                                    <td class="td-title">{{ trans('order.shipping_phone') }}
                                                                                        :
                                                                                    </td>
                                                                                    <td>{!! $order->phone !!}
                                                                                    </td>
                                                                                </tr>
                                                                            @endif

                                                                            <tr>
                                                                                <td class="td-title">{{ trans('order.email') }}:</td>
                                                                                <td>{!! empty($order->email)?'N/A':$order->email!!}</td>
                                                                            </tr>

                                                                            @if (sc_config('customer_company'))
                                                                                <tr>
                                                                                    <td class="td-title">{{ trans('order.company') }}:
                                                                                    </td>
                                                                                    <td>{!! $order->company !!}</td>
                                                                                </tr>
                                                                            @endif

                                                                            @if (sc_config('customer_postcode'))
                                                                                <tr>
                                                                                    <td class="td-title">{{ trans('order.postcode') }}
                                                                                        :
                                                                                    </td>
                                                                                    <td>{!! $order->postcode !!}</td>
                                                                                </tr>
                                                                            @endif

                                                                            <tr>
                                                                                <td class="td-title">{{ trans('order.shipping_address1') }}
                                                                                    :
                                                                                </td>
                                                                                <td>{!! $order->address1 !!}</td>
                                                                            </tr>

                                                                            @if (sc_config('customer_address2'))
                                                                                <tr>
                                                                                    <td class="td-title">{{ trans('order.shipping_address2') }}
                                                                                        :
                                                                                    </td>
                                                                                    <td>{!! $order->address2 !!}</td>
                                                                                </tr>
                                                                            @endif

                                                                            <tr>
                                                                                <td class="td-title">Địa chỉ:</td>
                                                                                <td>{!! $order->address3 !!}</td>
                                                                            </tr>

                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="box collapsed-box">
                                                                        <table class="table table-bordered">

                                                                            <tr>
                                                                                <td class="td-title">{{ trans('order.order_status') }}
                                                                                    :
                                                                                </td>
                                                                                <td>{{ $statusOrder[$order->status] }}
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>{{ trans('order.order_shipping_status') }}:</td>
                                                                                <td>{{ $statusShipping[$order->shipping_status]??'' }}
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>{{ trans('order.order_payment_status') }}:</td>
                                                                                <td>{{ $statusPayment[$order->payment_status]??'' }}
                                                                                </td>
                                                                            </tr>
                                                                            {{--                                                        <tr>--}}
                                                                            {{--                                                            <td>{{ trans('order.shipping_method') }}:</td>--}}
                                                                            {{--                                                            <td>{{ $order->shipping_method }}--}}
                                                                            {{--                                                            </td>--}}
                                                                            {{--                                                        </tr>--}}
                                                                            {{--                                                        <tr>--}}
                                                                            {{--                                                            <td>{{ trans('order.payment_method') }}:</td>--}}
                                                                            {{--                                                            <td>{{ $order->payment_method }}--}}
                                                                            {{--                                                            </td>--}}
                                                                            {{--                                                        </tr>--}}
                                                                        </table>
                                                                    </div>
                                                                    <div class="box collapsed-box">
                                                                        <table class="table table-bordered">
                                                                            <tr>
                                                                                <td class="td-title">
                                                                                    Nhà bán hàng:
                                                                                </td>
                                                                                <td>
                                                                                    @if($provider)
                                                                                        <a target="_blank"
                                                                                           href="{{ route('agency.show', ['alias' => $provider->alias]) }}">{{ $provider->name }}</a>
                                                                                    @else
                                                                                        Không tồn tại
                                                                                    @endif
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="box collapsed-box">
                                                                        <style>
                                                                            .resize_input{
                                                                                width: 100px;
                                                                            }
                                                                        </style>
                                                                        <input type="hidden" name="order_id" value="{{$order->id}}">
                                                                        <table class="table table-bordered">
                                                                            <thead>
                                                                            <tr>
                                                                                <th>{{ trans('product.name') }}</th>
                                                                                <th>{{ trans('product.sku') }}</th>
                                                                                <th class="product_price">{{ trans('product.price') }}</th>
                                                                                <th class="product_qty">{{ trans('product.quantity') }}</th>
                                                                                <th class="product_total">{{ trans('product.total_price') }}</th>
                                                                                <th class="product_tax">{{ trans('product.tax') }}</th>
                                                                                <th>Số lượng tách</th>
                                                                                <th>Còn lại</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            @foreach (\App\Models\ShopOrderDivideProduct::where('divide_id', $value->id)->get() as $item)
                                                                                <tr>
                                                                                    <td>{{ $item->name }}></td>
                                                                                    <td>{{ $item->sku }}></td>
                                                                                    <td class="product_price">{{ $item->price }}</td>
                                                                                    <td class="product_qty">{{ $item->qty }}</td>
                                                                                    <td class="product_total">{{ $item->total_price }}</td>
                                                                                    <td class="product_tax">{{ $item->tax }}</td>
                                                                                    <td>{{ $item->munber_divide }}</td>
                                                                                    <td>{{ $item->remaining }}</td>
                                                                                </tr>
                                                                            @endforeach
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                {{-- History --}}
                                                                {{--                                            <div class="col-sm-6">--}}
                                                                {{--                                                <div class="box collapsed-box">--}}
                                                                {{--                                                    <table class="table box table-bordered">--}}
                                                                {{--                                                        <tr>--}}
                                                                {{--                                                            <td class="td-title">{{ trans('order.order_note') }}:--}}
                                                                {{--                                                            </td>--}}
                                                                {{--                                                            <td>--}}
                                                                {{--                                                                <a href="#" class="updateInfo" data-name="comment"--}}
                                                                {{--                                                                   data-type="text"--}}
                                                                {{--                                                                   data-pk="{{ $order->id }}" data-url=""--}}
                                                                {{--                                                                   data-title="">{{ $order->comment }}--}}
                                                                {{--                                                                </a>--}}
                                                                {{--                                                            </td>--}}
                                                                {{--                                                        </tr>--}}
                                                                {{--                                                    </table>--}}
                                                                {{--                                                </div>--}}
                                                                {{--                                            </div>--}}
                                                                {{-- //End history --}}

                                                                {{-- Total --}}
                                                                {{--                                                <div class="col-sm-12">--}}
                                                                {{--                                                    <div class="box collapsed-box">--}}
                                                                {{--                                                        <table class="table table-bordered">--}}
                                                                {{--                                                            @foreach ($dataTotal as $element)--}}
                                                                {{--                                                                @if ($element['code'] =='subtotal')--}}
                                                                {{--                                                                    <tr>--}}
                                                                {{--                                                                        <td class="td-title-normal">Tổng giá trị sản--}}
                                                                {{--                                                                            phẩm:--}}
                                                                {{--                                                                        </td>--}}
                                                                {{--                                                                        <td style="text-align:right"--}}
                                                                {{--                                                                            class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>--}}
                                                                {{--                                                                    </tr>--}}
                                                                {{--                                                                @endif--}}
                                                                {{--                                                                @if ($element['code'] =='tax')--}}
                                                                {{--                                                                    <tr>--}}
                                                                {{--                                                                        <td class="td-title-normal">Thuế:</td>--}}
                                                                {{--                                                                        <td style="text-align:right"--}}
                                                                {{--                                                                            class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>--}}
                                                                {{--                                                                    </tr>--}}
                                                                {{--                                                                @endif--}}

                                                                {{--                                                                @if ($element['code'] =='shipping')--}}
                                                                {{--                                                                    <tr>--}}
                                                                {{--                                                                        <td>{!! $element['title'] !!}Phí vận chuyển:--}}
                                                                {{--                                                                        </td>--}}
                                                                {{--                                                                        <td style="text-align:right">{{$element['value'] }}</td>--}}
                                                                {{--                                                                    </tr>--}}
                                                                {{--                                                                @endif--}}
                                                                {{--                                                                @if ($element['code'] =='discount')--}}
                                                                {{--                                                                    <tr>--}}
                                                                {{--                                                                        <td>Giảm giá (-):</td>--}}
                                                                {{--                                                                        <td style="text-align:right">{{$element['value'] }}</td>--}}
                                                                {{--                                                                    </tr>--}}
                                                                {{--                                                                @endif--}}

                                                                {{--                                                                @if ($element['code'] =='total')--}}
                                                                {{--                                                                    <tr style="background:#f5f3f3;font-weight: bold;">--}}
                                                                {{--                                                                        <td>Tổng thanh toán:</td>--}}
                                                                {{--                                                                        <td style="text-align:right"--}}
                                                                {{--                                                                            class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>--}}
                                                                {{--                                                                    </tr>--}}
                                                                {{--                                                                @endif--}}

                                                                {{--                                                                @if ($element['code'] =='received')--}}
                                                                {{--                                                                    <tr>--}}
                                                                {{--                                                                        <td>Đã thanh toán(-):</td>--}}
                                                                {{--                                                                        <td style="text-align:right">{{$element['value'] }}</td>--}}
                                                                {{--                                                                    </tr>--}}
                                                                {{--                                                                @endif--}}

                                                                {{--                                                            @endforeach--}}

                                                                {{--                                                            <tr {!! $style !!}  class="data-balance">--}}
                                                                {{--                                                                <td>Còn lại:</td>--}}
                                                                {{--                                                                <td style="text-align:right">{{($order->balance === NULL)?sc_currency_format($order->total):sc_currency_format($order->balance) }}</td>--}}
                                                                {{--                                                            </tr>--}}
                                                                {{--                                                        </table>--}}
                                                                {{--                                                    </div>--}}

                                                                {{--                                                </div>--}}
                                                                {{-- //End total --}}

                                                            </div>
                                                        </div>
                                                        <div class="modal-footer not-print ">
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                                                            <button type="button" class="btn btn-warning" onclick="sub_order_printf()">Xuất PDF</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        <span onclick="deleteItemDivide({{ $value->id }});"
                                              title="{{ trans('admin.delete') }}"
                                              class="btn btn-danger btn-xs"><i
                                                    class="fa fa-trash"></i></span>
                                    </td>
                                </tr>
                                @endforeach
                                <tr>
                                    <td colspan="3">
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-sm btn-flat btn-success"
                                                data-toggle="modal"
                                                data-target="#exampleModalCenter"><i
                                                    class="fa fa-plus"></i>
                                            Tách đơn hàng
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 55%;">
                                <div class="modal-content">
                                    <div class="modal-header not-print ">
                                        <h3 class="modal-title not-print " id="exampleModalCenterTitle"
                                            style="width: 95%; float: left;">Tách đơn hàng</h3>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="{{route('order_divide.save')}}" method="post">
                                        @csrf
                                        <div class="modal-body">
                                            <div class="row" id="order-body">
                                                <div class="col-sm-6">
                                                    <div class="box collapsed-box">
                                                        <table class="table table-bordered">
                                                            <tr>
                                                                <td class="td-title">{{ trans('order.shipping_first_name') }}
                                                                    :
                                                                </td>
                                                                <td>{!! $order->first_name !!}
                                                                </td>
                                                            </tr>

                                                            @if (sc_config('customer_lastname'))
                                                                <tr>
                                                                    <td class="td-title">{{ trans('order.shipping_last_name') }}
                                                                        :
                                                                    </td>
                                                                    <td>{!! $order->last_name !!}
                                                                    </td>
                                                                </tr>
                                                            @endif

                                                            @if (sc_config('customer_phone'))
                                                                <tr>
                                                                    <td class="td-title">{{ trans('order.shipping_phone') }}
                                                                        :
                                                                    </td>
                                                                    <td>{!! $order->phone !!}
                                                                    </td>
                                                                </tr>
                                                            @endif

                                                            <tr>
                                                                <td class="td-title">{{ trans('order.email') }}:</td>
                                                                <td>{!! empty($order->email)?'N/A':$order->email!!}</td>
                                                            </tr>

                                                            @if (sc_config('customer_company'))
                                                                <tr>
                                                                    <td class="td-title">{{ trans('order.company') }}:
                                                                    </td>
                                                                    <td>{!! $order->company !!}</td>
                                                                </tr>
                                                            @endif

                                                            @if (sc_config('customer_postcode'))
                                                                <tr>
                                                                    <td class="td-title">{{ trans('order.postcode') }}
                                                                        :
                                                                    </td>
                                                                    <td>{!! $order->postcode !!}</td>
                                                                </tr>
                                                            @endif

                                                            <tr>
                                                                <td class="td-title">{{ trans('order.shipping_address1') }}
                                                                    :
                                                                </td>
                                                                <td>{!! $order->address1 !!}</td>
                                                            </tr>

                                                            @if (sc_config('customer_address2'))
                                                                <tr>
                                                                    <td class="td-title">{{ trans('order.shipping_address2') }}
                                                                        :
                                                                    </td>
                                                                    <td>{!! $order->address2 !!}</td>
                                                                </tr>
                                                            @endif

                                                            <tr>
                                                                <td class="td-title">Địa chỉ:</td>
                                                                <td>{!! $order->address3 !!}</td>
                                                            </tr>

                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="box collapsed-box">
                                                        <table class="table table-bordered">

                                                            <tr>
                                                                <td class="td-title">{{ trans('order.order_status') }}
                                                                    :
                                                                </td>
                                                                <td>{{ $statusOrder[$order->status] }}
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>{{ trans('order.order_shipping_status') }}:</td>
                                                                <td>{{ $statusShipping[$order->shipping_status]??'' }}
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>{{ trans('order.order_payment_status') }}:</td>
                                                                <td>{{ $statusPayment[$order->payment_status]??'' }}
                                                                </td>
                                                            </tr>
                                                            {{--                                                        <tr>--}}
                                                            {{--                                                            <td>{{ trans('order.shipping_method') }}:</td>--}}
                                                            {{--                                                            <td>{{ $order->shipping_method }}--}}
                                                            {{--                                                            </td>--}}
                                                            {{--                                                        </tr>--}}
                                                            {{--                                                        <tr>--}}
                                                            {{--                                                            <td>{{ trans('order.payment_method') }}:</td>--}}
                                                            {{--                                                            <td>{{ $order->payment_method }}--}}
                                                            {{--                                                            </td>--}}
                                                            {{--                                                        </tr>--}}
                                                        </table>
                                                    </div>
                                                    <div class="box collapsed-box">
                                                        <table class="table table-bordered">
                                                            <tr>
                                                                <td class="td-title">
                                                                    Nhà bán hàng:
                                                                </td>
                                                                <td>
                                                                    @if($provider)
                                                                        <a target="_blank"
                                                                           href="{{ route('agency.show', ['alias' => $provider->alias]) }}">{{ $provider->name }}</a>
                                                                    @else
                                                                        Không tồn tại
                                                                    @endif
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="box collapsed-box">
                                                        <style>
                                                            .resize_input{
                                                                width: 100px;
                                                            }
                                                        </style>
                                                        <input type="hidden" name="order_id" value="{{$order->id}}">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                            <tr>
                                                                <th>{{ trans('product.name') }}</th>
                                                                <th>{{ trans('product.sku') }}</th>
                                                                <th class="product_price">{{ trans('product.price') }}</th>
                                                                <th class="product_qty">{{ trans('product.quantity') }}</th>
                                                                <th class="product_total">{{ trans('product.total_price') }}</th>
                                                                <th class="product_tax">{{ trans('product.tax') }}</th>
                                                                <th>Số lượng tách</th>
                                                                <th>Còn lại</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            @foreach ($order->details as $item)
                                                                <tr>
                                                                    <td><input class="resize_input" type="text"
                                                                               name="name[]"
                                                                               value="{{ $item->name }}" readonly></td>
                                                                    <td><input class="resize_input" type="text"
                                                                               name="sku[]"
                                                                               value="{{ $item->sku }}" readonly></td>
                                                                    <td class="product_price"><input class="resize_input" type="number"
                                                                                                     name="price[]"
                                                                                                     value="{{ $item->price }}" readonly>
                                                                    </td>
                                                                    <td class="product_qty"><input class="resize_input qty_t" type="number"
                                                                                                   name="qty[]"
                                                                                                   value="{{ $item->qty }}" readonly>
                                                                    </td>
                                                                    <td class="product_total"><input class="resize_input" type="number"
                                                                                                     name="total_price[]"
                                                                                                     value="{{ $item->total_price }}" readonly>
                                                                    </td>
                                                                    <td class="product_tax"><input class="resize_input" type="number"
                                                                                                   name="tax[]"
                                                                                                   value="{{ $item->tax }}" readonly>
                                                                    </td>
                                                                    <td><input class="resize_input munber_divide_t" min="0" type="number" name="munber_divide[]" onchange="update_total_t($(this));"></td>
                                                                    <td><input class="resize_input remaining_t" type="number" name="remaining[]" value=""
                                                                               readonly></td>
                                                                </tr>
                                                            @endforeach
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                {{-- History --}}
                                                {{--                                            <div class="col-sm-6">--}}
                                                {{--                                                <div class="box collapsed-box">--}}
                                                {{--                                                    <table class="table box table-bordered">--}}
                                                {{--                                                        <tr>--}}
                                                {{--                                                            <td class="td-title">{{ trans('order.order_note') }}:--}}
                                                {{--                                                            </td>--}}
                                                {{--                                                            <td>--}}
                                                {{--                                                                <a href="#" class="updateInfo" data-name="comment"--}}
                                                {{--                                                                   data-type="text"--}}
                                                {{--                                                                   data-pk="{{ $order->id }}" data-url=""--}}
                                                {{--                                                                   data-title="">{{ $order->comment }}--}}
                                                {{--                                                                </a>--}}
                                                {{--                                                            </td>--}}
                                                {{--                                                        </tr>--}}
                                                {{--                                                    </table>--}}
                                                {{--                                                </div>--}}
                                                {{--                                            </div>--}}
                                                {{-- //End history --}}

                                                {{-- Total --}}
                                                <div class="col-sm-12">
                                                    <div class="box collapsed-box">
                                                        <table class="table table-bordered">
                                                            @foreach ($dataTotal as $element)
                                                                @if ($element['code'] =='subtotal')
                                                                    <tr>
                                                                        <td class="td-title-normal">Tổng giá trị sản
                                                                            phẩm:
                                                                        </td>
                                                                        <td style="text-align:right"
                                                                            class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                                                    </tr>
                                                                @endif
                                                                @if ($element['code'] =='tax')
                                                                    <tr>
                                                                        <td class="td-title-normal">Thuế:</td>
                                                                        <td style="text-align:right"
                                                                            class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                                                    </tr>
                                                                @endif

                                                                @if ($element['code'] =='shipping')
                                                                    <tr>
                                                                        <td>{!! $element['title'] !!}Phí vận chuyển:
                                                                        </td>
                                                                        <td style="text-align:right">{{$element['value'] }}</td>
                                                                    </tr>
                                                                @endif
                                                                @if ($element['code'] =='discount')
                                                                    <tr>
                                                                        <td>Giảm giá (-):</td>
                                                                        <td style="text-align:right">{{$element['value'] }}</td>
                                                                    </tr>
                                                                @endif

                                                                @if ($element['code'] =='total')
                                                                    <tr style="background:#f5f3f3;font-weight: bold;">
                                                                        <td>Tổng thanh toán:</td>
                                                                        <td style="text-align:right"
                                                                            class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                                                    </tr>
                                                                @endif

                                                                @if ($element['code'] =='received')
                                                                    <tr>
                                                                        <td>Đã thanh toán(-):</td>
                                                                        <td style="text-align:right">{{$element['value'] }}</td>
                                                                    </tr>
                                                                @endif

                                                            @endforeach

                                                            <tr {!! $style !!}  class="data-balance">
                                                                <td>Còn lại:</td>
                                                                <td style="text-align:right">{{($order->balance === NULL)?sc_currency_format($order->total):sc_currency_format($order->balance) }}</td>
                                                            </tr>
                                                        </table>
                                                    </div>

                                                </div>
                                                {{-- //End total --}}

                                            </div>
                                        </div>
                                        <div class="modal-footer not-print ">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy
                                            </button>
                                            <button type="button" class="btn btn-warning" onclick="sub_order_printf()">Xuất PDF</button>
                                            <button type="submit" class="btn btn-success">Tách ngay
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                    {{-- //End history shipping--}}
                    {{-- history pay --}}
                    <div class="col-sm-6">
                        <form id="form-add-item-payment" action="" method="">
                            @csrf
                            <input type="hidden" name="order_id" value="{{ $order->id }}">
                            <div class="box collapsed-box">
                                <h4>Lịch sử thanh toán</h4>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Ngày</th>
                                        <th>Thanh toán</th>
                                        <th>Ghi chú</th>
                                        <th>Hành động</th>
                                    </tr>
                                    @if(! is_null($order->history_payment))
                                        @foreach($order->history_payment as $key => $payment)
                                            <tr>
                                                <td>{{date('d-m-Y', strtotime($payment->date))}}</td>
                                                <td>{{sc_currency_format($payment->cost)}}</td>
                                                <td>{{$payment->note}}</td>
                                                <td>
                                                    <span onclick="deleteItemPayment({{ $payment->id }});"
                                                          class="btn btn-danger btn-xs" data-title="Delete"><i
                                                                class="fa fa-trash" aria-hidden="true"></i></span>
                                                </td>
                                            </tr>
                                        @endforeach
                                    @endif
                                    <tr id="add-item-payment" class="not-print">
                                        <td colspan="6">
                                            <button type="button" class="btn btn-sm btn-flat btn-success"
                                                    id="add-item-button-payment" title="Thêm thanh toán"><i
                                                        class="fa fa-plus"></i> Thêm thanh toán
                                            </button>
                                            &nbsp;&nbsp;&nbsp;<button style="display: none; margin-right: 50px"
                                                                      type="button"
                                                                      class="btn btn-sm btn-flat btn-warning"
                                                                      id="add-item-button-payment-save" title="Save"><i
                                                        class="fa fa-save"></i> {{ trans('admin.save') }}</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>
                    {{-- //End history pay  --}}

                </div>
                <div class="row">
                    {{-- History --}}
                    <div class="col-sm-6">
                        <div class="box collapsed-box">
                            <table class="table box table-bordered">
                                <tr>
                                    <td class="td-title">{{ trans('order.order_note') }}:</td>
                                    <td>
                                        <a href="#" class="updateInfo" data-name="comment" data-type="text"
                                           data-pk="{{ $order->id }}" data-url=""
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

                    {{-- Total --}}
                    <div class="col-sm-6">
                        <div class="box collapsed-box">
                            <table class="table table-bordered">
                                @foreach ($dataTotal as $element)
                                    @if ($element['code'] =='subtotal')
                                        <tr>
                                            <td class="td-title-normal">Tổng giá trị sản phẩm:</td>
                                            <td style="text-align:right"
                                                class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                        </tr>
                                    @endif
                                    @if ($element['code'] =='tax')
                                        <tr>
                                            <td class="td-title-normal">Thuế:</td>
                                            <td style="text-align:right"
                                                class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                        </tr>
                                    @endif

                                    @if ($element['code'] =='shipping')
                                        <tr>
                                            <td>{!! $element['title'] !!}Phí vận chuyển:</td>
                                            <td style="text-align:right">{{$element['value'] }}</td>
                                        </tr>
                                    @endif
                                    @if ($element['code'] =='discount')
                                        <tr>
                                            <td>Giảm giá (-):</td>
                                            <td style="text-align:right">{{$element['value'] }}</td>
                                        </tr>
                                    @endif

                                    @if ($element['code'] =='total')
                                        <tr style="background:#f5f3f3;font-weight: bold;">
                                            <td>Tổng thanh toán:</td>
                                            <td style="text-align:right"
                                                class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td>
                                        </tr>
                                    @endif

                                    @if ($element['code'] =='received')
                                        <tr>
                                            <td>Đã thanh toán(-):</td>
                                            <td style="text-align:right">{{$element['value'] }}</td>
                                        </tr>
                                    @endif

                                @endforeach

                                <tr {!! $style !!}  class="data-balance">
                                    <td>Còn lại:</td>
                                    <td style="text-align:right">{{($order->balance === NULL)?sc_currency_format($order->total):sc_currency_format($order->balance) }}</td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    {{-- //End total --}}
                </div>
                <div class="row">
                    @if($order->status > 2 && $order->status < 5)
                        <div class="col-md-12 float-right not-print">
                            <form action="{{route('admin_order.change_status')}}" method="post"
                                  style="float: right; padding: 10px;">
                                @csrf
                                <input type="hidden" name="id" value="{{ $order->id }}">
                                <input type="hidden" name="status" value="{{$order->status+1}}">
                                <input class="btn btn-success"
                                       onclick="return confirm('Đơn hàng này sẽ được xác nhận tiếp tục?')" type="submit"
                                       value="Xác nhận">
                            </form>
                            <form action="{{route('admin_order.change_status')}}" method="post"
                                  style="float: right; padding: 10px;">
                                @csrf
                                <input type="hidden" name="status" value="6">
                                <input type="hidden" name="id" value="{{ $order->id }}">
                                <input class="btn btn-danger"
                                       onclick="return confirm('Đơn hàng này sẽ được xác định là bị lỗi?')"
                                       type="submit" value="Lỗi thực hiện">
                            </form>
                        </div>
                    @endif
                </div>
                @php
                    $htmlAddItemPayment = '
                            <tr>
                                <td><input type="date" class="form-control" name="date[]" value="'. date('Y-m-d') .'" required></td>
                                <td><input type="number" min="0" class="form-control" name="cost[]" value="0" required></td>
                                <td><input type="text" class="form-control" name="note[]"></td>
                                <td><button onClick="$(this).parent().parent().remove();" class="btn btn-danger btn-md btn-flat" data-title="Delete"><i class="fa fa-times" aria-hidden="true"></i></button></td>
                            </tr>
                            ';
                            $htmlAddItemPayment = str_replace("\n", '', $htmlAddItemPayment);
                            $htmlAddItemPayment = str_replace("\t", '', $htmlAddItemPayment);
                            $htmlAddItemPayment = str_replace("\r", '', $htmlAddItemPayment);
                @endphp
                @php
                    $htmlAddItemDivide = '
                            <tr>
                                <td><input type="date" class="form-control" name="date[]" ></td>
                                <td><input type="number" min="0" class="form-control" name="cost[]" value="0"></td>
                                <td><input type="text" disabled class="add_sku form-control"  value=""></td>
                                <td><input onChange="update_total($(this));" type="number" min="0" class="add_price form-control" name="add_price[]" value="0"></td>
                                <td><input onChange="update_total($(this));" type="number" min="0" class="add_qty form-control" name="add_qty[]" value="0"></td>
                                <td><input type="number" disabled class="add_total form-control" value="0"></td>
                                <td><input  type="number" min="0" class="add_tax form-control" name="add_tax[]" value="0"></td>
                                <td><button onClick="$(this).parent().parent().remove();" class="btn btn-danger btn-md btn-flat" data-title="Delete"><i class="fa fa-times" aria-hidden="true"></i></button></td>
                            </tr>
                            ';
                            $htmlAddItemDivide = str_replace("\n", '', $htmlAddItemDivide);
                            $htmlAddItemDivide = str_replace("\t", '', $htmlAddItemDivide);
                            $htmlAddItemDivide = str_replace("\r", '', $htmlAddItemDivide);
                @endphp
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

        .kt-wizard-v1__nav-item:last-child:after {
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

        function update_total_t(e){
            var qty = 0;
            var divide = 0;
            node = e.closest('tr');
            qty = parseInt(node.find('.qty_t').eq(0).val());
            divide = parseInt(node.find('.munber_divide_t').eq(0).val());

            if (divide < 0){
                node.find('.munber_divide_t').eq(0).val(1);
                node.find('.remaining_t').eq(0).val(qty-1);
            }
            if(divide > qty){
                node.find('.munber_divide_t').eq(0).val(qty);
                node.find('.remaining_t').eq(0).val(0);
            }else {
                node.find('.remaining_t').eq(0).val(qty - divide);
            }

        }

        $(document).ready(function () {
            // does current browser support PJAX
            if ($.support.pjax) {
                $.pjax.defaults.timeout = 2000; // time in milliseconds
            }

        });

        $('#add-item-button-payment').click(function () {
            var html = '{!! $htmlAddItemPayment !!}';
            $('#add-item-payment').before(html);
            // $('.select2').select2();
            $('#add-item-button-payment-save').show();
        });

        $('#add-item-button-divide').click(function () {
            var html = '{!! $htmlAddItemDivide !!}';
            $('#add-item-divide').before(html);
            // $('.select2').select2();
            $('#add-item-button-divide-save').show();
        });

        $('#add-item-button-payment-save').click(function (event) {
            $('#add-item-button-payment').prop('disabled', true);
            $('#add-item-button-payment-save').button('loading');
            $.ajax({
                url: '{{ route("admin_order.add_item_payment") }}',
                type: 'post',
                dataType: 'json',
                data: $('form#form-add-item-payment').serialize(),
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (result) {
                    $('#loading').hide();
                    if (parseInt(result.error) == 0) {
                        location.reload();
                    } else {
                        alertJs('error', result.msg);
                    }
                }
            });
        });

        {{-- sweetalert2 --}}
        function deleteItemPayment(id) {
            Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: true,
            }).fire({
                title: '{{ trans('admin.confirm_delete') }}',
                text: "",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: '{{ trans('admin.confirm_delete_yes') }}',
                confirmButtonColor: "#DD6B55",
                cancelButtonText: '{{ trans('admin.confirm_delete_no') }}',
                reverseButtons: true,

                preConfirm: function () {
                    return new Promise(function (resolve) {
                        $.ajax({
                            method: 'POST',
                            url: '{{ route("admin_order.delete_item_payment") }}',
                            data: {
                                'pId': id,
                                _token: '{{ csrf_token() }}',
                            },
                            success: function (response) {
                                if (response.error == 0) {
                                    location.reload();
                                    alertJs('success', response.msg);
                                } else {
                                    alertJs('error', response.msg);
                                }

                            }
                        });
                    });
                }

            }).then((result) => {
                if (result.value) {
                    alertMsg('{{ trans('admin.confirm_delete_deleted') }}', '{{ trans('admin.confirm_delete_deleted_msg') }}', 'success');
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    // swalWithBootstrapButtons.fire(
                    //   'Cancelled',
                    //   'Your imaginary file is safe :)',
                    //   'error'
                    // )
                }
            })
        }

        {{-- sweetalert2 --}}
        function deleteItemDivide(id) {
            Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: true,
            }).fire({
                title: '{{ trans('admin.confirm_delete') }}',
                text: "",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: '{{ trans('admin.confirm_delete_yes') }}',
                confirmButtonColor: "#DD6B55",
                cancelButtonText: '{{ trans('admin.confirm_delete_no') }}',
                reverseButtons: true,

                preConfirm: function () {
                    return new Promise(function (resolve) {
                        $.ajax({
                            method: 'POST',
                            url: '{{ route("order_divide.delete") }}',
                            data: {
                                'pId': id,
                                _token: '{{ csrf_token() }}',
                            },
                            success: function (response) {
                                if (response.error == 0) {
                                    location.reload();
                                    alertJs('success', response.msg);
                                } else {
                                    alertJs('error', response.msg);
                                }

                            }
                        });
                    });
                }

            }).then((result) => {
                if (result.value) {
                    alertMsg('{{ trans('admin.confirm_delete_deleted') }}', '{{ trans('admin.confirm_delete_deleted_msg') }}', 'success');
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    // swalWithBootstrapButtons.fire(
                    //   'Cancelled',
                    //   'Your imaginary file is safe :)',
                    //   'error'
                    // )
                }
            })
        }

        {{--/ sweetalert2 --}}

        function order_print() {
            $('.not-print').hide();
            window.print();
            $('.not-print').show();
        }

        function sub_order_printf() {
            $('.not-print').hide();
            var divToPrint = document.getElementById('exampleModalCenter');
            var newWin = window.open('', 'Print-Window');
            newWin.document.open();
            newWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
            newWin.document.close();
            $('.not-print').show();
        }

    </script>

@endpush
