<!--Footer-->
<?php
$footerProductsNew = $modelProduct->start()->getProductLatest()->setlimit(6)->getData();
$footerProductsHot = $modelProduct->start()->getProductHot()->setlimit(6)->getData();
?>
<!--Module top footer -->
  @isset ($blocksContent['footer'])
      @foreach ( $blocksContent['footer']  as $layout)
        @php
          $arrPage = explode(',', $layout->page)
        @endphp
        @if ($layout->page == '*' ||  (isset($layout_page) && in_array($layout_page, $arrPage)))
          @if ($layout->type =='html')
            {!! $layout->text !!}
          @elseif($layout->type =='view')
            @if (view()->exists('blockView.'.$layout->text))
             @include('blockView.'.$layout->text)
            @endif
          @endif
        @endif
      @endforeach
  @endisset
<!--//Module top footer -->
<div class="float-icon-hotline">
  <ul class="left-icon hotline">
    <li class="hotline_float_icon"><a target="_blank" rel="nofollow" id="messengerButton" href="https://zalo.me/0989406446"><i class="fa fa-zalo animated infinite tada"></i><span>Zalo</span></a></li>
    <li class="hotline_float_icon"><a target="_blank" rel="nofollow" id="messengerButton" href="https://www.messenger.com/t/107205611039963"><i class="fa fa-messenger animated infinite tada"></i><span>Facebook</span></a></li>
  </ul>
</div>
<footer class="footer area-bg">
  <div class="area-bg__inner">
    <div class="footer__main">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="footer-section">
              <a class="footer__logo" href="{{ route('home') }}">
                <img class="img-responsive" src="{{ asset(sc_store('logo')) }}" alt="Logo" />
              </a>
              <div class="footer__info">Thái Hưng vững bước vươn ra biển lớn</div>
              <ul class="social-net list-inline">
                <li class="social-net__item"><a class="social-net__link text-primary_h" href="facebook.com"><i class="icon fa fa-facebook"></i></a>
                </li>
                <li class="social-net__item"><a class="social-net__link text-primary_h" href="twitter.com"><i class="icon fa fa-twitter"></i></a>
                </li>
                <li class="social-net__item"><a class="social-net__link text-primary_h" href="linkedin.com"><i class="icon fa fa-linkedin"></i></a>
                </li>
                <li class="social-net__item"><a class="social-net__link text-primary_h" href="instagram.com"><i class="icon fa fa-instagram"></i></a>
                </li>
                <li class="social-net__item"><a class="social-net__link text-primary_h" href="youtube.com"><i class="icon fa fa-youtube-play"></i></a>
                </li>
              </ul>
              <!-- end .social-list-->
            </div>
          </div>
          <div class="col-md-3">
            <section class="footer-section footer-section_list-columns">
              <h3 class="footer-section__title ui-title-inner">SẢN PHẨM MỚI</h3>
              <ul class="footer-list list-unstyled">
                @foreach($footerProductsNew as $productNew)
                  <li class="footer-list__item"><a class="footer-list__link" href="{{$productNew->getUrl()}}">{{$productNew->name}}</a></li>
                @endforeach
              </ul>
            </section>
          </div>
          <div class="col-md-3">
            <section class="footer-section footer-section_list-one">
              <h3 class="footer-section__title ui-title-inner">SẢN PHẨM NỔI BẬT</h3>
              <ul class="footer-list list-unstyled">
                @foreach($footerProductsHot as $productHot)
                <li class="footer-list__item"><a class="footer-list__link" href="{{$productHot->getUrl()}}">{{$productHot->name}}</a></li>
                @endforeach
              </ul>
            </section>
          </div>
          <div class="col-md-3">
            <section class="footer-section">
              <h3 class="footer-section__title ui-title-inner">LIÊN HỆ</h3>
              <div class="footer-contact footer-contact_lg">Gọi ngay: <span class="text-primary">{{ sc_store('phone') }}</span>
              </div>
              <div class="footer-contact"><i class="icon icon-xs fa fa-envelope-o"></i>{{ sc_store('email') }}</div>
              <div class="footer-contact"><i class="icon icon-lg fa fa-map-marker"></i>{{ sc_store('address') }}</div>
              <div class="footer-contact"><i class="icon fa fa-clock-o"></i>Mon - Fri : 0800am to 0500pm</div>
            </section>
          </div>
        </div>
      </div>
    </div>
    <div class="copyright">
      <div class="container">
        <div class="row">
          <div class="col-xs-12">Copyrights 2020<a class="copyright__brand" href="https://kennatech.vn"> KennaTech</a> All Rights Reserved
          </div>
        </div>
      </div>
    </div><span class="btn-up" id="toTop">TOP</span>
  </div>
</footer>
<!--//Footer-->
