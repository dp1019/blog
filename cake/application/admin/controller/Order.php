<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Db;
// use app\admin\model\Order as OrderModel;
// use app\admin\model\Orderdetails;
use app\admin\model\StandardModel;
use app\admin\model\OrderModel;
use app\admin\model\OrderDetailsModel;
class Order extends Controller
{

    public function create(Request $request)
    {
        $datas = $request->post();
        // 生成随机的13位订单号
        $order_num = date('Ymdhis') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
        // 写入订单主表中的字段
        $datas['order_num'] = $order_num;
        $datas['created_time'] = date('Y-m-d h:i',time());
        $datas['status'] = 0;
        $datas['total_price'] = 0;
        $products = $datas['orderdetails'];  //订单总价
        for($i = 0 ; $i < count($products) ; $i++){
            $standard_id = $products[$i]['standard'];
            $datas['total_price'] += StandardModel::where(['id'=>$standard_id])->value('member_price')*$products[$i]['num'];
        }
        // 提交到订单主表
        $order = new OrderModel($datas);
        $order->startTrans();   //打开事物
        $res = $order->allowField(true)->save(); //commit主表
        if(!$res){
            return json(['code' => 0 , 'message' => '提交失败请稍后再试']);
        }
        try{
            for($i = 0 ; $i < count($products) ; $i++){
                $products[$i]['order_id'] = $order['id'];
                $products[$i]['cake_name'] = $products[$i]['cake']['title'];
                $orderdetails = new OrderDetailsModel($products[$i]);
                $orderdetails->allowField(true)->save();
            }
            $order->commit();  // 提交
        }catch(\Exception $e){
            $order->rollback();  // 回滚
            return json(['code' => 0 , 'message' => '提交失败请稍后再试','error' => $e->getMessage()]);
        }
        return json(['code' => 1,'order_id' => $order->id]);      
    }

    ///////////////订单列表///////////////
    public function index(Request $request){
        if(!$order_num = $request->get('order_num')){
            $order_num = '';
        }
        if(!$delivery_day = $request->get('delivery_day')){
            $delivery_day = '';
        }
        if(!$delivery_time = $request->get('delivery_time')){
            $delivery_time = '';
        }
        $status = $request->get('status');
        if($status == null){
            $status = -1;
        }

        return view('index',[
            'order_num'=>$order_num,
            'delivery_day'=>$delivery_day,
            'delivery_time'=>$delivery_time,
            'status'=>$status,
        ]);
    }
    /////////////////订单数据/////////////////
    public function getData(Request $request){
        $limits = $request->get('limit');
        $nowPage = $request->get('page') ? $request->get('page') : 1;
        $map = [];
        if($order_num = $request->get('order_num')){
            $map['order_num'] = ['like',"%{$order_num}%"];
        }
        if($delivery_day = $request->get('delivery_day')){
            $map['day'] = ['like' , "%{$delivery_day}%"];
        } 
        if($delivery_time = $request->get('delivery_time')){
            $map['time'] = ['like' , "%{$delivery_time}%"];
        } 
        $status = $request->get('status');
        if($status != -1){
            $map['status'] = $status; 
        }
        $lists = OrderModel::where($map)->order('id desc')->select();
        $lists = collection($lists)->toArray();
        
        // foreach ($lists as $key => $value) {
        //    $lists[$key]['ordercate'] = $value['ordercate']['nickname'];
        //     $lists[$key]['address'] = $value['address']['address'];
        // }
        $count = count($lists);
        $allPage = (int)ceil($count / $limits);
        $data = $this->page($nowPage,$limits,$allPage,$lists);
        
        return ["code"=>0,"msg"=>"","count"=>$count,'data'=>$data];
    }
    ///////////分页////////////
    public function page( $page , $limits , $allPage , $lists){
        if(count($lists) == 0){
            return '';
        }
        $data = [];
        for($i = 1 ; $i <= $allPage ; $i++){
            for($j = $limits*($i-1) ; $j < $limits*$i ; $j++ ){
                if(isset($lists[$j])){
                    $data[$i][] = $lists[$j];
                }    
            }
        }
        return $data[$page];
    }
    ////////////订单状态/////////////
    public function status(Request $request){
        $id = $request->get('id');
        $admin = OrderModel::get($id);
        if($admin->status == 0){
            $admin->status = 1;
            $admin->save();
            return ['code' => 1 , 'msg' => '已改为付款状态'];die;
        }else if($admin->status == 1){
            $admin->status = 2;
            $admin->save();
            return ['code' => 1 , 'msg' => '开始送货'];die;
        }
        else if($admin->status == 2){
            $admin->status = 3;
            $admin->save();
            return ['code' => 1 , 'msg' => '送货完成'];
        }
    }
    ////////////////催单////////////////
    public function urge(Request $request){
        $id = $request->get('id');
        $admin = OrderModel::get($id);
        $admin->urge = 0;
        $admin->save();
        return ['code' => 1 , 'msg' => '已收到催单通知'];
    }
    /////////////订单删除/////////////
    public function delete(){
        $id = input('param.id');
        $order = new OrderModel;
        $proorder = new OrderDetailsModel;
          
        $prorder = $proorder->delOrderDetails($id);

        $dleorder = $order->delOrder($id);
        return json(['code' => 1, 'data' => '', 'msg' => '订单删除成功']);
    }
    
    ///////////////订单批量删除////////////////
    public function orderDeleteMany(Request $request){
        $param = $request->post();
        $order = new OrderModel;
        $proorder = new OrderDetailsModel;
        foreach ($param['arrIds'] as $id) {
            $prorder = $proorder->delOrderDetails($id);
            $dleorder = $order->delOrder($id);
        }
        return json(['code' => 1, 'data' => '', 'msg' => '订单批量删除成功']);
    }
    //////////////订单详情页///////////////
    public function details($id){
        $id = input('get.id');
        //$product = new OrderDetailsModel();
        // $cate = OrderDetailsModel::with(['orders','productss'])->where('order_id',$id)->select();
        // $cate = collection($cate)->toArray();
        
        // $order = new OrderModel();
        $order = OrderModel::with(['code','orderdetails'])->where(['id' => $id])->find();
        if($order['status'] == 0){
            $order['status'] = '待付款';
        }else if($order['status'] == 1){
            $order['status'] = '已支付';
        }else if($order['status'] == 2){
            $order['status'] = '配送中';
        }else if($order['status'] == 3){
            $order['status'] = '待评论';
        }else if($order['status'] == 4){
            $order['status'] = '订单完成';
        }
        
        return view('details',['order'=>$order]);
    }
}
