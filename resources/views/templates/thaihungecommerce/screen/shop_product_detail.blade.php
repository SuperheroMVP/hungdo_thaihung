@php
    /*
    $layout_page = product_detail
    $product: no paginate
    $productRelation: no paginate
    */
@endphp

@extends($templatePath.'.layout')

@section('center')
    <div class="single-thumb-vertical type-1 main-container shop-page no-sidebar w-100">
        <div class="container">
            <div class="row">
                <div class="main-content col-sm-12">
                    <div class="product type-product">
                        <div>
                            <div class="contain-left has-gallery">
                                <div class="single-left">
                                    <div class="woocommerce-product-gallery">
                                        <ol class="flex-control-nav flex-control-thumbs">
                                            <li><img src="{{ asset($product->getImage()) }}" alt=""></li>
                                            @if ($product->images->count())
                                                @foreach ($product->images as $key=>$image)
                                                    <li><img src="{{ asset($image->getImage()) }}" alt=""></li>
                                                @endforeach
                                            @endif
                                        </ol>
                                        <div class="flex-viewport">
                                            <div class=""><img width="1000" height="1000"
                                                               src="{{ asset($product->getImage()) }}"
                                                               class="wp-post-image lazy"></div>
                                            @if ($product->images->count())
                                                @foreach ($product->images as $key=>$image)
                                                    <div class=""><img width="1000" height="1000"
                                                                       src="{{ asset($image->getImage()) }}"
                                                                       class="wp-post-image lazy"></div>
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="summary entry-summary">
                                    <form id="buy_block" action="{{ route('cart.add') }}" method="post">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="product_id" id="product-detail-id"
                                               value="{{ $product->id }}"/>

                                        <h1 class="product_title entry-title">{{ $product->name }}</h1>

                                        <div class="woocommerce-product-rating">
                                            <div class="rating-wapper ">
                                                <div class="star-rating"><span style="width:100%"> <strong
                                                                class="rating">5.00</strong>
                                                    <span class="rating">1</span></span>
                                                </div>
                                                {{--                                            <span class="review">( 5 sao )</span>--}}
                                            </div>
                                            <a href="" class="woocommerce-review-link" rel="nofollow">(<span
                                                        class="count">1</span>
                                                customer review)</a>
                                        </div>

                                        <p class="stock in-stock available-product">
                                            <span>Sản phẩm còn hàng</span>
                                        </p>
                                        <div class="woocommerce-product-details__short-description">
                                            <ul>
                                                <li>Miễn phí vận chuyển</li>
                                                <li>Giảm giá 5% cho đơn hàng trên 100.000.000đ</li>
                                            </ul>
                                        </div>
                                        <div id="product-detail-price">
                                            {!! $product->showPriceDetail() !!}
                                        </div>
                                        <div class="cart">
                                            <div class="variations" cellspacing="0">
                                                @if ($product->attributes())
                                                    {!! $product->renderAttributeDetails() !!}
                                                @endif
                                            </div>
                                            <div class="quantity">
                                                <span class="qty-label">Quantiy:</span>
                                                <div class="control">
                                                    <a class="btn-number qtyminus quantity-minus"
                                                       href="">-</a>
                                                    <input type="number" data-step="1" id="quantity_5e9fa3c53e7db"
                                                           min="1"
                                                           name="qty" value="1" title="Qty"
                                                           class="input-qty input-text qty text" size="4"
                                                           pattern="[0-9]*"
                                                           inputmode="numeric">
                                                    <a class="btn-number qtyplus quantity-plus"
                                                       href="">+</a>
                                                </div>
                                            </div>

                                            <button type="submit" name="add-to-cart" value="248"
                                                    class="single_add_to_cart_button button alt">Đặt hàng
                                            </button>
                                        </div>

                                        <!-- COUNT TEXT -->

                                        <div class="product_meta">
                                            {{--                                        <span class="sku_wrapper">Mã sản phẩm: <span--}}
                                            {{--                                                    class="sku">{{ $product->id }}</span></span>--}}
                                            @if (sc_config('product_brand') && !empty($product->brand->name))
                                                <span class="singgle-provider">Thương hiệu: <a
                                                            href="{{ route('brand.detail', [$product->brand->alias]) }}"
                                                            class="sku">{{ empty($product->brand->name) ? 'None' : $product->brand->name }}</a></span>
                                            @endif
                                            {{--                                        <span class="posted_in">Danh mục sản phẩm: <a--}}
                                            {{--                                                    href="{{ asset('shop?category='.$product->Category->id) }}"--}}
                                            {{--                                                    rel="tag">{{ $product->Category->name }}</a></span>--}}
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="woocommerce-tabs wc-tabs-wrapper azirspares-tabs default ">
                            <ul class="tabs wc-tabs tab-link">
                                <li class="description_tab active" id="tab-title-description">
                                    <a href="#tab-description" role="tab">Mô tả</a>
                                </li>
                                <li class="additional_information_tab" id="tab-title-additional_information">
                                    <a href="#tab-additional_information" role="tab">Thông số kỹ thuật</a>
                                </li>
                                <li class="reviews_tab" id="tab-title-reviews">
                                    <a href="#tab-reviews" role="tab">Đánh giá (12)</a>
                                </li>
                                <li class="seller_tab" id="tab-title-seller">
                                    <a href="#tab-seller" role="tab">Thông tin đại lý</a>
                                </li>
                            </ul>

                            <div class="tab-container">
                                <div class="woocommerce-Tabs-panel tab-panel active" id="tab-description"
                                     role="tabpanel">
                                    {!! sc_html_render($product->content) !!}
                                </div>
                                <div class="woocommerce-Tabs-panel tab-panel" id="tab-additional_information"
                                     role="tabpanel">

                                    {!! sc_html_render($product->content) !!}
                                </div>
                                <div class="woocommerce-Tabs-panel tab-panel" id="tab-reviews" role="tabpanel">
                                    <div id="reviews" class="woocommerce-Reviews">
                                        <div id="comments">
                                            <h2 class="woocommerce-Reviews-title">
                                                5 sao for <span>Rotiform SFO – Custom Forged</span></h2>

                                            <ol class="commentlist">
                                                <li class="review byuser comment-author-admin bypostauthor even thread-even depth-1"
                                                    id="li-comment-28">

                                                    <div id="comment-28" class="comment_container">

                                                        <img src="https://www.kindpng.com/picc/m/78-785827_user-profile-avatar-login-account-male-user-icon.png"
                                                             width="60" height="60" alt="Avatar"
                                                             class="avatar avatar-60wp-user-avatar wp-user-avatar-60 alignnone photo avatar-default">
                                                        <div class="comment-text">

                                                            <div class="rating-wapper ">
                                                                <div class="star-rating"><span style="width:100%">Rated <strong
                                                                                class="rating">5</strong> out of 5</span>
                                                                </div>
                                                                <span class="review">( 5 sao )</span></div>
                                                            <p class="meta">
                                                                <strong class="woocommerce-e">Hoàng Công
                                                                    Vinh </strong>
                                                                <span class="woocommerce-review__dash">–</span>
                                                                <time class="woocommerce-review__published-date">12,
                                                                    Tháng 3, 2018
                                                                </time>
                                                            </p>

                                                            <div class="description">
                                                                <p>Sản phẩm tốt</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="review byuser comment-author-admin bypostauthor even thread-even depth-1"
                                                    id="li-comment-28">

                                                    <div id="comment-28" class="comment_container">

                                                        <img src="https://www.kindpng.com/picc/m/78-785827_user-profile-avatar-login-account-male-user-icon.png"
                                                             width="60" height="60" alt="Avatar"
                                                             class="avatar avatar-60wp-user-avatar wp-user-avatar-60 alignnone photo avatar-default">
                                                        <div class="comment-text">

                                                            <div class="rating-wapper ">
                                                                <div class="star-rating"><span style="width:100%">Rated <strong
                                                                                class="rating">5</strong> out of 5</span>
                                                                </div>
                                                                <span class="review">( 5 sao )</span></div>
                                                            <p class="meta">
                                                                <strong class="woocommerce-e">Hoàng Vĩnh Hưng </strong>
                                                                <span class="woocommerce-review__dash">–</span>
                                                                <time class="woocommerce-review__published-date">12,
                                                                    Tháng 3, 2018
                                                                </time>
                                                            </p>

                                                            <div class="description">
                                                                <p>Sản phẩm rất phù hợp với công trình của tôi.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="review byuser comment-author-admin bypostauthor even thread-even depth-1"
                                                    id="li-comment-28">

                                                    <div id="comment-28" class="comment_container">

                                                        <img src="https://www.kindpng.com/picc/m/78-785827_user-profile-avatar-login-account-male-user-icon.png"
                                                             width="60" height="60" alt="Avatar"
                                                             class="avatar avatar-60wp-user-avatar wp-user-avatar-60 alignnone photo avatar-default">
                                                        <div class="comment-text">

                                                            <div class="rating-wapper ">
                                                                <div class="star-rating"><span style="width:100%">Rated <strong
                                                                                class="rating">5</strong> out of 5</span>
                                                                </div>
                                                                <span class="review">( 5 sao )</span></div>
                                                            <p class="meta">
                                                                <strong class="woocommerce-e">Nguyễn Hữu Khanh </strong>
                                                                <span class="woocommerce-review__dash">–</span>
                                                                <time class="woocommerce-review__published-date">02,
                                                                    Tháng 4, 2018
                                                                </time>
                                                            </p>

                                                            <div class="description">
                                                                <p>Sản phẩm này tốt ngoài sức mong đợi của tôi.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>

                                                <!-- #comment-## -->
                                            </ol>

                                        </div>

                                        <div id="review_form_wrapper">
                                            <div id="review_form">
                                                <div id="respond" class="comment-respond">
                                                    <span id="reply-title"
                                                          class="comment-reply-title">Thêm đánh giá <small><a
                                                                    rel="nofollow" id="cancel-comment-reply-link"
                                                                    href="https://azirspares.famithemes.com/product/rotiform-sfo-custom-forged/#respond"
                                                                    style="display:none;">Cancel reply</a></small></span>
                                                    <form action="https://azirspares.famithemes.com/wp-comments-post.php"
                                                          method="post" id="commentform" class="comment-form"
                                                          novalidate="">
                                                        <div class="comment-form-rating">
                                                            <label for="rating"></label>
                                                            <p class="stars">
                                                                <span>
                                                                    <a class="star-1" href="#">1</a>
                                                                    <a class="star-2" href="#">2</a>
                                                                    <a class="star-3" href="#">3</a>
                                                                    <a class="star-4" href="#">4</a>
                                                                    <a class="star-5" href="#">5</a>
                                                                </span>
                                                            </p>
                                                            <select name="rating" id="rating" required=""
                                                                    style="display: none;">
                                                                <option value="0">Rate…</option>
                                                                <option value="5">Perfect</option>
                                                                <option value="4">Good</option>
                                                                <option value="3">Average</option>
                                                                <option value="2">Not that bad</option>
                                                                <option value="1">Very poor</option>
                                                            </select>
                                                        </div>
                                                        <p class="comment-form-comment">
                                                            <label for="comment">Đánh giá của bạn&nbsp;<span
                                                                        class="required">*</span></label>
                                                            <textarea id="comment" name="comment" cols="45" rows="8"
                                                                      required=""></textarea>
                                                        </p>
                                                        <input name="wpml_language_code" type="hidden" value="en">
                                                        <p class="form-submit">
                                                            <input name="submit" type="submit" id="submit"
                                                                   class="submit" value="Gửi đi">
                                                            <input type="hidden" name="comment_post_ID" value="248"
                                                                   id="comment_post_ID">
                                                            <input type="hidden" name="comment_parent"
                                                                   id="comment_parent" value="0">
                                                        </p>
                                                        <input type="hidden" id="_wp_unfiltered_html_comment_disabled"
                                                               name="_wp_unfiltered_html_comment" value="ea5ef227fe">
                                                    </form>
                                                </div>
                                                <!-- #respond -->
                                            </div>
                                        </div>

                                        <div class="clear"></div>
                                    </div>
                                </div>
                                <div class="woocommerce-Tabs-panel tab-panel  " id="tab-seller" role="tabpanel">

                                    <h2>Thông tin đại lý</h2>

                                    <ul class="list-unstyled">

                                        <li class="seller-name">
                                        <span>
            Đạ lý:        </span>

                                            <span class="details">
            <a href="">Công ty cổ phần thương mại Thái Hưng</a>        </span>
                                        </li>
                                        <li class="store-address">
                                            <span><b>Địa chỉ:</b></span>
                                            <span class="details">Tổ 8, P. Gia Sàng, TP. Thái Nguyên, Tỉnh Thái Nguyên
                            </span>
                                        </li>

                                        <li class="clearfix">
                                        <span class="seller-rating">
                        <span title=" Rated 5.00 out of 5" class="star-rating">
                            <span class="width" style="width: 100%"></span>
                                        <span><strong>5.00</strong></span>
                                        </span>
                                        </span>
                                            <span class="text">34 sản phẩm - 134 lượt đánh giá</span></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        @if ($productRelation->count())
                            <div class="style-05 col-sm-12 col-xs-12 single-product-bottom azirspares_woo_related-product">
                                <div class="block-title">$item
                                    <h2 class="product-grid-title">
                                        <span>Sản phẩm liên quan</span>
                                    </h2>
                                </div>
                                <div class="owl-carousel thaihung-blog" data-autoplay="false" data-nav="false"
                                     data-dots="false"
                                     data-loop="false"
                                     data-margin="20"
                                     data-responsive='{"0":{"items":1},"480":{"items":2},"768":{"items":2},"992":{"items":3},"1200":{"items":4}}'>
                                    @foreach ($productRelation as $key => $product_rel)
                                        <div class="product-item style-05">
                                            <div class="product-inner">
                                                <div class="product-top equal-elem">
                                                    {{--                                                <div class="cat-list">--}}
                                                    {{--                                                    <a href="#" tabindex="0">{{ $item->Category->name }}</a>--}}
                                                    {{--                                                </div>--}}
                                                    <h3 class="product-name product_title">
                                                        <a href="{{ $product_rel->getUrl() }}">{{ $product_rel->descriptions_relation->name }}</a>
                                                    </h3>
                                                </div>
                                                <div class="product-thumb">
                                                    <a class="thumb-link woocommerce-product-gallery__image"
                                                       href="{{ $product_rel->getUrl() }}"
                                                       tabindex="0">
                                                        <img class="img-responsive lazy wp-post-image"
                                                             src="{{ asset($product_rel->getThumb()) }}"
                                                             data-src="{{ asset($product_rel->getThumb()) }}"
                                                             width="320" height="320"
                                                             alt="{{ $product_rel->descriptions_relation->name }}">
                                                    </a>
                                                </div>
                                                <div class="product-info">
                                                    {{--<span class="price">
                                                        {{ number_format($product->price, 0, '', ' ') }} đ
                                                    </span>--}}
                                                    <div class="rating-wapper ">
                                                        <div class="star-rating"><span style="width:100%">Rated <strong
                                                                        class="rating">5.00</strong> out of 5</span>
                                                        </div>
                                                        {{--                                            <span class="review">( 5 sao )</span>--}}
                                                    </div>
                                                    @if ($product_rel->allowSale())
                                                        <div class="add-to-cart">
                                                            <div class="add-to-cart-wrap azirspares-add-to-cart-wrap"
                                                                 style="cursor: pointer">
                                                                <a onClick="addToCartAjax('{{ $product_rel->id }}','default')"
                                                                   class="button product_type_simple"></a>
                                                            </div>
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs pull-left">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
            <li><a href="{{ route('product.all') }}">Sản phẩm</a></li>
            <li class="active">{{ $title }}</li>
        </ol>
    </div>
@endsection

@push('styles')
    {{-- style css --}}
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
