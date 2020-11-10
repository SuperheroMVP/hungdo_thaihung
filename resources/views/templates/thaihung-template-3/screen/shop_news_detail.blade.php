@php
/*
$layout_page = news_detail
$news: no paginate
*/
@endphp

@extends($templatePath.'.layout')

@section('main')

<section >
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <main class="l-main-content">
                    <article class="b-post b-post-full clearfix">
                        <div class="entry-media">
                            <a class="js-zoom-images" href="{{asset($news->image)}}">
                                <img class="img-responsive" src="{{asset($news->image)}}" alt="Foto" />
                            </a>
                        </div>
                        <div class="entry-main">
                            <div class="entry-meta">
                                <div class="entry-meta__group-left"><span class="entry-meta__item">Post by<a class="entry-meta__link">Admin </a></span><span class="entry-meta__item">On<a class="entry-meta__link" href="{{$news->getUrl()}}"> {{$news->created_at->format('d-m-Y')}}</a></span>

                                </div>
                                <div class="entry-meta__group-right"><span class="entry-meta__item"><i class="icon fa fa-heart"></i><a class="entry-meta__link" href="blog-main.html"> 205</a></span><span class="entry-meta__item"><i class="icon fa fa-comment-o"></i>Comments<a class="entry-meta__link" href="blog-main.html"> 518</a></span>
                                </div>
                            </div>
                            <div class="entry-header">
                                <h2 class="entry-title"><a href="blog-post.html">{{$news->title}}</a></h2>
                            </div>
                            <div class="entry-content">
                                <p>{{$news->description}}</p>
{{--                                <div class="b-blockquote b-blockquote-2">--}}
{{--                                    <blockquote>--}}
{{--                                        <p>Motorland uis aute irure reprehender voluptate velit dolore ese acium fugiat nulla pariatury lorem excepteur ipsum et dolore magna aliqua. Ut enim quis nos minim veniam quis nostrud exercitation ullamco--}}
{{--                                            laboris sed ipsum aliqua veniam.</p>--}}
{{--                                        <cite class="b-blockquote__cite" title="Blockquote Title"><span class="b-blockquote__author">James Liam</span></cite>--}}
{{--                                    </blockquote>--}}
{{--                                </div>--}}
                                <!-- end .b-blockquote-->
                                <h3 class="entry-title-inner">Nội Dung</h3>
                                <p>{!! sc_html_render($news->content) !!}</p>
{{--                                <div class="b-post__section">--}}
{{--                                    <div class="row">--}}
{{--                                        <div class="col-sm-6">--}}
{{--                                            <img class="img-post img-responsive" src="assets/media/content/posts/360x270/1.jpg" alt="foto" />--}}
{{--                                        </div>--}}
{{--                                        <div class="col-sm-6">--}}
{{--                                            <div class="b-post__group-1"><strong>Consectetur elit sed eiusmod tempor incididunt labore et dolore mag aliqua sed ipsum.</strong>--}}
{{--                                                <ul class="list list-mark-5 list_mark-prim">--}}
{{--                                                    <li>Drivetrain Oil Cooler: Auxiliary</li>--}}
{{--                                                    <li>Engine Alternator: 160 Amps</li>--}}
{{--                                                    <li>Exterior Mirrors Manual Folding</li>--}}
{{--                                                    <li>Seatbelts Seatbelt Warning Sensors</li>--}}
{{--                                                    <li>Front Headrests Adjustable</li>--}}
{{--                                                    <li>Cruise Control System</li>--}}
{{--                                                </ul>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
                            </div>
                        </div>
{{--                        <div class="entry-footer">--}}
{{--                            <div class="entry-footer__group"><i class="icon fa fa-tags text-primary"></i><span class="entry-footer__title">tags:</span><a class="entry-footer__tags" href="blog-post.html">Buy Car</a><a class="entry-footer__tags" href="blog-post.html">sell Car</a>--}}
{{--                                <a--}}
{{--                                    class="entry-footer__tags" href="blog-post.html">autos</a><a class="entry-footer__tags" href="blog-post.html">motors</a>--}}
{{--                            </div>--}}
{{--                            <div class="entry-footer__group"><i class="icon fa fa-share-alt text-primary"></i><a class="entry-footer__link" href="blog-post.html">Share This Post</a>--}}
{{--                            </div>--}}
{{--                        </div>--}}
                    </article>
                    <!-- end .post-->
{{--                    <div class="about-author bg-grey clearfix">--}}
{{--                        <div class="about-author__img">--}}
{{--                            <img class="img-responsive" src="assets/media/content/posts/about-author/1.jpg" alt="foto" />--}}
{{--                        </div>--}}
{{--                        <div class="about-author__inner"><span class="about-author__title">Author:<span class="about-author__name"> Andrew Burnett</span></span><span class="about-author__category">Senior Post Editor</span>--}}
{{--                            <div class="about-author__description">Elit sed do eiusmod tempor incididunt ut labort dolore magna aliqua enim ad min veniam exercitation ullamco laboris nisi ut aliquip exea comodo consequat. Duis aute irure dolor voluptate velit esse cillum dolore eu--}}
{{--                                fugiat nulla pariatur.</div>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                    <!-- end .about-author-->--}}
{{--                    <div class="post-carousel owl-carousel owl-theme enable-owl-carousel" data-min768="2" data-min992="2" data-min1200="2" data-margin="30" data-pagination="false" data-navigation="true" data-auto-play="4000" data-stop-on-hover="true">--}}
{{--                        <div class="b-post-nav__item"><span class="b-post-nav__img"><img class="img-responsive" src="assets/media/content/posts/360x180/1.jpg" alt="foto"/></span><span class="b-post-nav__inner"><span class="b-post-nav__title">2017 Mazda 6 quick take:<br>The enthusiast's midsize sedan</span>--}}
{{--                                    <a--}}
{{--                                        class="b-post-nav__btn btn btn-primary btn-xs" href="blog-post.html">Mazda Car</a>--}}
{{--                                        </span>--}}
{{--                        </div>--}}
{{--                        <div class="b-post-nav__item"><span class="b-post-nav__img"><img class="img-responsive" src="assets/media/content/posts/360x180/2.jpg" alt="foto"/></span><span class="b-post-nav__inner"><span class="b-post-nav__title">Meet the new Rolls-Royce Phantom: Built-in art gallery</span>--}}
{{--                                    <a--}}
{{--                                        class="b-post-nav__btn btn btn-primary btn-xs" href="blog-post.html">Rolls Royce</a>--}}
{{--                                        </span>--}}
{{--                        </div>--}}
{{--                        <div class="b-post-nav__item"><span class="b-post-nav__img"><img class="img-responsive" src="assets/media/content/posts/360x180/1.jpg" alt="foto"/></span><span class="b-post-nav__inner"><span class="b-post-nav__title">2017 Mazda 6 quick take:<br>The enthusiast's midsize sedan</span>--}}
{{--                                    <a--}}
{{--                                        class="b-post-nav__btn btn btn-primary btn-xs" href="blog-post.html">Mazda Car</a>--}}
{{--                                        </span>--}}
{{--                        </div>--}}
{{--                        <div class="b-post-nav__item"><span class="b-post-nav__img"><img class="img-responsive" src="assets/media/content/posts/360x180/2.jpg" alt="foto"/></span><span class="b-post-nav__inner"><span class="b-post-nav__title">Meet the new Rolls-Royce Phantom: Built-in art gallery</span>--}}
{{--                                    <a--}}
{{--                                        class="b-post-nav__btn btn btn-primary btn-xs" href="blog-post.html">Rolls Royce</a>--}}
{{--                                        </span>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                    <section class="section-comment">--}}
{{--                        <h2 class="ui-title-inner">2 comments</h2>--}}
{{--                        <ul class="comments-list list-unstyled">--}}
{{--                            <li>--}}
{{--                                <article class="comment clearfix">--}}
{{--                                    <div class="comment-face">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/posts/face/1.jpg" alt="face" />--}}
{{--                                    </div>--}}
{{--                                    <div class="comment-inner">--}}
{{--                                        <header class="comment-header">--}}
{{--                                            <cite class="comment-author">Darren Smith</cite><span class="comment-datetime">Posted On--}}
{{--                            <time datetime="2017-09-24T18:18"> 31 August at 3:50 PM</time></span><a class="comment-btn text-primary" href="blog-post.html"><i class="icon fa fa-reply"></i></a>--}}
{{--                                        </header>--}}
{{--                                        <div class="comment-body">--}}
{{--                                            <p>Elit sed do eiusmod tempor incididunt ut labort dolore magna aliqua enim ad min veniam dui sed exercitation ullamco laboris nisi ut aliquip exea comodo consequat.</p>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                </article>--}}
{{--                                <ul class="children list-unstyled">--}}
{{--                                    <li>--}}
{{--                                        <article class="comment clearfix">--}}
{{--                                            <div class="comment-face">--}}
{{--                                                <img class="img-responsive" src="assets/media/content/posts/face/2.jpg" alt="face" />--}}
{{--                                            </div>--}}
{{--                                            <div class="comment-inner">--}}
{{--                                                <header class="comment-header">--}}
{{--                                                    <cite class="comment-author">Robert Shaw</cite><span class="comment-datetime">Posted On--}}
{{--                                <time datetime="2017-09-24T18:18"> 31 August at 3:50 PM</time></span><a class="comment-btn text-primary" href="blog-post.html"><i class="icon fa fa-reply"></i></a>--}}
{{--                                                </header>--}}
{{--                                                <div class="comment-body">--}}
{{--                                                    <p>Elit sed do eiusmod tempor incididunt ut labort dolore magna aliqua enim ad min veniam dui sed exercitation ullamco laboris nisi ut aliquip exea comodo consequat.</p>--}}
{{--                                                </div>--}}
{{--                                            </div>--}}
{{--                                        </article>--}}
{{--                                    </li>--}}
{{--                                </ul>--}}
{{--                            </li>--}}
{{--                            <li>--}}
{{--                                <article class="comment clearfix">--}}
{{--                                    <div class="comment-face">--}}
{{--                                        <img class="img-responsive" src="assets/media/content/posts/face/1.jpg" alt="face" />--}}
{{--                                    </div>--}}
{{--                                    <div class="comment-inner">--}}
{{--                                        <header class="comment-header">--}}
{{--                                            <cite class="comment-author">Darren Smith</cite><span class="comment-datetime">Posted On--}}
{{--                            <time datetime="2017-09-24T18:18"> 31 August at 3:50 PM</time></span><a class="comment-btn text-primary" href="blog-post.html"><i class="icon fa fa-reply"></i></a>--}}
{{--                                        </header>--}}
{{--                                        <div class="comment-body">--}}
{{--                                            <p>Elit sed do eiusmod tempor incididunt ut labort dolore magna aliqua enim ad min veniam dui sed exercitation ullamco laboris nisi ut aliquip exea comodo consequat.</p>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                </article>--}}
{{--                            </li>--}}
{{--                        </ul>--}}
{{--                    </section>--}}
{{--                    <!-- end .section-comment-->--}}
{{--                    <section class="section-reply-form" id="section-reply-form">--}}
{{--                        <h2 class="ui-title-inner">Leave a comment</h2>--}}
{{--                        <form class="form-reply ui-form-2" action="#" method="post">--}}
{{--                            <div class="row">--}}
{{--                                <div class="col-md-5">--}}
{{--                                    <div class="form-group">--}}
{{--                                        <div class="ui-label">your name</div>--}}
{{--                                        <input class="form-control" type="text" />--}}
{{--                                    </div>--}}
{{--                                    <div class="form-group">--}}
{{--                                        <div class="ui-label">Email address</div>--}}
{{--                                        <input class="form-control" type="email" />--}}
{{--                                    </div>--}}
{{--                                    <div class="form-group">--}}
{{--                                        <div class="ui-label">phone</div>--}}
{{--                                        <input class="form-control" type="tel" />--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                                <div class="col-md-7">--}}
{{--                                    <div class="form-group">--}}
{{--                                        <div class="ui-label">your Comments</div>--}}
{{--                                        <textarea class="form-control" rows="9"></textarea>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="row">--}}
{{--                                <div class="col-xs-12">--}}
{{--                                    <div class="text-right">--}}
{{--                                        <button class="ui-form__btn btn btn-primary">submit</button>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </form>--}}
{{--                    </section>--}}
{{--                    <!-- end .section-reply-form-->--}}
                </main>
                <!-- end .l-main-content-->
            </div>
            <div class="col-md-4">
                <aside class="l-sidebar-3">

                    <!-- end .widget-->
                    <section class="widget section-sidebar">
                        <h3 class="widget-title ui-title-inner">Bài viết mới nhất</h3>
                        <div class="widget-content">
                            @if($news->count()>0)
                                @foreach($list_recent as $new_re)
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
                </aside>
                <!-- end .sidebar-->
            </div>
        </div>
    </div>
</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@push('styles')
      {{-- style css --}}
@endpush

@push('scripts')
      {{-- script --}}
@endpush
