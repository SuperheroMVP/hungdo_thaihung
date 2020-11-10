@extends('admin.layout')

@section('main')
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <h2 class="box-title">{{ $title_description??'' }}</h2>

                    <div class="box-tools">
                        <div class="btn-group pull-right" style="margin-right: 5px">
                            <a href="{{ route('provider_order.index') }}" class="btn  btn-flat btn-default"
                               title="List"><i class="fa fa-list"></i><span
                                        class="hidden-xs"> {{trans('admin.back_list')}}</span></a>
                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form action="{{ route('provider_order.create') }}" method="post" accept-charset="UTF-8"
                      class="form-horizontal" id="form-main">

                    <div class="box-body">
                        <div class="fields-group">
                            @if(Admin::user()->roles[0]->id == 1)
                            <div class="form-group  {{ $errors->has('user_id') ? ' has-error' : '' }}">
                                <label for="user_id" class="col-sm-2 asterisk control-label">Chọn đại lý</label>
                                <div class="col-sm-8">
                                    <select class="form-control user_id select2" style="width: 100%;" >
                                        <option value=""></option>
                                        @foreach ($providerList as $k => $v)
                                            <option value="{{ $k }}" {{ (old('user_id') ==$k) ? 'selected':'' }}>{{ $v->name.'<'.$v->id.'>' }}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('user_id'))
                                        <span class="help-block">
                                                {{ $errors->first('user_id') }}
                                            </span>
                                    @endif
                                </div>
                            </div>
                            @endif
                            <div class="form-group   {{ $errors->has('first_name') ? ' has-error' : '' }}">
                                <label for="first_name" class="col-sm-2 col-form-label">Tên đại lý</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="first_name" name="provider_name"
                                               value="{!! $provider->name ?? old('first_name') !!}"
                                               class="form-control first_name" placeholder=""/>
                                    </div>
                                    @if ($errors->has('first_name'))
                                        <span class="help-block">
                                                {{ $errors->first('first_name') }}
                                            </span>
                                    @endif
                                </div>
                            </div>

                            @if (sc_config('customer_company'))
                                <div class="form-group   {{ $errors->has('company') ? ' has-error' : '' }}">
                                    <label for="company"
                                           class="col-sm-2 col-form-label">{{ trans('order.company') }}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <input type="text" id="company" name="company"
                                                   value="{!! $provider->name ?? old('company') !!}"
                                                   class="form-control company" placeholder=""/>
                                        </div>
                                        @if ($errors->has('company'))
                                            <span class="help-block">
                                                {{ $errors->first('company') }}
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            @endif

                            @if (sc_config('customer_postcode'))
                                <div class="form-group   {{ $errors->has('postcode') ? ' has-error' : '' }}">
                                    <label for="postcode"
                                           class="col-sm-2 col-form-label">{{ trans('order.postcode') }}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <input type="text" id="postcode" name="postcode"
                                                   value="{!! old('postcode') !!}" class="form-control postcode"
                                                   placeholder=""/>
                                        </div>
                                        @if ($errors->has('postcode'))
                                            <span class="help-block">
                                                {{ $errors->first('postcode') }}
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            @endif

                            <div class="form-group   {{ $errors->has('province') ? ' has-error' : '' }}">
                                <label for="address1" class="col-sm-2 col-form-label">Tỉnh</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="province" name="address"
                                               value="{!! $provider->province ?? old('address') !!}"
                                               class="form-control address" placeholder=""/>
                                    </div>
                                    @if ($errors->has('province'))
                                        <span class="help-block">
                                            {{ $errors->first('province') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('district') ? ' has-error' : '' }}">
                                <label for="district" class="col-sm-2 col-form-label">Huyện</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="district" name="district"
                                               value="{!! $provider->district ?? old('district') !!}"
                                               class="form-control address" placeholder=""/>
                                    </div>
                                    @if ($errors->has('district'))
                                        <span class="help-block">
                                            {{ $errors->first('district') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('ward') ? ' has-error' : '' }}">
                                <label for="ward" class="col-sm-2 col-form-label">Xã</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="ward" name="ward"
                                               value="{!! $provider->ward ?? old('ward') !!}"
                                               class="form-control address" placeholder=""/>
                                    </div>
                                    @if ($errors->has('ward'))
                                        <span class="help-block">
                                            {{ $errors->first('ward') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('address') ? ' has-error' : '' }}">
                                <label for="address" class="col-sm-2 col-form-label">Địa chỉ</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="address" name="address"
                                               value="{!! $provider->address ?? old('address') !!}"
                                               class="form-control address" placeholder=""/>
                                    </div>
                                    @if ($errors->has('address'))
                                        <span class="help-block">
                                            {{ $errors->first('address') }}
                                        </span>
                                    @endif
                                </div>
                            </div>


                            @if (sc_config('customer_phone'))
                                <div class="form-group   {{ $errors->has('phone') ? ' has-error' : '' }}">
                                    <label for="phone"
                                           class="col-sm-2 col-form-label">{{ trans('order.shipping_phone') }}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-phone fa-fw"></i></span>
                                            <input type="text" id="phone" name="phone"
                                                   value="{!! $provider->phone ?? old('phone') !!}"
                                                   class="form-control phone" placeholder="Input Phone"/>
                                        </div>
                                        @if ($errors->has('phone'))
                                            <span class="help-block">
                                                {{ $errors->first('phone') }}
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            @endif

                            <div class="form-group   {{ $errors->has('email') ? ' has-error' : '' }}">
                                <label for="email" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                                        <input type="email" id="email" name="email"
                                               value="{!! $provider->email ?? old('email') !!}"
                                               class="form-control phone" placeholder="Input email"/>
                                    </div>
                                    @if ($errors->has('email'))
                                        <span class="help-block">
                                                {{ $errors->first('email') }}
                                            </span>
                                    @endif
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="box collapsed-box">
                                        <div class="table-responsive">
                                            <h3>Chọn sản phẩm</h3>
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>{{ trans('product.name') }}</th>
                                                    <th>{{ trans('product.sku') }}</th>
                                                    <th class="product_price">{{ trans('product.price') }}</th>
                                                    <th class="product_qty">{{ trans('product.quantity') }}</th>
                                                    <th class="product_total">{{ trans('product.total_price') }}</th>
                                                    <th class="product_tax">{{ trans('product.tax') }}</th>
                                                    <th>{{ trans('admin.action') }}</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <tr id="add-item" class="not-print">
                                                    <td colspan="6">
                                                        <button type="button" class="btn btn-sm btn-flat btn-success"
                                                                id="add-item-button"
                                                                title="{{trans('product.add_product') }}"><i
                                                                    class="fa fa-plus"></i> {{ trans('product.add_product') }}
                                                        </button>
                                                        {{--                                                            &nbsp;&nbsp;&nbsp;<button style="display: none; margin-right: 50px" type="button" class="btn btn-sm btn-flat btn-warning" id="add-item-button-save"  title="Save"><i class="fa fa-save"></i> {{ trans('admin.save') }}</button>--}}
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="status" class="col-sm-2 col-form-label">Chọn nhà cung cấp</label>
                                <div class="col-sm-8">
                                    <select class="form-control status select2" style="width: 100%;" name="supplier">
                                        @foreach ($providerList as $k => $v)
                                            <option value="{{ $v->id }}" {{ (old('status') ==$k) ? 'selected':'' }}>
                                                {{ $v->name}}, Địa chỉ: {{ $v->address }} - {{ $v->ward }} - {{ $v->district }} - {{ $v->province }}, Số điện thoại: {{ $v->phone }}, Email:  {{ $v->email }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('status'))
                                        <span class="help-block">
                                                {{ $errors->first('status') }}
                                            </span>
                                    @endif
                                </div>
                            </div>

                            @if (sc_config('customer_postcode'))
                                <div class="form-group   {{ $errors->has('postcode') ? ' has-error' : '' }}">
                                    <label for="postcode"
                                           class="col-sm-2 col-form-label">{{ trans('order.postcode') }}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <input type="text" id="postcode" name="postcode"
                                                   value="{!! old('postcode') !!}" class="form-control postcode"
                                                   placeholder=""/>
                                        </div>
                                        @if ($errors->has('postcode'))
                                            <span class="help-block">
                                                {{ $errors->first('postcode') }}
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            @endif
                            {{--                            <div class="form-group   {{ $errors->has('currency') ? ' has-error' : '' }}">--}}
                            {{--                                <label for="currency" class="col-sm-2 asterisk control-label">{{ trans('order.currency') }}</label>--}}
                            {{--                                <div class="col-sm-8">--}}
                            {{--                                    <select class="form-control currency select2" style="width: 100%;" name="currency" >--}}
                            {{--                                        <option value=""></option>--}}
                            {{--                                        @foreach ($currencies as $k => $v)--}}
                            {{--                                            <option value="{{ $k }}" @php if ( old('currency') ==$k ){ echo 'selected'; } else { if( $k == 'VND' ){ echo "selected"; } else { echo ''; }} @endphp>{{ $v}}</option>--}}
                            {{--                                        @endforeach--}}
                            {{--                                    </select>--}}
                            {{--                                    @if ($errors->has('currency'))--}}
                            {{--                                        <span class="help-block">--}}
                            {{--                                                {{ $errors->first('currency') }}--}}
                            {{--                                            </span>--}}
                            {{--                                    @endif--}}
                            {{--                                </div>--}}
                            {{--                            </div>--}}

                            {{--                            <div class="form-group   {{ $errors->has('exchange_rate') ? ' has-error' : '' }}">--}}
                            {{--                                <label for="exchange_rate" class="col-sm-2 col-form-label">{{ trans('order.exchange_rate') }}</label>--}}
                            {{--                                <div class="col-sm-8">--}}
                            {{--                                    <div class="input-group">--}}
                            {{--                                        <span class="input-group-addon"><i class="fa fa-money fw" aria-hidden="true"></i></span>--}}
                            {{--                                        <input style="width: 150px" type="text" id="exchange_rate" name="exchange_rate" value="{!! old('exchange_rate') !!}" class="form-control exchange_rate" placeholder="Input Exchange rate" />--}}
                            {{--                                    </div>--}}
                            {{--                                    @if ($errors->has('exchange_rate'))--}}
                            {{--                                        <span class="help-block">--}}
                            {{--                                                {{ $errors->first('exchange_rate') }}--}}
                            {{--                                            </span>--}}
                            {{--                                    @endif--}}
                            {{--                                </div>--}}
                            {{--                            </div>--}}

                            <div class="form-group">
                                <label for="comment" class="col-sm-2 col-form-label">{{ trans('order.note') }}</label>
                                <div class="col-sm-8">
                                    <textarea name="comment" class="form-control comment" rows="5"
                                              placeholder="">{!! old('comment') !!}</textarea>
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('payment_method') ? ' has-error' : '' }}">
                                <label for="payment_method"
                                       class="col-sm-2 col-form-label">{{ trans('order.payment_method') }}</label>
                                <div class="col-sm-8">
                                    <select class="form-control payment_method select2" style="width: 100%;"
                                            name="payment_method">
                                        @foreach ($paymentMethod as $k => $v)
                                            <option value="{{ $k }}" {{ (old('payment_method') ==$k) ? 'selected':'' }}>{{ sc_language_render($v)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('payment_method'))
                                        <span class="help-block">
                                                {{ $errors->first('payment_method') }}
                                            </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('shipping_method') ? ' has-error' : '' }}">
                                <label for="shipping_method"
                                       class="col-sm-2 col-form-label">{{ trans('order.shipping_method') }}</label>
                                <div class="col-sm-8">
                                    <select class="form-control shipping_method select2" style="width: 100%;"
                                            name="shipping_method">
                                        @foreach ($shippingMethod as $k => $v)
                                            <option value="{{ $k }}" {{ (old('shipping_method') ==$k) ? 'selected':'' }}>{{ sc_language_render($v)}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('shipping_method'))
                                        <span class="help-block">
                                                {{ $errors->first('shipping_method') }}
                                            </span>
                                    @endif
                                </div>
                            </div>

{{--                            <div class="form-group   {{ $errors->has('status') ? ' has-error' : '' }}">--}}
{{--                                <label for="status" class="col-sm-2 col-form-label">{{ trans('order.status') }}</label>--}}
{{--                                <div class="col-sm-8">--}}
{{--                                    <select class="form-control status select2" style="width: 100%;" name="status">--}}
{{--                                        @foreach ($orderStatus as $k => $v)--}}
{{--                                            <option value="{{ $k }}" {{ (old('status') ==$k) ? 'selected':'' }}>{{ $v}}</option>--}}
{{--                                        @endforeach--}}
{{--                                    </select>--}}
{{--                                    @if ($errors->has('status'))--}}
{{--                                        <span class="help-block">--}}
{{--                                                {{ $errors->first('status') }}--}}
{{--                                            </span>--}}
{{--                                    @endif--}}
{{--                                </div>--}}
{{--                            </div>--}}

                            <hr>

                        </div>

                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        @csrf
                        <div class="col-md-2">
                        </div>

                        <div class="col-md-8">
                            <div class="btn-group pull-right">
                                <button type="submit" class="btn btn-primary">{{ trans('admin.submit') }}</button>
                            </div>

                            <div class="btn-group pull-left">
                                <button type="reset" class="btn btn-warning">{{ trans('admin.reset') }}</button>
                            </div>
                        </div>
                    </div>

                    <!-- /.box-footer -->
                </form>
            </div>
        </div>
    </div>

    @php
        $htmlSelectProduct = '
                <tr>
                    <td>
                      <select onChange="selectProduct($(this));"  class="add_id form-control select2" name="add_id[]" style="width:100% !important;">
                      <option value="0">'.trans('order.select_product').'</option>';
                      if(count($products)){
                        foreach ($products as $pId => $productName){
                          $htmlSelectProduct .='<option  value="'.$productName->id.'" >'.$productName->descriptions_relation->name.'</option>';
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
@endsection

@push('styles')

@endpush

@push('scripts')
    {{-- //Pjax --}}
    <script src="{{ asset('admin/plugin/jquery.pjax.js')}}"></script>

    <!-- Ediable -->
    <script src="{{ asset('admin/plugin/bootstrap-editable.min.js')}}"></script>



    <script type="text/javascript">

        $(document).ready(function () {
//Initialize Select2 Elements
            $('.select2').select2();
        });

        function update_total(e) {
            node = e.closest('tr');
            var qty = node.find('.add_qty').eq(0).val();
            var price = node.find('.add_price').eq(0).val();
            node.find('.add_total').eq(0).val(qty * price);
        }

        //Add item
        function selectProduct(element) {
            node = element.closest('tr');
            var id = parseInt(node.find('option:selected').eq(0).val());
            if (id == 0) {
                node.find('.add_sku').val('');
                node.find('.add_qty').eq(0).val('');
                node.find('.add_price').eq(0).val('');
                node.find('.add_attr').html('');
                node.find('.add_tax').html('');
            } else {
                console.log(id);
                $.ajax({
                    url: '{{ route('provider_order.product_info') }}',
                    type: "get",
                    dateType: "application/json; charset=utf-8",
                    data: {
                        id: id,
                        order_id: 1,
                    },
                    beforeSend: function () {
                        $('#loading').show();
                    },
                    success: function (returnedData) {
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

        $('#add-item-button').click(function () {
            var html = '{!! $htmlSelectProduct !!}';
            $('#add-item').before(html);
            $('.select2').select2();
            $('#add-item-button-save').show();
        });

        $('#add-item-button-save').click(function (event) {
            $('#add-item-button').prop('disabled', true);
            $('#add-item-button-save').button('loading');
            $.ajax({
                url: '{{ route("admin_order.add_item") }}',
                type: 'post',
                dataType: 'json',
                data: $('#form-add-item').serialize(),
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

        //End add item
        //

        $(document).ready(function () {
            all_editable();
        });

        function all_editable() {
            $.fn.editable.defaults.params = function (params) {
                params._token = "{{ csrf_token() }}";
                return params;
            };

            $('.updateInfo').editable({
                success: function (response) {
                    if (response.error == 0) {
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });

            $(".updatePrice").on("shown", function (e, editable) {
                var value = $(this).text().replace(/,/g, "");
                editable.input.$input.val(parseInt(value));
            });

            $('.updateStatus').editable({
                validate: function (value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                },
                success: function (response) {
                    if (response.error == 0) {
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });

            $('.updateInfoRequired').editable({
                validate: function (value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                },
                success: function (response, newValue) {
                    console.log(response.msg);
                    if (response.error == 0) {
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
                validate: function (value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                    if (!$.isNumeric(value)) {
                        return '{{  trans('admin.only_numeric') }}';
                    }
                },
                success: function (response, newValue) {
                    if (response.error == 0) {
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-received').html(response.detail.received);
                        $('.data-subtotal').html(response.detail.subtotal);
                        $('.data-tax').html(response.detail.tax);
                        $('.data-total').html(response.detail.total);
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-discount').html(response.detail.discount);
                        $('.item_id_' + response.detail.item_id).html(response.detail.item_total_price);
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
                validate: function (value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                    if (!$.isNumeric(value)) {
                        return '{{  trans('admin.only_numeric') }}';
                    }
                },

                success: function (response, newValue) {
                    if (response.error == 0) {
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
        function deleteItem(id) {
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
                            url: '{{ route("admin_order.delete_item") }}',
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

@push('scripts')
    <script type="text/javascript">

        $(document).ready(function () {
//Initialize Select2 Elements
            $('.select2').select2()
        });
        $('[name="user_id"]').change(function () {
            addInfo();
        });
        $('[name="currency"]').change(function () {
            addExchangeRate();
        });

        function addExchangeRate() {
            var currency = $('[name="currency"]').val();
            var jsonCurrency = {!!$currenciesRate !!};
            $('[name="exchange_rate"]').val(jsonCurrency[currency]);
        }

        function addInfo() {
            id = $('[name="user_id"]').val();
            if (id) {
                $.ajax({
                    url: '{{ route('admin_order.user_info') }}',
                    type: "get",
                    dateType: "application/json; charset=utf-8",
                    data: {
                        id: id
                    },
                    beforeSend: function () {
                        $('#loading').show();
                    },
                    success: function (result) {
                        var returnedData = JSON.parse(result);
                        $('[name="first_name"]').val(returnedData.first_name);
                        $('[name="last_name"]').val(returnedData.last_name);
                        $('[name="address1"]').val(returnedData.address1);
                        $('[name="address2"]').val(returnedData.address2);
                        $('[name="phone"]').val(returnedData.phone);
                        $('[name="company"]').val(returnedData.company);
                        $('[name="postcode"]').val(returnedData.postcode);
                        $('[name="country"]').val(returnedData.country).change();
                        $('#loading').hide();
                    }
                });
            } else {
                $('#form-main').reset();
            }

        }

    </script>
@endpush
