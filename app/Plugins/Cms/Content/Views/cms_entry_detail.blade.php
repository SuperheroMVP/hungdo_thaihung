@extends($templatePath.'.layout')

@section('main')
    <section class="w-100 p-0">
        <div class="container">
            <div class="row">
                <h2 class="title text-center">{{ $title }}</h2>
                {!! sc_html_render($entry_currently->content) !!}
            </div>
        </div>
        <br>
    </section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs container">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
          <li><a href="{{ $entry_currently->category->getUrl() }}">{{ $entry_currently->category->getFull()->title }}</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection
