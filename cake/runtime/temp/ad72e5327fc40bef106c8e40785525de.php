<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:59:"D:\cake\public/../application/admin\view\order\details.html";i:1516205547;s:59:"D:\cake\public/../application/admin\view\public\header.html";i:1515673654;s:59:"D:\cake\public/../application/admin\view\public\footer.html";i:1515674134;}*/ ?>
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
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>订单详情</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" name="edit_cate" id="edit_cate" method="post" action="<?php echo url('edit_cate'); ?>">
                    <input type="hidden" name="id" value="<?php echo $order['id']; ?>">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">订单号：</label>
                            <div class="input-group col-sm-4">
                                <input id="order_num" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $order['order_num']; ?>">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">收货人：</label>
                            <div class="input-group col-sm-4">
                                <input id="member_id" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $order['consignee']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">收货人电话：</label>
                            <div class="input-group col-sm-4">
                                <input id="member_id" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $order['receiving_telephone']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">收货地址：</label>
                            <div class="input-group col-sm-4">
                                <textarea id="address_id" type="text" class="form-control" disabled="disabled"  name="name"><?php echo $order['address']; ?></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">订单总额：</label>
                            <div class="input-group col-sm-4">
                                <input id="actualCost" type="text" class="form-control"  disabled="disabled" name="name" value="<?php echo $order['total_price']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">订单状态：</label>
                            <div class="input-group col-sm-4">
                                <textarea id="status" type="text" class="form-control" disabled="disabled" name="name"><?php echo $order['status']; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">客户留言：</label>
                            <div class="input-group col-sm-4">
                                <input id="message" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $order['message']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">下单时间：</label>
                            <div class="input-group col-sm-4">
                                <input id="create_time" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $order['created_time']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">配送日期：</label>
                            <div class="input-group col-sm-4">
                                <input id="delivery_day" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $order['day']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">配送时间段：</label>
                            <div class="input-group col-sm-4">
                                <input id="delivery_time" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $order['time']; ?>">
                            </div>
                        </div>
                        <?php if(is_array($order['orderdetails']) || $order['orderdetails'] instanceof \think\Collection || $order['orderdetails'] instanceof \think\Paginator): $i = 0; $__LIST__ = $order['orderdetails'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">产品图片：</label>
                                <div class="input-group col-sm-4">
                                    <img src="<?php echo $v['img']; ?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">产品名称：</label>
                                <div class="input-group col-sm-4">
                                    <input id="product_id" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $v['cake_name']; ?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">规格：</label>
                                <div class="input-group col-sm-4">
                                    <input id="standard_id" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $v['standard_name']; ?>">
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label">数量：</label>
                                <div class="input-group col-sm-4">
                                    <input id="num" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $v['num']; ?>">
                                </div>
                            </div>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        <div class="hr-line-dashed"></div>
                         <div class="form-group">
                            <label class="col-sm-3 control-label">优惠券：</label>
                            <div class="input-group col-sm-4">
                                <input id="standard_id" type="text" class="form-control" disabled="disabled" name="name" value="<?php echo $order['code']['name']; ?>">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-3">
                              <!--   <button class="btn btn-primary" type="submit"><i class="fa fa-save"></i> 保存</button>&nbsp;&nbsp;&nbsp; -->
                                <a class="btn btn-danger" href="javascript:history.go(-1);"><i class="fa fa-close"></i> 返回</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
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


    $(function(){
        $('#edit_cate').ajaxForm({
            beforeSubmit: checkForm, 
            success: complete, 
            dataType: 'json'
        });
        
        function checkForm(){
            if( '' == $.trim($('#name').val())){
                layer.msg('请输入分类名称',{icon:2,time:1500,shade: 0.1}, function(index){
                layer.close(index);
                });
                return false;
            }
        }


        function complete(data){
            if(data.code==1){
                layer.msg(data.msg, {icon: 6,time:1500,shade: 0.1}, function(index){
                    window.location.href="<?php echo url('product/index_cate'); ?>";
                });
            }else{
                layer.msg(data.msg, {icon: 5,time:1500,shade: 0.1});
                return false;   
            }
        }
     
    });



    //IOS开关样式配置
   var elem = document.querySelector('.js-switch');
        var switchery = new Switchery(elem, {
            color: '#1AB394'
        });
    var config = {
        '.chosen-select': {},                    
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }

</script>
</body>
</html>