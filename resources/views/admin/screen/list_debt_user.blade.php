@extends('admin.layout')

@section('main')
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <div>
                        @if (!empty($topMenu) && count($topMenu))
                            @foreach ($topMenu as $item)
                                <div>
                                    @php
                                        $arrCheck = explode('view::', $item);
                                    @endphp
                                    @if (count($arrCheck) == 2)
                                        @if (view()->exists($arrCheck[1]))
                                            @include($arrCheck[1])
                                        @endif
                                    @else
                                        {!! trim($item) !!}
                                    @endif
                                </div>
                            @endforeach
                        @endif
                    </div>
                    <div class="pull-right">
                        @if (!empty($topMenuRight) && count($topMenuRight))
                            @foreach ($topMenuRight as $item)
                                <div class="menu-right">
                                    @php
                                        $arrCheck = explode('view::', $item);
                                    @endphp
                                    @if (count($arrCheck) == 2)
                                        @if (view()->exists($arrCheck[1]))
                                            @include($arrCheck[1])
                                        @endif
                                    @else
                                        {!! trim($item) !!}
                                    @endif
                                </div>
                            @endforeach
                        @endif
                    </div>
                    <div class="pull-left">
                        @if (!empty($topMenuLeft) && count($topMenuLeft))
                            @foreach ($topMenuLeft as $item)
                                <div class="menu-left">
                                    @php
                                        $arrCheck = explode('view::', $item);
                                    @endphp
                                    @if (count($arrCheck) == 2)
                                        @if (view()->exists($arrCheck[1]))
                                            @include($arrCheck[1])
                                        @endif
                                    @else
                                        {!! trim($item) !!}
                                    @endif
                                </div>
                            @endforeach
                        @endif
                    </div>
                    <!-- /.box-tools -->
                </div>

                <div class="box-header with-border">
                    <div class="pull-right">
                        @if (!empty($menuRight) && count($menuRight))
                            @foreach ($menuRight as $item)
                                <div class="menu-right">
                                    @php
                                        $arrCheck = explode('view::', $item);
                                    @endphp
                                    @if (count($arrCheck) == 2)
                                        @if (view()->exists($arrCheck[1]))
                                            @include($arrCheck[1])
                                        @endif
                                    @else
                                        {!! trim($item) !!}
                                    @endif
                                </div>
                            @endforeach
                        @endif
                    </div>

                    <div class="pull-left">
                        @if (!empty($removeList))
                            <div class="menu-left">
                                <button type="button" class="btn btn-default grid-select-all"><i
                                            class="fa fa-square-o"></i></button>
                            </div>
                            <div class="menu-left">
                                <a class="btn btn-flat btn-danger grid-trash" title="{{ trans('admin.delete') }}"><i
                                            class="fa fa-trash-o"></i></a>
                            </div>
                        @endif

                        @if (!empty($buttonRefresh))
                            <div class="menu-left">
                                <a class="btn btn-flat btn-primary grid-refresh" title="{{ trans('admin.refresh') }}"><i
                                            class="fa fa-refresh"></i></a>
                            </div>
                        @endif

                        @if (!empty($buttonSort))
                            <div class="menu-left">
                                <div class="btn-group">
                                    <select class="form-control" id="order_sort">
                                        {!! $optionSort??'' !!}
                                    </select>
                                </div>
                                <div class="btn-group">
                                    <a class="btn btn-flat btn-primary" title="{{ trans('admin.sort') }}"
                                       id="button_sort">
                                        <i class="fa fa-sort-amount-asc"></i>
                                    </a>
                                </div>
                            </div>
                        @endif

                        @if (!empty($menuLeft) && count($menuLeft))
                            @foreach ($menuLeft as $item)
                                <div class="menu-left">
                                    @php
                                        $arrCheck = explode('view::', $item);
                                    @endphp
                                    @if (count($arrCheck) == 2)
                                        @if (view()->exists($arrCheck[1]))
                                            @include($arrCheck[1])
                                        @endif
                                    @else
                                        {!! trim($item) !!}
                                    @endif
                                </div>
                            @endforeach
                        @endif

                    </div>

                </div>
                <!-- /.box-header -->
                <section id="pjax-container" class="table-list">
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                @if (!empty($removeList))
                                    <th></th>
                                @endif
                                @foreach ($listTh as $key => $th)
                                    <th>{!! $th !!}</th>
                                @endforeach
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($dataTr as $keyRow => $tr)
                                <tr>
                                    @if (!empty($removeList))
                                        <td>
                                            <input class="input" type="checkbox" class="grid-row-checkbox"
                                                   data-id="{{ $tr['id']??'' }}">
                                        </td>
                                    @endif
                                    @foreach ($tr as $key => $trtd)
                                        <td>{!! $trtd !!}</td>
                                    @endforeach
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="box-footer clearfix">
                        {!! $resultItems??'' !!}
                        {!! $pagination??'' !!}
                    </div>

                    @if (!empty($blockBottom) && count($blockBottom))
                        @foreach ($blockBottom as $item)
                            <div class="clearfix">
                                @php
                                    $arrCheck = explode('view::', $item);
                                @endphp
                                @if (count($arrCheck) == 2)
                                    @if (view()->exists($arrCheck[1]))
                                        @include($arrCheck[1])
                                    @endif
                                @else
                                    {!! trim($item) !!}
                                @endif
                            </div>
                        @endforeach
                    @endif

                </section>
                <!-- /.box-body -->

                <!-- moda create debt -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document" style="width: 60%">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLabel" style="width: 95px; float: left;">Thanh
                                    toán</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="{{route('admin_user_debt.create')}}" method="post">
                                @csrf
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="debt" class="col-sm-3 col-form-label">Nợ hiện tại</label>
                                                <div class="col-sm-7">
                                                    <input type="text" class="form-control" id="show_debt"
                                                           value="{{number_format($provider->debt)}}" disabled>
                                                    <input type="hidden" name="user_id" value="{{$provider->id}}">
                                                    <input type="hidden" id="value_debt" name="value_debt"
                                                           value="{{$provider->debt}}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="thu_tu_khach" class="col-sm-3 col-form-label">Thu từ
                                                    khách</label>
                                                <div class="col-sm-7">
                                                    {{--                                                    <input type="number" class="form-control" id="view_thu_tu_khach" value="">--}}
                                                    <input type="number" class="form-control" id="thu_tu_khach"
                                                           name="thu_tu_khach"
                                                           value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="no_sau" class="col-sm-3 col-form-label">Nợ sau</label>
                                                <div class="col-sm-7">
                                                    <input type="number" class="form-control" id="no_sau" name="no_sau"
                                                           readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="time" class="col-sm-3 col-form-label">Thời gian</label>
                                                <div class="col-sm-7">
                                                    <input type="datetime-local" class="form-control" id="time"
                                                           name="date"
                                                           value="{{date('Y-m-d').'T'.date('H:i')}}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputEmail3" class="col-sm-3 col-form-label">Ghi chú</label>
                                                <div class="col-sm-7">
                                                    <textarea rows="3" style="width: 100%;" name="note"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Thời gian</th>
                                                <th scope="col">Giá trị hóa đơn</th>
                                                <th scope="col">Đã thu</th>
                                                <th scope="col">Còn cần thu</th>
                                                <th scope="col">Tiền thu</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($debt_provider_list as $key => $debt_provider)
                                                <tr>
                                                    <th scope="row">{{$debt_provider->id}}</th>
                                                    <td>{{$debt_provider->created_at}}</td>
                                                    <td>{{number_format($debt_provider->total)}}</td>
                                                    <td>{{number_format($debt_provider->received)}}</td>
                                                    <td>{{number_format($debt_provider->balance)}}</td>
                                                    <td><input type="number" value="" id="debt_{{$debt_provider->id}}"
                                                               name="debt_user[{{$debt_provider->id}}]" class="input_value_debt"> </td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary btn_submit_debt">Lưu</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- end moda create debt -->
                <!-- moda view debt -->
                <div class="modal fade" id="view_debt" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document" style="width: 60%">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLabel" style="width: 95px; float: left;">Chi
                                    tiết</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            {{--                            <form action="{{route('admin_provider_debt.create')}}" method="post">--}}
                            {{--                                @csrf--}}
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label for="debt" class="col-sm-3 col-form-label">Nợ trước</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" id="view_show_debt" value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="thu_tu_khach" class="col-sm-3 col-form-label">Thu từ
                                                khách</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" id="view_thu_tu_khach"
                                                       name="thu_tu_khach"
                                                       value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="no_sau" class="col-sm-3 col-form-label">Nợ sau</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" id="view_no_sau" name="no_sau">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label for="time" class="col-sm-3 col-form-label">Thời gian</label>
                                            <div class="col-sm-7">
                                                <input type="datetime-local" class="form-control" id="view_time"
                                                       name="date"
                                                       value="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-3 col-form-label">Ghi chú</label>
                                            <div class="col-sm-7">
                                                <textarea rows="3" style="width: 100%;" name="note"
                                                          id="view_note"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <table class="table" id="view_table_debt_provider_description">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Thời gian</th>
                                            <th scope="col">Giá trị hóa đơn</th>
                                            <th scope="col">Đã thu trước</th>
                                            <th scope="col">Thu thêm</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            {{--                                <div class="modal-footer">--}}
                            {{--                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>--}}
                            {{--                                    <button type="submit" class="btn btn-primary">Lưu</button>--}}
                            {{--                                </div>--}}
                            {{--                            </form>--}}
                        </div>
                    </div>
                </div>
                <!-- end view create debt -->
                <!-- moda view order  -->
                <div class="modal fade" id="view_order" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document" style="width: 60%">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLabel" style="width: 95px; float: left;">Chi
                                    tiết</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            {{--                            <form action="{{route('admin_provider_debt.create')}}" method="post">--}}
                            {{--                                @csrf--}}
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label for="debt" class="col-sm-3 col-form-label">Tổng giá trị</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" id="dh_view_show_debt" value=""
                                                       readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="thu_tu_khach" class="col-sm-3 col-form-label">Trả trước</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" id="dh_view_thu_tu_khach"
                                                       name="thu_tu_khach"
                                                       value="" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="no_sau" class="col-sm-3 col-form-label">Nợ sau</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" id="dh_view_no_sau"
                                                       name="no_sau" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label for="time" class="col-sm-3 col-form-label">Thời gian</label>
                                            <div class="col-sm-7">
                                                <input type="datetime-local" class="form-control" id="dh_view_time"
                                                       name="date"
                                                       value="" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-sm-3 col-form-label">Ghi chú</label>
                                            <div class="col-sm-7">
                                                <textarea rows="3" style="width: 100%;" name="note" id="dh_view_note"
                                                          readonly></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end view create order -->
            </div>
        </div>
    </div>
@endsection


@push('styles')
    <style type="text/css">
        .box-body td, .box-body th {
            max-width: 150px;
            word-break: break-all;
        }
    </style>
    {!! $css ?? '' !!}
@endpush

@push('scripts')
    {{-- //Pjax --}}
    <script src="{{ asset('admin/plugin/jquery.pjax.js')}}"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            var debt_provider_list = @json($debt_provider_list);
            var thu_tu_khach, tong_thu_don_hang;
            $('#thu_tu_khach').keyup(function () {
                let value_debt = parseInt($("#value_debt").val());
                thu_tu_khach = parseInt($("#thu_tu_khach").val());
                debt_provider_list.forEach(function (index, data) {
                    let field = $(`#debt_${index['id']}`);
                    field.val(null)
                });
                if (thu_tu_khach != null && thu_tu_khach > 0) {
                    if (!(thu_tu_khach <= value_debt)) {
                        $("#thu_tu_khach").val(value_debt);
                        $("#no_sau").val(0);
                        let tem_thu_tu_khach = thu_tu_khach;
                        for (let i = 0; i < debt_provider_list.length; i++) {
                            let field = $(`#debt_${debt_provider_list[i]['id']}`);
                            let debt_don_hang = parseInt(debt_provider_list[i]['balance']);
                            if (debt_don_hang < tem_thu_tu_khach) {
                                field.val(debt_don_hang)
                                tem_thu_tu_khach = tem_thu_tu_khach - debt_don_hang;
                            } else {
                                field.val(tem_thu_tu_khach)
                                return false
                            }
                            $('.btn_submit_debt').removeAttr('disabled');
                        }
                    } else {
                        $("#no_sau").val(value_debt - thu_tu_khach);
                        let tem_thu_tu_khach = thu_tu_khach;
                        for (let i = 0; i < debt_provider_list.length; i++) {
                            let field = $(`#debt_${debt_provider_list[i]['id']}`);
                            let debt_don_hang = parseInt(debt_provider_list[i]['balance']);
                            if (debt_don_hang < tem_thu_tu_khach) {
                                field.val(debt_don_hang)
                                tem_thu_tu_khach = tem_thu_tu_khach - debt_don_hang;
                            } else {
                                field.val(tem_thu_tu_khach)
                                break;
                            }
                            $('.btn_submit_debt').removeAttr('disabled');
                        }
                    }
                }
            });

            $(".input_value_debt").keyup(function () {
                tong_thu_don_hang = 0;
                debt_provider_list.forEach(function (item, index) {
                    let field = $(`#debt_${item['id']}`);
                    let debt_don_hang = parseInt(field.val());
                    if (isNaN(debt_don_hang)) {
                        debt_don_hang = 0;
                    }
                    tong_thu_don_hang += debt_don_hang;
                });
                console.log("asd")
                if (tong_thu_don_hang == thu_tu_khach) {
                    $('.btn_submit_debt').removeAttr('disabled');
                } else {
                    $('.btn_submit_debt').attr("disabled", true);
                }
            });

            //     $('#view_thu_tu_khach').keypress(function (event) {
            //         if (!(event.charCode >= '0'.charCodeAt(0) && event.charCode <= '9'.charCodeAt(0))) {
            //             event.preventDefault();
            //         }
            //     });
            //     $('#view_thu_tu_khach').on('keyup', function () {
            //         if ($(this).val().length != 0) {
            //             this.value = parseFloat(this.value.replace(/,/g, ""))
            //                 .toFixed(0)
            //                 .toString()
            //                 .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            //
            //             //set the numeric value to a number input
            //             document.getElementById("thu_tu_khach").value = this.value.replace(/,/g, "")
            //         } else {
            //             document.getElementById("thu_tu_khach").value = '';
            //         }
            //     });
        });

        $(".view_debt").on('click', function () {
            let id = $(this).attr("data-id");
            let url = "{{url('/sc_admin/debt_user/show')}}/" + id;
            $.ajax({
                type: 'GET',
                url: url,
                success: function (data) {
                    // console.log(new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(data['debt_provider']['total']))
                    $('#view_show_debt').val(new Intl.NumberFormat('de-DE', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(data['debt_provider']['total']));
                    $('#view_thu_tu_khach').val(new Intl.NumberFormat('de-DE', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(data['debt_provider']['value']));
                    $('#view_no_sau').val(new Intl.NumberFormat('de-DE', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(data['debt_provider']['outstanding_customer_debt']));
                    // $('#view_time').val(data['debt_provider']['time']);
                    var time = new Date(data['debt_provider']['time']);
                    time.setMinutes(time.getMinutes() + 60);
                    document.getElementById("view_time").valueAsNumber = time.getTime();
                    $('#view_note').val(data['debt_provider']['note']);
                    $("#view_table_debt_provider_description tbody").empty();
                    data['debt_provider_description'].forEach(function (data) {
                        // console.log(data)
                        var newRowContent = "<tr><th>" + data['user_order_id'] + "</th><td>" + data['date'] + "</td><td>" + new Intl.NumberFormat('de-DE', {
                            style: 'currency',
                            currency: 'VND'
                        }).format(data['total']) + "</td><td>" + new Intl.NumberFormat('de-DE', {
                            style: 'currency',
                            currency: 'VND'
                        }).format(data['received']) + "</td><td>" + new Intl.NumberFormat('de-DE', {
                            style: 'currency',
                            currency: 'VND'
                        }).format(data['collect_more']) + "</td></tr>";
                        $("#view_table_debt_provider_description tbody").append(newRowContent);
                    });
                }
            });
        });

        $(".view_order").on('click', function () {
            let id = $(this).attr("data-id");
            let url = "{{url('/sc_admin/debt_user/show_user_debt_order')}}/" + id;
            $.ajax({
                type: 'GET',
                url: url,
                success: function (data) {
                    console.log(data['provider_order'])
                    $('#dh_view_show_debt').val(new Intl.NumberFormat('de-DE', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(data['user_order']['total']));
                    $('#dh_view_thu_tu_khach').val(new Intl.NumberFormat('de-DE', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(data['user_order']['received']));
                    $('#dh_view_no_sau').val(new Intl.NumberFormat('de-DE', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(data['user_order']['balance']));
                    // $('#view_time').val(data['debt_provider']['time']);
                    var time = new Date(data['user_order']['created_at']);
                    time.setMinutes(time.getMinutes() + 60);
                    document.getElementById("dh_view_time").valueAsNumber = time.getTime();
                    $('#dh_view_note').val(data['user_order']['note']);
                }
            });
        });

        $('.grid-refresh').click(function () {
            $.pjax.reload({container: '#pjax-container'});
        });

        $(document).on('submit', '#button_search', function (event) {
            $.pjax.submit(event, '#pjax-container')
        })

        $(document).on('pjax:send', function () {
            $('#loading').show()
        })
        $(document).on('pjax:complete', function () {
            $('#loading').hide()
        })

        // tag a
        $(function () {
            $(document).pjax('a.page-link', '#pjax-container')
        })


        $(document).ready(function () {
            // does current browser support PJAX
            if ($.support.pjax) {
                $.pjax.defaults.timeout = 2000; // time in milliseconds
            }
        });

        @if ($buttonSort)
        $('#button_sort').click(function (event) {
            var url = '{{ $urlSort??'' }}?sort_order=' + $('#order_sort option:selected').val();
            $.pjax({url: url, container: '#pjax-container'})
        });
        @endif


        $(document).on('ready pjax:end', function (event) {
            $('.table-list input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' /* optional */
            });
        })

    </script>
    {{-- //End pjax --}}


    <script type="text/javascript">
        {{-- sweetalert2 --}}
        var selectedRows = function () {
            var selected = [];
            $('.grid-row-checkbox:checked').each(function () {
                selected.push($(this).data('id'));
            });

            return selected;
        }

        $('.grid-trash').on('click', function () {
            var ids = selectedRows().join();
            deleteItem(ids);
        });

        function deleteItem(ids) {
            Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: true,
            }).fire({
                title: '{{ trans('admin.confirm_delete') }}',
                text: "",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: '{{ trans('admin.confirm_delete_yes') }}',
                confirmButtonColor: "#DD6B55",
                cancelButtonText: '{{ trans('admin.confirm_delete_no') }}',
                reverseButtons: true,

                preConfirm: function () {
                    return new Promise(function (resolve) {
                        $.ajax({
                            method: 'post',
                            url: '{{ $urlDeleteItem ?? '' }}',
                            data: {
                                ids: ids,
                                _token: '{{ csrf_token() }}',
                            },
                            success: function (data) {
                                if (data.error == 1) {
                                    alertMsg('{{ trans('admin.warning') }}', data.msg, 'error');
                                    $.pjax.reload('#pjax-container');
                                    return;
                                } else {
                                    $.pjax.reload('#pjax-container');
                                    resolve(data);
                                }

                            }
                        });
                    });
                }

            }).then((result) => {
                if (result.value) {
                    alertMsg('{{ trans('admin.confirm_delete_deleted') }}', '{{ trans('admin.confirm_delete_deleted_msg') }}', 'success');
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    // swalWithBootstrapButtons.fire(
                    //   'Cancelled',
                    //   'Your imaginary file is safe :)',
                    //   'error'
                    // )
                }
            })
        }
        {{--/ sweetalert2 --}}


    </script>

    {!! $js ?? '' !!}
@endpush
