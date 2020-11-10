@php
    $menuIndex = 6;
    $menus = Admin::getMenuVisible();
    $level0 = $menus[$menuIndex];
@endphp
<!--begin::Bottom-->
<div class="header-bottom" id="kt_header_bottom">
    <!--begin::Container-->
    <div class="container d-flex flex-column">
        <!--begin::Tab Navs(for desktop mode)-->
        <ul class="header-tabs nav flex-column-auto" role="tablist">
            @if(!empty($level0))
                @foreach($level0 as $level1)
                    <!--begin::Item-->
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="tab" data-target="#kt_header_tab_{{ $loop->index }}" role="tab">
                                <span class="nav-title text-uppercase">{!! sc_language_render($level1->title) !!}</span>
{{--                                <span class="nav-desc">Dashboard &amp; Reports</span>--}}
                            </a>
                        </li>
                    <!--end::Item-->
                @endforeach
            @endif
        </ul>
        <!--begin::Tab Navs-->
        <!--begin::Header Menu Wrapper-->
        <div class="header-navs header-navs-left flex-column-fluid" id="kt_header_navs">
            <!--begin::Tab Content-->
            <div class="tab-content">
            @if(!empty($level0))
                @foreach($level0 as $level1)
                <!--begin::Tab Pane-->
                <div class="tab-pane show" id="kt_header_tab_{{$loop->index}}" data-tab="{{ $loop->index }}">
                    <!--begin::Menu-->
                    <div id="kt_header_menu" class="header-menu header-menu-mobile header-menu-layout-default">
                        <!--begin::Nav-->
                        <ul class="menu-nav">
                            @foreach ($menus[$level1->id] as $level2)
                            <li class="menu-item {{ sc_url_render($level2->uri) == url()->current() ? 'menu-item-active' : '' }}" aria-haspopup="true">
                                <a href="{{ $level2->uri?sc_url_render($level2->uri):'#' }}" class="menu-link">
                                    <span class="menu-text">{!! sc_language_render($level2->title) !!}</span>
                                </a>
                            </li>
                            @endforeach
                        </ul>
                        <!--end::Nav-->
                    </div>
                    <!--end::Menu-->
                </div>
                <!--begin::Tab Pane-->
                @endforeach
            @endif
            </div>
            <!--end::Tab Content-->
        </div>
        <!--end::Header Menu Wrapper-->
    </div>
    <!--end::Container-->
</div>
<!--end::Bottom-->