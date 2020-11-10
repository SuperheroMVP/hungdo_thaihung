@php
    /*
    $layout_page = product_detail
    $product: no paginate
    $productRelation: no paginate
    */
@endphp

@extends($templatePath.'.layout')

@section('center')
    <main class="l-main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <section class="b-car-details">
                        <div class="b-car-details__header">
                            {{--                            {{dd($product->descriptions)}}--}}
                            <h2 class="b-car-details__title">{{$product->name}}</h2>
                            {{--                            <div class="b-car-details__subtitle">AWD 430i xSmart Drive Coupe</div>--}}
                            {{--                            <div class="b-car-details__address"><i class="icon fa fa-map-marker text-primary"></i> 13165--}}
                            {{--                                N Auto Show Ave Surprise, AZ 85388--}}
                            {{--                            </div>--}}
                            <div class="b-car-details__links"><a class="b-car-details__link"
                                                                 onClick="addToCartAjax('{{ $product->id }}','compare')"><i
                                            class="icon fa fa-exchange text-primary"></i>{{trans('front.add_to_compare')}}
                                </a><a class="b-car-details__link" href="car-details.html"><i
                                            class="icon fa fa-car text-primary"></i> Car Brochure</a>
                                <a
                                        class="b-car-details__link" href="#"><i
                                            class="icon fa fa-share-alt text-primary"></i> Share
                                </a>
                            </div>
                        </div>

                        <div class="slider-car-details slider-pro" id="slider-car-details">
                            <div class="sp-slides">
                                @if($product->images->count()>0)
                                    @foreach($product->images  as $image)
                                        <div class="sp-slide">
                                            <img class="sp-image" src="{{asset($image->getImage())}}" alt="img"/>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                            <div class="sp-thumbnails">
                                @if($product->images->count()>0)
                                    @foreach($product->images  as $image)
                                        <div class="sp-thumbnail">
                                            <img class="img-responsive" src="{{asset($image->getImage())}}" alt="img"/>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>

                        <!-- end .b-thumb-slider-->
                        <div class="b-car-details__section">
                            <h3 class="b-car-details__section-title ui-title-inner">Thông Tin Sản Phẩm</h3>
                            <div class="b-car-details__section-subtitle">{!! sc_html_render($product->content) !!}</div>
                        </div>

                        <div>
                            @if ($product->kind == SC_PRODUCT_GROUP)
                                <div class="products-group list-products">
                                    @php
                                        $groups = $product->groups
                                    @endphp
                                    <h3 class="b-car-details__section-title ui-title-inner">{{ trans('product.groups') }}</h3>
                                    @foreach ($groups as $group)
                                        <div class="single_product_group row">
{{--                                            {{dd($group->product)}}--}}
                                            <a class="col-md-4 col-sm-12 img-pro" href="{{$group->product->getUrl()}}" title="" style="background-image: url('{{$group->product->image}}')">
                                            </a>
                                            <div class="card_bod_full col-md-8 col-sm-12">
                                                <div class="card-body">
                                                    <a href="24_Property_Single.html" title="">
                                                        <h3>{{$group->product->descriptions[0]->name }}</h3>
                                                        <p>Ngày đăng: {{$group->product->created_at}}</p>
                                                    </a>
                                                    <ul>
                                                        <li>Chiều dài: {{$group->product->length}}</li>
                                                        <li>Chiều rộng: {{$group->product->width}}</li>
                                                        <li>Chiều cao: {{$group->product->height}}</li>
                                                    </ul>
                                                </div>
                                                <div class="card-footer">
                                                    <div class="crd-links">
                                                        <a href="{{$group->product->getUrl()}}" class="pull-left day-ago">
                                                            <i class="la la-calendar-check-o"></i> {{$group->product->view}} Lượt xem
                                                        </a>
                                                        <a href="{{$group->product->getUrl()}}" title="" class="btn-default pull-right btn btn-success">Xem chi tiết</a>

                                                    </div><!--crd-links end-->

                                                </div>
                                            </div><!--card_bod_full end-->
                                            <a href="{{$group->product->getUrl()}}" title="" class="ext-link"></a>
                                        </div>
                                    @endforeach
                                </div>
                            @endif
                        </div>

                    </section>
                </div>
                <div class="col-md-4">
                    <aside class="l-sidebar-2">
                        <div class="b-car-info">

                            <div class="b-car-info__price">Thông số sản phẩm</div>
                            <dl class="b-car-info__desc dl-horizontal bg-grey">
                                <dt class="b-car-info__desc-dt">Chiều Dài</dt>
                                <dd class="b-car-info__desc-dd">{{$product->length}} {{$product->length_class}}</dd>
                                <dt class="b-car-info__desc-dt">Chiều Rộng</dt>
                                <dd class="b-car-info__desc-dd">{{$product->width}} {{$product->length_class}}</dd>
                                <dt class="b-car-info__desc-dt">Chiều Cao</dt>
                                <dd class="b-car-info__desc-dd">{{$product->height}} {{$product->length_class}} </dd>
                                <dt class="b-car-info__desc-dt">Kích Thước</dt>
                                <dd class="b-car-info__desc-dd">0</dd>
                                <dt class="b-car-info__desc-dt">Màu Sắc</dt>
                                <dd class="b-car-info__desc-dd">Xám</dd>
                                <dt class="b-car-info__desc-dt">Cân Nặng</dt>
                                <dd class="b-car-info__desc-dd">{{$product->weight}} {{$product->weight_class}}</dd>
                            </dl>

                        </div>
                        <form class="b-calculator" id="buy_block" action="{{ route('cart.add') }}" method="post">
                            @csrf
                            <input type="hidden" name="product_id" id="product-detail-id" value="{{ $product->id }}"/>
                            <div class="b-calculator__header"><span class="icon-cart"><i
                                            class="fa fa-shopping-cart"></i></span>
                                {{--                                    <i class="icon flaticon-calculator text-primary"></i>--}}
                                <div class="b-calculator__header-inner">
                                    <div class="b-calculator__name">{{$product->name}}</div>
                                    {{--                                        <div class="b-calculator__info">Calculate The Car Financing</div>--}}
                                </div>
                            </div>
                            <div class="b-calculator__group">
                                <div class="b-calculator__label">Số lượng</div>
                                <input class="b-calculator__input form-control" type="number" name="qty" value="1"
                                       min="1"/>
                            </div>

                            <button type="submit" class="btn btn-warning form-control"><i
                                        class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</button>
                        </form>

                        <div class="b-bnr-2">
                            <div class="b-bnr-2__icon flaticon-smartphone"></div>
                            <div class="b-bnr-2__inner">
                                <div class="b-bnr-2__title">GỌI NGAY:</div>
                                <div class="b-bnr-2__info">{{sc_store('phone')}}</div>
                            </div>
                        </div>

                </aside>
            </div>
        </div>
        </div>
        <!-- end .b-car-details-->
        <section class="section-default_top">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="ui-title-block">Sản Phẩm Liên Quan</h2>
                        <div class="ui-decor"></div>
                        <div class="related-carousel owl-carousel owl-theme owl-theme_w-btn enable-owl-carousel"
                             data-min768="2" data-min992="3" data-min1200="3" data-margin="30" data-pagination="false"
                             data-navigation="true" data-auto-play="4000" data-stop-on-hover="true">
                            @if($productRelation2->count())
                                @foreach($productRelation2 as $key =>$product)
                                    <div class="b-goods-feat">
                                        <div class="b-goods-feat__img">
                                            <img class="img-responsive" src="{{asset($product->image)}}" alt="foto"/>
                                            {{--                                            <span class="b-goods-feat__label">$45,000<span class="b-goods-feat__label_msrp">MSRP $27,000</span></span>--}}
                                            {{--                                            <span class="b-goods-feat__label">{!! $product->showPrice() !!}</span>--}}
                                        </div>
                                        <ul class="b-goods-feat__desc list-unstyled">
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Chiều Rộng:</span>{{$product->width}} {{$product->length_class}}
                                            </li>
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Chiều Dài:</span> {{$product->height}} {{$product->length_class}}
                                            </li>
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Cân nặng:</span> {{$product->weight}} {{$product->weight_class}}
                                            </li>
                                        </ul>
                                        <h3 class="b-goods-feat__name"><a
                                                    href="{{$product->getUrl()}}">{{$product->name}}</a></h3>
                                        <div class="b-goods-feat__info">{{$product->description}}</div>
                                    </div>
                            @endforeach
                        @endif
                        <!-- end .b-goods-featured-->
                        </div>
                        <!-- end .related-carousel-->
                    </div>
                </div>
            </div>
        </section>
        <!-- end .section-default_top-->
    </main>

@endsection

@section('breadcrumb')
    <div class="bg-grey">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="home.html"><i class="icon fa fa-home"></i></a>
                        </li>
                        <li><a href="/products">Sản Phẩm</a>
                        </li>
                        <li class="active">{{$title}}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('styles')
    {{-- style css --}}

    <style>
        .single_product_group{
            padding: 15px 0;
        }
        .single_product_group ul{
            float: left;
            width: 100%;
            padding-bottom: 20px;
            border-bottom: 1px solid #ddd;
            list-style-type: none;
            margin-top: 20px;
            padding-left: 0px
        }
        .single_product_group ul li{
            float: left;
            padding: 0px 15px;
            border-right: 1px solid;
        }
        .single_product_group .card_bod_full{
            border: 1px solid rgba(0,0,0,.125);
            height: 260px;
        }
        .single_product_group .img-pro{
            padding: 0;
            height: 260px;
            background-size: cover;
        }
        .single_product_group .card-body{
            margin-top: 30px;
        }
        .single_product_group .card-footer .crd-links{
            margin-top: 95px;
        }
        .single_product_group .card-footer .crd-links .day-ago{
            margin-top: 15px;
        }
    </style>
@endpush

@push('scripts')
    <script type="text/javascript">
        $('.sc-product-group').click(function (event) {
            if ($(this).hasClass('active')) {
                return;
            }
            $('.sc-product-group').removeClass('active');
            $(this).addClass('active');
            var id = $(this).data("id");
            $.ajax({
                url: '{{ route("product.info") }}',
                type: 'POST',
                dataType: 'json',
                data: {id: id, "_token": "{{ csrf_token() }}"},
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    //console.log(data);
                    var showImages = '<div class="carousel-inner">' +
                        '<div class="view-product item active"  data-slide-number="0">' +
                        '<img src="' + data.image + '" alt="">' +
                        '</div>';
                    if (data.subImages.length) {
                        $.each(data.subImages, function (index, value) {
                            showImages += '<div class="view-product item"  data-slide-number="' + (index + 1) + '">' +
                                '<img src="' + value + '" alt="">' +
                                '</div>'
                        });
                    }
                    showImages += '</div>';
                    if (data.subImages.length) {
                        showImages += '<a class="left item-control" href="#similar-product" data-slide="prev">' +
                            '<i class="fa fa-angle-left"></i></a>' +
                            '<a class="right item-control" href="#similar-product" data-slide="next">' +
                            '<i class="fa fa-angle-right"></i>' +
                            '</a>';
                    }
                    $('#product-detail-cart-group').show();
                    $('#product-detail-name').html(data.name);
                    $('#product-detail-model').html(data.sku);
                    $('#product-detail-price').html(data.showPrice);
                    $('#product-detail-brand').html(data.brand_name);
                    $('#product-detail-image').html(showImages);
                    $('#product-detail-available').html(data.availability);
                    $('#product-detail-id').val(data.id);
                    $('#product-detail-image').carousel();
                    $('#loading').hide();
                    window.history.pushState("", "", data.url);
                }
            });

        });
    </script>
@endpush
