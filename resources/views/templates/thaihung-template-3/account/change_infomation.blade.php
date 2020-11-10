@php
    /*
    $layout_page = shop_profile
    $user
    $countries
    */
@endphp

@extends($templatePath.'.layout')

@section('main')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div class="card">

                    <div class="card-body">
                        <form method="POST" action="{{ route('member.post_change_infomation') }}">
                            @csrf
                            @if (sc_config('customer_lastname'))
                                <div class="form-group row {{ $errors->has('first_name') ? ' has-error' : '' }}">
                                    <label for="first_name"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.first_name') }}</label>

                                    <div class="col-md-6">
                                        <input id="first_name" type="text" class="form-control" name="first_name"
                                               required
                                               value="{{ (old('first_name'))?old('first_name'):$user['first_name']}}">

                                        @if($errors->has('first_name'))
                                            <span class="help-block">{{ $errors->first('first_name') }}</span>
                                        @endif

                                    </div>
                                </div>
                                <div class="form-group row {{ $errors->has('last_name') ? ' has-error' : '' }}">
                                    <label for="last_name"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.last_name') }}</label>

                                    <div class="col-md-6">
                                        <input id="last_name" type="text" class="form-control" name="last_name" required
                                               value="{{ (old('last_name'))?old('last_name'):$user['last_name']}}">

                                        @if($errors->has('last_name'))
                                            <span class="help-block">{{ $errors->first('last_name') }}</span>
                                        @endif

                                    </div>
                                </div>
                            @else
                                <div class="form-group row {{ $errors->has('first_name') ? ' has-error' : '' }}">
                                    <label for="first_name"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.name') }}</label>

                                    <div class="col-md-6">
                                        <input id="first_name" type="text" class="form-control" name="first_name"
                                               required
                                               value="{{ (old('first_name'))?old('first_name'):$user['first_name']}}">

                                        @if($errors->has('first_name'))
                                            <span class="help-block">{{ $errors->first('first_name') }}</span>
                                        @endif

                                    </div>
                                </div>
                            @endif


                            @if (sc_config('customer_phone'))
                                <div class="form-group row {{ $errors->has('phone') ? ' has-error' : '' }}">
                                    <label for="phone"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.phone') }}</label>

                                    <div class="col-md-6">
                                        <input id="phone" type="text" class="form-control" name="phone" required
                                               value="{{ (old('phone'))?old('phone'):$user['phone']}}">

                                        @if($errors->has('phone'))
                                            <span class="help-block">{{ $errors->first('phone') }}</span>
                                        @endif

                                    </div>
                                </div>
                            @endif

                            @if (sc_config('customer_postcode'))
                                <div class="form-group row {{ $errors->has('postcode') ? ' has-error' : '' }}">
                                    <label for="postcode"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.postcode') }}</label>

                                    <div class="col-md-6">
                                        <input id="postcode" type="text" class="form-control" name="postcode" required
                                               value="{{ (old('postcode'))?old('postcode'):$user['postcode']}}">

                                        @if($errors->has('postcode'))
                                            <span class="help-block">{{ $errors->first('postcode') }}</span>
                                        @endif

                                    </div>
                                </div>
                            @endif

                            <div class="form-group row {{ $errors->has('email') ? ' has-error' : '' }}">
                                <label for="email"
                                       class="col-md-4 col-form-label text-md-right">{{ trans('account.email') }}</label>

                                <div class="col-md-6">
                                    {{ $user['email'] }}

                                </div>
                            </div>

                            @if (sc_config('customer_address2'))
{{--                                <div class="form-group row {{ $errors->has('address1') ? ' has-error' : '' }}">--}}
{{--                                    <label for="address1"--}}
{{--                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.address1') }}</label>--}}

{{--                                    <div class="col-md-6">--}}
{{--                                        <input id="address1" type="text" class="form-control" name="address1" required--}}
{{--                                               value="{{ (old('address1'))?old('address1'):$user['address1']}}">--}}

{{--                                        @if($errors->has('address1'))--}}
{{--                                            <span class="help-block">{{ $errors->first('address1') }}</span>--}}
{{--                                        @endif--}}

{{--                                    </div>--}}
{{--                                </div>--}}

{{--                                <div class="form-group row {{ $errors->has('address2') ? ' has-error' : '' }}">--}}
{{--                                    <label for="address2"--}}
{{--                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.address2') }}</label>--}}
{{--                                    <div class="col-md-6">--}}
{{--                                        <input id="address2" type="text" class="form-control" name="address2" required--}}
{{--                                               value="{{ (old('address2'))?old('address2'):$user['address2']}}">--}}

{{--                                        @if($errors->has('address2'))--}}
{{--                                            <span class="help-block">{{ $errors->first('address2') }}</span>--}}
{{--                                        @endif--}}

{{--                                    </div>--}}
{{--                                </div>--}}

                                <div class="form-group row {{ $errors->has('address1') ? ' has-error' : '' }}">
                                    <label for="address2"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.address2') }}</label>
                                    <div class="col-md-6">
                                    <select class="select2 form-control" style="width: 100%" id="province"
                                            name="address1">
                                        <option value="{{ (old('address1'))?old('address1'): $user['address1']}}">{{ (old('address1'))?old('address1'): $user['address1']}}</option>
                                    </select>
                                    @if($errors->has('address1'))
                                        <span class="help-block">{{ $errors->first('address1') }}</span>
                                    @endif
                                    </div>
                                </div>

                                <div class="form-group row {{ $errors->has('address2') ? ' has-error' : '' }}">
                                    <label for="address2"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.address2') }}</label>
                                    <div class="col-md-6">
                                    <select class="select2 form-control" style="width: 100%" id="district"
                                            name="address2">
                                        <option value="{{ (old('address2'))?old('address2'): $user['address2']}}">{{ (old('address2'))?old('address2'): $user['address2']}}</option>
                                    </select>
                                    @if($errors->has('address2'))
                                        <span class="help-block">{{ $errors->first('address2') }}</span>
                                    @endif
                                    </div>
                                </div>

                                <div class="form-group row {{ $errors->has('address3') ? ' has-error' : '' }}">
                                    <label for="address2"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.address2') }}</label>
                                    <div class="col-md-6">
                                    <select class="select2 form-control" style="width: 100%" id="ward"
                                            name="address3">
                                        <option value="{{ (old('address3'))?old('address3'): $user['address3']}}">{{ (old('address3'))?old('address3'): $user['address3']}}</option>
                                    </select>
                                    @if($errors->has('address3'))
                                        <span class="help-block">{{ $errors->first('address3') }}</span>
                                    @endif
                                    </div>
                                </div>
                                <div class="form-group row {{ $errors->has('address') ? ' has-error' : '' }}">
                                    <label for="address2"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.address2') }}</label>
                                    <div class="col-md-6">
                                    <input type="text"
                                           class="is_required validate account_input form-control {{ ($errors->has('address'))?"input-error":"" }}"
                                           name="address" placeholder="{{ trans('account.address') }}"
                                           value="{{ old('address') ? old('address') : $user['address'] }}">
                                    @if ($errors->has('address'))
                                        <span class="help-block">
                {{ $errors->first('address') }}
            </span>
                                    @endif
                                    </div>
                                </div>
                            @else
                                <div class="form-group row {{ $errors->has('address1') ? ' has-error' : '' }}">
                                    <label for="address1"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.address') }}</label>

                                    <div class="col-md-6">
                                        <input id="address1" type="text" class="form-control" name="address1" required
                                               value="{{ (old('address1'))?old('address1'):$user['address1']}}">

                                        @if($errors->has('address1'))
                                            <span class="help-block">{{ $errors->first('address1') }}</span>
                                        @endif

                                    </div>
                                </div>
                            @endif

                            @if (sc_config('customer_country'))
                                @php
                                    $country = (old('country'))?old('country'):$user['country'];
                                @endphp

                                <div class="form-group row {{ $errors->has('country') ? ' has-error' : '' }}">
                                    <label for="country"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.country') }}</label>
                                    <div class="col-md-6">
                                        <select class="form-control country" style="width: 100%;" name="country">
                                            <option>__{{ trans('account.country') }}__</option>
                                            @foreach ($countries as $k => $v)
                                                <option value="{{ $k }}" {{ ($country ==$k) ? 'selected':'' }}>{{ $v }}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('country'))
                                            <span class="help-block">
                                        {{ $errors->first('country') }}
                                    </span>
                                        @endif
                                    </div>
                                </div>
                            @endif

                            @if (sc_config('customer_sex'))
                                @php
                                    $sex = old('sex')?old('sex'):$user['sex'];
                                @endphp
                                <div class="form-group{{ $errors->has('sex') ? ' has-error' : '' }}">
                                    <label class="validate account_input {{ ($errors->has('sex'))?"input-error":"" }}">{{ trans('account.sex') }}
                                        : </label>
                                    <label class="radio-inline"><input value="0" type="radio"
                                                                       name="sex" {{ ($sex == 0)?'checked':'' }}> {{ trans('account.sex_women') }}
                                    </label>
                                    <label class="radio-inline"><input value="1" type="radio"
                                                                       name="sex" {{ ($sex == 1)?'checked':'' }}> {{ trans('account.sex_men') }}
                                    </label>
                                    @if ($errors->has('sex'))
                                        <span class="help-block">
                            {{ $errors->first('sex') }}
                        </span>
                                    @endif
                                </div>
                            @endif

                            @if (sc_config('customer_birthday'))
                                <div class="form-group row {{ $errors->has('birthday') ? ' has-error' : '' }}">
                                    <label for="birthday"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.birthday') }}</label>

                                    <div class="col-md-6">
                                        <input type="date" id="birthday" data-date-format="YYYY-MM-DD"
                                               class="form-control" name="birthday" required
                                               value="{{ (old('birthday'))?old('birthday'):$user['birthday']}}">

                                        @if($errors->has('birthday'))
                                            <span class="help-block">{{ $errors->first('birthday') }}</span>
                                        @endif

                                    </div>
                                </div>
                            @endif

                            @if (sc_config('customer_group'))
                                <div class="form-group row {{ $errors->has('group') ? ' has-error' : '' }}">
                                    <label for="group"
                                           class="col-md-4 col-form-label text-md-right">{{ trans('account.group') }}</label>

                                    <div class="col-md-6">
                                        <input id="group" type="text" class="form-control" name="group" required
                                               value="{{ (old('group'))?old('group'):$user['group']}}">

                                        @if($errors->has('group'))
                                            <span class="help-block">{{ $errors->first('group') }}</span>
                                        @endif

                                    </div>
                                </div>
                            @endif

                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        {{ trans('account.update_infomation') }}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
            <li><a href="{{ route('member.index') }}">{{ trans('front.my_account') }}</a></li>
            <li class="active">{{ $title }}</li>
        </ol>
    </div>
@endsection

@push('styles')
    {{-- style css --}}
    <style>
        .select2-container--default .select2-selection--single .select2-selection__arrow{
            top: 13px !important;
        }
        .select2-container .select2-selection--single {
            height: 50px !important;
            padding: 10px 22px 11px;
        }
    </style>
@endpush

@push('scripts')
    {{-- script --}}

    <script>
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
            let ward = "{!! old()?old('address3'):$user['address3']??'' !!}";
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
            let ward = "{!! old()?old('ward'):$supplier['ward']??'' !!}";
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
            let district = "{!! old()?old('address2'):$user['address2']??'' !!}";
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
            let district = "{!! old()?old('district'):$supplier['district']??'' !!}";
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
                let province = "{!! old()?old('address1'):$user['address1']??'' !!}";
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
            let province = "{!! old()?old('province'):$obj['province']??'' !!}";
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
    </script>
@endpush