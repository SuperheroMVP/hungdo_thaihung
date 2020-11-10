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
<div class="w-100">
    <div class="container">
        <div class="row">
    @include($templatePath.'.left')
    @if (count($products) ==0)
        {{ trans('front.empty_product') }}
    @else
        <div class="main-content col-lg-9 col-md-8 col-sm-8 col-xs-12 has-sidebar">
            <div class="row">
                @foreach ($products as $key => $product)
                    <div class="col-sm-6 col-6 col-md-4">
                        <div class="product-item  wow fadeInUp product-item col-ts-12 style-05 pb-5">
                            <div class="product-inner">
                                <div class="product-top equal-elem product-{{ $product->id }}">
                                    {{--                                <div class="cat-list">--}}
                                    {{--                                    <a href="#" rel="tag">{{ $product->name }}</a>--}}
                                    {{--                                </div>--}}
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

                                        {{--                                                                            <span class="price">--}}
                                        {{--                                                                                {{ number_format($product->price, 0, '', ' ') }} đ--}}
                                        {{--                                                                            </span>--}}
                                        <div class="rating-wapper ">
                                            <div class="star-rating"><span style="width:100%">Rated <strong
                                                            class="rating">5.00</strong> out of 5</span></div>
                                            {{--                                                    <span class="review">( 1 review )</span></div>--}}
                                            <div class="add-to-cart">
                                                <input type="hidden" class="xcp-hidden-id" value="1529">
                                                <div class="add-to-cart-wrap azirspares-add-to-cart-wrap"
                                                     data-toggle="tooltip" data-placement="top"
                                                     data-original-title=""
                                                     title=""><a data-quantity="1"
                                                                 class="button product_type_simple add_to_cart_button ajax_add_to_cart"
                                                                 data-product_id="1529" data-product_sku="460B137"
                                                                 aria-label=""
                                                                 rel="nofollow"
                                                                 onClick="addToCartAjax('{{ $product->id }}','default')"
                                                                 style="cursor: pointer;">Add to cart</a></div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
{{--        <div class="row auto-clear azirspares-products">--}}
{{--            <ul class="products">--}}
{{--                @foreach ($products as  $key => $product)--}}
{{--                    <li class="product-item  wow fadeInUp product-item rows-space-100 col-bg-4 col-lg-4 col-md-6 col-sm-6 col-xs-6  ">--}}
{{--                        <div class="product-inner">--}}
{{--                            <div class="product-top equal-elem product-{{ $product->id }}">--}}
{{--                                <div class="cat-list">--}}
{{--                                    <a href="#" rel="tag">{{ $product->name }}</a>--}}
{{--                                </div>--}}
{{--                                <h3 class="product-name product_title">--}}
{{--                                    <a href="{{ $product->getUrl() }}">{{ $product->name }}</a>--}}
{{--                                </h3>--}}
{{--                            </div>--}}
{{--                            <div class="product-thumb">--}}
{{--                                <a class="thumb-link" href="{{ $product->getUrl() }}">--}}
{{--                                    <img class="img-responsive lazy"--}}
{{--                                         src="{{ asset($product->getThumb()) }}">--}}
{{--                                </a>--}}
{{--                                <div class="product-info">--}}

{{--                                                                            <span class="price">--}}
{{--                                                                                {{ number_format($product->price, 0, '', ' ') }} đ--}}
{{--                                                                            </span>--}}
{{--                                    <div class="rating-wapper ">--}}
{{--                                        <div class="star-rating"><span style="width:100%">Rated <strong--}}
{{--                                                        class="rating">5.00</strong> out of 5</span></div>--}}
{{--                                        --}}{{--                                                    <span class="review">( 1 review )</span></div>--}}
{{--                                        <div class="add-to-cart">--}}
{{--                                            <input type="hidden" class="xcp-hidden-id" value="1529">--}}
{{--                                            <div class="add-to-cart-wrap azirspares-add-to-cart-wrap"--}}
{{--                                                 data-toggle="tooltip" data-placement="top"--}}
{{--                                                 data-original-title=""--}}
{{--                                                 title=""><a data-quantity="1"--}}
{{--                                                        class="button product_type_simple add_to_cart_button ajax_add_to_cart"--}}
{{--                                                        data-product_id="1529" data-product_sku="460B137"--}}
{{--                                                        aria-label=""--}}
{{--                                                        rel="nofollow"--}}
{{--                                                        onClick="addToCartAjax('{{ $product->id }}','default')"--}}
{{--                                                        style="cursor: pointer;">Add to cart</a></div>--}}

{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </li>--}}
{{--                @endforeach--}}
{{--            </ul>--}}
{{--        </div>--}}
        {{ $products->appends(request()->except(['page','_token']))->links($templatePath.'.block.paginate')}}
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
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@section('filter')
  <form action="" method="GET" id="filter_sort">
        <div class="breadcrumbs pull-right">
        <div>
            @php
              $queries = request()->except(['filter_sort','page']);
            @endphp
            @foreach ($queries as $key => $query)
              <input type="hidden" name="{{ $key }}" value="{{ $query }}">
            @endforeach
          <select class="custom-select" name="filter_sort">
            <option value="">{{ trans('front.filters.sort') }}</option>
            <option value="price_asc" {{ ($filter_sort =='price_asc')?'selected':'' }}>{{ trans('front.filters.price_asc') }}</option>
            <option value="price_desc" {{ ($filter_sort =='price_desc')?'selected':'' }}>{{ trans('front.filters.price_desc') }}</option>
            <option value="sort_asc" {{ ($filter_sort =='sort_asc')?'selected':'' }}>{{ trans('front.filters.sort_asc') }}</option>
            <option value="sort_desc" {{ ($filter_sort =='sort_desc')?'selected':'' }}>{{ trans('front.filters.sort_desc') }}</option>
            <option value="id_asc" {{ ($filter_sort =='id_asc')?'selected':'' }}>{{ trans('front.filters.id_asc') }}</option>
            <option value="id_desc" {{ ($filter_sort =='id_desc')?'selected':'' }}>{{ trans('front.filters.id_desc') }}</option>
          </select>
        </div>
      </div>
  </form>

@endsection

@push('styles')
      {{-- style css --}}
@endpush

@push('scripts')
  <script type="text/javascript">
    $('[name="filter_sort"]').change(function(event) {
      $('#filter_sort').submit();
    });
  </script>
@endpush
