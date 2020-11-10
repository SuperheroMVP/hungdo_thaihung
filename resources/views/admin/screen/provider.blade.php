@extends('admin.layout')

@section('main')
<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h2 class="box-title">{{ $title_description??'' }}</h2>

                <div class="box-tools">
                    <div class="btn-group pull-right" style="margin-right: 5px">
                        <a href="{{ route('admin_provider.index') }}" class="btn  btn-flat btn-default" title="List"><i
                                class="fa fa-list"></i><span class="hidden-xs"> {{trans('admin.back_list')}}</span></a>
                    </div>
                </div>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action="{{ $url_action }}" method="post" accept-charset="UTF-8" class="form-horizontal" id="form-main"
                enctype="multipart/form-data">


                <div class="box-body">
                    <div class="fields-group">

                                <div class="form-group   {{ $errors->has('name') ? ' has-error' : '' }}">
                                    <label for="name" class="col-sm-2 col-form-label">Tên đại lý/Công ty thành viên <span class="seo" title="SEO"><i class="fa fa-coffee" aria-hidden="true"></i></span></label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <input type="text" id="name" name="name"
                                                value="{!! old()?old('name'):$supplier['name']??'' !!}"
                                                class="form-control" placeholder="" />
                                        </div>
                                        @if ($errors->has('name'))
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('name') }}
                                        </span>
                                        @else
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ trans('admin.max_c',['max'=>100]) }}
                                        </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group   {{ $errors->has('alias') ? ' has-error' : '' }}">
                                    <label for="alias" class="col-sm-2 col-form-label">{!! trans('supplier.alias') !!}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <input type="text" id="alias" name="alias"
                                                value="{!! old()?old('alias'):$supplier['alias']??'' !!}"
                                                class="form-control" placeholder="" />
                                        </div>
                                        @if ($errors->has('alias'))
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('alias') }}
                                        </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group   {{ $errors->has('email') ? ' has-error' : '' }}">
                                    <label for="email"
                                        class="col-sm-2 col-form-label">{{ trans('supplier.email') }}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <input type="email" id="email" name="email"
                                                value="{!! old()?old('email'):$supplier['email']??'' !!}"
                                                class="form-control" placeholder="" />
                                        </div>
                                        @if ($errors->has('email'))
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('email') }}
                                        </span>
                                        @endif
                                    </div>
                                </div>


                                <div class="form-group   {{ $errors->has('phone') ? ' has-error' : '' }}">
                                    <label for="phone"
                                        class="col-sm-2 col-form-label">{{ trans('supplier.phone') }}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <input type="text" id="phone" name="phone"
                                                value="{!! old()?old('phone'):$supplier['phone']??'' !!}"
                                                class="form-control" placeholder="" />
                                        </div>
                                        @if ($errors->has('phone'))
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('phone') }}
                                        </span>
                                        @endif
                                    </div>
                                </div>



                                <div class="form-group   {{ $errors->has('province') ? ' has-error' : '' }}">
                                    <label for="province"
                                        class="col-sm-2 col-form-label">Tỉnh/TP</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <select class="select2 card-select form-control" name="province" id="province"></select>
                                        </div>
                                        @if ($errors->has('province'))
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('province') }}
                                        </span>
                                        @endif
                                    </div>
                                </div>


                                <div class="form-group   {{ $errors->has('district') ? ' has-error' : '' }}">
                                    <label for="district"
                                           class="col-sm-2 col-form-label">Quận/Huyện</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <select class="select2 card-select form-control" name="district" id="district"></select>
                                        </div>
                                        @if ($errors->has('district'))
                                            <span class="help-block">
                                                    <i class="fa fa-info-circle"></i> {{ $errors->first('district') }}
                                                </span>
                                        @endif
                                    </div>
                                </div>


                                <div class="form-group   {{ $errors->has('ward') ? ' has-error' : '' }}">
                                    <label for="ward"
                                           class="col-sm-2 col-form-label">Xã/Phường/Thị trấn</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <select class="select2 card-select form-control" name="ward" id="ward"></select>
                                        </div>
                                        @if ($errors->has('ward'))
                                            <span class="help-block">
                                                            <i class="fa fa-info-circle"></i> {{ $errors->first('ward') }}
                                                        </span>
                                        @endif
                                    </div>
                                </div>


                                <div class="form-group   {{ $errors->has('address') ? ' has-error' : '' }}">
                                    <label for="address"
                                           class="col-sm-2 col-form-label">{{ trans('supplier.address') }}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                            <input type="text" id="address" name="address"
                                                   value="{!! old()?old('address'):$supplier['address']??'' !!}"
                                                   class="form-control" placeholder="" />
                                        </div>
                                        @if ($errors->has('address'))
                                            <span class="help-block">
                                                    <i class="fa fa-info-circle"></i> {{ $errors->first('address') }}
                                                </span>
                                        @endif
                                    </div>
                                </div>


                                <div class="form-group   {{ $errors->has('avatar') ? ' has-error' : '' }}">
                                    <label for="avatar"
                                        class="col-sm-2 col-form-label">{{ trans('supplier.image') }}</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" id="avatar" name="avatar"
                                                value="{!! old('avatar',$supplier['avatar']??'') !!}"
                                                class="form-control input-sm image" placeholder="" />
                                            <span class="input-group-btn">
                                                <a data-input="avatar" data-preview="preview_image1" data-type="provider-avatar"
                                                    class="btn btn-sm btn-primary lfm">
                                                    <i class="fa fa-picture-o"></i>
                                                    {{trans('product.admin.choose_image')}}
                                                </a>
                                            </span>
                                        </div>
                                        @if ($errors->has('avatar'))
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('avatar') }}
                                        </span>
                                        @endif
                                        <div id="preview_image1" class="img_holder">
                                            @if (old('avatar',$supplier['avatar']??''))
                                            <img src="{{ asset(old('avatar',$supplier['avatar']??'')) }}">
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group   {{ $errors->has('cover') ? ' has-error' : '' }}">
                            <label for="cover"
                                   class="col-sm-2 col-form-label">Ảnh bìa</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" id="cover" name="cover"
                                           value="{!! old('cover',$supplier['cover']??'') !!}"
                                           class="form-control input-sm image" placeholder="" />
                                    <span class="input-group-btn">
                                                <a data-input="cover" data-preview="preview_image2" data-type="provider-avatar"
                                                   class="btn btn-sm btn-primary lfm">
                                                    <i class="fa fa-picture-o"></i>
                                                    {{trans('product.admin.choose_image')}}
                                                </a>
                                            </span>
                                </div>
                                @if ($errors->has('cover'))
                                    <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('cover') }}
                                        </span>
                                @endif
                                <div id="preview_image2" class="img_holder">
                                    @if (old('cover',$supplier['cover']??''))
                                        <img src="{{ asset(old('cover',$supplier['cover']??'')) }}">
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label
                                    class="col-sm-2 validate account_input">Vị trí đại lý:
                            </label>
                            <div class="col-sm-8">
{{--                                <input id="pac-input" class="controls" type="text" placeholder="Search Box"/>--}}
                                <div id="map" style="width: 100%; height: 500px;"></div>
                                <input type="text" id="latbox" name="lat" value="{!! old()?old('lat'):$supplier['lat']??'' !!}" readonly>
                                <input type="text" id="lngbox" name="lng" value="{!! old()?old('lng'):$supplier['lng']??'' !!}" readonly>
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('type') ? ' has-error' : '' }}">
                            <label
                                    class="col-sm-2 validate account_input {{ ($errors->has('type'))?"input-error":"" }}">Đại lý/Công ty thành viên:
                            </label>
                            <div class="col-sm-8">
                                <label class="radio-inline"><input value="0" type="radio" name="type"
                                            {{ (old('type', $supplier['type'] ?? 0) == 0)?'checked':'' }}> Đại lý lẻ</label>
                                <label class="radio-inline"><input value="1" type="radio" name="type"
                                            {{ (old('type', $supplier['type'] ?? 0) == 1)?'checked':'' }}> Công ty thành viên</label>
                            </div>
                            @if ($errors->has('type'))
                                <span class="help-block">
                                    {{ $errors->first('type') }}
                                </span>
                            @endif
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
                    </div>
                </div>
                        <!-- /.box-footer -->
            </form>
        </div>
    </div>
</div>


@endsection

@push('styles')

@endpush

@push('scripts')

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

        function initMap() {
            var lat = document.getElementById("latbox").value;
            var lng = document.getElementById("lngbox").value;
            if(lat != "" && lng != ""){
                var latlng = new google.maps.LatLng(lat, lng);
            }else{
                var latlng = new google.maps.LatLng(21.5685576, 105.7968738);
            }

            var map = new google.maps.Map(document.getElementById('map'), {
                center: latlng,
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                title: 'Set lat/lon values for this property',
                draggable: true
            });

            google.maps.event.addListener(marker, 'dragend', function (event) {
                document.getElementById("latbox").value = this.getPosition().lat();
                document.getElementById("lngbox").value = this.getPosition().lng();
            });
        }

        // function initAutocomplete() {
        //     const map = new google.maps.Map(document.getElementById("map"), {
        //         center: { lat: 21.5685576, lng: 105.7968738 },
        //         zoom: 13,
        //         mapTypeId: "roadmap",
        //     });
        //
        //
        //
        //     // Create the search box and link it to the UI element.
        //     const input = document.getElementById("pac-input");
        //     const searchBox = new google.maps.places.SearchBox(input);
        //     map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        //     // Bias the SearchBox results towards current map's viewport.
        //     map.addListener("bounds_changed", () => {
        //         searchBox.setBounds(map.getBounds());
        //     });
        //     let markers = [];
        //     // Listen for the event fired when the user selects a prediction and retrieve
        //     // more details for that place.
        //     searchBox.addListener("places_changed", () => {
        //         const places = searchBox.getPlaces();
        //
        //         if (places.length == 0) {
        //             return;
        //         }
        //         // Clear out the old markers.
        //         markers.forEach((marker) => {
        //             marker.setMap(null);
        //         });
        //         markers = [];
        //         // For each place, get the icon, name and location.
        //         const bounds = new google.maps.LatLngBounds();
        //         places.forEach((place) => {
        //             if (!place.geometry) {
        //                 console.log("Returned place contains no geometry");
        //                 return;
        //             }
        //             const icon = {
        //                 url: place.icon,
        //                 size: new google.maps.Size(71, 71),
        //                 origin: new google.maps.Point(0, 0),
        //                 anchor: new google.maps.Point(17, 34),
        //                 scaledSize: new google.maps.Size(25, 25),
        //             };
        //             // Create a marker for each place.
        //             markers.push(
        //                 new google.maps.Marker({
        //                     map,
        //                     icon,
        //                     title: place.name,
        //                     position: place.geometry.location,
        //                 })
        //             );
        //
        //             if (place.geometry.viewport) {
        //                 // Only geocodes have viewport.
        //                 bounds.union(place.geometry.viewport);
        //             } else {
        //                 bounds.extend(place.geometry.location);
        //             }
        //         });
        //         map.fitBounds(bounds);
        //     });
        //
        //     var marker = new google.maps.Marker({
        //         position: latlng,
        //         map: map,
        //         title: 'Set lat/lon values for this property',
        //         draggable: true
        //     });
        //
        //     google.maps.event.addListener(marker, 'dragend', function (event) {
        //         document.getElementById("latbox").value = this.getPosition().lat();
        //         document.getElementById("lngbox").value = this.getPosition().lng();
        //     });
        // }


    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzlVX517mZWArHv4Dt3_JVG0aPmbSE5mE&libraries=places&callback=initMap"></script>
{{--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--}}

@endpush