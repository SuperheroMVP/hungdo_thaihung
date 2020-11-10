@php
    /*
    $layout_page = shop_profile
    $statusOrder
    */
    /*$orders = $modelUserOrder->start()->getData();*/
@endphp

@extends($templatePath.'.layout')

@section('main')
    <section class="w-100">
        <div class="container">
            <h2 class="title text-center">{{ $title }}</h2>
            <div class="row">
                @if (count($orders) ==0)
                    <div class="col-md-12 text-danger">
                        {{ trans('account.orders.empty') }}
                    </div>
                @else
                <!-- /.box-header -->
                    <div class="tableData w-100">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            @foreach($statusOrder as $key => $status)
                                <li role="presentation" class="{{ ($loop->first) ? 'active' : '' }}" style="padding: 5px 10px;">
                                    <a href="#state{{ $key }}" aria-controls="{{ $status }}" role="tab"
                                       data-toggle="tab">{{ $status }}</a>
                                </li>
                            @endforeach
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            @foreach($statusOrder as $key => $status)
                                <div role="tabpanel" class="tab-pane fade {{ ($loop->first) ? 'active show' : '' }}"
                                     id="state{{ $key }}">
                                    <section id="pjax-container" class="table-list">
                                        <div class="box-body table-responsive no-padding">
                                            <table class="table table-hover dataTable" id="dataTable">
                                                <thead>
                                                <tr>
                                                    <th style="width: 50px;">No.</th>
                                                    <th style="width: 100px;">SKU</th>
                                                    <th>{{ trans('account.orders.total') }}</th>
                                                    <th>{{ trans('account.orders.status') }}</th>
                                                    <th>{{ trans('account.orders.date_add') }}</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                @foreach($orders as $key => $order)
                                                    @if($statusOrder[$order->status] == $status)
                                                        <tr>
                                                            <td><span class="item_21_id">{{ $key }}</span></td>
                                                            <td><span class="item_21_sku">#{{ $order->id }}</span></td>
                                                            <td align="right">
                                                                {{ number_format($order->total) }}
                                                            </td>
                                                            <td>{{ $statusOrder[$order->status]}}</td>
                                                            <td>{{ $order->created_at }}</td>
                                                            <td>
                                                                <a href="{{route('member.order_detail', $order->id)}}">
                                                                    <i class="glyphicon glyphicon-list-alt"></i> {{ trans('account.orders.detail_order') }}
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    @endif
                                                @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
            <li><a href="{{ route('member.index') }}">{{ trans('front.my_account') }}</a></li>
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