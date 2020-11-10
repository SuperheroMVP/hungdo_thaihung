@extends('admin.layout')

@section('main')
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                {{--        <div class="pull-right">--}}
                {{--          @if (!empty($topMenuRight) && count($topMenuRight))--}}
                {{--            @foreach ($topMenuRight as $item)--}}
                {{--                <div class="menu-right">--}}
                {{--                  @php--}}
                {{--                      $arrCheck = explode('view::', $item);--}}
                {{--                  @endphp--}}
                {{--                  @if (count($arrCheck) == 2)--}}
                {{--                    @if (view()->exists($arrCheck[1]))--}}
                {{--                      @include($arrCheck[1])--}}
                {{--                    @endif--}}
                {{--                  @else--}}
                {{--                    {!! trim($item) !!}--}}
                {{--                  @endif--}}
                {{--                </div>--}}
                {{--            @endforeach--}}
                {{--          @endif--}}
                {{--        </div>--}}
                {{--        <div class="pull-left">--}}
                {{--          @if (!empty($topMenuLeft) && count($topMenuLeft))--}}
                {{--            @foreach ($topMenuLeft as $item)--}}
                {{--                <div class="menu-left">--}}
                {{--                  @php--}}
                {{--                  $arrCheck = explode('view::', $item);--}}
                {{--                  @endphp--}}
                {{--                  @if (count($arrCheck) == 2)--}}
                {{--                    @if (view()->exists($arrCheck[1]))--}}
                {{--                      @include($arrCheck[1])--}}
                {{--                    @endif--}}
                {{--                  @else--}}
                {{--                    {!! trim($item) !!}--}}
                {{--                  @endif--}}
                {{--                </div>--}}
                {{--            @endforeach--}}
                {{--          @endif--}}
                {{--         </div>--}}
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
{{--                            <div class="menu-left">--}}
{{--                                <button type="button" class="btn btn-default grid-select-all"><i--}}
{{--                                            class="fa fa-square-o"></i></button>--}}
{{--                            </div>--}}
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

                        {{--                                  @if (!empty($buttonSort))--}}
                        {{--                                  <div class="menu-left">--}}
                        {{--                                    <div class="btn-group">--}}
                        {{--                                          <select class="form-control" id="order_sort">--}}
                        {{--                                          {!! $optionSort??'' !!}--}}
                        {{--                                          </select>--}}
                        {{--                                    </div>--}}
                        {{--                                    <div class="btn-group">--}}
                        {{--                                      <a class="btn btn-flat btn-primary" title="{{ trans('admin.sort') }}" id="button_sort">--}}
                        {{--                                        <i class="fa fa-sort-amount-asc"></i>--}}
                        {{--                                      </a>--}}
                        {{--                                    </div>--}}
                        {{--                                  </div>--}}
                        {{--                                  @endif--}}

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
                <div class="tableData">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        @foreach($orderStatus as $key => $status)
                            <li role="presentation" class="{{ ($loop->first) ? 'active' : '' }}">
                                <a href="#state{{ $key }}" aria-controls="{{ $status }}" role="tab"
                                   data-toggle="tab">{{ $status }}</a>
                            </li>
                        @endforeach
                        <li role="presentation">
                            <a href="#all" aria-controls="all" role="tab" data-toggle="tab">Tất cả</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        @foreach($orderStatus as $key => $status)
                            <div role="tabpanel" class="tab-pane fade {{ ($loop->first) ? 'active in' : '' }}"
                                 id="state{{ $key }}">
                                <section id="pjax-container" class="table-list">
                                    <div class="box-body table-responsive no-padding">
                                        <table class="table table-hover dataTable" id="dataTable">
                                            <thead>
                                            <tr>
                                                @if (!empty($removeList))
                                                    <th></th>
                                                @endif
                                                <th>ID</th>
                                                <th>Tên</th>
                                                <th>Số ĐT</th>
                                                <th>Email</th>
                                                <th>Tiền hàng</th>
                                                <th>Vận chuyển</th>
                                                <th>Giảm giá</th>
                                                <th>Tổng</th>
                                                <th>Trạng thái</th>
                                                <th>Tạo lúc</th>
                                                <th>Hành động</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @if($dataTable[$status])
                                                @foreach($dataTable[$status] as $data)
                                                    @if($data->status == 1)
                                                        <tr>
                                                            @if (!empty($removeList))
                                                                <td>
                                                                    <input class="input grid-row-checkbox" type="checkbox" data-id="{{ $data->id ?? '' }}" >
                                                                </td>
                                                            @endif
                                                            <td>{{ $data->id }}</td>
                                                            <td>{{ $data->provider_name }}</td>
                                                            <td>{{ ($data->phone)?? 'N/A' }}</td>
                                                            <td>{{ ($data->email)?? 'N/A' }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->subtotal ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->shipping ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->discount ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->total ?? 0, $data->currency) }}</td>
                                                            <td>{{ $status }}</td>
                                                            <td>{{ date_format($data->created_at, 'H:i:s d-m-Y') }}</td>
                                                            <td>
                                                                <a href="{{ route('provider_order.show', ['id' => $data->id]) }}"><span
                                                                            title="Xem" type="button"
                                                                            class="btn btn-flat btn-primary"><i
                                                                                class="fa fa-eye"></i></span></a>&nbsp;
                                                                @if(Admin::user()->username == 'telesale' || Admin::user()->username == 'admin' || Admin::user()->username == 'superadmin')
                                                                <a href="{{ route('provider_order.detail', ['id' => $data->id]) }}"><span
                                                                            title="{{ trans('order.admin.edit') }}"
                                                                            type="button"
                                                                            class="btn btn-flat btn-primary"><i
                                                                                class="fa fa-edit"></i></span></a>&nbsp;
                                                                <span onclick="deleteItem({{ $data->id }});"
                                                                      title="{{ trans('admin.delete') }}"
                                                                      class="btn btn-flat btn-danger"><i
                                                                            class="fa fa-trash"></i></span>
                                                                @endif
                                                            </td>
                                                        </tr>
                                                    @elseif($data->status == 2)
                                                        <tr>
                                                            @if (!empty($removeList))
                                                                <td>
                                                                    <input class="input grid-row-checkbox" type="checkbox"
                                                                           data-id="{{ $data->id ?? '' }}">
                                                                </td>
                                                            @endif
                                                            <td>{{ $data->id }}</td>
                                                            <td>{{ $data->provider_name }}</td>
                                                            <td>{{ ($data->phone)?? 'N/A' }}</td>
                                                            <td>{{ ($data->email)?? 'N/A' }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->subtotal ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->shipping ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->discount ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->total ?? 0, $data->currency) }}</td>
                                                            <td>{{ $status }}</td>
                                                            <td>{{ date_format($data->created_at, 'H:i:s d-m-Y') }}</td>
                                                            <td>
                                                                <a href="{{ route('provider_order.show', ['id' => $data->id]) }}"><span
                                                                            title="Xem" type="button"
                                                                            class="btn btn-flat btn-primary"><i
                                                                                class="fa fa-eye"></i></span></a>&nbsp;
                                                            </td>
                                                        </tr>
                                                    @else
                                                        <tr>
                                                            @if (!empty($removeList))
                                                                <td>
                                                                    <input class="input grid-row-checkbox" type="checkbox"
                                                                           data-id="{{ $data->id ?? '' }}">
                                                                </td>
                                                            @endif
                                                            <td>{{ $data->id }}</td>
                                                            <td>{{ $data->provider_name }}</td>
                                                            <td>{{ ($data->phone)?? 'N/A' }}</td>
                                                            <td>{{ ($data->email)?? 'N/A' }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->subtotal ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->shipping ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->discount ?? 0, $data->currency) }}</td>
                                                            <td>{{ sc_currency_render_symbol($data->total ?? 0, $data->currency) }}</td>
                                                            <td>{{ $status }}</td>
                                                            <td>{{ date_format($data->created_at, 'H:i:s d-m-Y') }}</td>
                                                            <td>
                                                                <a href="{{ route('provider_order.show', ['id' => $data->id]) }}"><span
                                                                            title="Xem" type="button"
                                                                            class="btn btn-flat btn-primary"><i
                                                                                class="fa fa-eye"></i></span></a>&nbsp;
                                                                <span onclick="deleteItem({{ $data->id }});"
                                                                      title="{{ trans('admin.delete') }}"
                                                                      class="btn btn-flat btn-danger"><i
                                                                            class="fa fa-trash"></i></span>
                                                            </td>
                                                         </tr>
                                                    @endif
                                                @endforeach
                                            @endif
                                            </tbody>
                                        </table>
                                    </div>
                                    {{--                                          <div class="box-footer clearfix">--}}
                                    {{--                                             {!! $resultItems??'' !!}--}}
                                    {{--                                             {!! $pagination??'' !!}--}}
                                    {{--                                          </div>--}}

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
                        @endforeach
                        <div role="tabpanel" class="tab-pane fade" id="all">
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
                                        @foreach ($dataTr as $keyRow => $tr)
                                            <tr>
                                                @if (!empty($removeList))
                                                    <td>
                                                        <input type="checkbox" class="input grid-row-checkbox"
                                                               data-id="{{ $tr['id'] ?? '' }}">
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
                                {{--      <div class="box-footer clearfix">--}}
                                {{--         {!! $resultItems??'' !!}--}}
                                {{--         {!! $pagination??'' !!}--}}
                                {{--      </div>--}}

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
{{--        {{dd($urlDeleteItem)}}--}}
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
