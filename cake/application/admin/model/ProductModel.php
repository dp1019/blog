<?php
namespace app\admin\model;
use think\Model;
class ProductModel extends Model{
	protected $name = 'product';
	protected $autoWriteTimestamp = true;
	public function productcate(){
		return $this->belongsTo('ProductCateModel','productcate_id');
	}

	public function codes(){
		return $this->belongsToMany('CodeModel','product_code','code_id','product_id');
	}

	public function standards(){
		return $this->hasMany('StandardModel','pid');
	}
}



?>