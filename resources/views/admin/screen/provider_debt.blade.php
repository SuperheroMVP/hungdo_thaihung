@extends('admin.layout')

@section('main')
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="content-wrapper">
                    <div id="app">
                        <section class="content-header">
                            <h1>
                                <i class="fa fa-indent" aria-hidden="true"></i> Danh sách Đại lý
                                <small></small>
                            </h1>
                            <div class="more_info"></div>
                            <!-- breadcrumb start -->
                            <ol class="breadcrumb">
                                <li><a href="http://thaihung.htc-it.team/public/sc_admin"><i
                                                class="fa fa-dashboard"></i> Trang chủ</a></li>
                                <li>Danh sách Đại lý</li>
                            </ol>
                            <!-- breadcrumb end -->
                        </section>
                        <section class="content">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box">
                                        <div class="box-header with-border">
                                            <div class="pull-right">
                                                <div class="menu-right">
                                                    <form action="http://thaihung.htc-it.team/public/sc_admin/provider"
                                                          id="button_search">
                                                        <div onclick="$(this).submit();" class="btn-group pull-right">
                                                            <a class="btn btn-flat btn-primary" title="Refresh">
                                                                <i class="fa  fa-search"></i>
                                                            </a>
                                                        </div>
                                                        <div class="btn-group pull-right">
                                                            <div class="form-group">
                                                                <input type="text" name="keyword" class="form-control"
                                                                       placeholder="Tìm tên hoặc email" value="">
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="pull-left">
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>

                                        <div class="box-header with-border">
                                            <div class="pull-right">
                                                <div class="menu-right">

                                                </div>
                                            </div>


                                            <div class="pull-left">


                                                <div class="menu-left">
                                                    <div class="btn-group">
                                                        <select class="form-control" id="order_sort">
                                                            <option value="id__desc">ID desc</option>
                                                            <option value="id__asc">ID asc</option>
                                                            <option value="name__desc">Tên z-a</option>
                                                            <option value="name__asc">Tên a-z</option>
                                                            <option value="email__desc">Email z-a</option>
                                                            <option value="email__asc">Email a-z</option>
                                                        </select>
                                                    </div>
                                                    <div class="btn-group">
                                                        <a class="btn btn-flat btn-primary" title="Sắp xếp"
                                                           id="button_sort">
                                                            <i class="fa fa-sort-amount-asc"></i>
                                                        </a>
                                                    </div>
                                                </div>


                                            </div>

                                        </div>
                                        <!-- /.box-header -->
                                        <section id="pjax-container" class="table-list">
                                            <div class="box-body table-responsive no-padding">
                                                <table class="table table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tên đại lý</th>
                                                        <th>Email</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Tỉnh</th>
                                                        <th>Tổng nợ</th>
                                                        <th>Tổng bán</th>
                                                        <th>Hành động</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>7</td>
                                                        <td>TH - Bắc Giang</td>
                                                        <td>faker74209@gmail.com</td>
                                                        <td>0969837681</td>
                                                        <td>Bắc Giang</td>
                                                        <td></td>
                                                        <td></td>
                                                        <td>
                                                            <a href="http://thaihung.htc-it.team/public/sc_admin/debt/detail_provider_debt/7"><span
                                                                        title="Xem công nợ" type="button"
                                                                        class="btn btn-flat btn-warning"><i
                                                                            class="fa fa-book"></i></span></a>&nbsp;
                                                        </td>
                                                    </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </section>
                                        <!-- /.box-body -->
                                    </div>
                                </div>
                            </div>


                            @endsection

                            @push('styles')

                            @endpush

                            @push('scripts')

                                <script>

                                </script>

    @endpush