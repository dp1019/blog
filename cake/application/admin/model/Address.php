<?php

namespace app\admin\model;

use think\Model;

class Address extends Model
{
    public function vip()
    {
    	return $this->belongsTo('VipModel');
    }
}
