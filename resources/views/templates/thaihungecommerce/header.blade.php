@php
    $categories = $modelCategory->start()->getList(['status' => 1]);
    $categoriesTop = $modelCategory->start()->getCategoryTop()->getData();
@endphp
<header id="header" class="header style1 header-sticky">
    <div class="header-top style1">
        <div class="container">
            <div class="header-top-inner">
                <ul id="menu-top-left-menu" class="azirspares-nav top-bar-menu">
                    <li class="menu-item"><a title="Store Direction" href="{{ route('product.all') }}"><span
                                    class="icon flaticon-place"></span>Mua hàng</a></li>
                    <li class="menu-item"><a title="Track Your Order" href="{{ route('member.order_list') }}"><span
                                    class="icon flaticon-box"></span>Đơn hàng đã đặt</a></li>
                </ul>
                <ul id="menu-top-right-menu" class="azirspares-nav top-bar-menu right">
                    <li class="menu-item "><a title="Contact" href="/contact.html">Liên hệ</a></li>
                    <li class="menu-item "><a style="cursor: pointer" class="pick-location" title="Pick Location">{{ (session('guestLocation') ?? 'Chọn địa điểm') }}</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="header-middle">
        <div class="container">
            <div class="header-middle-inner">
                <div class="header-logo">
                    <a href="{{ route('home') }}"><img style="width:120px" alt="Thái Hưng" src="{{ asset(sc_store('logo')) }}" class="logo"></a>
                </div>
                <div class="block-search">
                    <form role="search" method="get" action="{{ route('search') }}"
                          class="form-search block-search-form azirspares-live-search-form">
                        <div class="form-content search-box results-search">
                            <div class="inner">
                                <input autocomplete="off" type="text" class="searchfield txt-livesearch input"
                                       name="keyword" value="" placeholder="{{ trans('front.search_form.keyword') }}...">
                            </div>
                        </div>
                        <input type="hidden" name="post_type" value="product">
                        <input type="hidden" name="taxonomy" value="product_cat">
                        <div class="category">
                            <select name="category" id="849112588" class="category-search-option"
                                    tabindex="-1">
                                <option value="0">Danh mục</option>
                                @if ($categoriesTop->count())
                                    @foreach ($categoriesTop as $key => $category)
                                        @if (!empty($categories[$category->id]))
                                            <option class="level-0" value="{{ $category->id }}">{{ $category->title }}</option>
                                            @foreach ($categories[$category->id] as $cateChild)
                                                <option class="level-1" value="{{ $cateChild->id }}">&nbsp;&nbsp;&nbsp;{{ $cateChild->title }}</option>
                                            @endforeach
                                        @else
                                            <option class="level-0" value="{{ $category->id }}">{{ $category->title }}</option>
                                        @endif
                                    @endforeach
                                @endif
                            </select>
                        </div>
                        <button type="submit" class="btn-submit">
                            <span class="flaticon-magnifying-glass-browser"></span>
                        </button>
                    </form>
                </div>
                <div class="header-control">
                    <div class="header-control-inner">
                        <div class="meta-woo">
                            <div class="block-menu-bar">
                                <a class="menu-bar menu-toggle" href="{{ asset('/') }}">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </a>
                            </div>
                            <div class="menu-item block-user block-woo azirspares-dropdown">
                                <a data-azirspares="azirspares-dropdown" class="block-link"
                                   href="{{ route('login') }}">
                                    <span class="flaticon-user"></span>
                                </a>
                                <ul class="sub-menu">
                                    @guest
                                        <li class="menu-item woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
                                            <a href="{{ route('login') }}">Đăng nhập/Đăng ký</a>
                                        </li>
                                    @else
                                        <li class="menu-item woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard is-active">
                                            <a href="{{ route('member.change_infomation') }}">Tài khoản</a>
                                        </li>
{{--                                        <li class="menu-item woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">--}}
{{--                                            <a href="{{ asset('/') }}">Sản phẩm ưa thích</a>--}}
{{--                                        </li>--}}
                                        <li class="menu-item woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--downloads">
                                            <a href="{{ route('member.order_list') }}">Đơn hàng</a>
                                        </li>
                                        <li class="menu-item woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout">
                                            <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Đăng xuất</a>
                                            <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                                  style="display: none;">@csrf</form>
                                        </li>
                                    @endguest
                                </ul>
                            </div>
                            <div class="block-minicart block-woo azirspares-mini-cart">
                                <div class="shopcart-dropdown block-cart-link"
                                     data-azirspares="azirspares-dropdown">
                                    <a class="block-link link-dropdown" href="{{ route('cart') }}">
                                        <span class="flaticon-online-shopping-cart"></span>
                                        <span class="count sc-cart" id="shopping-cart">{{ Cart::instance('default')->count() }}</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-nav style1">
        <div class="container">
            <div class="azirspares-menu-wapper"></div>
            <div class="header-nav-inner">
                <!-- block category -->
                <div data-items="9"
                     class="vertical-wrapper block-nav-category has-vertical-menu always-open show-button-all">
                    <div class="block-title">
                        <a href="{{ route('supplier.all') }}">
                                <span class="before">
                        <span></span>
                                <span></span>
                                <span></span>
                                </span>
                            <span class="text-title">Nhà cung cấp</span>
                        </a>
                    </div>
                    <div class="block-content verticalmenu-content">
                        <ul id="menu-vertical-menu" class="azirspares-nav vertical-menu default">
                            @foreach(\App\Models\ShopSupplier::get() as $supplier)
                                <li class="menu-item parent parent-megamenu item-megamenu menu-item-has-children">
                                    <a class="azirspares-menu-item-title" title="{{ $supplier->name }}"
                                       href="{{ $supplier->getUrl() }}">{{ $supplier->name }}</a>
                                    <span class="toggle-submenu"></span>
                                    <div style="width: 728px; max-width: 1033px;" class="submenu megamenu">
                                        <div class="col-sm-12">
                                            <div class="azirspares-iconbox style13">
                                                <div class="iconbox-inner">
                                                    <div class="icon">
                                                        <img src="{{ $supplier->image }}">
                                                    </div>
                                                    <div class="iconbox-wrap">
                                                        <h4 class="title">
                                                            {{ $supplier->name }}
                                                        </h4>
                                                        <a class="button" target="_self"
                                                           href="{{ $supplier->getUrl() }}">Mua hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <!-- block category -->
                <div class="box-header-nav">
                    <ul id="menu-primary-menu"
                        class="clone-main-menu azirspares-clone-mobile-menu azirspares-nav main-menu">
                        <li id="menu-item-1602"
                            class="menu-item menu-item-type-post_type menu-item-object-megamenu menu-item-1602 parent parent-megamenu item-megamenu menu-item-has-children">
                            <a class="azirspares-menu-item-title" title="Home" href="{{ route('home') }}">Trang
                                chủ</a><span
                                    class="toggle-submenu"></span></li>
                        <li id="menu-item-713"
                            class="menu-item menu-item-type-post_type menu-item-object-megamenu menu-item-713 parent parent-megamenu item-megamenu menu-item-has-children">
                            <a class="azirspares-menu-item-title" title="Shop"
                               href="{{ route('product.all') }}">
                                <span class="image">
                                    <img width="31" height="15"
                                         src="{{ asset('assets/js/libs/label-new-fix.jpg') }}"
                                         class="image_icon_1 lazy"
                                         alt=""
                                         style="display: inline;">
                                </span>Sản phẩm
                            </a>
                            <span class="toggle-submenu"></span>
                            <div style="width: 700px; max-width: 1400px; left: -423.844px; background-image: url('https://i.ibb.co/pWQYtQt/background.jpg'); background-repeat: no-repeat; background-position: right; background-size: cover;" class="submenu megamenu">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="row ">
                                            @if ($categoriesTop->count())
                                                @foreach ($categoriesTop as $key => $category)
                                                    <div class="col-sm-4 pb-5">
                                                        <div class="azirspares-listing style1 light">
                                                            <div class="listing-inner">
                                                                @if (!empty($categories[$category->id]))
                                                                <div class="listing-thumb">
                                                                    <h4 class="cat-name">
                                                                        {{ $category->title }}
                                                                    </h4>
                                                                </div>
                                                                    @foreach ($categories[$category->id] as $key => $cateChild)
                                                                        <ul class="listing-list equal-elem ">
                                                                            <li class="">
                                                                                <a href="{{ route('category.detail', $cateChild->alias) }}"
                                                                                   target="_self">
                                                                                    {{ $cateChild->title }}
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    @endforeach
                                                                @else
                                                                    <div class="listing-thumb">
                                                                        <h4 class="cat-name">
                                                                            {{ $category->title }}
                                                                        </h4>
                                                                    </div>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                </div>
{{--                                <div class="azirspares-iconbox style13 dark   azirspares_custom_5bed269f25f85 ">--}}
{{--                                    @php--}}
{{--                                        $product = \App\Product::with('Images', 'Category')->get()->random();--}}
{{--                                    @endphp--}}
{{--                                    <div class="iconbox-inner">--}}
{{--                                        <div class="icon">--}}
{{--                                            <img width="208" height="192"--}}
{{--                                                 src="https://media-exp1.licdn.com/dms/image/C561BAQFs7X5y5Ru0KA/company-background_10000/0?e=2159024400&v=beta&t=msmFSdmhWbRWxgx-9-DbTWELEkdoGsQp07fJ359kaWU"></div>--}}
{{--                                        <div class="iconbox-wrap">--}}
{{--                                            <a href="{{ asset('san-pham/'. $product->slug) }}">--}}
{{--                                                <h4 class="title">--}}
{{--                                                    {{ $product->name }}--}}
{{--                                                </h4>--}}
{{--                                            </a>--}}
{{--                                            <a href="{{ asset('shop?category=' . $product->Category->id) }}">--}}
{{--                                                <p class="desc">{{ $product->Category->name }}</p>--}}
{{--                                            </a>--}}
{{--                                            <a class="button" target=" _blank" href="{{ asset('shop') }}">Tất cả sản phẩm</a>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
                            </div>
                        </li>
{{--                            <li id="menu-item-1613"--}}
{{--                            class="menu-item menu-item-type-post_type menu-item-object-megamenu menu-item-1613 parent parent-megamenu item-megamenu menu-item-has-children"--}}
{{--                        ><a class="azirspares-menu-item-title" title="Vendor"--}}
{{--                            href="{{ asset('provider') }}">Nhà cung cấp</a><span--}}
{{--                                    class="toggle-submenu"></span>--}}
{{--                            <div style="width: 800px; max-width: 1400px; left: -173px;" class="submenu megamenu">--}}
{{--                                <div class="row">--}}
{{--                                    @foreach(\App\Provider::where('state', 1)->get() as $provider)--}}
{{--                                        <div class=" col-sm-3">--}}
{{--                                            <a href="{{ route('provider.show', [$provider->slug]) }}">--}}
{{--                                                <img width="195px" height="45px" src="{{ asset($provider->avatar) }}"--}}
{{--                                                     title="">--}}
{{--                                            </a>--}}
{{--                                        </div>--}}
{{--                                    @endforeach--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
                        @if (!empty($layoutsUrl['menu']))
                            @foreach ($layoutsUrl['menu'] as $url)
                                <li id="menu-item-73"
                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-73 parent">
                                    <a class="azirspares-menu-item-title" title="Blog" {{ ($url->target =='_blank')?'target=_blank':''  }}
                                    href="{{ sc_url_render($url->url) }}">{{ sc_language_render($url->name) }}</a><span
                                            class="toggle-submenu"></span>
                                </li>
                            @endforeach
                        @endif
{{--                        <li id="menu-item-73"--}}
{{--                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-73 parent">--}}
{{--                            <a class="azirspares-menu-item-title" title="Blog"--}}
{{--                               href="{{ asset('blog') }}">Giới thiệu</a><span--}}
{{--                                    class="toggle-submenu"></span>--}}
{{--                        </li>--}}
{{--                        <li id="menu-item-73"--}}
{{--                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-73 parent">--}}
{{--                            <a class="azirspares-menu-item-title" title="Blog"--}}
{{--                               href="{{ asset('blog') }}">Đầu tư</a><span--}}
{{--                                    class="toggle-submenu"></span>--}}
{{--                        </li>--}}
{{--                        <li id="menu-item-73"--}}
{{--                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-73 parent">--}}
{{--                            <a class="azirspares-menu-item-title" title="Blog"--}}
{{--                               href="{{ asset('blog') }}">Tin tức</a><span--}}
{{--                                    class="toggle-submenu"></span>--}}
{{--                        </li>--}}
{{--                        <li id="menu-item-73"--}}
{{--                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-73 parent">--}}
{{--                            <a class="azirspares-menu-item-title" title="Blog"--}}
{{--                               href="{{ asset('blog') }}">Liên hệ</a><span--}}
{{--                                    class="toggle-submenu"></span>--}}
{{--                        </li>--}}
                    </ul>
                </div>
                <div class="phone-header style1">
                    <div class="phone-inner">
                                <span class="phone-icon">
                                    <span class="flaticon-telephone"></span>
                                </span>
                        <div class="phone-number">
                            <p>Hotline</p>
                            <p>{{ sc_store('phone') }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
