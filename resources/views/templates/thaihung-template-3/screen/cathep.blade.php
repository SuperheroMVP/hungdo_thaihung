@php
    /*
    $layout_page = shop_cart
    $cart: no paginate
    $shippingMethod: string
    $paymentMethod: string
    $totalMethod: array
    $dataTotal: array
    $shippingAddress: array
    $countries: array
    $attributesGroup: array
    */
@endphp

@extends($templatePath.'.layout')

@section('main')
    <style>
        .list-group-item {
            user-select: none;
        }

        .list-group-item img {
            max-width: 100px;
            max-height: 50px;
            vertical-align: middle;
        }

        .list-group-item .provider-info {
            display: inline-block;
            vertical-align: middle;
        }

        .list-group input[type="checkbox"] {
            display: none;
        }

        .list-group input[type="checkbox"] + .list-group-item {
            cursor: pointer;
        }

        .list-group input[type="checkbox"] + .list-group-item:before {
            content: "\2713";
            color: transparent;
            font-weight: bold;
            margin-right: 1em;
        }

        .list-group input[type="checkbox"]:checked + .list-group-item {
            background-color: #0275D8;
            color: #FFF;
        }

        .list-group input[type="checkbox"]:checked + .list-group-item:before {
            color: inherit;
        }

        .list-group input[type="radio"] {
            display: none;
        }

        .list-group input[type="radio"] + .list-group-item {
            cursor: pointer;
        }

        .list-group input[type="radio"] + .list-group-item:before {
            content: "\2022";
            color: transparent;
            font-weight: bold;
            margin-right: 1em;
        }

        .list-group input[type="radio"]:checked + .list-group-item {
            background-color: #0275D8;
            color: #FFF;
        }

        .list-group input[type="radio"]:checked + .list-group-item:before {
            color: inherit;
        }
    </style>
    <section class="w-100 cat-thep">
        <div style="padding: 0 5%">
            <div class="cart-total">
                <div class="table-responsive">
                    <form action="{{ route('post.catthep') }}" method="post">
                        @csrf
                    <table class="table box table-bordered" id="cart-table">
                        <thead>
                        <tr style="background: #eaebec">
                            <th style="width: 50px;">STT</th>
                            <th>{{ trans('product.name') }}</th>
                            <th style="width: 200px;">Giá trị</th>
                            <th style="width: 200px;">Đơn vị</th>
                            <th style="width: 200px">{{ trans('product.quantity') }}</th>
                            <th style="width: 150px;">Thao Tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr class="row_cart">
                                <td>1</td>
                                <td>
                                    <select name="productid[]" id="" class="form-control select2">
                                        @foreach($products as $product)
                                            <option value="{{ $product->id }}">{{ $product->name }}</option>
                                        @endforeach
                                    </select>
                                </td>
                                <td>
                                    <input name="giatri[]" type="number" class="form-control" value="1" min="1">
                                </td>
                                <td>
                                    <select name="donvi[]" id="donvi" class="form-control">
                                        <option value="1">Kg</option>
                                        <option value="2">Mét</option>
                                    </select>
                                </td>
                                <td>
                                    <input name="quantity[]" type="number" class="form-control" value="1" min="1">
                                </td>
                                <td>
                                    <button name="delete" class="btn btn-danger">Xóa</button>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                        <tr style="background: #d9a751">
                            <td colspan="12">
                                <div class="pull-left">
                                    {{--<button class="btn btn-default" type="button"
                                            style="cursor: pointer;"
                                            onClick="location.href='{{ route('home') }}'"><i
                                                class="fa fa-arrow-left"></i> {{ trans('cart.back_to_shop') }}
                                    </button>--}}
                                </div>
                                <div class="pull-right">
                                    <button class="btn" type="button" name="add-product" style="cursor: pointer;color: #000000">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i>
                                        Thêm sản phẩm
                                    </button>
                                    <button class="btn btn-success" type="submit" name="complete">
                                        <i class="fa fa-check-square" aria-hidden="true"></i>
                                        Hoàn thành
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                    </form>
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

@push('scripts')
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzlVX517mZWArHv4Dt3_JVG0aPmbSE5mE&sensor=false&v=3&libraries=geometry"></script>
    {{--    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&v=3&libraries=geometry"></script>--}}
    <script>
        $(document).ready(function () {
            // $('.select2').select2();
            {{--let products = @json($products);--}}
            let rowContent = $('tr.row_cart').html();
            let row = `<tr class="row_cart">${rowContent}</tr>`;
            $(document).on('click', 'button[name=add-product]', function () {
                $('table tbody').append(row);
            })

            $(document).on('click', 'button[name=delete]', function () {
                $(this).parents('tr.row_cart').remove();
            })
        })
    </script>
@endpush

@push('styles')
    {{-- style css --}}
    <style>
        .list-group-item {
            user-select: none;
        }

        .list-group input[type="checkbox"] {
            display: none;
        }

        .list-group input[type="checkbox"] + .list-group-item {
            cursor: pointer;
        }

        .list-group input[type="checkbox"] + .list-group-item:before {
            content: "\2713";
            color: transparent;
            font-weight: bold;
            margin-right: 1em;
        }

        .list-group input[type="checkbox"]:checked + .list-group-item {
            background-color: #0275D8;
            color: #FFF;
        }

        .list-group input[type="checkbox"]:checked + .list-group-item:before {
            color: inherit;
        }

        .list-group input[type="radio"] {
            display: none;
        }

        .list-group input[type="radio"] + .list-group-item {
            cursor: pointer;
        }

        .list-group input[type="radio"] + .list-group-item:before {
            content: "\2022";
            color: transparent;
            font-weight: bold;
            margin-right: 1em;
        }

        .list-group input[type="radio"]:checked + .list-group-item {
            background-color: #0275D8;
            color: #FFF;
        }

        .list-group input[type="radio"]:checked + .list-group-item:before {
            color: inherit;
        }

        .cart_quantity_delete {
            cursor: pointer;
        }
    </style>
@endpush