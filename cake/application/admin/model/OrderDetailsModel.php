<?php
namespace app\admin\model;
use think\Db;
use think\Model;
/**
 * 
 */
 class OrderDetailsModel extends Model
 {
 	protected $name = 'orderdetails';
 	public function orders(){
 		return $this->belongsTo('OrderModel','order_id');
 	}
 	// public function productss(){
 	// 	return $this->belongsTo('ProductModel','product_id');
 	// }
 	// public function standard(){
 	// 	return $this->belongsTo('StandardModel','standard_id');
 	// }
 	// public function orderdetails(){
 		
 	// }
 	public function delOrderDetails($id)
    {
        try{  	
            $this->where('order_id', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '产品详情删除成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }
 } 
?>