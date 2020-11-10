@php
/*
$layout_page = shop_auth
*/
@endphp

@extends($templatePath.'.layout')

@section('main')

    <section id="form-login"><!--form-->
        <div class="container">
            <div class="row">
                <h2 class="title text-center">{{ $title }}</h2>
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        @include($templatePath.'.auth.login')
                    </div><!--/login form-->
                </div>

                <div class="col-sm-1">
                    <h2 class="or">OR</h2>
                </div>

                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        @include($templatePath.'.auth.register')
                    </div><!--/sign up form-->
                </div>

            </div>
        </div>
    </section><!--/form-->
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
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
            let ward = "{!! old()?old('ward'):$supplier['ward']??'' !!}";
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
            let district = "{!! old()?old('district'):$supplier['district']??'' !!}";
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
                let province = "{!! old()?old('province'):$supplier['province']??'' !!}";
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