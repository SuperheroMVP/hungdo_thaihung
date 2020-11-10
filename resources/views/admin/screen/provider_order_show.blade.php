@extends('admin.layout')

@section('main')
    <div class="row">
{{--                {{dd($order)}}--}}
        <div class="col-md-12">
            <div class="p-20 not-print" style="text-align: center; background-color: white;">
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
                @endif
            </div>
            <div class="box container">
                <div class="box-header with-border">
                    <h3 class="box-title">{{ trans('order.order_detail') }} #{{ $order->id }}</h3>
                    <div class="box-tools not-print">
                        <div class="btn-group pull-right" style="margin-right: 0px">
                            <a href="{{ route('provider_order.index') }}" class="btn btn-sm btn-flat btn-default"><i class="fa fa-list"></i>&nbsp;{{ trans('admin.list') }}</a>
                        </div>
                        <div class="btn-group pull-right" style="margin-right: 10px">
                            <a href="{{ route('provider_order.export_detail').'?order_id='.$order->id.'&type=invoice' }}" class="btn btn-sm btn-flat btn-twitter" title="Export"><i class="fa fa-file-excel-o"></i><span class="hidden-xs"> Excel</span></a>
                        </div>
                        {{--                   <div class="btn-group pull-right" style="margin-right: 10px">
                                              <a href="{{ route('provider_order.export_detail').'?order_id='.$order->id.'&type=pdf' }}" class="btn btn-sm btn-flat btn-warning" title="Export"><i class="fa fa-file-pdf-o"></i><span class="hidden-xs"> PDF</span></a>
                                          </div> --}}
                        <div class="btn-group pull-right" style="margin-right: 10px;border:1px solid #c5b5b5;">
                            <a class="btn btn-sm btn-flat" title="Export" onclick="order_print()"><i class="fa fa-print"></i><span class="hidden-xs"> Print</span></a>
                        </div>
                    </div>
                </div>

                <div class="row" id="order-body">
                    <div class="col-sm-6">
                        <table class="table table-bordered">
                            <tr>
                                <td class="td-title">Tên đại lý:</td><td>{!! $order->provider_name !!}</td>
                            </tr>

                            <tr>
                                <td class="td-title">Tỉnh:</td><td>{!! $order->province !!}</td>
                            </tr>

                            <tr>
                                <td class="td-title">Huyện:</td><td>{!! $order->district !!}</td>
                            </tr>

                            <tr>
                                <td class="td-title">Xã:</td><td>{!! $order->ward !!}</td>
                            </tr>

                            <tr>
                                <td class="td-title">Địa chỉ:</td><td>{!! $order->address !!}</td>
                            </tr>



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
                                    <td class="td-title">{{ trans('order.company') }}:</td><td><a href="#" class="updateInfoRequired" data-name="company" data-type="text" data-pk="{{ $order->id }}" data-url="{{ route("provider_order.update") }}" data-title="{{ trans('order.company') }}" >{!! $order->company !!}</a></td>
                                </tr>
                            @endif

                            {{--                            @if (sc_config('customer_postcode'))--}}
                            {{--                                <tr>--}}
                            {{--                                    <td class="td-title">{{ trans('order.postcode') }}:</td><td><a href="#" class="updateInfoRequired" data-name="postcode" data-type="text" data-pk="{{ $order->id }}" data-url="{{ route("provider_order.update") }}" data-title="{{ trans('order.postcode') }}" >{!! $order->postcode !!}</a></td>--}}
                            {{--                                </tr>--}}
                            {{--                            @endif--}}

                        </table>
                    </div>
                    <div class="col-sm-6">
                        <table  class="table table-bordered">

                            <tr><td  class="td-title">{{ trans('order.order_status') }}:</td><td>{{ $statusOrder[$order->status] }}</td></tr>
                            <tr><td>{{ trans('order.order_shipping_status') }}:</td><td>{{ $statusShipping[$order->shipping_status]??'' }}</td></tr>
                            <tr><td>{{ trans('order.order_payment_status') }}:</td><td>{{ $statusPayment[$order->payment_status]??'' }}</td></tr>
                            <tr><td>{{ trans('order.shipping_method') }}:</td><td>{{ $order->shipping_method }}</td></tr>
                            <tr><td>{{ trans('order.payment_method') }}:</td><td>{{ $order->payment_method }}</td></tr>
                        </table>
                        <table class="table table-bordered">
                            <tr>
                                <td class="td-title">
                                    Nhà bán hàng:
                                </td>
                                <td>
                                    @if( $supplier = $order->getInforProvider)
                                        <h4>{{$supplier->name}}</h4>
                                        <p>Địa chỉ: {{$supplier->address}}, {{$supplier->ward}}, {{$supplier->district}}, {{$supplier->province}}</p>
                                        <p>Liên hệ: {{$supplier->phone}}, {{$supplier->email}}</p>
                                    @else
                                        <p>Nhà cung cấp không tồn tại!</p>
                                    @endif
                                    {{--                                    @if($provider)<a href="{{ route('admin_provider.show', ['id' => $provider->id]) }}">{{ $provider->name }}</a>@else Không tồn tại @endif--}}
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
                    <input type="hidden" name="order_id"  value="{{ $order->id }}">
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
                                                                  $html .= '<br><b>'.$attributesGroup[$key].'</b> : <i>'.sc_render_option_price($element, $order->currency, $order->exchange_rate).'</i>';
                                                                }
                                                          }
                                                    @endphp
                                                    {!! $html !!}
                                                </td>
                                                <td>{{ $item->sku }}</td>
                                                <td class="product_price">{{ $item->price }}</td>
                                                <td class="product_qty">x {{ $item->qty }}</td>
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
                </form>

                <div class="row">
                    {{-- Total --}}
                    <div class="col-sm-6">
                        <div class="box collapsed-box">
                            <table   class="table table-bordered">
                                @foreach ($dataTotal as $element)
                                    @if ($element['code'] =='subtotal')
                                        <tr><td  class="td-title-normal">Tổng giá trị sản phẩm:</td><td style="text-align:right" class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td></tr>
                                    @endif
                                    @if ($element['code'] =='tax')
                                        <tr><td  class="td-title-normal">Thuế:</td><td style="text-align:right" class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td></tr>
                                    @endif

                                    @if ($element['code'] =='shipping')
                                        <tr><td>Phí vận chuyển:</td><td style="text-align:right">{{$element['value'] }}</td></tr>
                                    @endif
                                    @if ($element['code'] =='discount')
                                        <tr><td>Giảm giá (-):</td><td style="text-align:right">{{$element['value'] }}</td></tr>
                                    @endif

                                    @if ($element['code'] =='total')
                                        <tr style="background:#f5f3f3;font-weight: bold;"><td>Tổng thanh toán:</td><td style="text-align:right" class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td></tr>
                                    @endif

                                    @if ($element['code'] =='received')
                                        <tr><td>Đã thanh toán(-):</td><td style="text-align:right">{{$element['value'] }}</td></tr>
                                    @endif

                                @endforeach

                                <tr  {!! $style !!}  class="data-balance"><td>Còn lại:</td><td style="text-align:right">{{($order->balance === NULL)?sc_currency_format($order->total):sc_currency_format($order->balance) }}</td></tr>
                            </table>
                        </div>

                    </div>
                    {{-- //End total --}}

                    {{-- History --}}
                    <div class="col-sm-6">
                        <div class="box collapsed-box">
                            <table class="table box table-bordered">
                                <tr>
                                    <td  class="td-title">{{ trans('order.order_note') }}:</td>
                                    <td>{{ $order->comment }}</td>
                                </tr>
                            </table>
                        </div>

                        <div class="box collapsed-box not-print">
                            <div class="box-header with-border">
                                <h3 class="box-title">{{ trans('order.order_history') }}</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="box-body table-responsive no-padding box-primary">
                                @if (count($order->history))
                                    <table  class="table table-bordered" id="history">
                                        <tr>
                                            <th>{{ trans('order.history_staff') }}</th>
                                            <th>{{ trans('order.history_content') }}</th>
                                            <th>{{ trans('order.history_time') }}</th>
                                        </tr>
                                        @foreach ($order->history->sortKeysDesc()->all() as $history)
                                            <tr>
                                                <td>{{ \App\Admin\Models\AdminUser::find($history['admin_id'])->name??'' }}</td>
                                                <td><div class="history">{!! $history['content'] !!}</div></td>
                                                <td>{{ $history['add_date'] }}</td>
                                            </tr>
                                        @endforeach
                                    </table>
                                @endif
                            </div>
                        </div>

                    </div>
                    {{-- //End history --}}
                    @if($order->status > 2 && $order->status < 5)
                        <div class="col-md-12 float-right not-print">
                            <form action="{{route('provider_order.change_status')}}" method="post"
                                  style="float: right; padding: 10px;">
                                @csrf
                                <input type="hidden" name="id" value="{{ $order->id }}">
                                <input type="hidden" name="status" value="{{$order->status+1}}">
                                <input class="btn btn-success" onclick="return confirm('Đơn hàng này sẽ được xác nhận tiếp tục?')" type="submit" value="Xác nhận">
                            </form>
                            <form action="{{route('provider_order.change_status')}}" method="post"
                                  style="float: right; padding: 10px;">
                                @csrf
                                <input type="hidden" name="status" value="6">
                                <input type="hidden" name="id" value="{{ $order->id }}">
                                <input class="btn btn-danger" onclick="return confirm('Đơn hàng này sẽ được xác định là bị lỗi?')" type="submit" value="Lỗi thực hiện">
                            </form>
                        </div>
                    @endif
                </div>
                @php
                    $htmlSelectProduct = '<tr>
                                <td>
                                  <select onChange="selectProduct($(this));"  class="add_id form-control select2" name="add_id[]" style="width:100% !important;">
                                  <option value="0">'.trans('order.select_product').'</option>';
                                  if(count($products)){
                                    foreach ($products as $pId => $productName){
                                      $htmlSelectProduct .='<option  value="'.$pId.'" >'.$productName.'</option>';
                                     }
                                  }
                    $htmlSelectProduct .='
                                </select>
                                <span class="add_attr"></span>
                              </td>
                                <td><input type="text" disabled class="add_sku form-control"  value=""></td>
                                <td><input onChange="update_total($(this));" type="number" min="0" class="add_price form-control" name="add_price[]" value="0"></td>
                                <td><input onChange="update_total($(this));" type="number" min="0" class="add_qty form-control" name="add_qty[]" value="0"></td>
                                <td><input type="number" disabled class="add_total form-control" value="0"></td>
                                <td><input  type="number" min="0" class="add_tax form-control" name="add_tax[]" value="0"></td>
                                <td><button onClick="$(this).parent().parent().remove();" class="btn btn-danger btn-md btn-flat" data-title="Delete"><i class="fa fa-times" aria-hidden="true"></i></button></td>
                              </tr>
                            <tr>
                            </tr>';
                          $htmlSelectProduct = str_replace("\n", '', $htmlSelectProduct);
                          $htmlSelectProduct = str_replace("\t", '', $htmlSelectProduct);
                          $htmlSelectProduct = str_replace("\r", '', $htmlSelectProduct);
                @endphp
            </div>
        </div>
    </div>
@endsection


@push('styles')
    <style type="text/css">
        .history{
            max-height: 50px;
            max-width: 300px;
            overflow-y: auto;
        }
        .td-title{
            width: 35%;
            font-weight: bold;
        }
        .td-title-normal{
            width: 35%;
        }
        .product_qty{
            width: 80px;
            text-align: right;
        }
        .product_price,.product_total{
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
{{--    <link rel="stylesheet" href="{{ asset('admin/css/plugins.bundle.css')}}">--}}
{{--    <link rel="stylesheet" href="{{ asset('admin/css/style.bundle.css')}}">--}}
{{--    <link rel="stylesheet" href="{{ asset('admin/css/wizard-1.css')}}">--}}
@endpush

@push('scripts')
    {{-- //Pjax --}}
    <script src="{{ asset('admin/plugin/jquery.pjax.js')}}"></script>

    <!-- Ediable -->
    <script src="{{ asset('admin/plugin/bootstrap-editable.min.js')}}"></script>



    <script type="text/javascript">

        $(document).ready(function() {
//Initialize Select2 Elements
            $('.select2').select2();
        });

        function update_total(e){
            node = e.closest('tr');
            var qty = node.find('.add_qty').eq(0).val();
            var price = node.find('.add_price').eq(0).val();
            node.find('.add_total').eq(0).val(qty*price);
        }


        //Add item
        function selectProduct(element){
            node = element.closest('tr');
            var id = parseInt(node.find('option:selected').eq(0).val());
            if(id == 0){
                node.find('.add_sku').val('');
                node.find('.add_qty').eq(0).val('');
                node.find('.add_price').eq(0).val('');
                node.find('.add_attr').html('');
                node.find('.add_tax').html('');
            }else{
                $.ajax({
                    url : '{{ route('provider_order.product_info') }}',
                    type : "get",
                    dateType:"application/json; charset=utf-8",
                    data : {
                        id : id,
                        order_id : {{ $order->id }},
                    },
                    beforeSend: function(){
                        $('#loading').show();
                    },
                    success: function(returnedData){
                        node.find('.add_sku').val(returnedData.sku);
                        node.find('.add_qty').eq(0).val(1);
                        node.find('.add_price').eq(0).val(returnedData.price_final * {!! ($order->exchange_rate)??1 !!});
                        node.find('.add_total').eq(0).val(returnedData.price_final * {!! ($order->exchange_rate)??1 !!});
                        node.find('.add_attr').eq(0).html(returnedData.renderAttDetails);
                        node.find('.add_tax').eq(0).html(returnedData.tax);
                        $('#loading').hide();
                    }
                });
            }

        }
        $('#add-item-button').click(function() {
            var html = '{!! $htmlSelectProduct !!}';
            $('#add-item').before(html);
            $('.select2').select2();
            $('#add-item-button-save').show();
        });

        $('#add-item-button-save').click(function(event) {
            $('#add-item-button').prop('disabled', true);
            $('#add-item-button-save').button('loading');
            $.ajax({
                url:'{{ route("provider_order.add_item") }}',
                type:'post',
                dataType:'json',
                data:$('form#form-add-item').serialize(),
                beforeSend: function(){
                    $('#loading').show();
                },
                success: function(result){
                    $('#loading').hide();
                    if(parseInt(result.error) ==0){
                        location.reload();
                    }else{
                        alertJs('error', result.msg);
                    }
                }
            });
        });

        //End add item
        //

        $(document).ready(function() {
            all_editable();
        });

        function all_editable(){
            $.fn.editable.defaults.params = function (params) {
                params._token = "{{ csrf_token() }}";
                return params;
            };

            $('.updateInfo').editable({
                success: function(response) {
                    if(response.error ==0){
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });

            $(".updatePrice").on("shown", function(e, editable) {
                var value = $(this).text().replace(/,/g, "");
                editable.input.$input.val(parseInt(value));
            });

            $('.updateStatus').editable({
                validate: function(value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                },
                success: function(response) {
                    if(response.error ==0){
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });

            $('.updateInfoRequired').editable({
                validate: function(value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                },
                success: function(response,newValue) {
                    console.log(response.msg);
                    if(response.error == 0){
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });


            $('.edit-item-detail').editable({
                ajaxOptions: {
                    type: 'post',
                    dataType: 'json'
                },
                validate: function(value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                    if (!$.isNumeric(value)) {
                        return '{{  trans('admin.only_numeric') }}';
                    }
                },
                success: function(response,newValue) {
                    if(response.error ==0){
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-received').html(response.detail.received);
                        $('.data-subtotal').html(response.detail.subtotal);
                        $('.data-tax').html(response.detail.tax);
                        $('.data-total').html(response.detail.total);
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-discount').html(response.detail.discount);
                        $('.item_id_'+response.detail.item_id).html(response.detail.item_total_price);
                        var objblance = $('.data-balance').eq(0);
                        objblance.before(response.detail.balance);
                        objblance.remove();
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }

            });

            $('.updatePrice').editable({
                ajaxOptions: {
                    type: 'post',
                    dataType: 'json'
                },
                validate: function(value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                    if (!$.isNumeric(value)) {
                        return '{{  trans('admin.only_numeric') }}';
                    }
                },

                success: function(response, newValue) {
                    if(response.error ==0){
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-received').html(response.detail.received);
                        $('.data-subtotal').html(response.detail.subtotal);
                        $('.data-tax').html(response.detail.tax);
                        $('.data-total').html(response.detail.total);
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-discount').html(response.detail.discount);
                        var objblance = $('.data-balance').eq(0);
                        objblance.before(response.detail.balance);
                        objblance.remove();
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });
        }


        {{-- sweetalert2 --}}
        function deleteItem(id){
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

                preConfirm: function() {
                    return new Promise(function(resolve) {
                        $.ajax({
                            method: 'POST',
                            url: '{{ route("provider_order.delete_item") }}',
                            data: {
                                'pId':id,
                                _token: '{{ csrf_token() }}',
                            },
                            success: function (response) {
                                if(response.error ==0){
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


        $(document).ready(function(){
            // does current browser support PJAX
            if ($.support.pjax) {
                $.pjax.defaults.timeout = 2000; // time in milliseconds
            }

        });

        function order_print(){
            $('.not-print').hide();
            window.print();
            $('.not-print').show();
        }
    </script>

@endpush
