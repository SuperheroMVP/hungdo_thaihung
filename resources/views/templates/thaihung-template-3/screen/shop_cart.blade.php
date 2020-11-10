@php
    /*
    $layout_page = shop_cart
    $cart: no paginate
    $shippingMethod: string
    $paymentMethod: string
    $totalMethod: array
    $dataTotal: array
    $shippingAddress: array
    $countries: array
    $attributesGroup: array
    */
@endphp

@extends($templatePath.'.layout')

@section('main')
    <style>
        .list-group-item {
            user-select: none;
        }

        .list-group-item img {
            max-width: 100px;
            max-height: 50px;
            vertical-align: middle;
        }

        .list-group-item .provider-info {
            display: inline-block;
            vertical-align: middle;
        }

        .list-group input[type="checkbox"] {
            display: none;
        }

        .list-group input[type="checkbox"] + .list-group-item {
            cursor: pointer;
        }

        .list-group input[type="checkbox"] + .list-group-item:before {
            content: "\2713";
            color: transparent;
            font-weight: bold;
            margin-right: 1em;
        }

        .list-group input[type="checkbox"]:checked + .list-group-item {
            background-color: #0275D8;
            color: #FFF;
        }

        .list-group input[type="checkbox"]:checked + .list-group-item:before {
            color: inherit;
        }

        .list-group input[type="radio"] {
            display: none;
        }

        .list-group input[type="radio"] + .list-group-item {
            cursor: pointer;
        }

        .list-group input[type="radio"] + .list-group-item:before {
            content: "\2022";
            color: transparent;
            font-weight: bold;
            margin-right: 1em;
        }

        .list-group input[type="radio"]:checked + .list-group-item {
            background-color: #0275D8;
            color: #FFF;
        }

        .list-group input[type="radio"]:checked + .list-group-item:before {
            color: inherit;
        }
    </style>
    <section class="w-100">
        <div class="container">
            <div class="cart-total">
                {{--                <h2 class="title text-center">{{ $title }}</h2>--}}
                @if (count($cart) ==0)
                    <div class="col-md-12 text-danger">
                        {!! trans('cart.cart_empty') !!}!
                    </div>
                @else
                    <div class="table-responsive">
                        <table class="table box table-bordered" id="cart-table">
                            <thead>
                            <tr style="background: #eaebec">
                                <th style="width: 50px;">STT</th>
                                <th style="width: 100px;">{{ trans('product.sku') }}</th>
                                <th>{{ trans('product.name') }}</th>
                                <th>Đơn vị</th>
                                <th>{{ trans('product.quantity') }}</th>
                                <th>{{ trans('cart.delete') }}</th>
                            </tr>
                            </thead>
                            <tbody>

                            @foreach($cart as $item)
                                @php
                                    $n = (isset($n)?$n:0);
                                    $n++;
                                    $product = $modelProduct->start()->getDetail($item->id);
                                @endphp
                                <tr class="row_cart">
                                    <td>{{ $n }}</td>
                                    <td>{{ $product->sku }}</td>
                                    <td>
                                        {{ $product->name }}<br>
                                        {{-- Process attributes --}}
                                        @if ($item->options->count())
                                            (
                                            @foreach ($item->options as $keyAtt => $att)
                                                <b>{{ $attributesGroup[$keyAtt] }}</b>: <i>{{ $att }}</i> ;
                                            @endforeach
                                            )<br>
                                        @endif
                                        {{-- //end Process attributes --}}

                                    </td>
                                    <td>
                                        <select name="donvi" id="donvi[{{ $item->id }}][]" class="form-control"
                                                data-rowid="{{$item->rowId}}">
                                            <option value="0">Đơn vị</option>
                                            <option value="1">Mét</option>
                                            <option value="2">Kg</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" data-id="{{ $item->id }}"
                                               data-rowid="{{$item->rowId}}"
                                               class="item-qty form-control" name="qty-{{$item->id}}"
                                               value="{{$item->qty}}"><span
                                                class="text-danger item-qty-{{$item->id}}"
                                                style="display: none;"></span>
                                        @if (session('arrErrorQty')[$product->id] ?? 0)
                                            <span class="help-block">
                    <br>{{ trans('cart.minimum_value', ['value' => session('arrErrorQty')[$product->id]]) }}
                </span>
                                        @endif
                                    </td>
                                    <td>
                                        <i class="fa fa-plus-circle add-row-to-cut"></i>&nbsp;&nbsp;
                                        <a title="Remove Item" alt="Remove Item"
                                           class="cart_quantity_delete"
                                           data-rowid="{{$item->rowId}}"
                                                {{--                                           href="{{route("cart.remove",['id'=>$item->rowId])}}"--}}
                                        >
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                            <tfoot>
                            <tr style="background: #d9a751">
                                <td colspan="12">
                                    <div class="pull-left">
                                        <button class="btn btn-default" type="button"
                                                style="cursor: pointer;"
                                                onClick="location.href='{{ route('home') }}'"><i
                                                    class="fa fa-arrow-left"></i> {{ trans('cart.back_to_shop') }}
                                        </button>
                                    </div>
                                    <div class="pull-right">
                                        <button class="btn" type="button" style="cursor: pointer;color: #000000"
                                                onClick="if(confirm('Confirm ?')) window.location.href='{{ route('cart.clear') }}';">
                                            <i class="fa fa-window-close" aria-hidden="true"></i>
                                            {{ trans('cart.remove_all') }}</button>
                                    </div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    <form class="sc-shipping-address" id="form-order" role="form" method="POST"
                          action="{{ route('cart.process') }}">
                        <div class="row">
                            <div class="col-md-6">
                                @csrf
                                <table class="table table-responsive">
                                    <tr>
                                        @if (sc_config('customer_lastname'))
                                            <td class="form-group{{ $errors->has('first_name') ? ' has-error' : '' }}">
                                                <label for="phone" class="control-label"><i
                                                            class="fa fa-user"></i> {{ trans('cart.first_name') }}
                                                    :</label>
                                                <input name="first_name" type="text"
                                                       placeholder="{{ trans('cart.first_name') }}"
                                                       value="{{(old('first_name'))?old('first_name'):$shippingAddress['first_name']}}">
                                                @if($errors->has('first_name'))
                                                    <span class="help-block">{{ $errors->first('first_name') }}</span>
                                                @endif
                                            </td>
                                            <td class="form-group{{ $errors->has('last_name') ? ' has-error' : '' }}">
                                                <label for="phone" class="control-label"><i
                                                            class="fa fa-user"></i> {{ trans('cart.last_name') }}
                                                    :</label>
                                                <input name="last_name" type="text"
                                                       placeholder="{{ trans('cart.last_name') }}"
                                                       value="{{(old('last_name'))?old('last_name'):$shippingAddress['last_name']}}">
                                                @if($errors->has('last_name'))
                                                    <span class="help-block">{{ $errors->first('last_name') }}</span>
                                                @endif
                                            </td>

                                        @else
                                            <td colspan="2"
                                                class="form-group{{ $errors->has('first_name') ? ' has-error' : '' }}">
                                                <label for="phone" class="control-label"><i
                                                            class="fa fa-user"></i> {{ trans('cart.name') }}:</label>
                                                <input name="first_name" type="text"
                                                       placeholder="{{ trans('cart.name') }}"
                                                       value="{{(old('first_name'))?old('first_name'):$shippingAddress['first_name']}}">
                                                @if($errors->has('first_name'))
                                                    <span class="help-block">{{ $errors->first('first_name') }}</span>
                                                @endif
                                            </td>
                                        @endif
                                    </tr>

                                    <tr>
                                        @if (sc_config('customer_phone'))
                                            <td class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                                <label for="email" class="control-label"><i
                                                            class="fa fa-envelope"></i> {{ trans('cart.email') }}
                                                    :</label>
                                                <input name="email" type="text" placeholder="{{ trans('cart.email') }}"
                                                       value="{{(old('email'))?old('email'):$shippingAddress['email']}}">
                                                @if($errors->has('email'))
                                                    <span class="help-block">{{ $errors->first('email') }}</span>
                                                @endif
                                            </td>
                                            <td class="form-group{{ $errors->has('phone') ? ' has-error' : '' }}">
                                                <label for="phone" class="control-label"><i class="fa fa-phone"
                                                                                            aria-hidden="true"></i> {{ trans('cart.phone') }}
                                                    :</label>
                                                <input name="phone" type="text" placeholder="{{ trans('cart.phone') }}"
                                                       value="{{(old('phone'))?old('phone'):$shippingAddress['phone']}}">
                                                @if($errors->has('phone'))
                                                    <span class="help-block">{{ $errors->first('phone') }}</span>
                                                @endif
                                            </td>
                                        @else
                                            <td colspan="2"
                                                class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                                <label for="email" class="control-label">
                                                    <i class="fa fa-envelope"></i>
                                                    {{ trans('cart.email') }}
                                                    :</label>
                                                <input name="email" type="text" placeholder="{{ trans('cart.email') }}"
                                                       value="{{(old('email'))?old('email'):$shippingAddress['email']}}">
                                                @if($errors->has('email'))
                                                    <span class="help-block">{{ $errors->first('email') }}</span>
                                                @endif
                                            </td>
                                        @endif

                                    </tr>

                                    <input type="hidden" name="country" value="VN">
                                    @if (sc_config('customer_country'))
                                        <tr>
                                            <td colspan="2"
                                                class="form-group{{ $errors->has('country') ? ' has-error' : '' }}">
                                                <label for="country" class="control-label">
                                                    <i class="fa fa-dribbble" aria-hidden="true">
                                                    </i> {{ trans('cart.country') }}
                                                    :</label>
                                                @php
                                                    $ct = (old('country'))?old('country'):$shippingAddress['country'];
                                                @endphp
                                                <select class="form-control country " style="width: 100%;"
                                                        name="country">
                                                    <option value="">__{{ trans('cart.country') }}__</option>
                                                    @foreach ($countries as $k => $v)
                                                        <option value="{{ $k }}" {{ ($ct ==$k) ? 'selected': $k == 'VN' ? 'selected' : '' }}>{{ $v }}</option>
                                                    @endforeach
                                                </select>
                                                @if ($errors->has('country'))
                                                    <span class="help-block">
                                                        {{ $errors->first('country') }}
                                                    </span>
                                                @endif
                                            </td>
                                        </tr>
                                    @endif


                                    <tr>
                                        @if (sc_config('customer_postcode'))
                                            <td class="form-group {{ $errors->has('postcode') ? ' has-error' : '' }}">
                                                <label for="postcode" class="control-label"><i
                                                            class="fa fa-tablet"></i> {{ trans('cart.postcode') }}
                                                    :</label>
                                                <input name="postcode" type="text"
                                                       placeholder="{{ trans('cart.postcode') }}"
                                                       value="{{ (old('postcode'))?old('postcode'):$shippingAddress['postcode']}}">
                                                @if($errors->has('postcode'))
                                                    <span class="help-block">{{ $errors->first('postcode') }}</span>
                                                @endif
                                            </td>
                                        @endif

                                        @if (sc_config('customer_company'))
                                            <td class="form-group{{ $errors->has('company') ? ' has-error' : '' }}">
                                                <label for="company" class="control-label"><i
                                                            class="fa fa-university"></i> {{ trans('cart.company') }}
                                                </label>
                                                <input name="company" type="text"
                                                       placeholder="{{ trans('cart.company') }}"
                                                       value="{{ (old('company'))?old('company'):$shippingAddress['company']}}">
                                                @if($errors->has('company'))
                                                    <span class="help-block">{{ $errors->first('company') }}</span>
                                                @endif
                                            </td>
                                        @endif
                                    </tr>
                                    @if (sc_config('customer_address2'))
                                        <tr>

                                            <td class="form-group {{ $errors->has('address1') ? ' has-error' : '' }}">
                                                <label for="address1" class="control-label"><i
                                                            class="fa fa-list-ul"></i> {{ trans('cart.address1') }}
                                                    :</label>
                                                <select class="select2" style="width: 100%" id="province"
                                                        name="address1">
                                                    <option value="{{ (old('address1'))?old('address1'):$shippingAddress['address1']}}">{{ (old('address1'))?old('address1'):$shippingAddress['address1']}}</option>
                                                </select>
                                                {{--                                                <input name="address1" type="text"--}}
                                                {{--                                                       placeholder="{{ trans('cart.address1') }}"--}}
                                                {{--                                                       value="{{ (old('address1'))?old('address1'):$shippingAddress['address1']}}">--}}
                                                @if($errors->has('address1'))
                                                    <span class="help-block">{{ $errors->first('address1') }}</span>
                                                @endif
                                            </td>
                                            <td class="form-group{{ $errors->has('address2') ? ' has-error' : '' }}">
                                                <label for="address2" class="control-label"><i
                                                            class="fa fa-list-ul"></i> {{ trans('cart.address2') }}
                                                </label>
                                                <select class="select2" style="width: 100%" id="district"
                                                        name="address2">
                                                    <option value="{{ (old('address2'))?old('address2'):$shippingAddress['address2']}}">{{ (old('address2'))?old('address2'):$shippingAddress['address2']}}</option>
                                                </select>
                                                {{--                                                <input name="address2" type="text"--}}
                                                {{--                                                       placeholder="{{ trans('cart.address2') }}"--}}
                                                {{--                                                       value="{{ (old('address2'))?old('address2'):$shippingAddress['address2']}}">--}}
                                                @if($errors->has('address2'))
                                                    <span class="help-block">{{ $errors->first('address2') }}</span>
                                                @endif
                                            </td>
                                        </tr>
                                        {{--                                    {{dd($shippingAddress['address3'])}}--}}
                                        <tr>
                                            <td colspan="2"
                                                class="form-group{{ $errors->has('address3') ? ' has-error' : '' }}">
                                                <label for="address3" class="control-label"><i
                                                            class="fa fa-list-ul"></i> Xã/Phường
                                                </label>
                                                <select class="select2" style="width: 100%" id="ward"
                                                        name="address3">
                                                    <option value="{{ (old('address3'))?old('address3'):$shippingAddress['address3']}}">{{ (old('address3'))?old('address3'):$shippingAddress['address3']}}</option>
                                                </select>
                                                {{--                                                <input name="address2" type="text"--}}
                                                {{--                                                       placeholder="{{ trans('cart.address2') }}"--}}
                                                {{--                                                       value="{{ (old('address2'))?old('address2'):$shippingAddress['address2']}}">--}}
                                                @if($errors->has('address3'))
                                                    <span class="help-block">{{ $errors->first('address3') }}</span>
                                                @endif
                                            </td>
                                        </tr>
                                    @else
                                        <tr>
                                            <td colspan="2"
                                                class="form-group {{ $errors->has('address1') ? ' has-error' : '' }}">
                                                <label for="address1" class="control-label"><i
                                                            class="fa fa-list-ul"></i> {{ trans('cart.address') }}
                                                    :</label>
                                                <select class="select2" style="width: 100%" id="select_provincial"
                                                        name="address1">
                                                    <option value="{{ (old('address1'))?old('address1'):$shippingAddress['address1']}}">{{ (old('address1'))?old('address1'):$shippingAddress['address1']}}</option>
                                                </select>
                                                {{--                                                <input name="address1" type="text"--}}
                                                {{--                                                       placeholder="{{ trans('cart.address') }}"--}}
                                                {{--                                                       value="{{ (old('address1'))?old('address1'):$shippingAddress['address1']}}">--}}
                                                @if($errors->has('address1'))
                                                    <span class="help-block">{{ $errors->first('address1') }}</span>
                                                @endif
                                            </td>
                                        </tr>
                                        @endif
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="form-group">
                                                <label for="address" class="control-label"><i
                                                            class="fa fa-list-ul"></i> Địa chỉ
                                                    :</label>
                                                <input type="text" name="address" id="address" required="required"
                                                       value="{{ (old('address'))?old('address'):$shippingAddress['address'] ?? ""}}">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2" class="form-group">
                                                <label class="control-label"><i
                                                            class="fa fa-calendar-o"></i> {{ trans('cart.note') }}
                                                    :</label>
                                                <textarea rows="5" name="comment"
                                                          placeholder="{{ trans('cart.note') }}....">{{ (old('comment'))?old('comment'):$shippingAddress['comment'] }}</textarea>
                                            </td>
                                        </tr>


                                </table>

                            </div>
                            <div class="col-md-6">

                                {{-- Total --}}
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="pickProvider" class="control-label">
                                            <i class="fa fa-tv" aria-hidden="true"></i>
                                            Chọn nhà bán hàng
                                        </label>
                                        <div class="list-provider">
                                            @if(!$providerList->count())
                                                @if(session('guestLocation') != '')
                                                    <p class="alert alert-warning">
                                                        <b>Xin lỗi!</b><br>
                                                        Tỉnh của bạn hiện tại chưa có nhà bán hàng nào bán sản phẩm có
                                                        trong
                                                        giỏ hàng của bạn.
                                                    </p>
                                                @else
                                                    <p class="alert alert-warning">
                                                        <b>Xin lỗi!</b><br>
                                                        Chúng tôi chưa có vị trí của bạn vui lòng <a
                                                                style="cursor: pointer;color: red;"
                                                                class="pick-location" title="Pick Location"> Chọn vị trí
                                                            tại đây</a>
                                                    </p>
                                                @endif
                                            @else
{{--                                                @php $first = 1; @endphp--}}
                                                <div id="list_provider"></div>
{{--                                                @foreach($providerList as $key => $provider)--}}
{{--                                                    <div class="provider-item">--}}
{{--                                                        <input type="radio" name="provider_id"--}}
{{--                                                               value="{{ $provider->id }}"--}}
{{--                                                               id="provider{{ $provider->id }}" @php if($first == 1) { $first = 0; echo 'Checked'; }else{ echo ''; } @endphp />--}}
{{--                                                        <label class="list-group-item"--}}
{{--                                                               for="provider{{ $provider->id }}">--}}
{{--                                                            <img src="{{ $provider->getAvatar() }}" alt="">--}}
{{--                                                            <span class="provider-info">--}}
{{--                                                                Tên: {{ $provider->name }} <br>--}}
{{--                                                                Đ/c: {{ $provider->address.', '.$provider->ward.', '.$provider->district.', '.$provider->province }} <br>--}}
{{--                                                                SĐT: {{ $provider->phone }} <br>--}}
{{--                                                                Email: {{ $provider->email }}--}}
{{--                                                            </span>--}}
{{--                                                        </label>--}}
{{--                                                    </div>--}}
{{--                                                @endforeach--}}
                                            @endif

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table box table-bordered" id="showTotal">
                                            @foreach ($dataTotal as $key => $element)
                                                @if ($element['value'] !=0)
                                                    @if ($element['code']=='total')
                                                        <tr class="showTotal"
                                                            style="background:#f5f3f3;font-weight: bold;">
                                                    @else
                                                        <tr class="showTotal">
                                                            @endif
                                                            <th>{!! $element['title'] !!}</th>
                                                            <td style="text-align: right"
                                                                id="{{ $element['code'] }}">{{$element['text'] }}</td>
                                                        </tr>
                                                    @endif
                                                    @endforeach
                                        </table>
                                        {{-- Total method --}}

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group {{ $errors->has('totalMethod') ? ' has-error' : '' }}">
                                                    @if($errors->has('totalMethod'))
                                                        <span class="help-block">{{ $errors->first('totalMethod') }}</span>
                                                    @endif
                                                </div>

                                                <div class="form-group">
                                                    @foreach ($totalMethod as $key => $plugin)
                                                        @if (view()->exists($plugin['pathPlugin'].'::render'))
                                                            @include($plugin['pathPlugin'].'::render')
                                                        @endif
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                        {{-- //Total method --}}

                                    </div>
                                </div>
                                {{-- End total --}}


                                <div class="row" style="padding-bottom: 20px;">
                                    <div class="col-md-12 text-center">
                                        <div class="pull-right">
                                            <button class="btn btn-success" id="submit-order" type="submit"
                                                    style="cursor: pointer;padding:10px 30px"><i
                                                        class="fa fa-check"></i> {{ trans('cart.checkout') }}</button>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </form>
                @endif
            </div>
        </div>
    </section>
    <div hidden id="google-map"></div>
    <p id="km"></p>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
            <li class="active">{{ $title }}</li>
        </ol>
    </div>
@endsection

@push('scripts')
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzlVX517mZWArHv4Dt3_JVG0aPmbSE5mE&sensor=false&v=3&libraries=geometry"></script>
    {{--    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&v=3&libraries=geometry"></script>--}}
    <script type="text/javascript">

        $(document).ready(function () {
            // get_province();
            get_default_ward();

            $(document).on('change', '#province', function () {
                let code = $(this).find('option:selected').data('code');
                get_district(code);
            });

            $(document).on('change', '#district', function () {
                let code = $(this).find('option:selected').data('code');
                get_ward(code);
            });
            $('.select2').select2().trigger("change");
        });

        async function get_default_ward() {
            await get_default_district();
            let code = $('#district').find('option:selected').data('code');
            let ward = "{!! old()?old('ward'):$shippingAddress['address3']??'' !!}";
            $('#ward').append($('<option value="">Chọn xã/phường/thị trấn</option>'));
            $.getJSON('{{asset('public/hcvn/xa_phuong.json')}}', function (json) {
                jQuery.each(json, function (index, item) {

                    if (item.parent_code == code) {
                        let opt;
                        if (ward === item.name_with_type) {
                            opt = $('<option data-code="' + index + '" value="' + item.name_with_type + '" selected>' + item.name_with_type + '</option>');
                        } else {
                            opt = $('<option data-code="' + index + '" value="' + item.name_with_type + '">' + item.name_with_type + '</option>');
                        }
                        $('#ward').append(opt);
                    }
                });
            });
        }

        function get_ward(code) {
            let ward = "{!! old()?old('ward'):$shippingAddress['ward']??'' !!}";
            $.getJSON('{{asset('public/hcvn/xa_phuong.json')}}', function (json) {
                $('#ward').empty();
                $('#ward').append($('<option value="">Chọn xã/phường/thị trấn</option>'));
                jQuery.each(json, function (index, item) {
                    if (item.parent_code == code) {
                        let opt;
                        if (ward === item.name_with_type) {
                            opt = $('<option data-code="' + index + '" value="' + item.name_with_type + '" selected>' + item.name_with_type + '</option>');
                        } else {
                            opt = $('<option data-code="' + index + '" value="' + item.name_with_type + '">' + item.name_with_type + '</option>');
                        }
                        $('#ward').append(opt);
                    }
                });
            });
        }

        async function get_default_district() {
            await get_defaut_province();
            let code = $('#province').find('option:selected').data('code');
            let district = "{!! old()?old('district'):$shippingAddress['address2']??'' !!}";
            $('#district').append($('<option value="">Chọn quận/huyện</option>'));
            return new Promise(resolve => {
                $.getJSON('{{asset('public/hcvn/quan_huyen.json')}}', function (json) {
                    jQuery.each(json, function (index, item) {
                        if (item.parent_code == code) {
                            let opt;
                            if (district === item.name_with_type) {
                                opt = $('<option data-code="' + index + '" value="' + item.name_with_type + '" selected>' + item.name_with_type + '</option>');
                            } else {
                                opt = $('<option data-code="' + index + '" value="' + item.name_with_type + '">' + item.name_with_type + '</option>');
                            }
                            $('#district').append(opt);
                        }
                    });
                    resolve($('#district'));
                });
            });
        }

        function get_district(code) {
            let district = "{!! old()?old('district'):$shippingAddress['district']??'' !!}";
            $.getJSON('{{asset('public/hcvn/quan_huyen.json')}}', function (json) {
                $('#district').empty();
                $('#district').append($('<option value="">Chọn quận/huyện</option>'));
                $('#ward').empty();
                $('#ward').append($('<option value="">Chọn xã/phường/thị trấn</option>'));
                jQuery.each(json, function (index, item) {
                    if (item.parent_code == code) {
                        let opt;
                        if (district === item.name_with_type) {
                            opt = $('<option data-code="' + index + '" value="' + item.name_with_type + '" selected>' + item.name_with_type + '</option>');
                        } else {
                            opt = $('<option data-code="' + index + '" value="' + item.name_with_type + '">' + item.name_with_type + '</option>');
                        }
                        $('#district').append(opt);
                    }
                });
            });
        }

        function get_defaut_province() {
            return new Promise(resolve => {
                let province = "{!! old()?old('province'):$shippingAddress['address1']??'' !!}";
                $('#province').append($('<option value="">Chọn tỉnh/thành</option>'));
                $.getJSON('{{asset('public/hcvn/tinh_tp.json')}}', function (json) {
                    jQuery.each(json, function (index, item) {
                        let opt;
                        if (province === item.name) {
                            opt = $('<option data-code="' + index + '" value="' + item.name + '" selected>' + item.name + '</option>');
                        } else {
                            opt = $('<option data-code="' + index + '" value="' + item.name + '">' + item.name + '</option>');
                        }
                        $('#province').append(opt);
                    });
                    resolve($('#province'));
                });
            });
        }

        function get_province() {
            let province = "{!! old()?old('province'):$shippingAddress['province']??'' !!}";
            $.getJSON('{{asset('public/hcvn/tinh_tp.json')}}', function (json) {
                $('#province').empty();
                $('#district').empty();
                $('#district').append($('<option value="">Chọn quận/huyện</option>'));
                $('#ward').empty();
                $('#ward').append($('<option value="">Chọn xã/phường/thị trấn</option>'));
                jQuery.each(json, function (index, item) {
                    let opt;
                    if (province === item.name) {
                        opt = $('<option data-code="' + index + '" value="' + item.name + '" selected>' + item.name + '</option>');
                    } else {
                        opt = $('<option data-code="' + index + '" value="' + item.name + '">' + item.name + '</option>');
                    }
                    $('#province').append(opt);
                });
            });
        }

        $(document).ready(function () {
            let province = $('#province').val();
            let district = $('#district').val();
            let ward = $('#ward').val();
            let address = $('#address').val();
            var address_full = address + ", " + ward + ", " + district + ", " + province;
            var arrayKM=[];

            geocoder = new google.maps.Geocoder();
            var providerlist = @json($providerList);
            if (address_full !== ', , , '){
                betwen();
            }

            $( "#ward" ).change(function() {
                province = $('#province').val();
                district = $('#district').val();
                ward = $('#ward').val();
                address = $('#address').val();
                address_full = address + ", " + ward + ", " + district + ", " + province;
                $('#list_provider').empty();
                betwen();
            });
            $( "#address" ).change(function() {
                province = $('#province').val();
                district = $('#district').val();
                ward = $('#ward').val();
                address = $('#address').val();
                address_full = address + ", " + ward + ", " + district + ", " + province;
                $('#list_provider').empty();
                betwen();
            });

            async function betwen() {
                let spherical = google.maps.geometry.spherical;
                let re = await getlocationfromaddress(address_full, function (result) {
                    providerlist.forEach(element => {
                        let local1 = new google.maps.LatLng({lat: parseFloat(result.lat()), lng: parseFloat(result.lng())});
                        let local2 = new google.maps.LatLng({lat: parseFloat(element.lat), lng: parseFloat(element.lng)});
                        arrayKM.push({'id': element.id, 'betwen': spherical.computeDistanceBetween(local1, local2)})
                    })

                    function compare( a, b ) {
                        if ( parseFloat(a.betwen) < parseFloat(b.betwen) ){
                            return -1;
                        }
                        if ( parseFloat(a.betwen) > parseFloat(b.betwen) ){
                            return 1;
                        }
                        return 0;
                    }
                    arrayKM.sort( compare )
                    for (let i=0; i < arrayKM.length; i++){
                        if ( i > 5 ) break;
                        let dataFind= providerlist.find(x => x.id === arrayKM[i]['id']);
                        console.log(dataFind);
                        let data= `
                            <div class="provider-item">
                                    <input type="radio" name="provider_id"
                                           value="`+dataFind['id']+`"
                                           id="provider`+dataFind['id']+`" required/>
                                    <label class="list-group-item"
                                           for="provider`+dataFind['id']+`">
                                        <img src="`+dataFind['avatar']+` " alt="">
                                        <span class="provider-info">
                                            Tên: `+dataFind['name']+` <br>
                                            Đ/c: `+dataFind['address']+`, `+dataFind['ward']+`, `+dataFind['district']+`, `+dataFind['province']+`<br>
                                            SĐT: `+dataFind['phone']+` <br>
                                            Email: `+dataFind['email']+`
                                        </span>
                                    </label>
                                </div>
                            `;
                        $('#list_provider').append(data);
                    }
                });
            }

            console.log(arrayKM)
        })

        function getlocationfromaddress(address, callback) {
            geocoder.geocode({'address': address}, function (results, status) {
                if (status == 'OK') {
                    // console.log(results[0].geometry.location)
                    callback(results[0].geometry.location);
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }

    </script>
    <script>
        $(document).ready(function () {
            $(document).on('click', '.add-row-to-cut', function () {
                let row = $(this).parents('tr.row_cart');
                $('table#cart-table > tbody').append(`<tr class="row_cart">${row.html()}</tr>`);
            })
            $(document).on('click', '.cart_quantity_delete', function () {
                let rowId = $(this).data('rowid');
                let row = $(this).parents('tr.row_cart');
                let url = `cart_remove/${rowId}`
                $.ajax(url, {
                    type: 'GET',
                    success: function () {
                        row.remove();
                    }
                })
            })
        })

    </script>
@endpush

@push('styles')
    {{-- style css --}}
    <style>
        .list-group-item {
            user-select: none;
        }

        .list-group input[type="checkbox"] {
            display: none;
        }

        .list-group input[type="checkbox"] + .list-group-item {
            cursor: pointer;
        }

        .list-group input[type="checkbox"] + .list-group-item:before {
            content: "\2713";
            color: transparent;
            font-weight: bold;
            margin-right: 1em;
        }

        .list-group input[type="checkbox"]:checked + .list-group-item {
            background-color: #0275D8;
            color: #FFF;
        }

        .list-group input[type="checkbox"]:checked + .list-group-item:before {
            color: inherit;
        }

        .list-group input[type="radio"] {
            display: none;
        }

        .list-group input[type="radio"] + .list-group-item {
            cursor: pointer;
        }

        .list-group input[type="radio"] + .list-group-item:before {
            content: "\2022";
            color: transparent;
            font-weight: bold;
            margin-right: 1em;
        }

        .list-group input[type="radio"]:checked + .list-group-item {
            background-color: #0275D8;
            color: #FFF;
        }

        .list-group input[type="radio"]:checked + .list-group-item:before {
            color: inherit;
        }

        .cart_quantity_delete {
            cursor: pointer;
        }
    </style>
@endpush