<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ShopOrderDivide;
use App\Models\ShopOrderDivideProduct;


class ShopOrderDivideController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     *
     */

    public function __construct()
    {

    }

    public function index()
    {

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
//        dd($request);
        $order_divide = new ShopOrderDivide();
        $order_divide->order_id = $request->order_id;
        $order_divide->save();
        //create divide

        if (count($request->name) > 0){
            foreach ($request->name as $key=>$n){
                if ($request->munber_divide[$key] == null || $request->munber_divide[$key] < 1 ){
                    continue;
                }
                $order_divide_product = new ShopOrderDivideProduct();
                $order_divide_product->order_id = $request->order_id;
                $order_divide_product->divide_id = $order_divide->id;
                $order_divide_product->name = $request->name[$key];
                $order_divide_product->sku = $request->sku[$key];
                $order_divide_product->price = $request->price[$key];
                $order_divide_product->qty = $request->qty[$key];
                $order_divide_product->total_price = $request->total_price[$key];
                $order_divide_product->tax = $request->tax[$key];
                $order_divide_product->munber_divide = $request->munber_divide[$key];
                $order_divide_product->remaining = $request->remaining[$key] ?? 1 ;
                $order_divide_product->save();
            }
        }
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => 'Method not allow!']);
        } else {
            $ids = request('pId');
            $divide = ShopOrderDivide::find($ids);
            ShopOrderDivideProduct::where('divide_id', $divide->id)->delete();
            ShopOrderDivide::destroy($ids);
            return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
        }
    }
}
