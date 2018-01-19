<?php

namespace app\admin\model;

use think\Model;

class VipModel extends Model
{
	protected $name = 'Vip';
	protected $autoWriteTimestamp = true;   // 开启自动写入时间戳
    public function getAllCount($map)
    {
        return $this->where($map)->count();
    }

    public function getAll($map, $Nowpage, $limits)
    {
        return $this->where($map)->page($Nowpage,$limits)->order('id asc')->select();     
    }

    public function address()
    {
    	return $this->hasMany('Address');
    }

    public function point()
    {
    	return $this->hasMany('Point');
    }

    public function order()
    {
    	return $this->hasMany('OrderModel','member_id');
    }

    public function getVip($id)
    {
    	//获取当前会员已完成订单的总和
        return $this->with(['order'=>function($query){
        	$query->where(['status' => 4]);
        },'point','address'])->where("id = $id")->find();
    }
}