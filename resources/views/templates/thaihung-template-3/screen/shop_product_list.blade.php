@php
    /*
    $layout_page = product_list
    $itemsList: paginate
    Use paginate: $itemsList->appends(request()->except(['page','_token']))->links()
    $products: paginate
    Use paginate: $products->appends(request()->except(['page','_token']))->links()
    */
    $categories = $modelCategory->start()->getList(['sc_status' => 1]);
    $categoriesTop = $modelCategory->start()->getCategoryTop()->getData();

@endphp

@extends($templatePath.'.layout')

@section('center')
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-md-push-3">
                <main class="l-main-content">
                    <div class="filter-goods row">
                        <div class="col-md-6">
                            {{--                           <div class="filter-goods__info">Showing results from<strong> 1 - 10</strong> of total<strong> 35</strong>--}}
                            {{--                           </div>--}}
                            <div class="filter-goods__info">Hiển Thị:<strong> {{count($products)}} Sản Phẩm</div>
                        </div>
                            <div class="col-md-4">
                                <form action="" method="GET" id="filter_sort">
                                    <div class="filter-goods__select">
                                        @php
                                            $queries = request()->except(['filter_sort','page']);
                                        @endphp
                                        @foreach ($queries as $key => $query)
                                            <input type="hidden" name="{{ $key }}" value="{{ $query }}">
                                        @endforeach
                                        <select class="selectpicker" name="filter_sort" data-width="190">
                                            <option value="">{{ trans('front.filters.sort') }}</option>
                                            <option value="price_asc" {{ ($filter_sort =='price_asc')?'selected':'' }}>{{ trans('front.filters.price_asc') }}</option>
                                            <option value="price_desc" {{ ($filter_sort =='price_desc')?'selected':'' }}>{{ trans('front.filters.price_desc') }}</option>
                                            <option value="sort_asc" {{ ($filter_sort =='sort_asc')?'selected':'' }}>{{ trans('front.filters.sort_asc') }}</option>
                                            <option value="sort_desc" {{ ($filter_sort =='sort_desc')?'selected':'' }}>{{ trans('front.filters.sort_desc') }}</option>
                                            <option value="id_asc" {{ ($filter_sort =='id_asc')?'selected':'' }}>{{ trans('front.filters.id_asc') }}</option>
                                            <option value="id_desc" {{ ($filter_sort =='id_desc')?'selected':'' }}>{{ trans('front.filters.id_desc') }}</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-2">
                                <div class="btns-switch pull-right"><i
                                            class="btns-switch__item js-view-th active icon fa fa-th-large"></i><i
                                            class="btns-switch__item js-view-list icon fa fa-th-list"></i>
                                </div>
                            </div>
                    </div>
                    <!-- end .filter-goods-->
                    <div class="goods-group-2 list-goods list-goods_th">
                        <!-- end .b-goods-1-->
                        @if (count($products) ==0)
                            {{ trans('front.empty_product') }}
                        @else
                            {{--                            {{dd($products)}}--}}
                            @foreach ($products as  $key => $product)

                                <section class="b-goods-1 b-goods-1_mod-a">
                                    <div class="row">
                                        <div class="b-goods-1__img">
                                            <a class="js-zoom-images" href="{{$product->getThumb()}}">
                                                <img class="img-responsive" src="{{ asset($product->getThumb()) }}"
                                                     alt="{{$product->name}}"/>
                                            </a>
                                            {{--                                <span class="b-goods-1__price hidden-th">$45,000<span class="b-goods-1__price-msrp">MSRP $27,000</span></span>--}}
                                            {{--                                        <span class="b-goods-1__price hidden-th">{!! $product->showPrice() !!}</span>--}}
                                        </div>
                                        <div class="b-goods-1__inner">
                                            <div class="b-goods-1__header"><a class="b-goods-1__choose hidden-th"
                                                                              href="listing-1.html"><i
                                                            class="icon fa fa-heart-o"></i></a>
                                                <h2 class="b-goods-1__name"><a
                                                            href="{{$product->getUrl()}}">{{$product->name}}</a></h2>
                                            </div>
                                            <div class="b-goods-1__info">{{$product->description}}<span
                                                        class="b-goods-1__info-more collapse"
                                                        id="info-2">{{$product->description}}</span>
                                                <span class="b-goods-1__info-link" data-toggle="collapse"
                                                      data-target="#info-2"></span>
                                            </div>
                                            {{--                                        <span class="b-goods-1__price_th text-primary visible-th">{!! $product->showPrice() !!}--}}
                                            <span class="b-goods-1__price_th text-primary visible-th">

                                            {{-- <span class="b-goods-1__price-msrp">MSRP $27,000</span>--}}
                                            <a class="b-goods-1__choose add-to-cart"
                                               onClick="addToCartAjax('{{ $product->id }}','wishlist')">
                                                <i class="icon fa fa-heart-o"></i>
                                            </a>
                                        </span>
                                            <div class="b-goods-1__section">
                                                <h3 class="b-goods-1__title" data-toggle="collapse"
                                                    data-target="#desc-2">Kích Thước</h3>
                                                <div class="collapse in" id="desc-2">
                                                    <ul class="b-goods-1__desc list-unstyled">
                                                        <li class="b-goods-1__desc-item"><span class="hidden-th">Chiều Rộng:</span>{{$product->width}} {{$product->length_class}}
                                                        </li>
                                                        <li class="b-goods-1__desc-item"><span class="hidden-th">Chiều Dài:</span> {{$product->height}} {{$product->length_class}}
                                                        </li>
                                                        <li class="b-goods-1__desc-item"><span class="hidden-th">Cân nặng:</span> {{$product->weight}}{{$product->weight_class}}
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="b-goods-1__section hidden-th">
                                                <h3 class="b-goods-1__title" data-toggle="collapse"
                                                    data-target="#list-2" aria-expanded="false">Mô Tả</h3>
                                                <div class="collapse" id="list-2">
                                                    <ul class="b-goods-1__list list list-mark-5">
                                                        <li class="b-goods-1__list-item">Engine DOHC 24-valve V-6</li>
                                                        <li class="b-goods-1__list-item">Audio Controls on Steering
                                                            Wheel
                                                        </li>
                                                        <li class="b-goods-1__list-item">Power Windows</li>
                                                        <li class="b-goods-1__list-item">Daytime Running Lights</li>
                                                        <li class="b-goods-1__list-item">Cruise Control, ABS</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            @endforeach
                        <!-- end .b-goods-1-->
                        @endif
                        <div style="clear: both; ">
                            <ul class="pagination">
                                {{ $products->appends(request()->except(['page','_token']))->links() }}
                            </ul>
                        </div>

                        <!-- end .b-goods-1-->
                    </div>
                    <!-- end .goods-group-2-->
                </main>
                <!-- end .l-main-content-->
            </div>
            <div class="col-md-3 col-md-pull-9">
                <aside class="l-sidebar">
                    <form class="b-filter-2 bg-grey">
                        <h3 class="b-filter-2__title">{{trans('front.categories')}}</h3>
                        <nav id="sidebar">
                            <ul class="list-unstyled components">
                                @if($categoriesTop->count())
                                    @foreach($categoriesTop as $category)
                                        @if(!empty($categories[$category->id]))
                                            <li><a href="{{$category->getUrl()}}" data-toggle="" aria-expanded=""
                                                   class="dropdown-toggle2">{{$category->title}}</a>
                                                <ul class=" list-unstyled" id="homeSubmenu">
                                                    @foreach($categories[$category->id] as $cateChild)
                                                        <li><a href="{{$cateChild->getUrl()}}">{{$cateChild->title}}</a>
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </li>
                                        @else
                                            <li><a href="{{$category->getUrl()}}" data-toggle="collapse"
                                                   aria-expanded="false"
                                                   class="dropdown-toggle2">{{$category->title}}</a>
                                        @endif
                                    @endforeach
                                @endif
                            </ul>

                        </nav>
                        {{--                        <div class="b-filter-2__inner">--}}
                        {{--                            <div class="b-filter-2__group">--}}
                        {{--                                <div class="b-filter-2__group-title">Từ khoa</div>--}}
                        {{--                                <input class="form-control" type="text" placeholder="Từ khóa..." />--}}
                        {{--                            </div>--}}
                        {{--                            <div class="b-filter-2__group">--}}
                        {{--                                <div class="b-filter-2__group-title">Vehicle Type</div>--}}
                        {{--                                <select class="selectpicker" data-width="100%">--}}
                        {{--                                    <option>All Types</option>--}}
                        {{--                                    <option>Type 1</option>--}}
                        {{--                                    <option>Type 2</option>--}}
                        {{--                                    <option>Type 3</option>--}}
                        {{--                                </select>--}}
                        {{--                            </div>--}}

                        {{--                            <div class="b-filter-2__group">--}}
                        {{--                                <div class="b-filter-2__group-title">Make</div>--}}
                        {{--                                <select class="selectpicker" data-width="100%">--}}
                        {{--                                    <option>All Makes</option>--}}
                        {{--                                    <option>Make 1</option>--}}
                        {{--                                    <option>Make 2</option>--}}
                        {{--                                </select>--}}
                        {{--                            </div>--}}
                        {{--                            <div class="b-filter-2__group">--}}
                        {{--                                <div class="b-filter-2__group-title">Model</div>--}}
                        {{--                                <select class="selectpicker" data-width="100%">--}}
                        {{--                                    <option>All Models</option>--}}
                        {{--                                    <option>Model 1</option>--}}
                        {{--                                    <option>Model 2</option>--}}
                        {{--                                    <option>Model 3</option>--}}
                        {{--                                </select>--}}
                        {{--                            </div>--}}
                        {{--                            <div class="b-filter-2__group">--}}
                        {{--                                <div class="b-filter-2__group-title">Model Year</div>--}}
                        {{--                                <select class="selectpicker" data-width="100%">--}}
                        {{--                                    <option>Min Year</option>--}}
                        {{--                                    <option>Year 1</option>--}}
                        {{--                                    <option>Year 2</option>--}}
                        {{--                                </select>--}}
                        {{--                                <select class="selectpicker" data-width="100%">--}}
                        {{--                                    <option>Max Year</option>--}}
                        {{--                                    <option>Year 1</option>--}}
                        {{--                                    <option>Year 2</option>--}}
                        {{--                                </select>--}}
                        {{--                            </div>--}}
                        {{--                            <div class="b-filter-2__group">--}}
                        {{--                                <div class="b-filter-2__group-title">fuel type</div>--}}
                        {{--                                <select class="selectpicker" data-width="100%">--}}
                        {{--                                    <option>All Fuel Types</option>--}}
                        {{--                                    <option>Type 1</option>--}}
                        {{--                                    <option>Type 2</option>--}}
                        {{--                                    <option>Type 3</option>--}}
                        {{--                                </select>--}}
                        {{--                            </div>--}}
                        {{--                            <div class="b-filter-2__group">--}}
                        {{--                                <div class="b-filter-2__group-title">Filter Price</div>--}}
                        {{--                                <div class="ui-filter-slider">--}}
                        {{--                                    <div id="slider-price"></div>--}}
                        {{--                                    <div class="ui-filter-slider__info">--}}
                        {{--                                        <div class="ui-filter-slider__label">Price Range:</div><span class="ui-filter-slider__current" id="slider-snap-value-lower"></span>-<span class="ui-filter-slider__current" id="slider-snap-value-upper"></span>--}}
                        {{--                                    </div>--}}
                        {{--                                </div>--}}
                        {{--                            </div>--}}
                        {{--                            <div class="b-filter-2__group">--}}
                        {{--                                <div class="b-filter-2__group-title">TRANSMISSION</div>--}}
                        {{--                                <div class="checkbox-group">--}}
                        {{--                                    <input class="forms__check hidden" id="check-1" type="checkbox" />--}}
                        {{--                                    <label class="forms__label forms__label-check forms__label-check-1" for="check-1">4 Speed Automatic</label>--}}
                        {{--                                    <input class="forms__check hidden" id="check-2" type="checkbox" />--}}
                        {{--                                    <label class="forms__label forms__label-check forms__label-check-1" for="check-2">4 Speed Manual</label>--}}
                        {{--                                    <input class="forms__check hidden" id="check-3" type="checkbox" checked="checked" />--}}
                        {{--                                    <label class="forms__label forms__label-check forms__label-check-1" for="check-3">5 Speed Automatic</label>--}}
                        {{--                                    <input class="forms__check hidden" id="check-4" type="checkbox" />--}}
                        {{--                                    <label class="forms__label forms__label-check forms__label-check-1" for="check-4">5 Speed Manual</label>--}}
                        {{--                                    <input class="forms__check hidden" id="check-5" type="checkbox" checked="checked" />--}}
                        {{--                                    <label class="forms__label forms__label-check forms__label-check-1" for="check-5">6-Speed Semi-Auto</label>--}}
                        {{--                                    <input class="forms__check hidden" id="check-6" type="checkbox" />--}}
                        {{--                                    <label class="forms__label forms__label-check forms__label-check-1" for="check-6">6-Speed Manual</label>--}}
                        {{--                                </div>--}}
                        {{--                            </div>--}}
                        {{--                        </div>--}}
                    </form>
                    <div class="b-filter-2 bg-grey mt-30">
                        <h3 class="b-filter-2__title">{{trans('front.brands')}}</h3>
                        @php
                            $list_brands = $modelBrand->start()->getData();
                        @endphp

                        <nav id="sidebar">
                            <ul class="list-unstyled components">
                                @if($list_brands->count())
                                    @foreach($list_brands as $brand)
                                        <li><a href="{{$brand->getUrl()}}">{{$brand->name}} <span></span></a>
                                        {{--                                        <li><a href="{{$brand->getUrl()}}">{{$brand->name}} <span><img width="80" height="40" src="{{asset($brand->image)}}" alt=""></span></a>--}}
                                    @endforeach
                                @endif
                            </ul>
                        </nav>
                    </div>
                </aside>
                <!-- end .l-sidebar-->
            </div>
        </div>
    </div>
@endsection




@section('breadcrumb')
    <div class="bg-grey">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="home.html"><i class="icon fa fa-home"></i></a>
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
@endpush

@push('scripts')
    <script type="text/javascript">
        $('[name="filter_sort"]').change(function (event) {
            $('#filter_sort').submit();
        });
    </script>
@endpush
