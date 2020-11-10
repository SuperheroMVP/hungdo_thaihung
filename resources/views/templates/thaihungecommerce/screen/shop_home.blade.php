@php
    /*
    $layout_page = shop_home
    */
@endphp

@extends($templatePath.'.layout')

@section('center')
    @php
        $productsNew = $modelProduct->start()->getProductLatest()->setlimit(4)->getData();
        $productsHot = $modelProduct->start()->getProductHot()->setlimit(4)->getData();
        $productsBestSell = $modelProduct->start()->getProductBestSell()->setlimit(4)->getData();
        $productsBuild = $modelProduct->start()->getProductBuild()->getData();
        $productsGroup = $modelProduct->start()->getProductGroup()->getData();
        $categories = $modelCategory->start()->getList(['status' => 1]);
        $categoriesTop = $modelCategory->start()->getCategoryTop()->getData();
        $news = $modelNews->start()->setLimit(6)->getData();
    @endphp
    <section style="background-color: #f2f2f2; width: 100%;" class="wow">
        <div class="container">
            <div class="azirspares-tabs default">
                <div class="tab-head">
                    <h2 class="title">
                        <span class="text">SẢN PHẨM CỦA CHÚNG TÔI</span>
                    </h2>
                    <ul class="tab-link ">
                        <li class="active">
                            <a href="#tab1" role="tab" data-aos="fade-up" data-aos-offset="100">
                                <span>SẢN PHẨM NỔI BẬT</span>
                            </a>
                        </li>
                        <li>
                            <a href="#tab2" role="tab" data-aos="fade-up" data-aos-offset="200">
                                <span>SẢN PHẨM MỚI</span>
                            </a>
                        </li>
                        <li>
                            <a href="#tab3" role="tab" data-aos="fade-up" data-aos-offset="300">
                                <span>QUAN TÂM NHIỀU NHẤT</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="tab-container">
                    <div class="tab-panel active" id="tab1">
                        <div class="row spotlight-container">
                            @php
                                $productHotDefault = $productsHot[0];
                            @endphp
                            <div class="col-12">
                                <div class="box-spotlight">
                                    <div class="box-info-product">
                                        <div class="box-title name-product">
                                            <h3>{{ $productHotDefault->name }}</h3>
                                        </div>
                                        <div class="box-title info-product">
                                            <a href="{{ $productHotDefault->getUrl() }}" class="btn btn-primary">Xem chi tiết</a>
                                        </div>
                                        <div class="box-image">
                                            <img src="{{ asset($productHotDefault->getThumb()) }}"
                                                 width="300" height="220" alt="">
                                            <div class="box-shadow"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row list-product">
                                    @foreach ($productsHot as $key => $product_new)
                                        <div class="col-md-3" data-aos="fade-up" data-aos-offset="{{ $key * 100 }}">
                                            <div class="azirspares-products style-02 ">
                                                <div class="product-item  style-02 rows-space-60"
                                                     data-product='{{$product_new}}'
                                                     data-name="{{ $product_new->name }}"
                                                     data-url="{{ $product_new->getUrl() }}"
                                                     style="width: 100%; display: inline-block;">
                                                    <div class="product-inner images">
                                                        <div class="product-thumb index-custom-img">
                                                            <img class="img-responsive lazy"
                                                                 src="{{ asset($product_new->getThumb()) }}"
                                                                 data-src="{{ asset($product_new->getThumb()) }}"
                                                                 width="320" height="320"
                                                                 alt="{{ $product_new->name }}">
                                                            <div class="flash">
                                                                <span class="onsale">
                                                                    <span class="number">NEW</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="index-custom-info equal-elem" style="height: 197px;">
                                                            <h3 class="product-name product_title">
                                                                {{ $product_new->name }}
                                                            </h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-panel" id="tab2">
                        <div class="row spotlight-container">
                            @php
                                $productNewDefault = $productsNew[0];
                            @endphp
                            <div class="col-12">
                                <div class="box-spotlight">
                                    <div class="box-info-product">
                                        <div class="box-title name-product">
                                            <h3>{{ $productNewDefault->name }}</h3>
                                        </div>
                                        <div class="box-title info-product">
                                            <a href="{{ $productNewDefault->getUrl() }}" class="btn btn-primary">Xem chi tiết</a>
                                        </div>
                                        <div class="box-image">
                                            <img src="{{ asset($productNewDefault->getThumb()) }}"
                                                 width="300" height="220" alt="">
                                            <div class="box-shadow"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row list-product">
                                    @foreach ($productsNew as $key => $product_new)
                                        <div class="col-md-3" data-aos="fade-up" data-aos-offset="{{ $key * 100 }}">
                                            <div class="azirspares-products style-02 ">
                                                <div class="product-item  style-02 rows-space-60"
                                                     data-product='{{$product_new}}'
                                                     data-name="{{ $product_new->name }}"
                                                     data-url="{{ $product_new->getUrl() }}"
                                                     style="width: 100%; display: inline-block;">
                                                    <div class="product-inner images">
                                                        <div class="product-thumb index-custom-img">
                                                            <img class="img-responsive lazy"
                                                                 src="{{ asset($product_new->getThumb()) }}"
                                                                 data-src="{{ asset($product_new->getThumb()) }}"
                                                                 width="320" height="320"
                                                                 alt="{{ $product_new->name }}">
                                                            <div class="flash">
                                                                <span class="onsale">
                                                                    <span class="number">NEW</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="index-custom-info equal-elem" style="height: 197px;">
                                                            <h3 class="product-name product_title">
                                                                {{ $product_new->name }}
                                                            </h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-panel " id="tab3">
                        <div class="row spotlight-container">
                            @php
                                $productBestSellDefault = $productsBestSell[0];
                            @endphp
                            <div class="col-12">
                                <div class="box-spotlight">
                                    <div class="box-info-product">
                                        <div class="box-title name-product">
                                            <h3>{{ $productBestSellDefault->name }}</h3>
                                        </div>
                                        <div class="box-title info-product">
                                            <a href="{{ $productBestSellDefault->getUrl() }}" class="btn btn-primary">Xem chi tiết</a>
                                        </div>
                                        <div class="box-image">
                                            <img src="{{ asset($productBestSellDefault->getThumb()) }}"
                                                 width="300" height="220" alt="">
                                            <div class="box-shadow"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row list-product">
                                    @foreach ($productsBestSell as $key => $product_new)
                                        <div class="col-md-3" data-aos="fade-up" data-aos-offset="{{ $key * 100 }}">
                                            <div class="azirspares-products style-02 ">
                                                <div class="product-item  style-02 rows-space-60"
                                                     data-product='{{$product_new}}'
                                                     data-name="{{ $product_new->name }}"
                                                     data-url="{{ $product_new->getUrl() }}"
                                                     style="width: 100%; display: inline-block;">
                                                    <div class="product-inner images">
                                                        <div class="product-thumb index-custom-img">
                                                            <img class="img-responsive lazy"
                                                                 src="{{ asset($product_new->getThumb()) }}"
                                                                 data-src="{{ asset($product_new->getThumb()) }}"
                                                                 width="320" height="320"
                                                                 alt="{{ $product_new->name }}">
                                                            <div class="flash">
                                                                <span class="onsale">
                                                                    <span class="number">NEW</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="index-custom-info equal-elem" style="height: 197px;">
                                                            <h3 class="product-name product_title">
                                                                {{ $product_new->name }}
                                                            </h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    @if ($categoriesTop->count())
        <section class="wow" style="width: 100%">
            <div class="container">
                <div class="azirspares-heading style3 dark">
                    <div class="heading-inner">
                        <div class="header-wrap">
                            <h3 class="title">
                                <span>DANH MỤC SẢN PHẨM</span>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="azirspares-category  default ">
                    <div class="category-list-owl">
                        <div class="row">
                            @foreach ($categoriesTop as $key =>  $category)
                                <div class="row-item col-md-2" data-aos="fade-up" data-aos-offset="{{ $key * 50 }}">
                                    <div class="category-item"
                                         style="width: 100%; display: inline-block;">
                                        <div class="category-inner equal-elem" style="height: 256px;">
                                            <figure class="category-thumb"
                                                    style="background-image: url({{ asset($category->getThumb()) }})">
                                                <a href="{{ $category->getUrl() }}" tabindex="0">
                                                </a>
                                            </figure>
                                            <h3 class="title">
                                                <a href="{{ $category->getUrl() }}"
                                                   tabindex="0">
                                                    {{ $category->title }}</a>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
    @if($news->count())
        <section class="bg-dark wow" style="width: 100%">
            <div class="container">
                <div class="azirspares-blog default">
                    <h3 class="title">
                        <span>TIN TỨC</span>
                    </h3>
                    <div class="owl-carousel thaihung-blog nav-right" data-autoplay="false" data-nav="true"
                         data-dots="true"
                         data-loop="false"
                         data-margin="20"
                         data-responsive='{"0":{"items":1},"480":{"items":2},"768":{"items":2},"992":{"items":3},"1200":{"items":3}}'>
                        @foreach($news as $key => $new)
                            <div class="post-item post-grid" data-aos="fade-up" data-aos-offset="{{ $key * 100 }}">
                                <div class="post-inner">
                                    <div class="post-thumb">
                                        <img width="440" height="321"
                                             src="{{ asset($new->getThumb()) }}"
                                             class="img-responsive attachment-440x321 size-440x321 lazy" alt=""
                                             data-src="{{ asset($new->getThumb()) }}">
                                    </div>
                                    <div class="post-content">
                                        <div class="post-info equal-elem" style="height: 176px;">
                                            <div class="date">
                                                <a href="{{ $new->getUrl() }}"
                                                   tabindex="0">{{ date_format($new->created_at, "d.m.Y") }}</a>
                                            </div>
                                            <h2 class="post-title"><a
                                                        href="{{ $new->getUrl() }}"
                                                        tabindex="0">{{ $new->title }}</a></h2>
                                            <div class="post-des">
                                                {{ $new->description }}
                                            </div>
                                        </div>
                                        <div class="post-meta">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </section>
    @endif
    <section class="wow" style="width: 100%">
        <div class="container">
            <div class="row ">
                <div class="col-sm-12 col-md-4" data-aos="fade-up" data-aos-offset="100">
                    <div class="azirspares-banner style2  left top   ">
                        <div class="banner-inner">
                            <div class="label-banner"><span></span></div>
                            <figure class="banner-thumb">
                                <img src="http://thaihung.htc-it.team/templates/thaihungecommerce/images/banner-mall-2.png">
                            </figure>
                            <div class="banner-info">
                                <div class="banner-content">
                                    <h3 class="title">
                                        Iris schol </h3>
                                    <div class="desc">
                                        Vươn tới tương lai
                                    </div>
                                    <a class="button" target=" _blank"
                                       href="https://irisschool.edu.vn">Đi đến</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4" data-aos="fade-up" data-aos-offset="200">
                    <div class="azirspares-banner style2  left top   ">
                        <div class="banner-inner">
                            <div class="label-banner"><span></span></div>
                            <figure class="banner-thumb">
                                <img src="http://thaihung.htc-it.team/templates/thaihungecommerce/images/banner-mall-3.png">
                            </figure>
                            <div class="banner-info">
                                <div class="banner-content">
                                    <h3 class="title">
                                        Crown villa </h3>
                                    <div class="desc">
                                        Đẳng cấp khác biệt
                                    </div>
                                    <a class="button" target=" _blank"
                                       href="https://crownvillas.com.vn">Đi đến</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4" data-aos="fade-up" data-aos-offset="300">
                    <div class="azirspares-banner style2  left top   ">
                        <div class="banner-inner">
                            <div class="label-banner"><span></span></div>
                            <figure class="banner-thumb">
                                <img src="http://thaihung.htc-it.team/templates/thaihungecommerce/images/banner-mall.png"
                                     title="" style="">
                            </figure>
                            <div class="banner-info">
                                <div class="banner-content">
                                    <h3 class="title">
                                        Phát hành sách </h3>
                                    <div class="desc">
                                        Thảo sức đam mê
                                    </div>
                                    <a class="button" target=" _blank"
                                       href="http://www.thaihung.com.vn/vi/cong-ty-co-phan-phat-hanh-sach-thai-nguyen.html">Đi
                                        đến</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection



@push('styles')
    {{-- style css --}}
@endpush

@push('scripts')
    {{-- script --}}
    <script>
        $(document).on('click', '.product-item', function () {
            let data = $(this).data('product');
            let name = $(this).data('name');
            let url = $(this).data('url');
            let image = data.image;
            $(this).parents('.spotlight-container').find('.box-title.name-product h3').text(name);
            $(this).parents('.spotlight-container').find('.box-image img').prop('src', image);
            $(this).parents('.spotlight-container').find('.box-title.info-product a').prop('href', url);
        })
    </script>
@endpush