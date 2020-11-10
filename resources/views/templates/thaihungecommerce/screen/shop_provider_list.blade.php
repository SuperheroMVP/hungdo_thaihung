@php
    /*
    $layout_page = product_list
    $itemsList: paginate
    Use paginate: $itemsList->appends(request()->except(['page','_token']))->links()
    $products: paginate
    Use paginate: $products->appends(request()->except(['page','_token']))->links()
    */
@endphp

@extends($templatePath.'.layout')

@section('center')
    @if (count($providers) == 0)
        {{ trans('front.empty_product') }}
    @else
        <style>
            img.vendor_img {
                width: 100%;
                height: 100%;
            }
        </style>

        <div class="main-content col-lg-9 col-md-8 col-sm-8 col-xs-12 has-sidebar container">
            <div class="wcmp-store-list-wrap">
                @foreach($providers as $key => $provider)
                    <div class="wcmp-store-list" data-aos="fade-up-right" data-aos-offset="{{ ($key+1) * 100 }}">
                        <div class="wcmp-profile-wrap">
                            <div class="wcmp-cover-picture">
                                <a href="{{ $provider->getUrl() }}"><img class="vendor_img" src="{{ $provider->cover }}"
                                                                         id="vendor_image_display"></a>
                            </div>
                            <div class="store-badge-wrap">
                            </div>
                            <div class="wcmp-store-info">
                                <div class="wcmp-store-picture">
                                    <a href="{{ $provider->getUrl() }}"><img class="vendor_img"
                                                                             src="{{ $provider->avatar }}"
                                                                             id="vendor_image_display"></a>
                                </div>
                            </div>
                        </div>
                        <div class="wcmp-store-detail-wrap">
                            <ul class="wcmp-store-detail-list">
                                <li>
                                    <i class="fa fa-home" aria-hidden="true"></i>
                                    <a href="{{ $provider->getUrl() }}"
                                       class="store-name">{{ $provider->name }}</a>
                                </li>
                                <li>
                                    <i class="glyph-icon flaticon-localization"></i>
                                    <p>{{ $provider->address.', '.$provider->ward.', '.$provider->district.', '.$provider->province }}</p>
                                </li>
                                <li>
                                    <i class="wcmp-font ico-call-icon"></i>
                                    <p>{{ $provider->phone }}</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                @endforeach
                {{ $providers->links($templatePath.'.block.paginate') }}
            </div>
        </div>
    @endif
@endsection


@section('breadcrumb')
    <div class="breadcrumbs pull-left">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
            <li class="active">{{ $title }}</li>
        </ol>
    </div>
@endsection


@push('styles')

@endpush

@push('scripts')

@endpush
