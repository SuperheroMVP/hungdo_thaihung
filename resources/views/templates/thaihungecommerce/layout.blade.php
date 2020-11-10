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
    <meta property="og:image" content="{{ !empty($og_image)?asset($og_image):asset('images/org.jpg') }}" />
    <meta property="og:url" content="{{ \Request::fullUrl() }}" />
    <meta property="og:type" content="Website" />
    <meta property="og:title" content="{{ $title??sc_store('title') }}" />
    <meta property="og:description" content="{{ $description??sc_store('description') }}" />
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
@include($templatePath.'.common.css')
<!--//end css defaut -->
{{--    <link rel="stylesheet" href="{{ asset($templateFile.'/css/bootstrap.min.css') }}" type="text/css" media="all">--}}
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="{{ asset($templateFile.'/css/slick.min.css') }}" type="text/css" media="all">
    <link rel="stylesheet" href="{{ asset($templateFile.'/fonts/flaticon/flaticon.css') }}" type="text/css" media="all">
    <link rel="stylesheet" href="{{ asset($templateFile.'/css/owl.carousel.css') }}" type="text/css" media="all">
    <link rel="stylesheet" href="{{ asset($templateFile.'/css/vendor-list.css') }}" type="text/css" media="all">
    <link rel="stylesheet" href="{{ asset($templateFile.'/css/font-awesome.min.css') }}" type="text/css" media="all">
    <link rel="stylesheet" href="{{ asset($templateFile.'/css/style.css'.'?v='.time()) }}" type="text/css" media="all">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />

  <!--Module header -->
  @isset ($blocksContent['header'])
      @foreach ( $blocksContent['header']  as $layout)
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


  <section class="p-0">
    <div>
      <div class="row">
        <div class=" container" id="breadcrumb">
          <!--breadcrumb-->
          @yield('breadcrumb')
          <!--//breadcrumb-->

          <!--fillter-->
          @yield('filter')
          <!--//fillter-->
        </div>

        <!--Notice -->
        @include($templatePath.'.common.notice')
        <!--//Notice -->


        <!--body-->
        @section('main')

          @include($templatePath.'.center')
          @include($templatePath.'.right')
        @show
        <!--//body-->
      </div>
    </div>
      <a href="#" class="backtotop active">
          <i class="fa fa-angle-up"></i>
      </a>
  </section>
<div class="modal-pick-location">
    <div class="modal fade " tabindex="-1" role="dialog" id="modalPickLocation">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Vui Lòng cho chúng tôi biết bạn ở đâu?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ route('save-location') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <select class="select2" style="width: 100%" id="selectLocation" name="province">
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <button type="submit" id="submitLocation" class="btn btn-primary">Lưu địa chỉ</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@include($templatePath.'.footer')

<script type="text/javascript" src="{{ asset($templateFile.'/js/jquery.min.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/magnific-popup.min.js') }}"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/jquery.growl.min.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/slick.min.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/jquery.scrollbar.min.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/countdown.min.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/lazyload.min.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/wow.min.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/owl.carousel.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/libs/jquery.session.js') }}"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/scripts.js') }}"></script>
<script type="text/javascript" src="{{ asset($templateFile.'/js/functions.js') }}"></script>
<script>
    AOS.init();
    $(document).ready(function(){
        clickPickUp();
        // let check=1;
        // if ($.session.get("guestLocation") == null && check==1){
        //     check=0;
        //     showLocation();
        // }
        // else{
        //     // $('.pick-location').text($.session.get("guestLocation"));
        // }
    });
    function showLocation() {
        $('.select2').select2({
            dropdownParent: $('#modalPickLocation')
        });
        $.getJSON('{{asset('hcvn/tinh_tp.json')}}', function (data) {
            $.each(data, function (index, item) {
                let opt;
                if($.session.get("guestLocation") === item.name){
                    opt = $('<option value="' + item.name + '" selected>' + item.name + '</option>');
                }
                else{
                    opt = $('<option value="' + item.name + '">' + item.name + '</option>');
                }
                $('#selectLocation').append(opt)
            })
        });
        $('#modalPickLocation').modal('show')
        saveLocation()
    }

    function saveLocation() {
        $("#submitLocation").click(function(){
            $.session.set("guestLocation", $('#selectLocation').val());
            $('#modalPickLocation').modal('hide')
            // $('.pick-location').text($.session.get("guestLocation"));
        });
    }
    function clickPickUp() {
        $('.pick-location').click(function () {
            showLocation();
        });
    }

    $(document).ready(function () {
        // Handler for .ready() called.
        $('html, body').animate({
            scrollTop: $('.breadcrumb').offset().top
        }, '1500');
    });
</script>

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
 
 <div id="sc-loading">
  <div class="sc-overlay"><i class="fa fa-spinner fa-pulse fa-5x fa-fw "></i></div>
</div>

</body>
</html>
@endif