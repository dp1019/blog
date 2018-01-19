<?php

namespace app\admin\controller;

use think\Request;
use app\admin\model\VipModel;
use app\admin\model\Adderss;
class Member extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $key = input('key');
        $map = [];
        if($key&&$key!==""){
            $map['nickname|phone'] = ['like',"%" . $key . "%"];   
        }      
        $vip = new VipModel();
        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = config('list_rows');
        $count = $vip->getAllCount($map);         //获取总条数
        $allpage = intval(ceil($count / $limits));  //计算总页面      
        $lists = $vip->getAll($map, $Nowpage, $limits); 
        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数 
        $this->assign('val', $key);
        if(input('get.page')){
            return json($lists);
        }
        return $this->fetch();
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $vip = new VipModel();
        $member = $vip->getVip($id);
        $member['money'] = $member['points'] = 0;
        foreach ($member['point'] as $k => $val) {
            $member['points'] += $val['point'];
        }
        foreach ($member['order'] as $k => $val) {
            $member['money'] += $val['actualCost'];
        }
        return view('edit_member',[
            'member'  => $member
        ]);
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        $rs = VipModel::where(['id'=>$id])->delete();
        if ($rs) {
            return json([
                'code' => 1,
                'msg'  => '删除会员成功'
            ]);
        }
    }

    public function member_status($id)
    {
        $status = VipModel::where(['id'=>$id])->value('status');
        if ($status == 1) {
            VipModel::where(['id'=>$id])->setField('status',0);
            return json([
                'code' => 1,
                'msg'  => '状态关闭'
            ]);
        }
        if($status == 0) {
            VipModel::where(['id'=>$id])->setField('status',1);
            return json([
                'code' => 0,
                'msg'  => '状态开启'
            ]);
        }

    }
}
