  @php
    $categories = $modelCategory->start()->getList(['status' => 1]);
    $categoriesTop = $modelCategory->start()->getCategoryTop()->getData();
  @endphp
  
  @if ($categoriesTop->count())
      <div class="sidebar col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <div id="widget-area" class="widget-area shop-sidebar">
              <div id="woocommerce_product_categories-2" class="widget woocommerce widget_product_categories">
                  <h2 class="widgettitle">Danh mục sản phẩm<span class="arrow"></span></h2>
                  <ul class="product-categories">
                      @foreach ($categoriesTop as $key => $category)
                          <li class="cat-item cat-item-224 cat-parent {{ $category->alias.$key }}"><a
                                      href="{{ $category->getUrl() }}">{{ $category->title }}</a>
                              @if (!empty($categories[$category->id]))
                                  <span class="carets"></span>

                                  <ul class="children {{ $category->alias.$key }}">
                                      @foreach ($categories[$category->id] as $cateChild)
                                          <li class="cat-item cat-item-248"><a
                                                      href="{{ $cateChild->getUrl() }}">{{ $cateChild->title }}</a>
                                          </li>
                                      @endforeach
                                  </ul>
                              @endif
                          </li>
                      @endforeach
                  </ul>
              </div>
              <div id="prdctfltr-5" class="widget prdctfltr-widget">

                  <div class="prdctfltr_wc prdctfltr_woocommerce woocommerce prdctfltr_wc_widget pf_default      prdctfltr_round ">

                      <form action="#"
                            class="prdctfltr_woocommerce_ordering" method="get">

                          <div class="prdctfltr_filter_wrapper prdctfltr_columns_1" data-columns="1">

                              {{--<div class="prdctfltr_filter_inner">

                                  <div class="prdctfltr_filter prdctfltr_attributes prdctfltr_pa_type-product prdctfltr_single prdctfltr_text">
                                      <input name="pa_type-product" type="hidden">
                                      <div class="pf-help-title">
                                          <h2 class="widgettitle"><span class="prdctfltr_widget_title">Type			<i
                                                          class="prdctfltr-down"></i>
                                          </span><span class="arrow"></span></h2></div>
                                      <div class="prdctfltr_add_scroll">
                                          <div class="prdctfltr_checkboxes">
                                              <label class="prdctfltr_ft">
                                                  <input type="checkbox" value=""><span>None</span>
                                              </label>
                                              <label class="prdctfltr_ft">
                                                  <input type="checkbox" value=""><span>None</span>
                                              </label>
                                              <label class="prdctfltr_ft">
                                                  <input type="checkbox" value=""><span>None</span>
                                              </label>
                                              <label class="prdctfltr_ft">
                                                  <input type="checkbox" value=""><span>None</span>
                                              </label>
                                              <label class="prdctfltr_ft">
                                                  <input type="checkbox" value=""><span>None</span>
                                              </label>
                                          </div>
                                      </div>
                                  </div>

                              </div>--}}

                          </div>

                      </form>

                  </div>

              </div>
              <div id="media_image-2" class="widget widget_media_image"><img width="320" height="612"
                                                                             src="https://i.ibb.co/rbVC41M/1053.jpg"
                                                                             class="image wp-image-3563  attachment-full size-full lazy"
                                                                             alt=""
                                                                             style="max-width: 100%; height: auto; display: inline;"
                                                                             sizes="(max-width: 320px) 100vw, 320px"
                                                                             srcset="https://i.ibb.co/rbVC41M/1053.jpg">
              </div>
          </div>
      </div>

  @endif
