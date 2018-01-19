<?php

namespace app\admin\model;
use think\Model;
use think\Db;

class CodeModel extends Model
{
    protected $name = 'code';
    
    // 开启自动写入时间戳
    protected $autoWriteTimestamp = true;

    public function products(){
        return $this->belongsToMany('ProductModel','product_code','product_id','code_id');
    }
   
    public function getAllCate()
    {
        return $this->order('id asc')->select();       
    }


    
    public function insertCate($param)
    {
        try{
            $result = $this->save($param);
            if(false === $result){     
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '优惠添加成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }



    
    public function editCate($param)
    {
        try{
            $result = $this->save($param, ['id' => $param['id']]);
            if(false === $result){          
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '优惠编辑成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }



    
    public function getOneCate($id)
    {
        return $this->where('id', $id)->find();
    }



    public function delCate($id)
    {
        try{
            $this->where('id', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '优惠删除成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

}