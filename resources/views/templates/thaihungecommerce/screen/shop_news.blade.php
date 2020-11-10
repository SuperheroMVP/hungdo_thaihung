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
<section class="w-100 p-0">
    <div class="main-container no-sidebar">
        <!-- POST LAYOUT -->
        <div class="container">
            <div class="blog-banner">
                <a href="https://azirspares.famithemes.com/blog/?azirspares_blog_style=grid&amp;azirspares_sidebar_blog_layout=full#"
                   class=""><img width="1399" height="318" src="./Blog – Azirspares_files/Banner-thay2.jpg"
                                 class="img-responsive attachment-1399x318 size-1399x318 lazy" alt=""
                                 style="display: block;"></a>
            </div>
            <h1 class="page-title blog-title">Tin tức</h1>
            <div class="row">
                <div class="main-content azirspares_blog col-sm-12 col-xs-12">
                    <div class="blog-grid auto-clear content-post row">
                        @foreach($news as $newsDetail)
                            <article class="post-item post-grid col-bg-4 col-lg-4 col-md-4 col-sm-4 col-xs-6 col-ts-12">
                                <div class="post-inner">
                                    <div class="post-thumb">
                                        <a href="{{ $newsDetail->getUrl() }}">
                                            <figure class="">
                                                <img width="440" height="393" src="{{ asset($newsDetail->getThumb()) }}"/>
                                            </figure>
                                        </a>
                                        <div class="datebox">
                                            <a href="#">
                                                {{ date_format($newsDetail->created_at,"d-m") }}
                                            </a>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <div class="post-meta">
                                            <div class="post-comment-icon">
                                                <a href="#">14</a>
                                            </div>
                                        </div>
                                        <div class="post-info equal-elem">
                                            <h2 class="post-title"><a
                                                        href="{{ $newsDetail->getUrl() }}">{{ $newsDetail->title }}</a>
                                            </h2>
                                            <div class="post-content">
                                                {{ $newsDetail->description }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        @endforeach
                    </div>

                    {{ $news->links() }}
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs container">
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