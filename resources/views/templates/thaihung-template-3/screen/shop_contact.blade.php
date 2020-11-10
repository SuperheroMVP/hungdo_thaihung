@php
/*
$layout_page = shop_contact
*/
@endphp

@extends($templatePath.'.layout')

@section('main')

    <!-- end .b-subscribe-->
    <div class="block-table">
        <div class="block-table__cell col-md-6">
            <div class="block-table__inner">
                <section class="section-form-contacts" style="padding: 60px 15% 60px 17%;">
                    <div class="section-form-contacts__label">LIÊN LẠC</div>
                    <h3 class="section-form-contacts__title">Gửi tin nhắn cho chúng tôi</h3>
                    <div class="section-form-contacts__info">MotorLand is nisi aliquip exa con velit esse cillum dolore
                        fugiatal sint ipsum occaecat excepteur ipsum dolor sit amet consectetur.
                    </div>
                    <div id="success"></div>
                    <form method="post" action="{{ route('contact.post') }}"  class="b-form-contacts ui-form" id="contactForm">
                        {{ csrf_field() }}
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
                                    <input class="form-control {{ ($errors->has('name'))?"input-error":"" }}" id="user-name" type="text" name="name"
                                           placeholder="{{ trans('front.contact_form.name') }}" required="required" value="{{ old('name') }}"/>
                                    @if ($errors->has('name'))
                                        <span class="help-block">
                                            {{ $errors->first('name') }}
                                        </span>
                                    @endif
                                </div>
                                <div class="form-group {{ $errors->has('phone') ? ' has-error' : '' }}">
                                    <input class="form-control {{ ($errors->has('phone'))?"input-error":"" }}" id="user-phone" type="tel" name="phone"
                                           placeholder="{{ trans('front.contact_form.phone') }}" required="required" value="{{old('phone')}}"/>
                                    @if ($errors->has('phone'))
                                        <span class="help-block">
                                            {{ $errors->first('phone') }}
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('email') ? ' has-error' : '' }}">
                                    <input class="form-control {{ ($errors->has('phone'))?"input-error":"" }}" id="user-email" type="email" name="email"
                                           placeholder="{{ trans('front.contact_form.email') }}" required="required"  value="{{old('email')}}"/>
                                    @if ($errors->has('email'))
                                        <span class="help-block">
                                            {{ $errors->first('email') }}
                                        </span>
                                    @endif
                                </div>
                                <div class="form-group {{ $errors->has('title') ? ' has-error' : '' }}">
                                    <input class="form-control  last-block_mrg-btn_0 {{ ($errors->has('title'))?"input-error":"" }}" id="user-subject" type="text"
                                           name="title" placeholder="{{ trans('front.contact_form.subject') }}" required="required" value="{{old('title')}}"/>
                                    @if ($errors->has('title'))
                                        <span class="help-block">
                                            {{ $errors->first('title') }}
                                        </span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <textarea class="form-control {{ ($errors->has('content'))?"input-error":"" }}" name="content" id="user-message" rows="7" placeholder="{{ trans('front.contact_form.content') }}"
                                          required="required"></textarea>
                                @if ($errors->has('content'))
                                    <span class="help-block">
                                                    {{ $errors->first('content') }}
                                                </span>
                                @endif
                                <button type="submit"  class="btn btn-white btn-lg">Gửi tin nhắn</button>
                            </div>
                        </div>
                    </form>
                </section>
                <!-- end .b-form-contact-->
            </div>
        </div>
        <div class="block-table__cell col-md-6">
            {{--            <div class="block-table__inner">--}}
            {{--                <div class="map" id="map"></div>--}}
            {{--            </div>--}}
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d231.86461733090349!2d105.83447395891581!3d21.59240662142147!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31352720060f1f91%3A0x5639b40584a6fced!2zQ1RDUCBTw4FDSCBUSMOBSSBIxq9ORw!5e0!3m2!1svi!2s!4v1602206886302!5m2!1svi!2s" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
    </div>
    <!-- end .block-table-->
{{--     <div id="contact-page" class="container">--}}
{{--        <div class="bg">--}}
{{--            <div class="row">--}}
{{--                <div class="col-sm-12">--}}
{{--                    <h2 class="title text-center">{{ $title }}</h2>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--            <div class="row">--}}
{{--                <div class="col-sm-8">--}}
{{--                    <div class="contact-form">--}}
{{--                        <h2 class="title text-center">{{ trans('front.contact_form.title') }}</h2>--}}
{{--                        <form method="post" action="{{ route('contact.post') }}" class="contact-form">--}}
{{--                        {{ csrf_field() }}--}}
{{--                        <div id="contactFormWrapper" style="margin: 30px;">--}}
{{--                        <div class="row">--}}
{{--                                <div class="col-md-12 col-xs-12">--}}
{{--                                    <div class="row">--}}
{{--                                        <div class="col-sm-4 form-group {{ $errors->has('name') ? ' has-error' : '' }}">--}}
{{--                                            <label>{{ trans('front.contact_form.name') }}:</label>--}}
{{--                                            <input type="text"  class="form-control {{ ($errors->has('name'))?"input-error":"" }}"  name="name" placeholder="Your name..." value="{{ old('name') }}">--}}
{{--                                            @if ($errors->has('name'))--}}
{{--                                                <span class="help-block">--}}
{{--                                                    {{ $errors->first('name') }}--}}
{{--                                                </span>--}}
{{--                                            @endif--}}
{{--                                        </div>--}}
{{--                                        <div class="col-sm-4 form-group {{ $errors->has('email') ? ' has-error' : '' }}">--}}
{{--                                            <label>{{ trans('front.contact_form.email') }}:</label>--}}
{{--                                            <input  type="email" class="form-control {{ ($errors->has('email'))?"input-error":"" }}"  name="email" placeholder="Your email..." value="{{ old('email') }}">--}}
{{--                                            @if ($errors->has('email'))--}}
{{--                                                <span class="help-block">--}}
{{--                                                    {{ $errors->first('email') }}--}}
{{--                                                </span>--}}
{{--                                            @endif--}}
{{--                                        </div>--}}
{{--                                        <div class="col-sm-4 form-group {{ $errors->has('phone') ? ' has-error' : '' }}">--}}
{{--                                            <label>{{ trans('front.contact_form.phone') }}:</label>--}}
{{--                                            <input  type="telephone" class="form-control {{ ($errors->has('phone'))?"input-error":"" }}"  name="phone" placeholder="Your phone..." value="{{ old('phone') }}">--}}
{{--                                            @if ($errors->has('phone'))--}}
{{--                                                <span class="help-block">--}}
{{--                                                    {{ $errors->first('phone') }}--}}
{{--                                                </span>--}}
{{--                                            @endif--}}
{{--                                        </div>--}}
{{--                                    </div>--}}

{{--                                    <div class="row">--}}
{{--                                        <div class="col-sm-12 form-group {{ $errors->has('title') ? ' has-error' : '' }}">--}}
{{--                                            <label class="control-label">{{ trans('front.contact_form.subject') }}:</label>--}}
{{--                                            <input  type="text" class="form-control {{ ($errors->has('title'))?"input-error":"" }}"  name="title" placeholder="Subject..." value="{{ old('title') }}">--}}
{{--                                            @if ($errors->has('title'))--}}
{{--                                                <span class="help-block">--}}
{{--                                                    {{ $errors->first('title') }}--}}
{{--                                                </span>--}}
{{--                                            @endif--}}
{{--                                        </div>--}}
{{--                                        <div class="col-sm-12 form-group {{ $errors->has('content') ? ' has-error' : '' }}">--}}
{{--                                            <label class="control-label">{{ trans('front.contact_form.content') }}:</label>--}}
{{--                                            <textarea  class="form-control {{ ($errors->has('content'))?"input-error":"" }}" rows="5" cols="75"  name="content" placeholder="Your Message...">{{ old('content') }}</textarea>--}}
{{--                                            @if ($errors->has('content'))--}}
{{--                                                <span class="help-block">--}}
{{--                                                    {{ $errors->first('content') }}--}}
{{--                                                </span>--}}
{{--                                            @endif--}}

{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                    <div class="btn-toolbar form-group">--}}
{{--                                        <input type="submit"  value="{{ trans('front.contact_form.submit') }}" class="btn btn-primary">--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                        </div>--}}
{{--                        </div><!-- contactFormWrapper -->--}}
{{--                        </form>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-sm-4">--}}
{{--                    <div class="contact-info">--}}
{{--                        <h2 class="title text-center">{{ trans('front.contact_form.info') }}</h2>--}}
{{--                        <address>--}}
{{--                            <p>{{ sc_store('title') }}</p>--}}
{{--                            <p>{{ sc_store('address') }}</p>--}}
{{--                            <p>{{ sc_store('long_phone') }}</p>--}}
{{--                            <p>{{ sc_store('email') }}</p>--}}
{{--                        </address>--}}
{{--                        <div class="social-networks">--}}
{{--                            <h2 class="title text-center">Social Networking</h2>--}}
{{--                            <ul>--}}
{{--                                <li>--}}
{{--                                    <a href="#"><i class="fa fa-facebook"></i></a>--}}
{{--                                </li>--}}
{{--                                <li>--}}
{{--                                    <a href="#"><i class="fa fa-twitter"></i></a>--}}
{{--                                </li>--}}
{{--                                <li>--}}
{{--                                    <a href="#"><i class="fa fa-google-plus"></i></a>--}}
{{--                                </li>--}}
{{--                                <li>--}}
{{--                                    <a href="#"><i class="fa fa-youtube"></i></a>--}}
{{--                                </li>--}}
{{--                            </ul>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div><!--/#contact-page-->--}}



{{--  <!-- Main Container -->--}}
{{--  <div class="main-container col1-layout">--}}
{{--    <div class="container">--}}
{{--      <div class="row">--}}
{{--        <div class="col-md-12">--}}
{{--  <div class="page_content">--}}


{{--  </div>--}}
{{--        </div>--}}
{{--    </div>--}}
{{--    </div>--}}
{{--</div>--}}

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