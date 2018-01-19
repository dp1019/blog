<?php

namespace app\admin\controller;
use app\admin\model\ProductModel;
use app\admin\model\ProductCateModel;
use app\admin\model\CodeModel;
use app\admin\model\StandardModel;
use think\Db;
use think\Request;
class Product extends Base
{

    public function index(Request $request){
        if(!$keyword = $request->get('keyword')){
            $keyword = '';
        }
        if(!$title  = $request->get('title')){
            $title = '';
        }
        $status = $request->get('status');
        if($status == null){
            $status = -1;
        }
        if(!$pcate_id = $request->get('pcate_id')){
            $pcate_id = -1;
        }
        if(!$code = $request->get('code')){
            $code = -1;
        }
        $sale = $request->get('sale');
        //var_dump($sale);die;
        $integral = $request->get('integral');
        $isShop = $request->get('isShop');
        $cates = ProductCateModel::all();
        $codes = CodeModel::all();
        return view('index',[
            'keyword' => $keyword,
            'title'=>$title,
            'cates'=>$cates,
            'codes'=>$codes,
            'code' =>$code,
            'status' => $status,
            'pcate_id' => $pcate_id,
            'sale'  => $sale,
            'integral' => $integral,
            'isShop' => $isShop
        ]);
    }
    // 异步数据接口
    public function getData(Request $request){
        $limits = $request->get('limit');
        $nowPage = $request->get('page') ? $request->get('page') : 1;
        $map = [];
        if($keyword = $request->get('keyword')){
            $map['keyword'] = ['like',"%{$keyword}%"];
        }
        if($title = $request->get('title')){
            $map['title'] = ['like' , "%{$title}%"];
        } 
        $productcate_id = $request->get('pcate_id');
        if(-1 != $productcate_id){
            $map['productcate_id'] = $productcate_id; 
        }
        $status = $request->get('status');
        if(-1 != $status){
            $map['status'] = $status; 
        }
        $code = $request->get('code');
        if(-1 != $code){
            $codeModel = CodeModel::find($code);
            $ids = $codeModel->products()->column('think_product.id');
            $map['id'] = ['in',$ids];
        }
        $isShop = $request->get('isShop');
        if($isShop){
            $map['integral'] = ['<>',0];
        }
        $integral = $request->get('integral');
        if(1 == $integral){
            $order['integral'] = 'desc';
        }
        if(-1 == $integral){
            $order['integral'] = 'asc';
        }
        $sale = $request->get('sale');
        if(1 == $sale){
            $order['sale'] = 'desc';
        }
        if(-1 == $sale){
            $order['sale'] = 'asc';
        }
        $order['sort'] = 'desc';

        $map['is_delete'] = 0;
        $lists = ProductModel::where($map)->with(['productcate'])->order($order)->select();
        $count = count($lists);
        $allPage = (int)ceil($count / $limits);
        $data = $this->page($nowPage,$limits,$allPage,$lists);
        return ["code"=>0,"msg"=>"","count"=>$count,'data'=>$data];

    }
    //异步状态接口
    public function status(Request $request){
        $id = $request->get('id');
        $admin = ProductModel::get($id);
        if($admin->status == 1){
            $admin->status = 0;
            $admin->save();
            return ['code' => 1 , 'msg' => '已下架'];
        }else{
            $admin->status = 1;
            $admin->save();
            return ['code' => 0 , 'msg' => '已上架'];
        }
        
    }
    //异步排序并批量到积分商城接口
    public function sort()
    {
        $param = input('post.');
        foreach ($param as $id => $value){
            if(strpos($id, 'in') !== false){
                ProductModel::where(['id' => str_replace('in', '', $id)])->setField('integral' , $value);
            }else{
                ProductModel::where(['id' => $id])->setField('sort' , $value);
            }  
        }
        return json(['code' => 1, 'msg' => '批量更新成功']);
        
    }
    //异步批量移入接口
    public function productMoveMany(Request $request){
        $param = $request->post();
        foreach ($param['arrIds'] as $id) {
            ProductModel::where(['id'=>$id])->setField('productcate_id',$param['productcate_id']);
        }
        return json(['code' => 1 ,'msg' => '移动成功']);
    }
    //此接口废弃
    // public function productFavorableMany(Request $request){
    //     $param = $request->post();
    //     foreach ($param['arrIds'] as $id) {
    //         ProductModel::where(['id'=>$id])->setField('code_id',$param['code_id']);
    //     }
    //     return json(['code' => 1 ,'msg' => '设置优惠成功']);
    // }
    //异步批量删除接口
    public function productDeleteMany(Request $request){
        $param = $request->post();
        foreach ($param['arrIds'] as $id) {
            ProductModel::where(['id'=>$id])->setField('is_delete',1);
        }
        return json(['code' => 1 ,'msg' => '删除成功']);
    }
    //异步批量上架接口
    public function productUpMany(Request $request){
        $param = $request->post();
        foreach ($param['arrIds'] as $id) {
            ProductModel::where(['id'=>$id])->setField('status',1);
        }
        return json(['code' => 1 ,'msg' => '上架成功']);
    }
    //异步批量下架接口
    public function productDownMany(Request $request){
        $param = $request->post();
        foreach ($param['arrIds'] as $id) {
            ProductModel::where(['id'=>$id])->setField('status',0);
        }
        return json(['code' => 1 ,'msg' => '下架成功']);
    }
    // 创建商品页面渲染
    public function createProduct(){
        $standards = StandardModel::all();
        $codes = CodeModel::all();
        $cates = ProductCateModel::all();
        return view('create_product',[
            'codes' => $codes,
            'standards' => $standards, 
            'cates' => $cates
        ]);
    }

    // 添加商品
    public function storeProduct(Request $request){
        $data = $request->post();
        unset($data['file']);
        $bool = isset($data['codes']);
        if($bool){
            $arr = [];  // low在这些地方    [0=>1,1,=>2]关联对不起  [1,2]我才可以
            foreach($data['codes'] as $code){
                $arr[] = $code;
            }    
        }
        unset($data['codes']);
        if($product = ProductModel::create($data)){
            if($bool){
                $product->codes()->attach($arr);
            }
            return json(['code' => 1 ,'msg' => '添加基本信息成功请继续继续添加规格','url' => url('product/add_standard',['id'=>$product->id])]);
        }
    }
    // 编辑商品页面
    public function editProduct(Request $request){
        $id = $request->get('id');
        $product = ProductModel::get($id);
        $standards = StandardModel::all();
        $codes = CodeModel::all();
        $product_codes = $product->codes()->column('think_code.id');
        $cates = ProductCateModel::all();
        return view('edit_product',[
            'codes' => $codes,
            'product_codes' => $product_codes,
            'standards' => $standards, 
            'cates' => $cates,
            'product' => $product
        ]);
    }
    // 更新商品
    public function updateProduct(Request $request){
        $data = $request->post();
        unset($data['file']);
        $bool = isset($data['codes']);
        if($bool){
            $arr = [];  // low在这些地方    [0=>1,1,=>2]关联对不起  [1,2]我才可以
            foreach($data['codes'] as $code){
                $arr[] = $code;
            }
        }
        unset($data['codes']);
        if( false!==ProductModel::where('id',$data['id'])->update($data)){
            if($bool){
                ProductModel::get($data['id'])->codes()->detach();//  不能加个sync方法吗
                ProductModel::get($data['id'])->codes()->attach($arr);// 解绑在绑定 
            }
            return json(['code' => 1 ,'msg' => '更新成功']);
        }
    }
    //分页数据提取器
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
    //*********************************************分类管理*********************************************//

    /**
     * [index_cate 分类列表]
     * @return [type] [description]
     */
    public function index_cate(){

        $cate = new ProductCateModel();
        $list = $cate->getAllCate();
        $this->assign('list',$list);
        return $this->fetch();
    }


    /**
     * [add_cate 添加分类]
     * @return [type] [description]
     */
    public function add_cate()
    {
        if(request()->isAjax()){

            $param = input('post.');
            $cate = new ProductCateModel();
            $flag = $cate->insertCate($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        return $this->fetch();
    }


    /**
     * [edit_cate 编辑分类]
     * @return [type] [description]
     */
    public function edit_cate()
    {
        $cate = new ProductCateModel();

        if(request()->isAjax()){

            $param = input('post.');
            $flag = $cate->editCate($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = input('param.id');
        $this->assign('cate',$cate->getOneCate($id));
        return $this->fetch();
    }


    /**
     * [del_cate 删除分类]
     * @return [type] [description]
     */
    public function del_cate()
    {
        $id = input('param.id');
        $cate = new ProductCateModel();
        $flag = $cate->delCate($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }



    /**
     * [cate_state 分类状态]
     * @return [type] [description]
     */
    public function cate_state()
    {
        $id=input('param.id');
        $status = Db::name('product_cate')->where(array('id'=>$id))->value('status');//判断当前状态情况
        if($status==1)
        {
            $flag = Db::name('product_cate')->where(array('id'=>$id))->setField(['status'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }
        else
        {
            $flag = Db::name('product_cate')->where(array('id'=>$id))->setField(['status'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    
    }  
    //*********************************************优惠券管理*********************************************//

    /**
     * [index_code 分类列表]
     * @return [type] [description]
     */
    public function index_code(){

        $cate = new CodeModel();
        $list = $cate->getAllCate();
        $this->assign('list',$list);
        return $this->fetch();
    }


    /**
     * [add_code 添加分类]
     * @return [type] [description]
     */
    public function add_code()
    {
        if(request()->isAjax()){

            $param = input('post.');
            $cate = new CodeModel();
            $flag = $cate->insertCate($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        return $this->fetch();
    }


    /**
     * [edit_code 编辑分类]
     * @return [type] [description]
     */
    public function edit_code()
    {
        $cate = new CodeModel();

        if(request()->isAjax()){

            $param = input('post.');
            $flag = $cate->editCate($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = input('param.id');
        $this->assign('cate',$cate->getOneCate($id));
        return $this->fetch();
    }


    /**
     * [del_cate 删除分类]
     * @return [type] [description]
     */
    public function del_code()
    {
        $id = input('param.id');
        $cate = new CodeModel();
        $flag = $cate->delCate($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }



    // /**
    //  * [cate_state 分类状态]
    //  * @return [type] [description]
    //  */
    // public function cate_state()
    // {
    //     $id=input('param.id');
    //     $status = Db::name('product_cate')->where(array('id'=>$id))->value('status');//判断当前状态情况
    //     if($status==1)
    //     {
    //         $flag = Db::name('product_cate')->where(array('id'=>$id))->setField(['status'=>0]);
    //         return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
    //     }
    //     else
    //     {
    //         $flag = Db::name('product_cate')->where(array('id'=>$id))->setField(['status'=>1]);
    //         return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
    //     }
    
    // } 
    //*****************************************规格价格管理*********************************************//
    /**
     * [index_code 商品规格列表]
     * @return [type] [description]
     */
    public function index_standard(){
        $id = input('id');
        $list = StandardModel::where('pid',$id)->select();
        return view('index_standard',['list'=>$list,'id'=>$id]);
    }


    /**
     * [add_code 添加规格]
     * @return [type] [description]
     */
    public function add_standard(Request $request)
    {
        if($request->isPost()){
            $param = input('post.');
            $pid = input('pid');  // 商品id
            $cate = new StandardModel();
            $flag = $cate->insertCate($param);
            return json(['code' => 1, 'msg' => '添加规格成功','pid'=>$pid]);
        }  
        $id = input('id');
        $product = ProductModel::get($id);
        return $this->fetch('add_standard',['product'=>$product]);
    }


    /**
     * [edit_code 编辑规格]
     * @return [type] [description]
     */
    public function edit_standard()
    {
        $cate = new StandardModel();

        if(request()->isAjax()){
            $param = input('post.');
            $flag = $cate->editCate($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg'],'pid'=>input('pid')]);
        }

        $id = input('param.id');
        $pid = input('pid');
        return view('edit_standard',['cate'=>$cate->getOneCate($id),'pid'=>$pid]);
    }


    /**
     * [del_cate 删除分类]
     * @return [type] [description]
     */
    public function del_standard()
    {
        $id = input('param.id');
        $pid = input('pid');
        $cate = new StandardModel();
        $flag = $cate->delCate($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg'],'pid'=>$pid]);
    }
}