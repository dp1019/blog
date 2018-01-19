<?php

namespace app\admin\model;
use think\Db;
use think\Model;

class OrderModel extends Model
{
    protected $name = 'order';
    protected $autoWriteTimestamp = false;
	// protected $autoWriteTimestamp = true;
	// protected $updateTime = false;

	public function OrdergetAll(){
		return $this->order('id asc')->select();
	}
	public function OrdergetOne($id){
		return $this->where('id',$id)->find();
	}
	// 此处也不关联  不一定是给自己的
	// public function ordercate(){
	// 	return $this->belongsTo('VipModel','member_id');
	// }
	// 此处不关联
	// public function address(){
	// 	return $this->belongsTo('Address','address_id');
	// }
	// public function details(){
	// 	return $this->hasMany('OrderModel','order_id');
	// }

    // public function orderdetails(){
    // 	return $this->hasMany('orderdetails');
    // }
	public function code(){
        return $this->belongsTo('CodeModel','code_id');
    }
    public function orderdetails(){
    	return $this->hasMany('OrderDetailsModel','order_id');
    }
	public function delOrder($id)
    {
        try{
            $this->where('id', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '订单删除成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
}
