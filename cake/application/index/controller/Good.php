<?php
namespace app\index\controller;
use app\admin\model\ProductModel;
use app\admin\model\ProductCateModel;
use app\admin\model\OrderModel;
use think\Request;

class Good
{
    public function index(){
        $goods = ProductModel::with(['standards','codes'])->where([
        	'status' => 1,
        	'is_delete' => 0
        ])->select();
        foreach($goods as $key => $val){
        	$goods[$key]['photo'] = rtrim($val['photo'],'|');
        }
        $cates = ProductCateModel::all();
        return json([
            'cakes' => $goods,
            'cates' => $cates
        ]);
    }

    public function getOrderById(Request $request){
        $order_id = input('order_id');
        //$order = Order::where('id',$order_id)->find();
        $order = OrderModel::where(['id' => $order_id])->with('orderdetails')->find();
        if($order){
            return json([
                'code' => 1,
                'data' => $order
            ]);
        }else{
            return json([
                'code' => 0
            ]);
        }
        
    }
}