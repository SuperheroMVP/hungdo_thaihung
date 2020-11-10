@php
    /*
    $layout_page = shop_page
    $page: no paginate
    */
@endphp

@extends($templatePath.'.layout')

@section('main')
    <section class="w-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="title  text-center">{{ $title }}</h2>
                </div>
                <div class="col-12">
                    {!! sc_html_render($page->content) !!}
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