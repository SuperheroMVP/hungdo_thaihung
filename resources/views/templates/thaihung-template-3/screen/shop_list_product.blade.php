@php
    /*
    $layout_page = product_list
    $itemsList: paginate
    Use paginate: $itemsList->appends(request()->except(['page','_token']))->links()
    $products: paginate
    Use paginate: $products->appends(request()->except(['page','_token']))->links()
    */
    $categories = $modelCategory->start()->getList(['sc_status' => 1]);
    $categoriesTop = $modelCategory->start()->getCategoryTop()->getData();
    $list_brands = $modelBrand->start()->getData();

@endphp

@extends($templatePath.'.layout')

@section('center')
<style type="text/css">
    .sidebar-container {
        background-color: #fff;
        box-shadow: 0 0 15px 0 rgba(247, 245, 245, 0.77);
        position: relative;      
    }
    .sidebar-product ul li{
       list-style: none;
    
    }
   .sidebar-product ul li a{
     font-size: 15px;
      font-weight: 700;
      padding: 8px 0px 8px 15px;
      display: block;
    }
    .sidebar-product ul li a:hover{
       background: #eee;
    }
    .sidebar-static.d-none-static{
        display: none
    }
    .sidebar-fixed{
        display: none;
    }
    .sidebar-fixed.d-block-fixed{
         display: block;
        position: fixed;
        top: 110px;
        width: 260px;
        padding-right: 0px!important;
        padding-left: 0px!important;
        animation: 0.5s show_sidebar forwards;
    }
    @keyframes show_sidebar {
        0%{
            transform: translateY(-100px);
            opacity: 0;
        }
        100%{
            opacity: 1;
            transform: translateY(0px);

        }
    }
    .photo-box.small {
        height: 200px;
        margin-bottom: 30px;
    }
    .photo-box.small:hover {
      transform: translateY(-5px);
    }
    .photo-box:hover {
      box-shadow: 0 4px 12px rgba(42,65,232,0.25);
    }
    .photo-box:hover::before {
        opacity: 0.65;
        background-color: #ff8d0042!important;
    }
    .photo-box {
        border-radius: 4px;
        height: 360px;
        display: block;
        position: relative;
        background-size: cover;
        background-position: 100%;
        box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        transition: 0.4s;
        margin: 0 0 25px 0;
    }
    .photo-box:before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        background: #333;
        opacity: 0.5;
        border-radius: 4px;
        transition: 0.4s;
    }
    .photo-box.small .photo-box-content {
        position: absolute;
        left: 0;
        right: 0;
        margin: 0 auto;
        text-align: center;
        bottom: auto;
        top: 50%;
        transform: translateY(-49%); 
    }
    .photo-box.small .photo-box-content h3 {
        color: #fff;
        font-weight: 600;
    }
    .photo-box-content span{
        color: #fff;
    }
    .product_us{
        margin: 20px 0px 0px 0pxs;
        text-align: center;
        font-size: 20px;
        font-weight: 400;
    }
    .mt-20{
        margin-top:20px;
    }
</style>
{{--  <div class="section" style="height: 600px;background-image: url('https://steelonline.vn/steel_online/static/img/bg/mainbanner-bg4-new.jpg');"> --}}
<div class="section" style="height: 600px;background-image: url('https://steelonline.vn/steel_online/static/img/bg/mainbanner-bg4-new.jpg');">
     <div class="container">
           <div class="row">
                <div class="col-xl-12 col-md-12 col-xs-12 col-12 mt-3 text-center mb-3">
                     <h2 class="product_us">SẢN PHẨM CỦA CHÚNG TÔI</h2>
                     <div class="ui-decor"></div>
                 </div>
                 <div class="col-xl-3 col-md-3">
                    <div class="sidebar-static">
                         <div class="sidebar-container">
                             <div class="sidebar-product">                 
                                <ul style="margin:0!important;padding: 0px!important;">
                                    @if($list_brands->count())
                                        @foreach($list_brands as $brand)
                                              <li><a href="#">{{$brand->name}}</a></li>
                                        @endforeach
                                    @endif
                                </ul>                    
                             </div>
                         </div>
                     </div>
                     <div class="sidebar-fixed">
                        <div class="sidebar-container">
                         <div class="sidebar-product">                 
                            <ul style="margin:0!important;padding: 0px!important;">
                                @if($list_brands->count())
                                    @foreach($list_brands as $brand)
                                          <li><a href="#">{{$brand->name}}</a></li>
                                    @endforeach
                                @endif
                            </ul>                    
                         </div>
                     </div>
                     </div>
                 </div>
                 <div class="col-xl-9 col-md-9" >
                     <div class="row mt-20">
                        @if ($categoriesTop->count())
                           @foreach ($categoriesTop as $category)                   
                                 <div class="col-xl-6 col-md-6">
                                    <a class="photo-box small" href="#" style="background-image: url({{asset($category->image)}});">
                                        <div class="photo-box-content">
                                          {{--   {{dd($category)}} --}}
                                            <h3>{{ $category->title }}</h3>
                                            <span>{{count($category->productDescription)}} sản phẩm</span> <br>
                                            <span>
                                                @if(!empty($categories[$category->id]))
                                                     @foreach ($categories[$category->id] as $cateChild)
                                                      {{ $cateChild->title }},
                                                     @endforeach
                                                 @endif
                                            </span>
                                        </div>
                                    </a>
                                </div>                                     
                            @endforeach
                        @endif
                     </div>
                 </div>
           </div>
     </div>
 </div>
@endsection




@section('breadcrumb')
    <div class="bg-grey">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="home.html"><i class="icon fa fa-home"></i></a>
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
        $(function(){
              $(window).scroll(function(event) {
                console.log('Chay den vi tri:');
                console.log($('html,body').scrollTop());
                var vitri=$('html,body').scrollTop();

                if(vitri>=800){
                  $('.sidebar-static').addClass('d-none-static');
                  $('.sidebar-fixed').addClass('d-block-fixed');
                }
                if(vitri<800){
                  $('.sidebar-static').removeClass('d-none-static');
                  $('.sidebar-fixed').removeClass('d-block-fixed');
                }

             })
        });
    </script>
@endpush
