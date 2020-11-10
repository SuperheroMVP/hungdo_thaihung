@extends('admin.layout')

@section('main')
<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h2 class="box-title">{{ $title_description??'' }}</h2>

                <div class="box-tools">
                    <div class="btn-group pull-right" style="margin-right: 5px">
                        <a href="{{ route('admin_supplier.index') }}" class="btn  btn-flat btn-default" title="List"><i
                                class="fa fa-list"></i><span class="hidden-xs"> {{trans('admin.back_list')}}</span></a>
                    </div>
                </div>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action="{{ $url_action }}" method="post" accept-charset="UTF-8" class="form-horizontal" id="form-main"
                enctype="multipart/form-data">


                <div class="box-body">
                    <div class="fields-group">
                        <div class="form-group   {{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-sm-2 col-form-label">Tên đại lý</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                    <input type="text" id="name" name="name"
                                        value="{!! old()?old('name'):$supplier['name']??'' !!}"
                                        class="form-control"  placeholder="" readonly/>
                                    <input type="hidden" id="products" name="products"
                                           class="form-control"  placeholder="" readonly/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-search fa-fw"></i></span>
                                            <input type="text" id="searchProduct" name=""
                                                   class="form-control"  placeholder="Sản phẩm chưa chọn"/>
                                        </div>
                                    </div>
                                </div>
                                <ul class="list-group list-group-sortable-connected" id="productList">
                                    @if($products)
                                        @foreach($products as $product)
                                            @if(!in_array($product->id, explode(',', $supplier['products'])))
                                                <li class="list-group-item list-group-item-info" value="{{ $product->id }}">
                                                    <img src="{{ asset(old('image',$product->image)) }}">
                                                    {{ $product->name }}
                                                </li>
                                            @endif
                                        @endforeach
                                    @endif
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-search fa-fw"></i></span>
                                            <input type="text" id="searchSelected" name=""
                                                   class="form-control"  placeholder="Sản phẩm đã chọn"/>
                                        </div>
                                    </div>
                                </div>
                                <ul class="list-group list-group-sortable-connected" id="productSelected">
                                    @if($products)
                                        @foreach($products as $product)
                                            @if(in_array($product->id, explode(',', $supplier['products'])))
                                                <li class="list-group-item list-group-item-success" value="{{ $product->id }}">
                                                    <img src="{{ asset(old('image',$product->image)) }}">
                                                    {{ $product->name }}
                                                </li>
                                            @endif
                                        @endforeach
                                    @endif
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                        <!-- /.box-body -->

                        <div class="box-footer">
                            @csrf
                            <div class="col-md-2">
                            </div>

                            <div class="col-md-8">
                                <div class="btn-group pull-right">
                                    <button type="submit" id="submit" class="btn btn-primary">{{ trans('admin.submit') }}</button>
                                </div>

                                <div class="btn-group pull-left">
                                    <button type="reset" class="btn btn-warning">{{ trans('admin.reset') }}</button>
                                </div>
                            </div>
                        </div>

                        <!-- /.box-footer -->
            </form>
        </div>
    </div>
</div>


@endsection

@push('styles')
    <style>
        #productList, #productSelected{
            overflow-y: auto;
            height: 65vh;
        }
        #productList img, #productSelected img{
            width: 50px;
            height: 50px;
        }
    </style>
@endpush

@push('scripts')
    <script src="{{ asset('admin/plugin/sortable/jquery.sortable.min.js')}}"></script>
    <script>
        $(document).ready(function () {
            $("#searchProduct").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#productList li").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
            $("#searchSelected").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#productSelected li").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });

            $("#submit").click(function (e) {
                var i = 0;
                var arlene1 = [];
                $('#productSelected li').each(function () {
                    arlene1[i++] = $(this).val();
                });
                $('#products').val(arlene1);
            });

            $('.list-group-sortable-connected').sortable({
                placeholderClass: 'list-group-item',
                connectWith: '.connected'
            });
        });
    </script>
@endpush