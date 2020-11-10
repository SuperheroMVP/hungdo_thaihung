@php
    /*
    $layout_page = product_detail
    $product: no paginate
    $productRelation: no paginate
    */
@endphp

@extends($templatePath.'.layout')

{{-- @section('center')
    <main class="l-main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <section class="b-car-details">
                        <div class="b-car-details__header">

                            <h2 class="b-car-details__title">{{$product->name}}</h2>

                            <div class="b-car-details__links">
                                <a class="b-car-details__link" href="#">
                                    <i class="icon fa fa-share-alt text-primary"></i> Share
                                </a>
                            </div>
                        </div>

                        <div class="slider-car-details slider-pro" id="slider-car-details">
                            <div class="sp-slides">
                                @if($product->images->count()>0)
                                    @foreach($product->images  as $image)
                                        <div class="sp-slide">
                                            <img class="sp-image" src="{{asset($image->getImage())}}" alt="img"/>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                            <div class="sp-thumbnails">
                                @if($product->images->count()>0)
                                    @foreach($product->images  as $image)
                                        <div class="sp-thumbnail">
                                            <img class="img-responsive" src="{{asset($image->getImage())}}" alt="img"/>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>

                        <ul class="b-car-details__nav nav nav-tabs bg-primary">
                            <li class="active"><a href="#specifications" data-toggle="tab">Thông tin chung</a></li>
                            <li><a href="#details" data-toggle="tab">Thông số kỹ thuật</a></li>
                        </ul>
                        <div class="b-car-details__tabs tab-content">
                            <div class="tab-pane active fade in" id="specifications">
                              {!! $product->general_details !!}
                            </div>
                            <div class="tab-pane fade" id="details">
                                {!! $product->content !!}
                            </div>

                        </div>
                    </section>
                </div>
                <div class="col-md-4">
                    <aside class="l-sidebar-2">
                            <div class="b-car-info">

                                <div class="b-car-info__price">Thông số sản phẩm</div>
                                <dl class="b-car-info__desc dl-horizontal bg-grey">
                                    <dt class="b-car-info__desc-dt">Chiều Dài</dt>
                                    <dd class="b-car-info__desc-dd">{{$product->length}} {{$product->length_class}}</dd>
                                    <dt class="b-car-info__desc-dt">Chiều Rộng</dt>
                                    <dd class="b-car-info__desc-dd">{{$product->width}} {{$product->length_class}}</dd>
                                    <dt class="b-car-info__desc-dt">Chiều Cao</dt>
                                    <dd class="b-car-info__desc-dd">{{$product->height}} {{$product->length_class}} </dd>
                                    <dt class="b-car-info__desc-dt">Kích Thước</dt>
                                    <dd class="b-car-info__desc-dd">0</dd>
                                    <dt class="b-car-info__desc-dt">Màu Sắc</dt>
                                    <dd class="b-car-info__desc-dd">Xám</dd>
                                    <dt class="b-car-info__desc-dt">Cân Nặng</dt>
                                    <dd class="b-car-info__desc-dd">{{$product->weight}} {{$product->weight_class}}</dd>
                                </dl>

                            </div>
                            <form class="b-calculator" id="buy_block" action="{{ route('cart.add') }}" method="post">
                                @csrf
                                 <input type="hidden" name="product_id" id="product-detail-id" value="{{ $product->id }}"/>
                                <div class="b-calculator__header"><span class="icon-cart"><i class="fa fa-shopping-cart"></i></span>
                                    <div class="b-calculator__header-inner">
                                        <div class="b-calculator__name">{{$product->name}}</div>

                                    </div>
                                </div>
                                <div id="product-detail-attr">
                                    @if ($product->attributes())
                                        {!! $product->renderAttributeDetails() !!}
                                    @endif
                                </div>
                                <div class="b-calculator__group">
                                    <div class="b-calculator__label">Số lượng</div>
                                    <input class="b-calculator__input form-control"  type="number" name="qty" value="1" min="1" />
                                </div>

                                <button type="submit" class="btn btn-warning form-control"> <i class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</button>
                            </form>

                            <div class="b-bnr-2">
                                <div class="b-bnr-2__icon flaticon-smartphone"></div>
                                <div class="b-bnr-2__inner">
                                    <div class="b-bnr-2__title">GỌI NGAY: </div>
                                    <div class="b-bnr-2__info">{{sc_store('phone')}}</div>
                                </div>
                            </div>
                    </aside>
                </div>
            </div>
        </div>
        <!-- end .b-car-details-->
        <section class="section-default_top">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="ui-title-block">Sản Phẩm Liên Quan</h2>
                        <div class="ui-decor"></div>
                        <div class="related-carousel owl-carousel owl-theme owl-theme_w-btn enable-owl-carousel"
                             data-min768="2" data-min992="3" data-min1200="3" data-margin="30" data-pagination="false"
                             data-navigation="true" data-auto-play="4000" data-stop-on-hover="true">
                            @if($relateProducts->count())
                                @foreach($relateProducts as $key =>$product)
                                    <div class="b-goods-feat">
                                        <div class="b-goods-feat__img">
                                            <img class="img-responsive" src="{{asset($product->image)}}" alt="foto"/>
                                        </div>
                                        <ul class="b-goods-feat__desc list-unstyled">
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Chiều Rộng:</span>{{$product->width}} {{$product->length_class}} </li>
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Chiều Dài:</span> {{$product->height}} {{$product->length_class}}</li>
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Cân nặng:</span> {{$product->weight}} {{$product->weight_class}}
                                            </li>
                                        </ul>
                                        <h3 class="b-goods-feat__name"><a
                                                    href="{{$product->getUrl()}}">{{$product->name}}</a></h3>
                                        <div class="b-goods-feat__info">{{$product->description}}</div>
                                    </div>
                            @endforeach
                        @endif
                 
                        </div>
                     
                    </div>
                </div>
            </div>
        </section>

    </main>

@endsection --}}

@section('center')
<style type="text/css">
table tr td {
    padding: 5px;
    border-bottom: 1px solid #777;
   }
   .d-flex.justify-content-between {
    justify-content: space-between!important;
    display: flex;
   }
    .d-flex.justify-content-center {
    justify-content: center!important;
    display: flex;
   }
   .choose-qty{
    margin: 5px 0px;
   }
   .info-diameter{
    margin-left: 10px;
    font-size: 18px;
    font-weight: 500;
   }
</style>
    <main class="l-main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <section class="b-car-details">
                        <div class="b-car-details__header">

                            <h2 class="b-car-details__title">{{$product->name}}</h2>

                            <div class="b-car-details__links">
                                <a class="b-car-details__link" href="#">
                                    <i class="icon fa fa-share-alt text-primary"></i> Share
                                </a>
                            </div>
                        </div>

                        <div class="slider-car-details slider-pro" id="slider-car-details">
                            <div class="sp-slides">
                                @if($product->images->count()>0)
                                    @foreach($product->images  as $image)
                                        <div class="sp-slide" style="width: 500px!important">
                                            <img class="sp-image" src="{{asset($image->getImage())}}" alt="img"/>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                            <div class="sp-thumbnails">
                                @if($product->images->count()>0)
                                    @foreach($product->images  as $image)
                                        <div class="sp-thumbnail">
                                            <img class="img-responsive" src="{{asset($image->getImage())}}" alt="img"/>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>

                        <ul class="b-car-details__nav nav nav-tabs bg-primary">
                            <li class="active"><a href="#specifications" data-toggle="tab">Thông tin chung</a></li>
                            <li><a href="#details" data-toggle="tab">Hưỡng dẫn mua hàng</a></li>
                        </ul>
                        <div class="b-car-details__tabs tab-content">
                            <div class="tab-pane active fade in" id="specifications">
                              {{-- {!! $product->general_details !!} --}}
                              <table  style="width: 100%;" class="product-data  margin-bottom-10">
                                <tbody>
                                    
                                        <tr>
                                            <td width="32%"> </td>
                                            <td width="68%"> </td>
                                        </tr>

                                    
                                        <tr>
                                            <td width="32%">Đường kính </td>
                                            <td width="68%">D6, D8, D8 gai, D10 </td>
                                        </tr>

                                    
                                        <tr>
                                            <td width="32%">Đường kính cuộn thép </td>
                                            <td width="68%">1,2m </td>
                                        </tr>

                                    
                                        <tr>
                                            <td width="32%">Bề mặt </td>
                                            <td width="68%">Sáng bóng </td>
                                        </tr>

                                    
                                        <tr>
                                            <td width="32%">Tiết diện </td>
                                            <td width="68%">Rất tròn, độ ovan nhỏ </td>
                                        </tr>

                                    
                                        <tr>
                                            <td width="32%">Trọng lượng </td>
                                            <td width="68%">1000kg - 2100kg </td>
                                        </tr>

                                    
                                        <tr>
                                            <td width="32%">Tiêu chuẩn </td>
                                            <td width="68%">JIS (Nhật Bản), ATMS (Hoa Kỳ), BS (Anh), TCVN (Việt Nam),... </td>
                                        </tr>

                                    
                                </tbody>
                            </table>
                            </div>
                            <div class="tab-pane fade" id="details">
                                {!! $product->content !!}
                            </div>

                        </div>
                    </section>
                </div>
                <div class="col-md-5">
                    <aside class="l-sidebar-2">
{{--                             <div class="b-car-info">

                                <div class="b-car-info__price">Thông số sản phẩm</div>
                                <dl class="b-car-info__desc dl-horizontal bg-grey">
                                    <dt class="b-car-info__desc-dt">Chiều Dài</dt>
                                    <dd class="b-car-info__desc-dd">{{$product->length}} {{$product->length_class}}</dd>
                                    <dt class="b-car-info__desc-dt">Chiều Rộng</dt>
                                    <dd class="b-car-info__desc-dd">{{$product->width}} {{$product->length_class}}</dd>
                                    <dt class="b-car-info__desc-dt">Chiều Cao</dt>
                                    <dd class="b-car-info__desc-dd">{{$product->height}} {{$product->length_class}} </dd>
                                    <dt class="b-car-info__desc-dt">Kích Thước</dt>
                                    <dd class="b-car-info__desc-dd">0</dd>
                                    <dt class="b-car-info__desc-dt">Màu Sắc</dt>
                                    <dd class="b-car-info__desc-dd">Xám</dd>
                                    <dt class="b-car-info__desc-dt">Cân Nặng</dt>
                                    <dd class="b-car-info__desc-dd">{{$product->weight}} {{$product->weight_class}}</dd>
                                </dl>

                            </div> --}}
                            <div class="b-car-info">
                                <div class="b-car-info__price">Lựa chọn kích thước</div>
                            </div>
                            <form class="b-calculator" id="buy_block" action="{{ route('cart.add') }}" method="post">
                                @csrf
                                 <input type="hidden" name="product_id" id="product-detail-id" value="{{ $product->id }}"/>
                                <div class="b-calculator__header"><span class="icon-cart"><i class="fa fa-shopping-cart"></i></span>
                                    <div class="b-calculator__header-inner">
                                        <div class="b-calculator__name">{{$product->name}}</div>
                                    </div>
                                </div>
                                <div id="product-detail-attr" style="width: 350px;">
                                    @if ($product->attributes())
                                        {!! $product->renderAttributeDetailsQty() !!}
                                    @endif
{{--                                     <div class="choose-qty d-flex justify-content-between">
                                        <div><input type="checkbox" class="check-qty"><span class="info-diameter">50mm</span></div>
                                        <div>
                                            <input disabled="disabled" class="quantity b-calculator__input form-control"  type="number" name="choose_qty" value="1" min="1" />
                                        </div>
                                    </div>
                                     <div class="choose-qty d-flex justify-content-between">
                                        <div><input type="checkbox"  class="check-qty"><span class="info-diameter">50mm</span></div>
                                        <div>
                                            <input disabled="disabled" class="quantity b-calculator__input form-control"  type="number" name="choose_qty" value="1" min="1" />
                                        </div>
                                    </div>
                                    <div class="choose-qty d-flex justify-content-between">
                                        <div><input type="checkbox" class="check-qty"><span class="info-diameter">50mm</span></div>
                                        <div>
                                            <input disabled="disabled" class="quantity b-calculator__input form-control"  type="number" name="choose_qty" value="1" min="1" />
                                        </div>
                                    </div> --}}

                                </div>
                                <div class="b-calculator__group">
                                    <div class="b-calculator__label">Số lượng</div>
                                    <input class="sum-quantity b-calculator__input form-control"  type="number" name="qty" value="1" min="1" />
                                </div>

                                <button type="submit" class="btn btn-warning form-control"> <i class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</button>
                            </form>

                            <div class="b-bnr-2">
                                <div class="b-bnr-2__icon flaticon-smartphone"></div>
                                <div class="b-bnr-2__inner">
                                    <div class="b-bnr-2__title">GỌI NGAY: </div>
                                    <div class="b-bnr-2__info">{{sc_store('phone')}}</div>
                                </div>
                            </div>
                    </aside>
                </div>
            </div>
        </div>
        <!-- end .b-car-details-->
        <section class="section-default_top">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="ui-title-block">Sản Phẩm Liên Quan</h2>
                        <div class="ui-decor"></div>
                        <div class="related-carousel owl-carousel owl-theme owl-theme_w-btn enable-owl-carousel"
                             data-min768="2" data-min992="3" data-min1200="3" data-margin="30" data-pagination="false"
                             data-navigation="true" data-auto-play="4000" data-stop-on-hover="true">
                            @if($relateProducts->count())
                                @foreach($relateProducts as $key =>$product)
                                    <div class="b-goods-feat">
                                        <div class="b-goods-feat__img">
                                            <img class="img-responsive" src="{{asset($product->image)}}" alt="foto"/>
                                        </div>
                                        <ul class="b-goods-feat__desc list-unstyled">
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Chiều Rộng:</span>{{$product->width}} {{$product->length_class}} </li>
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Chiều Dài:</span> {{$product->height}} {{$product->length_class}}</li>
                                            <li class="b-goods-1__desc-item"><span
                                                        class="hidden-th">Cân nặng:</span> {{$product->weight}} {{$product->weight_class}}
                                            </li>
                                        </ul>
                                        <h3 class="b-goods-feat__name"><a
                                                    href="{{$product->getUrl()}}">{{$product->name}}</a></h3>
                                        <div class="b-goods-feat__info">{{$product->description}}</div>
                                    </div>
                            @endforeach
                        @endif
                 
                        </div>
                     
                    </div>
                </div>
            </div>
        </section>

    </main>

@endsection

@section('breadcrumb')
    <div class="bg-grey">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="home.html"><i class="icon fa fa-home"></i></a>
                        </li>
                        <li><a href="/products">Sản Phẩm</a>
                        </li>
                        <li class="active">{{$title}}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('styles')
    {{-- style css --}}
@endpush

@push('scripts')
    <script type="text/javascript">
        $(document).ready(function(){

            $('.check-qty').click(function(){
                $(this).parents('.choose-qty').find('.quantity').prop('disabled',!$(this).prop('checked'));
            });
        
        });

        $(document).on('change','input.quantity,input.check-qty',function(){
            $('.sum-quantity').val(caculator());
        });

       function caculator()
       {
            // console.log($('input.quantity:enabled'));
            // return;
            let sum = 0;
            $.each($('input.quantity:enabled'),function(index, element){
                // console.log($(element).val());
                  sum += parseInt($(element).val());
            });
            return sum;
       }

        $('.sc-product-group').click(function (event) {
            if ($(this).hasClass('active')) {
                return;
            }
            $('.sc-product-group').removeClass('active');
            $(this).addClass('active');
            var id = $(this).data("id");
            $.ajax({
                url: '{{ route("product.info") }}',
                type: 'POST',
                dataType: 'json',
                data: {id: id, "_token": "{{ csrf_token() }}"},
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    //console.log(data);
                    var showImages = '<div class="carousel-inner">' +
                        '<div class="view-product item active"  data-slide-number="0">' +
                        '<img src="' + data.image + '" alt="">' +
                        '</div>';
                    if (data.subImages.length) {
                        $.each(data.subImages, function (index, value) {
                            showImages += '<div class="view-product item"  data-slide-number="' + (index + 1) + '">' +
                                '<img src="' + value + '" alt="">' +
                                '</div>'
                        });
                    }
                    showImages += '</div>';
                    if (data.subImages.length) {
                        showImages += '<a class="left item-control" href="#similar-product" data-slide="prev">' +
                            '<i class="fa fa-angle-left"></i></a>' +
                            '<a class="right item-control" href="#similar-product" data-slide="next">' +
                            '<i class="fa fa-angle-right"></i>' +
                            '</a>';
                    }
                    $('#product-detail-cart-group').show();
                    $('#product-detail-name').html(data.name);
                    $('#product-detail-model').html(data.sku);
                    $('#product-detail-price').html(data.showPrice);
                    $('#product-detail-brand').html(data.brand_name);
                    $('#product-detail-image').html(showImages);
                    $('#product-detail-available').html(data.availability);
                    $('#product-detail-id').val(data.id);
                    $('#product-detail-image').carousel();
                    $('#loading').hide();
                    window.history.pushState("", "", data.url);
                }
            });

        });
    </script>
@endpush
