@extends('admin.layout')

@section('main')
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <br>
                <!-- /.box-header -->
                <div class="tableData">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#daily" aria-controls="all" role="tab" data-toggle="tab">Đơn hàng đại lý</a>
                        </li>
                        <li role="presentation">
                            <a href="#le" aria-controls="all" role="tab" data-toggle="tab">Đơn hàng lẻ</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="daily">
                            <section id="pjax-container" class="table-list">
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover dataTable" id="dataTable">
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
                                        @foreach ($dataDaily as $keyRow => $tr)
                                            <tr>
                                                <td></td>
                                                <td>{{$tr->id}}</td>
                                                <td>{{$tr->provider_name}}</td>
                                                <td>{{$tr->phone}}</td>
                                                <td>{{$tr->email}}</td>
                                                <td>{{$tr->subtotal}}</td>
                                                <td>{{$tr->shipping}}</td>
                                                <td>{{$tr->discount}}</td>
                                                <td>{{$tr->total}}</td>
                                                <td>{{$tr->created_at}}</td>
                                                <td>
                                                    <a href="{{ route('manager.provider_order', ['id' => $tr->id]) }}"><span title="Xem" type="button" class="btn btn-flat btn-primary"><i class="fa fa-eye"></i></span></a>&nbsp;
                                                </td>
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
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="le">
                            <section id="pjax-container" class="table-list">
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover dataTable" id="dataTable">
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
                                        @foreach ($dataLe as $keyRow => $tr)
                                            <tr>
                                                <td></td>
                                                <td>{{$tr->id}}</td>
                                                <td>{{$tr->first_name}}</td>
                                                <td>{{$tr->phone}}</td>
                                                <td>{{$tr->email}}</td>
                                                <td>{{$tr->subtotal}}</td>
                                                <td>{{$tr->shipping}}</td>
                                                <td>{{$tr->discount}}</td>
                                                <td>{{$tr->total}}</td>
                                                <td>{{$tr->created_at}}</td>
                                                <td>
                                                    <a href="{{ route('manager.confirm.show', ['confirm' => $tr->id]) }}"><span title="Xem" type="button" class="btn btn-flat btn-primary"><i class="fa fa-eye"></i></span></a>&nbsp;
                                                </td>
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
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
        </div>
    </div>
@endsection


@push('styles')
    <link rel="stylesheet" href="{{ asset('admin/plugin/bootstrap-editable.css')}}">
    {{--    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">--}}
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css"/>
    <style type="text/css">
        .box-body td, .box-body th {
            max-width: 150px;
            word-break: break-all;
        }

        .tableData {
            margin: 0 10px;
        }
    </style>
    {!! $css ?? '' !!}
@endpush

@push('scripts')
    {{-- //Pjax --}}
    <script src="{{ asset('admin/plugin/jquery.pjax.js')}}"></script>
    <script src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script language="JavaScript" src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"
            type="text/javascript"></script>
    <script language="JavaScript" src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"
            type="text/javascript"></script>
    <script language="JavaScript" src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"
            type="text/javascript"></script>
    <script src="{{ asset('admin/plugin/bootstrap-editable.min.js')}}"></script>

    <script>
        $(document).ready(function () {
            $('.dataTable').DataTable({
                "bPaginate": true,
                "bLengthChange": false,
                "bFilter": true,
                "bAutoWidth": false,
                "responsive": true,
                "language": {
                    "zeroRecords": "Không tìm thấy dữ liệu",
                    "infoEmpty": "Không tìm thấy dữ liệu",
                    "infoFiltered": "(từ _MAX_ dữ liệu)",
                    "search": "Tìm kiếm",
                    "info": "Hiển thị _START_ đến _END_ của _MAX_ dữ liệu",
                    "paginate": {
                        "previous": "Trước",
                        "next": "Sau"
                    }
                },
                "columnDefs": [
                    {"orderable": false, "targets": [0, 11]}
                ],


            });
        });
    </script>

    <script type="text/javascript">

        $('.grid-refresh').click(function () {
            location.reload();
            // $.pjax.reload({container:'#pjax-container'});
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
        $(document).ready(function () {
            all_editable();
        });

        function all_editable() {
            $.fn.editable.defaults.params = function (params) {
                params._token = "{{ csrf_token() }}";
                return params;
            };

            $('.updateInfo').editable({
                success: function (response) {
                    if (response.error == 0) {
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });

            $(".updatePrice").on("shown", function (e, editable) {
                var value = $(this).text().replace(/,/g, "");
                editable.input.$input.val(parseInt(value));
            });

            $('.updateStatus').editable({
                validate: function (value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                },
                success: function (response) {
                    if (response.error == 0) {
                        alertJs('success', response.msg);
                        location.reload();
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });

            $('.updateInfoRequired').editable({
                validate: function (value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                },
                success: function (response, newValue) {
                    console.log(response.msg);
                    if (response.error == 0) {
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });


            $('.edit-item-detail').editable({
                ajaxOptions: {
                    type: 'post',
                    dataType: 'json'
                },
                validate: function (value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                    if (!$.isNumeric(value)) {
                        return '{{  trans('admin.only_numeric') }}';
                    }
                },
                success: function (response, newValue) {
                    if (response.error == 0) {
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-received').html(response.detail.received);
                        $('.data-subtotal').html(response.detail.subtotal);
                        $('.data-tax').html(response.detail.tax);
                        $('.data-total').html(response.detail.total);
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-discount').html(response.detail.discount);
                        $('.item_id_' + response.detail.item_id).html(response.detail.item_total_price);
                        var objblance = $('.data-balance').eq(0);
                        objblance.before(response.detail.balance);
                        objblance.remove();
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }

            });

            $('.updatePrice').editable({
                ajaxOptions: {
                    type: 'post',
                    dataType: 'json'
                },
                validate: function (value) {
                    if (value == '') {
                        return '{{  trans('admin.not_empty') }}';
                    }
                    if (!$.isNumeric(value)) {
                        return '{{  trans('admin.only_numeric') }}';
                    }
                },

                success: function (response, newValue) {
                    if (response.error == 0) {
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-received').html(response.detail.received);
                        $('.data-subtotal').html(response.detail.subtotal);
                        $('.data-tax').html(response.detail.tax);
                        $('.data-total').html(response.detail.total);
                        $('.data-shipping').html(response.detail.shipping);
                        $('.data-discount').html(response.detail.discount);
                        var objblance = $('.data-balance').eq(0);
                        objblance.before(response.detail.balance);
                        objblance.remove();
                        alertJs('success', response.msg);
                    } else {
                        alertJs('error', response.msg);
                    }
                }
            });
        }

    </script>

    {!! $js ?? '' !!}
@endpush
