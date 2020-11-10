@if (sc_config('SITE_STATUS') == 'off')
@include($templatePath . '.maintenance')
@else

        <!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="{{ $description??sc_store('description') }}">
    <meta name="keyword" content="{{ $keyword??sc_store('keyword') }}">
    <title>{{$title??sc_store('title')}}</title>
    <link rel="icon" href="{{ asset('images/icon.png') }}" type="image/png" sizes="16x16">
    <meta property="og:image" content="{{ !empty($og_image)?asset($og_image):asset('images/org.jpg') }}"/>
    <meta property="og:url" content="{{ \Request::fullUrl() }}"/>
    <meta property="og:type" content="Website"/>
    <meta property="og:title" content="{{ $title??sc_store('title') }}"/>
    <meta property="og:description" content="{{ $description??sc_store('description') }}"/>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!--Module meta -->
@isset ($blocksContent['meta'])
    @foreach ( $blocksContent['meta']  as $layout)
        @php
            $arrPage = explode(',', $layout->page)
        @endphp
        @if ($layout->page == '*' ||  (isset($layout_page) && in_array($layout_page, $arrPage)))
            @if ($layout->type =='html')
                {!! $layout->text !!}
            @endif
        @endif
    @endforeach
@endisset
<!--//Module meta -->

    <!-- css default for item s-cart -->
{{--@include($templatePath.'.common.css')--}}
<!--//end css defaut -->

    {{--  <link href="{{ asset($templateFile.'/css/main.css')}}" rel="stylesheet">--}}

    <link rel="stylesheet" href="{{ asset($templateFile.'/css/master.css')}}"/>
    <link rel="stylesheet" href="{{ asset($templateFile.'/css/animate.css')}}"/>
    <!-- SWITCHER-->
    <link href="{{ asset($templateFile.'/plugins/switcher/css/switcher.css')}}" rel="stylesheet" id="switcher-css"/>
    <link href="{{ asset($templateFile.'/plugins/switcher/css/color1.css')}}" rel="alternate stylesheet"
          title="color1"/>
    <link href="{{ asset($templateFile.'/plugins/switcher/css/color2.css')}}" rel="alternate stylesheet"
          title="color2"/>
    <link href="{{ asset($templateFile.'/plugins/switcher/css/color3.css')}}" rel="alternate stylesheet"
          title="color3"/>
    <link href="{{ asset($templateFile.'/plugins/switcher/css/color4.css')}}" rel="alternate stylesheet"
          title="color4"/>
    <link rel="icon" type="image/x-icon" href="./assets/favicon.ico"/>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <!--[if lt IE 9 ]>
    <script src="assets/js/separate-js/html5shiv-3.7.2.min.js" type="text/javascript"></script>
    <meta content="no" http-equiv="imagetoolbar">


<![endif]-->
@stack('styles')

    {{--custom style--}}
    <style>
       /* style for btn chat messager and zalo*/
        .float-icon-hotline {
            display: block;
            width: 40px;
            position: fixed;
            bottom: 9px;
            left: 28px;
            z-index: 999999;
            text-align: center;
        }
        ul.left-icon.hotline {
            margin-left: 0px !important;
        }
        .float-icon-hotline ul {
            display: block;
            width: 100%;
            padding-left: 0;
            margin-bottom: 0;
        }
        .float-icon-hotline ul li {
            display: block;
            width: 100%;
            position: relative;
            margin-bottom: 10px;
            cursor: pointer;
        }
        .float-icon-hotline ul li a#messengerButton {
            padding: 0px !important;
            background: transparent !important;
            border: 0px !important;
        }
        .float-icon-hotline ul li .fa-zalo {
            background: url(https://netweb.vn/img/hotline/zalo.png) center center no-repeat;
        }
        .float-icon-hotline ul li .fa {
            background-color: #ed1c24;
            display: block;
            width: 40px;
            height: 40px;
            text-align: center;
            line-height: 36px;
            -moz-box-shadow: 0 0 5px #888;
            -webkit-box-shadow: 0 0 5px #888;
            box-shadow: 0 0 5px #888;
            color: #fff;
            font-weight: 700;
            border-radius: 50%;
            position: relative;
            z-index: 2;
            border: 2px solid #fff;
        }
        @media only screen and (min-width: 960px) {
            .float-icon-hotline ul li .fa {
                background-size: contain !important;
            }
        }
        .float-icon-hotline ul li .fa-messenger {
            background: url(https://netweb.vn/img/hotline/fb.png) center center no-repeat;
        }
       /* end style for btn chat messager and zalo*/

    </style>
    <!--Module header -->
{{--@isset ($blocksContent['header'])--}}
{{--    @foreach ( $blocksContent['header']  as $layout)--}}
{{--        @php--}}
{{--            $arrPage = explode(',', $layout->page)--}}
{{--        @endphp--}}
{{--        @if ($layout->page == '*' ||  (isset($layout_page) && in_array($layout_page, $arrPage)))--}}
{{--            @if ($layout->type =='html')--}}
{{--                {!! $layout->text !!}--}}
{{--            @endif--}}
{{--        @endif--}}
{{--    @endforeach--}}
{{--@endisset--}}
<!--//Module header -->
</head>
<!--//head-->
<body>

@include($templatePath.'.header')

<!--Module banner -->
@isset ($blocksContent['banner_top'])
    @foreach ( $blocksContent['banner_top']  as $layout)
        @php
            $arrPage = explode(',', $layout->page)
        @endphp
        @if ($layout->page == '*' ||  (isset($layout_page) && in_array($layout_page, $arrPage)))
            @if ($layout->type =='html')
                {!! $layout->text !!}
            @elseif($layout->type =='view')
                @if (view()->exists($templatePath.'.block.'.$layout->text))
                    @include($templatePath.'.block.'.$layout->text)
                @endif
            @endif
        @endif
    @endforeach
@endisset
<!--//Module banner -->


<!--Module top -->
@isset ($blocksContent['top'])
    @foreach ( $blocksContent['top']  as $layout)
        @php
            $arrPage = explode(',', $layout->page)
        @endphp
        @if ($layout->page == '*' ||  (isset($layout_page) && in_array($layout_page, $arrPage)))
            @if ($layout->type =='html')
                {!! $layout->text !!}
            @elseif($layout->type =='view')
                @if (view()->exists($templatePath.'.block.'.$layout->text))
                    @include($templatePath.'.block.'.$layout->text)
                @endif
            @endif
        @endif
    @endforeach
@endisset
<!--//Module top -->


        <div class="row" style="margin: 0;">
            <div class="col-12" id="breadcrumb">
                <!--breadcrumb-->
            @yield('breadcrumb')
            <!--//breadcrumb-->

                <!--fillter-->
            @yield('filter')
            <!--//fillter-->
            </div>
        {{--      </div>--}}
        <!--Notice -->
        @include($templatePath.'.common.notice')
        <!--//Notice -->
                <!--body-->
            @section('main')
                {{--          @include($templatePath.'.left')--}}
                @include($templatePath.'.center')
                {{--          @include($templatePath.'.right')--}}
            @show
            <!--//body-->
        </div>

@include($templatePath.'.footer')

{{--<script src="{{ asset($templateFile.'/js/main.js')}}"></script>--}}

<!-- ++++++++++++-->
<!-- MAIN SCRIPTS-->
<!-- ++++++++++++-->
{{--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--}}

<script src="{{ asset($templateFile.'/libs/jquery-1.12.4.min.js')}}"></script>
<script src="{{ asset($templateFile.'/libs/jquery-migrate-1.2.1.js')}}"></script>
<link rel="stylesheet" href="http://thaihung.htc-it.team/admin/AdminLTE/bower_components/select2/dist/css/select2.min.css">
<script src="http://thaihung.htc-it.team/admin/AdminLTE/bower_components/select2/dist/js/select2.full.min.js"></script>
{{--<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />--}}
{{--<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>--}}
<!-- Bootstrap-->
<script src="{{ asset($templateFile.'/libs/bootstrap/bootstrap.min.js')}}"></script>
<!-- User customization-->
<script src="{{ asset($templateFile.'/js/custom.js')}}"></script>
<!-- Headers scripts-->
<script src="{{ asset($templateFile.'/plugins/headers/slidebar.js')}}"></script>
<script src="{{ asset($templateFile.'/plugins/headers/header.js')}}"></script>
<!-- Color scheme-->
<script src="{{ asset($templateFile.'/plugins/switcher/js/dmss.js')}}"></script>
<!-- Select customization & Color scheme-->
<script src="{{ asset($templateFile.'/plugins/bootstrap-select/js/bootstrap-select.min.js')}}"></script>
<!-- Slider-->
<script src="{{ asset($templateFile.'/plugins/owl-carousel/owl.carousel.min.js')}}"></script>
<!-- Pop-up window-->
<script src="{{ asset($templateFile.'/plugins/magnific-popup/jquery.magnific-popup.min.js')}}"></script>
<!-- Mail scripts-->
<script src="{{ asset($templateFile.'/plugins/jqBootstrapValidation.js')}}"></script>
<script src="{{ asset($templateFile.'/plugins/contact_me.js')}}"></script>
<!-- Filter and sorting images-->
<script src="{{ asset($templateFile.'/plugins/isotope/isotope.pkgd.min.js')}}"></script>
<script src="{{ asset($templateFile.'/plugins/isotope/imagesLoaded.js')}}"></script>
<!-- Progress numbers-->
<script src="{{ asset($templateFile.'/plugins/rendro-easy-pie-chart/jquery.easypiechart.min.js')}}"></script>
<script src="{{ asset($templateFile.'/plugins/rendro-easy-pie-chart/waypoints.min.js')}}"></script>
<!-- NoUiSlider-->
<script src="{{ asset($templateFile.'/plugins/noUiSlider/nouislider.min.js')}}"></script>
<script src="{{ asset($templateFile.'/plugins/noUiSlider/wNumb.js')}}"></script>
<!-- Animations-->
<script src="{{ asset($templateFile.'/plugins/scrollreveal/scrollreveal.min.js')}}"></script>
<!-- Main slider-->
<script src="{{ asset($templateFile.'/plugins/slider-pro/jquery.sliderPro.min.js')}}"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
<!-- User map-->
{{--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqQ_bBw186KJnMcRByvn5ffZueg88wp1E"></script>--}}
<!-- Maps customization-->
{{--<script src="{{ asset($templateFile.'/js/map-custom.js')}}"></script>--}}


@stack('scripts')

<!-- js default for item s-cart -->
@include($templatePath.'.common.js')
<!--//end js defaut -->

<!--Module bottom -->
@isset ($blocksContent['bottom'])
    @foreach ( $blocksContent['bottom']  as $layout)
        @php
            $arrPage = explode(',', $layout->page)
        @endphp
        @if ($layout->page == '*' ||  (isset($layout_page) && in_array($layout_page, $arrPage)))
            @if ($layout->type =='html')
                {!! $layout->text !!}
            @elseif($layout->type =='view')
                @if (view()->exists($templatePath.'.block.'.$layout->text))
                    @include($templatePath.'.block.'.$layout->text)
                @endif
            @endif
        @endif
    @endforeach
@endisset
<!--//Module bottom -->

{{-- <div id="sc-loading">--}}
{{--  <div class="sc-overlay"><i class="fa fa-spinner fa-pulse fa-5x fa-fw "></i></div>--}}
{{--</div>--}}


</body>
</html>
@endif
