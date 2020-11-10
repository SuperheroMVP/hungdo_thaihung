@php
  $banners = $modelBanner->start()->getBanner()->getData()
@endphp

 @if (!empty($banners))
     <div class="main-slider main-slider-1">
         <div class="slider-pro" id="main-slider" data-slider-width="100%" data-slider-height="560px" data-slider-arrows="true" data-slider-buttons="false">
             <div class="sp-slides">
             @foreach ($banners as $key => $banner)
                 <!-- Slide 1-->
                 <div class="sp-slide">
                     <img class="sp-image" src="{{ asset($banner->image) }}" alt="slider" />
{{--                     <div class="main-slider__wrap sp-layer" data-width="" data-position="centerLeft" data-horizontal="62%" data-show-transition="left" data-hide-transition="left" data-show-duration="2000" data-show-delay="1200" data-hide-delay="400">--}}
{{--                         <div class="main-slider__title">sedecrem zneb<span class="main-slider__label bg-primary">model 2018</span>--}}
{{--                         </div>--}}
{{--                         <div class="main-slider__subtitle">smart drive</div><a class="main-slider__btn btn btn-white btn-lg" href="services.html"><span class="main-slider__btn-label">Starting</span><span class="main-slider__btn-price"> $<strong>560/M</strong></span></a><a class="main-slider__btn btn btn-primary btn-lg" href="services.html">book now</a>--}}
{{--                     </div>--}}
                     {!! $banner->html !!}
                 </div>
                 @endforeach
             </div>
         </div>
     </div>
     <!-- end .main-slider-->
@endif
