@php
    /*
    $layout_page = product_list
    $itemsList: paginate
    Use paginate: $itemsList->appends(request()->except(['page','_token']))->links()
    $products: paginate
    Use paginate: $products->appends(request()->except(['page','_token']))->links()
    */
@endphp

@extends($templatePath.'.layout')

@section('center')
    <div class="container">
        <div class="row">
            <div class="main-content col-sm-12">
                <header class="woocommerce-products-header">
                    <h1 class="woocommerce-products-header__title page-title">{{ $provider->name }}</h1>

                    <p class="woocommerce-result-count">
                        Hiển thị {{ $products->count() }} sản phẩm</p>
                    <div class="vendor_description_background wcmp_vendor_banner_template template1">
                        <div class="wcmp_vendor_banner"
                             style="background-image: url('{{ asset($provider->cover) }}');background-repeat: no-repeat;background-size: cover;background-position: center;">
                            <div class="vendor_description">
                                <div class="vendor_img_add">
                                    <div class="img_div"><img height="400" width="200" src="{{ $provider->avatar }}">
                                    </div>
                                    <div class="vendor_address">
                                        <p class="wcmp_vendor_name">{{ $provider->name }}</p>
                                        <p class="wcmp_vendor_detail"><i class="wcmp-font ico-location-icon"></i>
                                            <label>{{ $provider->address.', '.$provider->ward.', '.$provider->district.', '.$provider->province }}</label>
                                        </p>
                                        <p>
                                            <a href="tel:{{ $provider->phone }}" class="wcmp_vendor_detail">
                                                <i class="wcmp-font ico-call-icon"></i>
                                                <label>{{ $provider->phone }}</label>
                                            </a>
                                        </p>
                                        <p><a href="mailto:{{ $provider->email }}" class="wcmp_vendor_detail">
                                                <i class="wcmp-font ico-mail-icon"></i>{{ $provider->email }}</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                @if (count($products) ==0)
                    {{ trans('front.empty_product') }}
                    <br>
                @else
                    <div class="row auto-clear equal-container better-height azirspares-products">
                        <ul class="products columns-4">
                            @foreach($products as $key => $product)
                                <li class="product-item  wow product-item rows-space-40 col-bg-3 col-lg-3 col-md-4 col-sm-6 col-xs-6 col-ts-12 style-05"
                                    data-aos="fade-up-left" data-aos-offset="{{ ($key+1) * 100 }}">
                                    <div class="product-inner">
                                        <div class="product-top equal-elem">
                                            {{--                                            <div class="cat-list"><a href="{{ asset("san-pham?category=".$providerProduct->Category->id) }}" rel="tag">{{ $providerProduct->Category->name }}</a></div>--}}
                                            <h3 class="product-name product_title">
                                                <a href="{{ $product->getUrl() }}">{{ $product->name }}</a>
                                            </h3>
                                        </div>
                                        <div class="product-thumb">
                                            <a class="thumb-link" href="{{ $product->getUrl() }}">
                                                <img class="img-responsive lazy"
                                                     src="{{ asset($product->getThumb()) }}">
                                            </a>
                                            <div class="product-info">
                                                <div class="rating-wapper ">
                                                    <div class="star-rating"><span style="width:100%">Rated <strong
                                                                    class="rating">5.00</strong> out of 5</span></div>
                                                    <span class="review">( 1 review )</span></div>
                                                <div class="add-to-cart">
                                                    <input type="hidden" class="xcp-hidden-id" value="1529">
                                                    <div class="add-to-cart-wrap azirspares-add-to-cart-wrap"
                                                         data-toggle="tooltip" data-placement="top"
                                                         data-original-title="" title=""><a
                                                                href="{{ $product->getUrl() }}" data-quantity="1"
                                                                class="button product_type_simple add_to_cart_button ajax_add_to_cart"
                                                                data-product_id="1529" data-product_sku="460B137"
                                                                aria-label="Add “{{ $product->name }}” to your cart"
                                                                rel="nofollow">Thêm giỏ hàng</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                        {{ $products->links($templatePath.'.block.paginate') }}
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection


@section('breadcrumb')
    <div class="breadcrumbs pull-left">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
            <li><a href="{{ route('agency.list') }}">Đại lý, nhà bán lẻ</a></li>
            <li class="active">{{ $title }}</li>
        </ol>
    </div>
@endsection

@push('styles')
    {{-- style css --}}
@endpush

@push('scripts')

@endpush
