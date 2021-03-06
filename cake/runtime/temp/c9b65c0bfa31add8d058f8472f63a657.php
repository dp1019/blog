<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:68:"D:\cake\public/../application/admin\view\product\index_standard.html";i:1515338840;s:59:"D:\cake\public/../application/admin\view\public\header.html";i:1515673654;s:59:"D:\cake\public/../application/admin\view\public\footer.html";i:1515674134;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo config('WEB_SITE_TITLE'); ?></title>
    <link href="/static/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/static/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/static/admin/css/animate.min.css" rel="stylesheet">
    <link href="/static/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/static/admin/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="/static/admin/css/plugins/switchery/switchery.css" rel="stylesheet">
    <link href="/static/admin/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="/static/admin/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/admin/dist/css/layui.css" media="all">
    <script src="/static/admin/dist/layui.all.js"></script>
    <style type="text/css">
    .long-tr th{
        text-align: center
    }
    .long-td td{
        text-align: center
    }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>规格列表</h5>
        </div>
        <div class="ibox-content">
            <!--搜索框开始-->           
            <div class="row">
                <div class="col-sm-12">   
                <div  class="col-sm-3" style="width: 120px">
                    <div class="input-group" >  
                        <a href="<?php echo url('add_standard',['id'=>$id]); ?>"><button class="btn btn-outline btn-primary" type="button">继续添加规格</button></a> 
                    </div>
                    
                </div>  
                <div  class="col-sm-3" style="width: 120px">
                    <div class="input-group" >  
                        <a href="<?php echo url('product/index'); ?>"><button class="btn btn-outline btn-success" type="button">商品列表</button></a> 
                    </div>  
                </div>                                                                
                </div>
            </div>
            <!--搜索框结束-->
            <div class="hr-line-dashed"></div>

            <div class="example-wrap">
                <div class="example">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr class="long-tr">
                                <th>商品名称</th>
                                <th>规格名称</th>
                                <th>价格（元）</th>
                                <th>会员价格（元）</th>
                                <th width="15%">添加时间</th>
                                <th width="15%">更新时间</th>
                                <th width="20%">操作</th>
                            </tr>
                        </thead>
                        <tbody id="article_list">
                            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                                <tr class="long-td">
                                    <td><?php echo $vo->product->title; ?></td>
                                    <td><?php echo $vo['name']; ?></td>
                                    <td><?php echo $vo['price']; ?></td> 
                                    <td><?php echo $vo['member_price']; ?></td>                                
                                    <td><?php echo $vo['create_time']; ?></td>
                                    <td><?php echo $vo['update_time']; ?></td>
                                    <td>
                                        <a href="<?php echo url('edit_standard',['id'=>$vo['id'],'pid'=>$id]); ?>" class="btn btn-primary btn-outline btn-xs">
                                            <i class="fa fa-paste"></i> 编辑</a>&nbsp;&nbsp;
                                        <a href="javascript:;" onclick="del_cate(<?php echo $vo['id']; ?>)" class="btn btn-danger btn-outline btn-xs">
                                            <i class="fa fa-trash-o"></i> 删除</a>   
                                    </td>
                                </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Panel Other -->
</div>
<script src="__JS__/jquery.min.js?v=2.1.4"></script>
<script src="__JS__/bootstrap.min.js?v=3.3.6"></script>
<script src="__JS__/content.min.js?v=1.0.0"></script>
<script src="__JS__/plugins/chosen/chosen.jquery.js"></script>
<script src="__JS__/plugins/iCheck/icheck.min.js"></script>
<!-- <script src="__JS__/plugins/layer/laydate/laydate.js"></script> -->
<script src="__JS__/plugins/switchery/switchery.js"></script><!--IOS开关样式-->
<script src="__JS__/jquery.form.js"></script>
<script src="__JS__/layer/layer.js"></script>
<script src="__JS__/laypage/laypage.js"></script>
<script src="__JS__/laytpl/laytpl.js"></script>
<script src="__JS__/lunhui.js"></script>
<script src="/static/admin/laydate/laydate.js"></script>
<script>
    $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>


<script type="text/javascript">

var product_id = "<?php echo $id; ?>";
function del_cate(id){
    layer.confirm('确认删除此规格?', {icon: 3, title:'提示'}, function(index){
        //do something
        $.getJSON('./del_standard', {'id' : id ,'pid' : product_id}, function(res){
            if(res.code == 1){
                layer.msg(res.msg,{icon:1,time:1500,shade: 0.1},function(){
                    window.location.href="/admin/product/index_standard?id="+res.pid;
                });               
            }else{
                layer.msg(res.msg,{icon:0,time:1500,shade: 0.1});
            }
        });

        layer.close(index);
    })

}



</script>
</body>
</html>