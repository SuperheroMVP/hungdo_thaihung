@php
    /*
    $layout_page = shop_home
    */
@endphp

@extends($templatePath.'.layout')

@section('center')
    @php
        $productsNew = $modelProduct->start()->getProductLatest()->setlimit(8)->getData();
        $productsHot = $modelProduct->start()->getProductHot()->setlimit(4)->getData();
        $productsBuild = $modelProduct->start()->getProductBuild()->getData();
        $productsGroup = $modelProduct->start()->getProductGroup()->getData();
        $categoriesTop = $modelCategory->start()->getCategoryTop()->getData();
        $list_brands =$modelBrand->start()->getData();
    @endphp

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-advantages-1">
                    <section class="b-advantages-1"><i class="b-advantages-1__icon flaticon-gearbox"></i>
                        <h3 class="b-advantages-1__title">Cắt thép theo nhu cầu</h3>
                        <div class="b-advantages-1__info">
                            Nhận cắt thép theo nhu cầu sử dụng của khách hàng, theo các kích thước bản thiết kế xây dựng được cung cấp. Bàn giao thành phẩm đến với khách hàng theo đúng cam kết.
                        </div>
                        <br>
                        <span class="ui-decrồior-2"></span>
                        <a class="pull-right btn btn-success" href="{{asset("cat-thep")}}">Đi đến</a>
                    </section>
                    <!-- end .b-advantages-->
                    <section class="b-advantages-1 active"><i class="b-advantages-1__icon flaticon-steering-wheel"></i>
                        <h3 class="b-advantages-1__title">Sản phẩm trọn gói theo công trình</h3>
                        <div class="b-advantages-1__info">Cung cấp vật tư trọn gói cho thi công từng công trình, từng hạng mục như kho bãi, biệt thự, công trình dân sinh, cầu cống... bao gồm các vật tư: cát, thép, xi măng, gạch đá,…
                        </div>
                        <br>
                        <span class="ui-decor-2"></span>
                        <a class="pull-right btn btn-success" href="{{ route('product.combo') }}">Đi đến</a>
                    </section>
                    <!-- end .b-advantages-->
                    <section class="b-advantages-1"><i class="b-advantages-1__icon flaticon-wrench"></i>
                        <h3 class="b-advantages-1__title">Các sản phẩm thép</h3>
                        <div class="b-advantages-1__info">Phân phối thép lớn nhất miền Bắc với nhiều thương hiệu thép hàng đầu Việt Nam như TISCO, VIS, POSCO VINA, NSV … phục vụ cho việc xây dựng các công trình.
                        </div>
                        <br>
                        <span class="ui-decor-2"></span>
                        <a class="pull-right btn btn-success" href="{{ route('product.all') }}">Đi đến</a>
                    </section>
                    <!-- end .b-advantages-->
                </div>
                <!-- end .section-advantages-1-->
            </div>
        </div>
    </div>
    <section class="section-default">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="text-center">
                        <h2 class="ui-title-block">SẢN PHẨM NỔI BẬT</h2>
                        <div class="ui-decor"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="featured-carousel owl-carousel enable-owl-carousel" data-min768="2"
             data-min992="3" data-min1200="5" data-margin="30" data-pagination="true" data-navigation="true"
             data-auto-play="4000" data-stop-on-hover="true" >

            @if($list_product_outstanding->count())
                @foreach($list_product_outstanding as $product)
                    <div class="b-goods-feat">
                        <div class="b-goods-feat__img">
                            <img class="img-responsive" src="{{ asset($product->getThumb()) }}"
                                 alt="foto"/>
{{--                            <span class="b-goods-feat__label">{{$product->cost}}--}}
{{--                                <span class="b-goods-feat__label_msrp">{{$product->price}}</span>--}}
{{--                            </span>--}}
                        </div>
                        <ul class="b-goods-feat__desc list-unstyled">
                            <li class="b-goods-feat__desc-item">{{$product->weight}}  {{$product->weight_class}}</li>
                            <li class="b-goods-feat__desc-item">{{$product->length}} {{$product->length_class}}</li>
                            <li class="b-goods-feat__desc-item">{{$product->width}}  {{$product->length_class}}</li>
                            <li class="b-goods-feat__desc-item">{{$product->height}}  {{$product->length_class}}</li>
                        </ul>
                        <h3 class="b-goods-feat__name"><a href="{{$product->getUrl()}}">{{$product->name}}</a></h3>
                        <div class="b-goods-feat__info">{{ $product->description }}</div>
                    </div>
                @endforeach
            @endif
        </div>
        <!-- end .featured-carousel-->
    </section>
    <!-- end .section-default-->
    <section class="section-default pdt-0 quitrinh">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="text-center">
                        <h2 class="ui-title-block">QUY TRÌNH MUA HÀNG TẠI THÁI HƯNG</h2>
                        <div class="ui-decor"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12">
                    <div class="quytrinh">
                        <div class="quytrinh-wrap">
                            <div class="image">
                                <img src="{{ $templateFile.'/images/ICON-12.png' }}">
                                <span>1</span>
                            </div>
                            <div class="content">
                                Tìm kiếm sản phẩm và tạo đơn hàng
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12">
                    <div class="quytrinh">
                        <div class="quytrinh-wrap">
                            <div class="image">
                                <img src="{{ $templateFile.'/images/ICON-13.png' }}">
                                <span>2</span>
                            </div>
                            <div class="content">
                                Khách hàng lựa chọn đại lý gần nhất để tiết kiệm chi phí cận chuyển
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12">
                    <div class="quytrinh">
                        <div class="quytrinh-wrap">
                            <div class="image">
                                <img src="{{ $templateFile.'/images/ICON-14.png' }}">
                                <span>3</span>
                            </div>
                            <div class="content">
                                Thái Hưng liên hệ với khách hàng,Xác nhận đơn hàng và lựa chọn hình thức thanh toán
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12">
                    <div class="quytrinh">
                        <div class="quytrinh-wrap">
                            <div class="image last">
                                <img src="{{ $templateFile.'/images/ICON-15.png' }}">
                                <span>4</span>
                            </div>
                            <div class="content">
                                Ký hợp đồng, thanh toán và nhận hàng
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-advantages-2 section-dark area-bg area-bg_dark parallax"
             style="background-image: url(/templates/thaihung-template-3/media/content/bg/banner-3.jpg)">
        <div class="area-bg__inner">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="text-center">
                            <h2 class="ui-title-block">Chúng tôi có những gì</h2>
                            <!--                                    <div class="ui-subtitle-block">Tempor incididunt labore dolore duis lorem magna aliqua sed ipsum</div>-->
                            <div class="ui-decor"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <a href="{{ $categoriesTop[0]->getUrl() }}">
                            <section class="b-advantages-2"><i
                                        class="b-advantages-2__icon flaticon-wheel-alignment"></i>
                                <h3 class="b-advantages-2__title">{{ $categoriesTop[0]->title }}</h3>
                                <div class="b-advantages-2__info">{{ $categoriesTop[0]->description }}
                                </div>
                                <span class="ui-decor-2"></span>
                            </section>
                        </a>
                        <!-- end .b-advantages-->
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="{{ $categoriesTop[1]->getUrl() }}">
                            <section class="b-advantages-2"><i class="b-advantages-2__icon flaticon-gearstick"></i>
                                <h3 class="b-advantages-2__title">{{ $categoriesTop[1]->title }}</h3>
                                <div class="b-advantages-2__info">{{ $categoriesTop[1]->description }}
                                </div>
                                <span class="ui-decor-2"></span>
                            </section>
                        </a>
                        <!-- end .b-advantages-->
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="{{ $categoriesTop[2]->getUrl() }}">
                            <section class="b-advantages-2"><i class="b-advantages-2__icon flaticon-painting"></i>
                                <h3 class="b-advantages-2__title">{{ $categoriesTop[2]->title }}</h3>
                                <div class="b-advantages-2__info">{{ $categoriesTop[2]->description }}
                                </div>
                                <span class="ui-decor-2"></span>
                            </section>
                        </a>
                        <!-- end .b-advantages-->
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="{{ $categoriesTop[3]->getUrl() }}">
                            <section class="b-advantages-2"><i class="b-advantages-2__icon flaticon-inspection"></i>
                                <h3 class="b-advantages-2__title">{{ $categoriesTop[3]->title }}</h3>
                                <div class="b-advantages-2__info">{{ $categoriesTop[3]->description }}
                                </div>
                                <span class="ui-decor-2"></span>
                            </section>
                        </a>
                        <!-- end .b-advantages-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end .section-advantages-2-->
    <!-- end .section-default-->
    <!-- end .section-default-->
    <section class="b-about section-default">
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <div class="b-about__inner"
                            {{--                         style="background: url('{{$productsHot[0]->image}}') no-repeat 100% 55px;"--}}
                    >
                        <h3 class="ui-title-block">VỀ CHÚNG TÔI</h3>
                        <div class="ui-subtitle-block">{{ sc_store('description') }}</div>
                        <div class="ui-decor"></div>
{{--                        <div class="b-about-main">--}}
{{--                            <div class="b-about-main__title">We are a Trusted Name in Auto Industry</div>--}}
{{--                            <div class="b-about-main__subtitle">Visited by Million of Car Buyers Every Month!</div>--}}
{{--                            <p>MotorLand is aliquip exd ea consequat duis lorem ipsum dolor sit amet consectetur dipis--}}
{{--                                icing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim--}}
{{--                                ad minim veniam quis nostrud exercitation.</p>--}}
{{--                            <p>Slamco laboris nisi ut aliquip ex ea comdo consequat uis aute irure dolor raeprehenderit--}}
{{--                                voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>--}}
{{--                            <div class="b-about-main__btns">--}}
{{--                                <a class="btn btn-dark" href="home.html">ĐẶT MUA</a>--}}
{{--                                <a class="btn btn-primary" href="home.html">THÔNG TIN</a>--}}
{{--                            </div>--}}
{{--                        </div>--}}
                    </div>
                </div>
                <div class="col-lg-2">
                    <ul class="b-about-list list-unstyled">
                        <li class="b-about-list__item"><i class="b-about-list__icon flaticon-travel"></i>
                            <div class="b-about-list__inner">
{{--                                <div class="b-about-list__title">10 Years in Business</div>--}}
                                <div class="b-about-list__info">
                                    Với uy tín gần 30 năm trong lĩnh vực kinh doanh thương mại thép, Thái Hưng tự hào là nhà phân phối thép lớn nhất miền Bắc với nhiều thương hiệu thép hàng đầu Việt Nam như: TISCO, VIS, POSCO VINA, NSV …
                                </div>
                                <div class="ui-decor-2"></div>
                            </div>
                        </li>
                        <li class="b-about-list__item"><i class="b-about-list__icon flaticon-handshake"></i>
                            <div class="b-about-list__inner">
{{--                                <div class="b-about-list__title">Trusted by Auto Buyers</div>--}}
                                <div class="b-about-list__info">
                                    Thái Hưng có mạng lưới bán hàng rộng khắp từ Bắc vào Nam với hơn 2000 đối tác và khách hàng thường xuyên.
                                </div>
                                <div class="ui-decor-2"></div>
                            </div>
                        </li>
                        <li class="b-about-list__item"><i class="b-about-list__icon flaticon-transport"></i>
                            <div class="b-about-list__inner">
{{--                                <div class="b-about-list__title">Affordable Auto Prices</div>--}}
                                <div class="b-about-list__info">
                                    Sản phẩm thép do Thái Hưng cung cấp có mặt trong hầu hết các công trình trọng điểm của quốc gia như Trung tâm hội nghị Quốc Gia, Nhà ga T1 - Sân bay Quốc tế Nội Bài, tòa Keangnam, nhà máy lọc dầu Dung Quất… cùng các dự án đường sắt, cao tốc, các khu đô thị lớn nhỏ trong cả nước.
                                </div>
                                <div class="ui-decor-2"></div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- end .b-about-->
    </section>
    <!-- end .b-about-->
    <div class="info-group block-table block-table_md">
        <div class="info-group__section col-md-6">
            <section class="b-info b-info_mod-a area-bg area-bg_op_80 area-bg_prim parallax"
                     style="background-image: url(/templates/thaihung-template-3/media/content/bg/banner-3.jpg)">
                <div class="area-bg__inner">
                    <h2 class="b-info__title">SẢN PHẨM ĐƯỢC ƯA CHUỘNG HÀNG ĐẦU</h2>
                    <div class="b-info__desc">

                    </div>
                    <a class="btn btn-white" href="{{asset('/contact.html')}}">NHẬN BÁO GIÁ</a>
                </div>
            </section>
        </div>
        <div class="info-group__section col-md-6">
            <section class="b-info b-info_mod-b area-bg area-bg_op_80 area-bg_dark-2 parallax"
                     style="background-image: url(/templates/thaihung-template-3/media/content/bg/banner-4.jpg)">
                <div class="area-bg__inner">
                    <h2 class="b-info__title">SẢN PHẨM BÁN CHẠY NHẤT</h2>
                    <div class="b-info__desc">

                    </div>
                    <a class="btn btn-white" href="{{asset('/contact.html')}}">NHẬN BÁO GIÁ</a>
                </div>
            </section>
        </div>
    </div>
    <!-- end .b-info-group-->
    <!-- end .section-default-->
    <!-- end .section-isotope-->
{{--    <div class="section-default">--}}
{{--        <div class="container">--}}
{{--            <div class="row">--}}
{{--                <div class="col-md-7">--}}
{{--                    <section class="section-list-brands">--}}
{{--                        <h2 class="ui-title-block">TOP SẢN PHẨM</h2>--}}
{{--                        <div class="ui-subtitle-block">CHÚNG TÔI CUNG CẤP NHỮNG GÌ?</div>--}}
{{--                        <div class="ui-decor"></div>--}}
{{--                        <ul class="b-list-brands list-unstyled">--}}
{{--                            @foreach($categoriesTop as $category)--}}
{{--                                <li class="b-list-brands__item">--}}
{{--                                    <a href="{{$category->getUrl()}}">--}}
{{--                                        <img src="{{$category->image}}" alt="" width="100%">--}}
{{--                                        <a class="b-list-brands__link" href="{{$category->getUrl()}}">{{$category->title}}--}}
{{--                                            <span class="badge">({{$category->count_product($category->id)}})</span>--}}
{{--                                        </a>--}}
{{--                                    </a>--}}
{{--                                </li>--}}
{{--                            @endforeach--}}
{{--                        </ul>--}}
{{--                        <a class="btn btn-primary" href="{{ route('product.all') }}">XEM TẤT CẢ</a>--}}
{{--                    </section>--}}
{{--                </div>--}}
{{--                <div class="col-md-4 col-md-offset-1">--}}
{{--                    <div class="b-bnr">--}}
{{--                        <div class="b-bnr__label">CHÚNG TÔI CUNG CẤP NHỮNG GÌ?</div>--}}
{{--                        <div class="b-bnr__title">CAR RENTAL</div>--}}
{{--                        <div class="b-bnr__info">We have Effective and Efficient Vehicles for Car Rental to meet all--}}
{{--                            your needs!--}}
{{--                        </div>--}}
{{--                        <ul class="b-bnr__list list list-mark-3">--}}
{{--                            <li>Instant Quotes</li>--}}
{{--                            <li>Unlimited Mileage</li>--}}
{{--                            <li>No Booking Fees or Hidden Costs</li>--}}
{{--                            <li>Hassle-Free Service</li>--}}
{{--                            <li>Guranteed Reservations</li>--}}
{{--                        </ul>--}}
{{--                    </div>--}}
{{--                    <!-- end .b-banner-->--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div>--}}
    <!-- end .b-list-brands-->
    <!-- end .section-default-->
    <!-- end .section-news-->
    <div class="section-default">
        <div class="b-brands owl-carousel owl-theme enable-owl-carousel" data-min768="2" data-min992="5"
             data-min1200="6" data-margin="30" data-pagination="false" data-navigation="true" data-auto-play="4000"
             data-stop-on-hover="true">
            @if($list_brands->count())
                @foreach($list_brands as $brand)
                    <div class="b-brands__item">
                        <div class="b-brands__img">
                            <img class="img-responsive" src="{{asset($brand->getThumb())}}"
                                 alt="foto"/>
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
        <!-- end .b-brands-->
    </div>
    <!-- end .section-default-->
    <!-- end .b-subscribe-->
    <div class="block-table">
        <div class="block-table__cell col-md-6">
            <div class="block-table__inner">
                <section class="section-form-contacts">
                    <div class="section-form-contacts__label">LIÊN LẠC</div>
                    <h3 class="section-form-contacts__title">Gửi tin nhắn cho chúng tôi</h3>
                    <div class="section-form-contacts__info">

                    </div>
                    <div id="success"></div>
                    <form method="post" action="{{ route('contact.post') }}"  class="b-form-contacts ui-form" id="contactForm">
                        {{ csrf_field() }}
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
                                    <input class="form-control {{ ($errors->has('name'))?"input-error":"" }}" id="user-name" type="text" name="name"
                                           placeholder="{{ trans('front.contact_form.name') }}" required="required" value="{{ old('name') }}"/>
                                    @if ($errors->has('name'))
                                        <span class="help-block">
                                            {{ $errors->first('name') }}
                                        </span>
                                    @endif
                                </div>
                                <div class="form-group {{ $errors->has('phone') ? ' has-error' : '' }}">
                                    <input class="form-control {{ ($errors->has('phone'))?"input-error":"" }}" id="user-phone" type="tel" name="phone"
                                           placeholder="{{ trans('front.contact_form.phone') }}" required="required" value="{{old('phone')}}"/>
                                    @if ($errors->has('phone'))
                                        <span class="help-block">
                                            {{ $errors->first('phone') }}
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('email') ? ' has-error' : '' }}">
                                    <input class="form-control {{ ($errors->has('phone'))?"input-error":"" }}" id="user-email" type="email" name="email"
                                           placeholder="{{ trans('front.contact_form.email') }}" required="required"  value="{{old('email')}}"/>
                                    @if ($errors->has('email'))
                                        <span class="help-block">
                                            {{ $errors->first('email') }}
                                        </span>
                                    @endif
                                </div>
                                <div class="form-group {{ $errors->has('title') ? ' has-error' : '' }}">
                                    <input class="form-control  last-block_mrg-btn_0 {{ ($errors->has('title'))?"input-error":"" }}" id="user-subject" type="text"
                                           name="title" placeholder="{{ trans('front.contact_form.subject') }}" required="required" value="{{old('title')}}"/>
                                    @if ($errors->has('title'))
                                        <span class="help-block">
                                            {{ $errors->first('title') }}
                                        </span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <textarea class="form-control {{ ($errors->has('content'))?"input-error":"" }}" name="content" id="user-message" rows="5" placeholder="{{ trans('front.contact_form.content') }}"
                                          required="required"></textarea>
                                @if ($errors->has('content'))
                                    <span class="help-block">
                                                    {{ $errors->first('content') }}
                                                </span>
                                @endif
                                <button type="submit"  class="btn btn-white btn-lg">Gửi tin nhắn</button>
                            </div>
                        </div>
                    </form>
                </section>
                <!-- end .b-form-contact-->
            </div>
        </div>
        <div class="block-table__cell col-md-6">
{{--            <div class="block-table__inner">--}}
{{--                <div class="map" id="map"></div>--}}
{{--            </div>--}}
            <iframe src="{{ sc_store('map') }}" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
    </div>
    <!-- end .block-table-->
@endsection



@push('styles')
    {{-- style css --}}
    <style>
        .input-search{
            width: 100%;
            height: 50px;
        }
    </style>
@endpush

@push('scripts')
    {{-- script --}}
@endpush
