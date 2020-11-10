<!--Footer-->
@php
  $categories = $modelCategory->start()->getList(['status' => 1]);
  $categoriesTop = $modelCategory->start()->getCategoryTop()->getData();
@endphp
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

<footer id="footer" class="footer azirspares-footer empty-footer">
  <div class="top-footer">
    <div class="container">
      <div class="row">
        <div class="  col-sm-12 col-md-4">
          <div class="logo align_center">

            <figure class="wpb_wrapper vc_figure">
              <div class="vc_single_image-wrapper   vc_box_border_grey">
                <a href="{{ route('home') }}"><img style="width:120px" alt="Thái Hưng" src="{{  asset(sc_store('logo')) }}" class="logo"></a>
              </div>
            </figure>
          </div>
          <div class="azirspares-iconbox style18 dark">
            <div class="iconbox-inner">
                                        <span class="icon">
                                <span class="flaticon-telephone"></span>
                                        </span>
              <div class="iconbox-wrap">
                <h4 class="title">
                  Hỗ trợ &amp; Đặt hàng </h4>
                <p class="desc">{{ sc_store('phone') }}</p>
              </div>
            </div>
          </div>

        </div>
        <div class="  col-sm-12 col-md-4 ">
          <div class="column-inner vc_custom_1542706740699">
            <div class="wpb_wrapper">
              <div class="azirspares-heading default dark   ">
                <div class="heading-inner">
                  <div class="header-wrap">
                    <h3 class="title">
                      <span>CÁC DỊCH VỤ</span>
                    </h3>
                  </div>
                </div>
              </div>
              <div class="row wpb_row vc_inner row-fluid">
                <div class="wpb_column column_container col-sm-6">
                  <div class="column-inner">
                    <div class="wpb_wrapper">
                      <div class="azirspares-listing style1 dark    azirspares_custom_5bf4ad006c52a famiau_custom_5bf4acffd2efc ">
                        <div class="listing-inner">
                          <div class="listing-thumb">
                          </div>
                          <ul class="listing-list equal-elem ">
                            @if (!empty($layoutsUrl['footer']))
                              @foreach ($layoutsUrl['footer'] as $url)
                                <li class=""><a href="{{ sc_url_render($url->url) }}"  {{ ($url->target =='_blank')?'target=_blank':''  }}>{{ sc_language_render($url->name) }}</a></li>
                              @endforeach
                            @endif
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="wpb_column column_container col-sm-6">
                  <div class="column-inner">
                    <div class="wpb_wrapper">
                      <div class="azirspares-listing style1 dark azirspares_custom_5bf4ad006c570 famiau_custom_5bf4acffd2f39 ">
                        <div class="listing-inner">
                          <div class="listing-thumb">
                          </div>
                          <ul class="listing-list equal-elem ">
                            @if ($categoriesTop->count())
                              @foreach ($categoriesTop as $key => $category)
                              <li class="">
                                <a href="{{$category->getUrl()}}" >{{ $category->title }}</a>
                              </li>
                              @endforeach
                            @endif
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="  col-sm-12 col-md-4  ">
          <div class="column-inner vc_custom_1542706775321">
            <div class="wpb_wrapper">
              <div class="azirspares-heading default dark   vc_custom_1535163144667 azirspares_custom_5bf4ad006c5ea vc_custom_1535163144667 vc_custom_1535163144667 vc_custom_1535163144696 vc_custom_1535163144667 vc_custom_1535163144667 vc_custom_1535163144696 ">
                <div class="heading-inner">
                  <div class="header-wrap">
                    <h3 class="title">
                      <span>Về chúng tôi</span>
                    </h3>
                  </div>
                </div>
              </div>
              <div class="azirspares-iconbox style2 dark   ">
                <div class="iconbox-inner">
                                        <span class="icon">
                                <span class="flaticon-localization"></span>
                                        </span>
                  <div class="iconbox-wrap">
                    <p class="desc">{{ sc_store('address') }}</p>
                  </div>
                </div>
              </div>
              <div class="azirspares-iconbox style2 dark ">
                <div class="iconbox-inner">
                                        <span class="icon">
                                <span class="flaticon-email"></span>
                                        </span>
                  <div class="iconbox-wrap">
                    <p class="desc">{{ sc_store('email') }}</p>
                  </div>
                </div>
              </div>
              <div class="azirspares-iconbox style2 dark     ">
                <div class="iconbox-inner">
                                        <span class="icon">
                                <span class="fa fa-phone"></span>
                                        </span>
                  <div class="iconbox-wrap">
                    <p class="desc">{{ sc_store('phone') }}</p>
                  </div>
                </div>
              </div>
              <div class="azirspares-socials default dark  ">
                <div class="content-socials">
                  <ul class="socials-list">
                    <li>
                      <a href="mailto:{{ sc_store('email') }}" target="_blank">
                        <i class="fa fa-envelope"></i>
                        <span class="text">Mail</span>
                      </a>
                    </li>
                    <li>
                      <a href="https://{{ sc_store('facebook') }}" target="_blank">
                        <i class="fa fa-facebook"></i>
                        <span class="text">Facebook</span>
                      </a>
                    </li>
                    <li>
                      <a href="https://{{ sc_store('youtube') }}" target="_blank">
                        <i class="fa fa-youtube"></i>
                        <span class="text">Youtube</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row-full-width vc_clearfix"></div>
    </div>
  </div>
  <div class="nav-footer">
    <p>Bản quyền © {{ date("Y") }} - Thuộc Công Ty CPTM <a href="{{ route('home') }}">Thái Hưng</a></p>
  </div>
</footer>

<!--//Footer-->
