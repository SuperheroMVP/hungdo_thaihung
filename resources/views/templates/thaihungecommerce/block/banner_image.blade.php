@php
  $banners = $modelBanner->start()->getBanner()->getData()
@endphp

 @if (!empty($banners))
     <section class="pt-0 pb-0 ">
         <div class="owl-carousel" data-autoplay="true" data-nav="false" data-dots="false"
              data-loop="true"
              data-margin="20"
              data-responsive='{"0":{"items":1},"480":{"items":1},"768":{"items":1},"992":{"items":1},"1200":{"items":1}}'>
             @foreach ($banners as $key => $banner)
             <a href="{{ route('banner.click',['id' => $banner->id]) }}" target="{{ $banner->target }}"><img src="{{ asset($banner->image) }}"></a>
             @endforeach
         </div>
     </section>
@endif
