<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="{{ asset('images/icon.png') }}" type="image/png" sizes="16x16">
    <title>{{sc_config('ADMIN_TITLE')}} | {{ $title??'' }}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css') }}">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css')}}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/Ionicons/css/ionicons.min.css')}}">

    @if (!Admin::isLoginPage() && !Admin::isLogoutPage())
        <link rel="stylesheet" href="{{ asset('admin/AdminLTE/dist/css/skins/_all-skins.css')}}">
        <link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/morris.js/morris.css')}}">
        <!-- jvectormap -->
        <link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/jvectormap/jquery-jvectormap.css')}}">
        <!-- Date Picker -->
        <link rel="stylesheet"
              href="{{ asset('admin/AdminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css')}}">
        <!-- Daterange picker -->
        <link rel="stylesheet"
              href="{{ asset('admin/AdminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css')}}">
        <!-- bootstrap wysihtml5 - text editor -->
        <link rel="stylesheet"
              href="{{ asset('admin/AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css')}}">
        <link rel="stylesheet" href="{{ asset('admin/css/css.css')}}?v={{ filemtime('admin/css/css.css') }}">

    @endif


<!-- Select2 -->
    <link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/select2/dist/css/select2.min.css')}}">
    {{-- switch --}}
    <link rel="stylesheet" href="{{ asset('admin/plugin/bootstrap-switch.min.css')}}">

@stack('styles')
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('admin/AdminLTE/dist/css/AdminLTE.css')}}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ asset('admin/AdminLTE/plugins/iCheck/square/blue.css')}}">
    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
@php
    //$mode = (sc_config('APP_DEBUG') === 'on')?'red':'blue';
    $mode = 'blue';
@endphp
<body class="hold-transition {{ (Admin::isLoginPage() || Admin::isLogoutPage())?'  -page':'skin-'.$mode.' sidebar-mini' }}">
<div class="wrapper">

    <div id="notifys" style="z-index: 9999; position: fixed; right: 50px; width: 320px;">
{{--        <div class="toast" data-autohide="false" style="background-color: white; padding: 15px;">--}}
{{--            <div class="toast-header">--}}
{{--                <strong class="mr-auto text-primary">Toast Header</strong>--}}
{{--                <small class="text-muted">5 mins ago</small>--}}
{{--                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>--}}
{{--            </div>--}}
{{--            <div class="toast-body">--}}
{{--                Some text inside the toast body--}}
{{--            </div>--}}
{{--        </div>--}}
    </div>
    <script>
        // Get all elements with class="closebtn"
        var close = document.getElementsByClassName("closebtn");
        var i;

        // Loop through all close buttons
        for (i = 0; i < close.length; i++) {
            // When someone clicks on a close button
            close[i].onclick = function(){

                // Get the parent of <span class="closebtn"> (<div class="alert">)
                var div = this.parentElement;

                // Set the opacity of div to 0 (transparent)
                div.style.opacity = "0";

                // Hide the div after 600ms (the same amount of milliseconds it takes to fade out)
                setTimeout(function(){ div.style.display = "none"; }, 600);
            }
        }
    </script>

    @if ((Admin::isLoginPage() || Admin::isLogoutPage()))
        @yield('main')
    @else
        @include('admin.component.exception')
        @include('admin.header')
        @include('admin.sidebar')
        <div class="content-wrapper">
            <div id="app">
                <section class="content-header">
                    <h1>
                        <i class="{{ $icon??'' }}" aria-hidden="true"></i> {!! $title??'' !!}
                        <small>{!!$subTitle??'' !!}</small>
                    </h1>
                    <div class="more_info">{!! $more_info??'' !!}</div>
                    <!-- breadcrumb start -->
                    <ol class="breadcrumb">
                        <li><a href="{{ route('admin.home') }}"><i
                                        class="fa fa-dashboard"></i> {{ trans('admin.home') }}</a></li>
                        <li>{!! $title??'' !!}</li>
                    </ol>
                    <!-- breadcrumb end -->
                </section>
                <section class="content">
                    @yield('main')
                </section>
            </div>
        </div>

        @include('admin.footer')

        <div id="loading">
            <div id="overlay" class="overlay"><i class="fa fa-spinner fa-pulse fa-5x fa-fw "></i></div>
        </div>

    @endif
</div>

@section('version-jquery')
    <!-- jQuery 3 -->
    <script src="{{ asset('admin/AdminLTE/bower_components/jquery/dist/jquery.min.js')}}"></script>
@show

<script src="{{ asset('admin/AdminLTE/bower_components/jquery-ui/jquery-ui.min.js')}}"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="{{ asset('admin/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js')}}"></script>
<!-- iCheck -->
<script src="{{ asset('admin/AdminLTE/plugins/iCheck/icheck.min.js')}}"></script>

@if (!Admin::isLoginPage() && !Admin::isLogoutPage())
    <script src="{{ asset('admin/AdminLTE/bower_components/raphael/raphael.min.js')}}"></script>
    <script src="{{ asset('admin/AdminLTE/bower_components/morris.js/morris.min.js')}}"></script>
    <!-- Sparkline -->
    <script src="{{ asset('admin/AdminLTE/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js')}}"></script>
    <!-- jvectormap -->
    <script src="{{ asset('admin/AdminLTE/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js')}}"></script>
    <script src="{{ asset('admin/AdminLTE/plugins/jvectormap/jquery-jvectormap-world-mill-en.js')}}"></script>
    <!-- jQuery Knob Chart -->
    <script src="{{ asset('admin/AdminLTE/bower_components/jquery-knob/dist/jquery.knob.min.js')}}"></script>
    <!-- daterangepicker -->
    <script src="{{ asset('admin/AdminLTE/bower_components/moment/min/moment.min.js')}}"></script>
    <script src="{{ asset('admin/AdminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.js')}}"></script>
    <!-- datepicker -->
    <script src="{{ asset('admin/AdminLTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js')}}"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="{{ asset('admin/AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js')}}"></script>
    <!-- Slimscroll -->
    <script src="{{ asset('admin/AdminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js')}}"></script>
    <!-- FastClick -->
    <script src="{{ asset('admin/AdminLTE/bower_components/fastclick/lib/fastclick.js')}}"></script>
    <!-- AdminLTE App -->
    <script src="{{ asset('admin/AdminLTE/dist/js/adminlte.min.js')}}"></script>
    {{-- sweetalert2 --}}
    <script src="{{ asset('admin/plugin/sweetalert2.all.min.js')}}"></script>
    {{-- <script src="{{ asset('admin/plugin/promise-polyfill.js')}}"></script> --}}

    <!-- Select2 -->
    <script src="{{ asset('admin/AdminLTE/bower_components/select2/dist/js/select2.full.min.js')}}"></script>
    {{-- switch --}}
    <script src="{{ asset('admin/plugin/bootstrap-switch.min.js')}}"></script>
@endif

{{--  js for Realtime notification--}}
<script src="https://js.pusher.com/4.3/pusher.min.js"></script>
<script type="text/javascript">
    var notifications = $('#notifys');
    // Enable pusher logging - don't include this in production
    Pusher.logToConsole = true;
    var pusher = new Pusher('f870174d851ebfccd4a3', {
        cluster: 'ap1',
        encrypted: true
    });

    // Subscribe to the channel we specified in our Laravel Event
    var channel = pusher.subscribe('NotificationNewOrder');

    // Bind a function to a Event (the full Laravel class)
    channel.bind('send-message', function (data) {
        var existingNotifications = notifications.html();
        let account = '{{ Admin::user()->username ?? ''}}'
        console.log(data.account);
        console.log(account);
        if(data.account == account){
        var newNotificationHtml = `
          <div class="alert" style="padding: 5px; margin: 5px; background-color: white; border: 1px solid; ">
                <button class="closebtn" style="float: right;" onclick="this.parentElement.style.display='none';">&times;</button>
                <div id="content-notify">
                    <h4>Bạn có đơn hàng mới!</h4>
                    <p>`+data.title+`</p>
                    <a href="`+data.url+`" style="color: red;">Xem đơn hàng</a>
                </div>
            </div>
        `;
        }else{
            var newNotificationHtml = ``;
        }
        notifications.html(newNotificationHtml + existingNotifications);
        notifications.show();
    });

    //js for toast
    $(document).ready(function(){
        $('.toast').toast('show');
    });
</script>

@stack('scripts')
<script>
    $(function () {
        $('.input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });

</script>

@include('admin.component.script')
@include('admin.component.alerts')

</body>
</html>
