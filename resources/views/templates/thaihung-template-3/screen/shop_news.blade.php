@php
/*
$layout_page = news_list
$news: paginate
Use paginate: $news->appends(request()->except(['page','_token']))->links()
$products: paginate
Use paginate: $products->appends(request()->except(['page','_token']))->links()
*/
@endphp

@extends($templatePath.'.layout')

@section('main')
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <main class="l-main-content">
                    <div class="posts-group-2">
                        @if($news->count()>0)
                            @foreach($news as $newsDetails)
                            <section class="b-post b-post-full clearfix">
                                <div class="entry-media">
                                    <a class="js-zoom-images" href="{{asset($newsDetails->getThumb())}}">
                                        <img width="100%" class="img-responsive" src="{{asset($newsDetails->getThumb())}}" alt="{{$newsDetails->title}}" />
                                    </a>
                                </div>
                                <div class="entry-main">
                                    <div class="entry-meta">
                                        <div class="entry-meta__group-left"><span class="entry-meta__item">Post by<a class="entry-meta__link" >Admin</a></span><span class="entry-meta__item">On<a class="entry-meta__link" href="blog-main.html"> {{$newsDetails->created_at->format('d-m-Y')}}</a></span>
{{--                                            <span class="entry-meta__categorie bg-primary">Ford News</span>--}}
                                        </div>
                                        <div class="entry-meta__group-right">
{{--                                            <span class="entry-meta__item"><i class="icon fa fa-heart"></i><a class="entry-meta__link" href="blog-main.html"> 205</a></span>--}}
{{--                                            <span class="entry-meta__item"><i class="icon fa fa-comment-o"></i>Comments<a class="entry-meta__link" href="blog-main.html"> 518</a></span>--}}
                                        </div>
                                    </div>
                                    <div class="entry-header">
                                        <h2 class="entry-title"><a href="{{$newsDetails->getUrl()}}">{{$newsDetails->title}}</a></h2>
                                    </div>
                                    <div class="entry-content">
                                        <p>{{$newsDetails->description}}</p>
                                    </div>
                                    <div class="entry-footer"><a class="btn btn-default" href="{{$newsDetails->getUrl()}}">ĐỌC THÊM</a>
                                    </div>
                                </div>
                            </section>
                            @endforeach
                        @endif
                        <!-- end .post-->
{{--                        <div class="b-bnr-3">--}}
{{--                            <div class="b-bnr-3__title">We offers the lowest car prices</div>--}}
{{--                            <div class="b-bnr-3__info"><span class="b-bnr-3__info-item">Post by Thomas Neil</span><span class="b-bnr-3__info-item">On August 22, 2017</span><a class="btn btn-primary" href="blog-post.html">Ford News</a>--}}
{{--                            </div>--}}
{{--                        </div>--}}
                        <!-- end .b-banner-->
                    </div>

                    <div class="sortPagiBar">
                        <div class="pagination-area " >
                            {{ $news->links() }}
                        </div>
                    </div>
                </main>
                <!-- end .l-main-content-->
            </div>
            <div class="col-md-4">
                <aside class="l-sidebar-3">
{{--                    <div class="widget widget-searce">--}}
{{--                        <form class="form-sidebar" id="search-global-form">--}}
{{--                            <input class="form-sidebar__input form-control" type="search" placeholder="Search News ..." />--}}
{{--                            <button class="form-sidebar__btn"><i class="icon fa fa-search text-primary"></i>--}}
{{--                            </button>--}}
{{--                        </form>--}}
{{--                    </div>--}}
                    <!-- end .widget-->
{{--                    <section class="widget section-sidebar">--}}
{{--                        <h3 class="widget-title ui-title-inner">categories</h3>--}}
{{--                        <div class="widget-content">--}}
{{--                            <ul class="widget-list list list-mark-5">--}}
{{--                                <li class="widget-list__item"><a class="widget-list__link" href="blog-post.html">Ferrari</a>--}}
{{--                                </li>--}}
{{--                                <li class="widget-list__item"><a class="widget-list__link" href="blog-post.html">Volkswagen</a>--}}
{{--                                </li>--}}
{{--                                <li class="widget-list__item"><a class="widget-list__link" href="blog-post.html">Lamborghini</a>--}}
{{--                                </li>--}}
{{--                                <li class="widget-list__item"><a class="widget-list__link" href="blog-post.html">Austin Martin</a>--}}
{{--                                </li>--}}
{{--                                <li class="widget-list__item"><a class="widget-list__link" href="blog-post.html">Land Rover</a>--}}
{{--                                </li>--}}
{{--                                <li class="widget-list__item"><a class="widget-list__link" href="blog-post.html">McLaren</a>--}}
{{--                                </li>--}}
{{--                                <li class="widget-list__item"><a class="widget-list__link" href="blog-post.html">Mercedes-Benz</a>--}}
{{--                                </li>--}}
{{--                                <li class="widget-list__item"><a class="widget-list__link" href="blog-post.html">Buy or Sell Car</a>--}}
{{--                                </li>--}}
{{--                            </ul>--}}
{{--                        </div>--}}
{{--                    </section>--}}
                    <!-- end .widget-->
                    <section class="widget section-sidebar">
                        <h3 class="widget-title ui-title-inner">Bài viết mới nhất</h3>
                        <div class="widget-content">
                            @if($news->count()>0)
                                @foreach($news as $new_re)
                                  <div class="post-widget clearfix">
                                    <div class="post-widget__media">
                                        <a href="blog-post.html">
                                            <img class="img-responsive" src="{{asset($new_re->getThumb())}}" alt="foto" />
                                        </a>
                                    </div>
                                    <div class="post-widget__inner"><a class="post-widget__title" href="{{asset($new_re->getUrl())}}">{{$new_re->title}}</a>
                                        <div class="post-widget__date">On
                                            <time class="post-widget__time" datetime="2017-10-27 15:20">{{$new_re->created_at->format('d-m-Y')}}</time>
                                        </div>
                                    </div>
                                    <!-- end .widget-post-->
                                </div>
                                @endforeach
                            @endif
                        </div>
                    </section>
                    <!-- end .widget-->
{{--                    <section class="widget section-sidebar">--}}
{{--                        <h3 class="widget-title ui-title-inner">TAGs WIDGET</h3>--}}
{{--                        <div class="widget-content">--}}
{{--                            <ul class="list-tags list-unstyled">--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">Car Dealer</a>--}}
{{--                                </li>--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">Ferrari</a>--}}
{{--                                </li>--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">Buy Car</a>--}}
{{--                                </li>--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">Sell Your Car</a>--}}
{{--                                </li>--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">Latest Cars</a>--}}
{{--                                </li>--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">SUV’s</a>--}}
{{--                                </li>--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">Latest Vehicles</a>--}}
{{--                                </li>--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">Automobile</a>--}}
{{--                                </li>--}}
{{--                                <li class="list-tags__item"><a class="list-tags__link" href="blog-main.html">Truck</a>--}}
{{--                                </li>--}}
{{--                            </ul>--}}
{{--                        </div>--}}
{{--                    </section>--}}
{{--                    <!-- end .widget-->--}}
{{--                    <section class="widget widget-gallery section-sidebar">--}}
{{--                        <h3 class="widget-title ui-title-inner">instagram feed</h3>--}}
{{--                        <div class="widget-content">--}}
{{--                            <div class="js-zoom-gallery">--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/1.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/1.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/2.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/2.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/3.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/3.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/4.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/4.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/5.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/5.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/6.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/6.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/7.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/7.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/8.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/8.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                <div class="widget-gallery__item">--}}
{{--                                    <a class="widget-gallery__img js-zoom-gallery__item" href="assets/media/content/gallery/100x80/9.jpg">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/gallery/100x80/9.jpg" alt="foto" />--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </section>--}}
{{--                    <div class="widget widget-newsletter section-sidebar">--}}
{{--                        <h3 class="widget-title ui-title-inner">newsletter</h3>--}}
{{--                        <div class="widget-content">--}}
{{--                            <p>Duis aute irure reprehender voluptate velit ese acium fugiat nulla pariatur lorem excepteur ipsum</p>--}}
{{--                            <form class="form-sidebar" id="newsletter-form">--}}
{{--                                <input class="form-sidebar__input form-control" type="text" placeholder="Email address" />--}}
{{--                                <button class="form-sidebar__btn"><i class="icon fa fa-envelope-open text-primary"></i>--}}
{{--                                </button>--}}
{{--                            </form>--}}
{{--                        </div>--}}
{{--                    </div>--}}
                    <!-- end .widget-->
                </aside>
                <!-- end .sidebar-->
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
                        <li><a href="{{route('home') }}"><i class="icon fa fa-home"></i></a>
                        </li>
                        <li class="active">{{ $title }}</li>
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
      {{-- script --}}
@endpush
