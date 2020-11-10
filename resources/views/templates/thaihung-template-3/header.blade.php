<!-- SEARCH MODAL-->
<!-- ==========================-->
<div class="header-search open-search">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
                <div class="navbar-search">
                    <form class="search-global" role="search" method="get" action="{{ route('search') }}">
                        <input class="search-global__input" type="text" placeholder="Tìm kiếm..." autocomplete="off" name="keyword" />
                        <button class="search-global__btn"><i class="icon stroke icon-Search"></i>
                        </button>
                        <div class="search-global__note">Giúp bạn tìm kiếm sản phẩm bạn cần một cách nhanh nhất.</div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <button class="search-close close" type="button"><i class="fa fa-times"></i>
    </button>
</div>
<!-- MOBILE MENU-->
<!-- ==========================-->
<div data-off-canvas="mobile-slidebar left overlay">
{{--    <a class="navbar-brand scroll" href="home.html">--}}
{{--        <img class="normal-logo img-resonsive visible-xs visible-sm" src="{{ asset(sc_store('logo')) }}" alt="logo" />--}}
{{--        <img class="scroll-logo img-resonsive hidden-xs hidden-sm" src="{{ asset(sc_store('logo')) }}" alt="logo" />--}}
{{--    </a>--}}
    <ul class="nav navbar-nav">
        <li>
            <h4><a href="">Menu</a></h4>
        </li>
        <li><a href="{{ route('home') }}">Trang chủ</a></li>
        <li class="dropdown"><a class="dropdown-toggle" href="{{ route('product.all')  }}" data-toggle="dropdown">Sản phẩm<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li>
                    <a href="{{ route('product.all')  }}" tabindex="-1">{{ trans('front.all_product') }}</a>
                </li>
                <li>
                    <a href="{{ route('product.combo')  }}" tabindex="-1">Sản phẩm combo</a>
                </li>
            </ul>
        </li>
        @if (!empty($layoutsUrl['menu']))
            @foreach ($layoutsUrl['menu'] as $url)
                <li><a {{ ($url->target =='_blank')?'target=_blank':''  }} href="{{ sc_url_render($url->url) }}">{{ sc_language_render($url->name) }}</a></li>
            @endforeach
        @endif
        <li><a href="{{asset("cat-thep")}}">Cắt thép</a></li>
        <li><a class="btn_header_search" href="#"><i class="icon fa fa-search"></i></a>
    </ul>
</div>

{{--end menu mobile--}}

<div class="l-theme animated-css" data-header="sticky" data-header-top="200" data-canvas="container">
    <!-- Start Switcher-->

<header class="header header-boxed-width navbar-fixed-top header-background-white header-color-black header-topbar-dark header-logo-black header-topbarbox-1-left header-topbarbox-2-right header-navibox-2-right header-navibox-3-right header-navibox-4-right">
    <div class="container container-boxed-width">
        <div class="top-bar">
            <div class="container">
                <div class="header-topbarbox-1">
                    <ul>
{{--                        <li><i class="icon fa fa-clock-o"></i> Mon - Fri : 0900am to 0600pm</li>--}}
                        <li><i class="icon fa fa-phone"></i><a href="tel:+0427983549">{{ sc_store('phone') }}</a>
                        </li>
                        <li><i class="icon fa fa-envelope-o"></i><a href="mailto:support@motorland.com">{{ sc_store('email') }}</a>
                        </li>
                    </ul>
                </div>
                <div class="header-topbarbox-2">
                    <ul class="social-links">
                            @php
                                $cartsCount = \Cart::count();
                            @endphp
                            {{--<li><a href="{{ route('wishlist') }}"><span  class="cart-qty  sc-wishlist" id="shopping-wishlist">{{ Cart::instance('wishlist')->count() }}</span><i class="fa fa-star"></i> --}}{{--{{ trans('front.wishlist') }}--}}{{--</a></li>--}}
{{--                            <li><a href="{{ route('compare') }}"><span  class="cart-qty sc-compare" id="shopping-compare">{{ Cart::instance('compare')->count() }}</span><i class="fa fa-crosshairs"></i>--}}{{-- {{ trans('front.compare') }}--}}{{--</a></li>--}}
                            <li><a href="{{ route('cart') }}"><span class="cart-qty sc-cart" id="shopping-cart">{{ Cart::instance('default')->count() }}</span><i class="fa fa-shopping-cart"></i> {{--{{ trans('front.cart_title') }}--}}</a>
                            </li>
                            @guest
                                <li><a href="{{ route('login') }}"><i class="fa fa-lock"></i> {{ trans('front.login') }}</a></li>
                            @else
                                <li><a href="{{ route('member.index') }}"><i class="fa fa-user"></i> {{--{{ trans('front.account') }}--}}</a></li>
                                <li><a href="{{ route('logout') }}" rel="nofollow" onclick="event.preventDefault();
                   document.getElementById('logout-form').submit();"><i class="fa fa-power-off"></i> {{ trans('front.logout') }}</a></li>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                            @endguest
                    </ul>
                </div>
            </div>
        </div>
        <nav class="navbar" id="nav">
            <div class="container">
                <div class="header-navibox-1">
                    <!-- Mobile Trigger Start-->
                    <button class="menu-mobile-button visible-xs-block js-toggle-mobile-slidebar toggle-menu-button"><i class="toggle-menu-button-icon"><span></span><span></span><span></span><span></span><span></span><span></span></i>
                    </button>
                    <!-- Mobile Trigger End-->
                    <a class="navbar-brand scroll" href="{{ route('home') }}">
                        <img class="normal-logo img-responsive" src="{{ asset(sc_store('logo')) }}" alt="logo" />
                        <img class="scroll-logo hidden-xs img-responsive" src="{{ asset(sc_store('logo')) }}" alt="logo"  width="80px"/>
                    </a>
                </div>
                <div class="header-navibox-3">
{{--                    <a class="btn btn-primary" href="{{asset("cat-thep")}}">Cắt thép</a>--}}
                </div>
                <div class="header-navibox-2">
                    <ul class="yamm main-menu nav navbar-nav">
                        <li><a class="dropdown-toggle" href="{{ route('home') }}">Trang chủ</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" href="" data-toggle="dropdown">Sản phẩm<b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="{{ route('product.all') }}" tabindex="-1">{{ trans('front.all_product') }}</a></li>
                                <li><a href="{{ route('product.combo') }}" tabindex="-1">Sản phẩm combo</a></li>
{{--                                <li><a href="{{ route('compare')  }}" tabindex="-1">{{ trans('front.compare') }}</a></li>--}}
{{--                                <li><a href="{{ route('cart')  }}" tabindex="-1">{{ trans('front.cart_title') }}</a></li>--}}
{{--                                <li><a href="{{ route('category.all')  }}" tabindex="-1">{{ trans('front.categories') }}</a></li>--}}
{{--                                <li><a href="{{ route('brand.all')  }}" tabindex="-1">{{ trans('front.brands') }}</a></li>--}}
{{--                                <li><a href="{{ route('supplier.all')  }}" tabindex="-1">{{ trans('front.suppliers') }}</a></li>--}}
                            </ul>
                        </li>
                        @if (!empty($layoutsUrl['menu']))
                            @foreach ($layoutsUrl['menu'] as $url)
                                <li><a {{ ($url->target =='_blank')?'target=_blank':''  }} href="{{ sc_url_render($url->url) }}">{{ sc_language_render($url->name) }}</a></li>
                            @endforeach
                        @endif
                        <li><a class="btn_header_search" href="#"><i class="icon fa fa-search"></i></a>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</header>