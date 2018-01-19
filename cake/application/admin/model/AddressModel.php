<?php

namespace app\admin\model;
use app\admin\model\MemberModel;
use think\Model;

class AddressModel extends Model
{
    protected $name = 'address';

    public function vip(){
    	return $this->belongsTo('MemberModel','address_id');
    }
}
