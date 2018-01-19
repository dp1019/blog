<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:68:"D:\cake\public/../application/admin\view\product\create_product.html";i:1515695008;s:59:"D:\cake\public/../application/admin\view\public\header.html";i:1515673654;s:59:"D:\cake\public/../application/admin\view\public\footer.html";i:1515674134;}*/ ?>
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
<link rel="stylesheet" type="text/css" href="/static/admin/webupload/webuploader.css">
<link rel="stylesheet" type="text/css" href="/static/admin/webupload/style.css">
<style>
.file-item{float: left; position: relative; width: 110px;height: 110px; margin: 0 20px 20px 0; padding: 4px;}
.file-item .info{overflow: hidden;}
.uploader-list{width: 100%; overflow: hidden;}
</style>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加产品</h5>
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
                    <form class="form-horizontal m-t layui-form" name="add" id="add" method="post" action="<?php echo url('product/storeProduct'); ?>">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">产品名称：</label>
                            <div class="input-group col-sm-4">
                                <input id="title" type="text" class="form-control" name="title" placeholder="输入产品标题" required="required">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group" >
                            <label class="col-sm-3 control-label">优惠券：</label>
                            <?php if(is_array($codes) || $codes instanceof \think\Collection || $codes instanceof \think\Paginator): if( count($codes)==0 ) : echo "" ;else: foreach($codes as $key=>$vo): ?>
                            <input class="ids i-checks"  type="checkbox" name="codes[]" value="<?php echo $vo['id']; ?>" title="你好" id="codes"><?php echo $vo['name']; endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">所需积分：</label>
                            <div class="input-group col-sm-4">
                                <input id="integral" type="text" class="form-control" name="integral" placeholder="0代表不上架至积分商城" required="required">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">所属分类：</label>
                            <div class="input-group col-sm-4">
                                <select class="form-control m-b chosen-select" name="productcate_id" id="productcate_id">
                                    <option value="0">==请选择==</option>
                                    <?php if(!empty($cates)): if(is_array($cates) || $cates instanceof \think\Collection || $cates instanceof \think\Paginator): if( count($cates)==0 ) : echo "" ;else: foreach($cates as $key=>$vo): ?>
                                            <option value="<?php echo $vo['id']; ?>"><?php echo $vo['name']; ?></option>
                                        <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">关键字：</label>
                            <div class="input-group col-sm-4">
                                <input id="keyword" type="text" class="form-control" name="keyword" placeholder="输入产品关键字" required="required">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">库存：</label>
                            <div class="input-group col-sm-4">
                                <input id="sort" type="text" class="form-control" name="store" placeholder="输入库存" required="required">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">排序：</label>
                            <div class="input-group col-sm-4">
                                <input id="sort" type="text" class="form-control" name="sort" placeholder="输入序号" value="10" required="required">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">描述：</label>
                            <div class="input-group col-sm-4">
                                <textarea type="text" rows="5" name="remark" id="remark" placeholder="输入产品描述" class="form-control" required="required"></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">产品图片：</label>
                            <div class="input-group col-sm-8">
                                <input type="hidden" id="data_photo" name="photo" >
                                <div id="fileList" class="uploader-list" style="float:right"></div>
                                <div id="imgPicker" style="float:left">选择图片</div>
                                <!-- <img id="img_data" height="100px" style="float:left;margin-left: 50px;margin-top: -10px;" src="/static/admin/images/no_img.jpg"/> -->
                                <div id="box">
                                    <img id="img_data" height="100px" style="float:left;margin-left: 50px;margin-top: -10px;" src="/static/admin/images/no_img.jpg"/>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>                          
                        <div class="form-group">
                            <label class="col-sm-3 control-label " for="myEditor">内容：</label>
                            <div class="input-group col-sm-9">
                                <script src="/static/admin/ueditor/ueditor.config.js" type="text/javascript"></script>
                                <script src="/static/admin/ueditor/ueditor.all.js" type="text/javascript"></script>
                                <textarea name="content" style="width:90%" id="myEditor"></textarea>
                                <script type="text/javascript">
                                    var editor = new UE.ui.Editor();
                                    editor.render("myEditor");
                                </script>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">状&nbsp;态：</label>
                            <div class="col-sm-6">
                                <div class="radio i-checks">
                                    <input type="radio" name='status' value="1" checked="checked"/>上架&nbsp;&nbsp;
                                    <input type="radio" name='status' value="0" />下架
                                </div>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-3">
                                <button class="btn btn-primary" type="submit"><i class="fa fa-save"></i> 保存</button>&nbsp;&nbsp;&nbsp;
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

<script type="text/javascript" src="/static/admin/webupload/webuploader.min.js"></script>

<script type="text/javascript">
    var $list = $('#fileList');
    var str = '';
    var value = '';
    //上传图片,初始化WebUploader
    var uploader = WebUploader.create({
     
        auto: true,// 选完文件后，是否自动上传。   
        swf: '/static/admin/js/webupload/Uploader.swf',// swf文件路径 
        server: "<?php echo url('Upload/upload'); ?>",// 文件接收服务端。
        duplicate :true,// 重复上传图片，true为可重复false为不可重复
        pick: '#imgPicker',// 选择文件的按钮。可选。

        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/jpg,image/jpeg,image/png'
        },

        // 'onUploadSuccess': function(file, data, response) {
        //     console.log(data);
        //     $("#data_photo").val(data._raw);
        //     $("#img_data").attr('src',data._raw);
        // }
        'onUploadSuccess': function(file, data, response) {
            str += '<img  onclick="del(this) "height="100px" style="float:left; cursor:pointer;margin-left:10px;margin-bottom:10px;" src="'+data._raw+'"/>';
            value += data._raw+'|';
            $('#box').html(str);
            $("#data_photo").val(value);
        }
    });

    uploader.on( 'fileQueued', function( file ) {
        $list.html( '<div id="' + file.id + '" class="item">' +
            '<p class="state">正在上传...</p>' +
        '</div>' );
    });

    // 文件上传成功
    uploader.on( 'uploadSuccess', function( file ) {
        layer.msg('上传成功',{icon:1,time:1000},function(index){
            layer.close(index);
        })
        $( '#'+file.id ).find('p.state').text('');
    });

    // 文件上传失败，显示上传出错。
    uploader.on( 'uploadError', function( file ) {
        $( '#'+file.id ).find('p.state').text('上传出错!');
    }); 
    // 删除多图中的某一张
    function del(obj){
        layer.confirm('确认删除此图片?',{icon: 3, title:'提示'},function(index){
            $(obj).remove();
            value = value.replace($(obj).attr('src') + '|','');
            str   = $('#box').html();
            $("#data_photo").val(value);
            layer.msg('删除成功',{icon:1,time:1500,shade: 0.1});
            layer.close(index);
        });
    }

</script>
<script type="text/javascript">

    $(function(){
        $('#add').ajaxForm({
            beforeSubmit: checkForm, // 此方法主要是提交前执行的方法，根据需要设置
            success: complete, // 这是提交后的方法
            dataType: 'json'
        });

        function checkForm(){
            if( 0 == $.trim($('#productcate_id').val())){
                layer.msg('请选择分类', {icon: 5,time:1500,shade: 0.1}, function(index){
                    layer.close(index);
                });
                return false;
            }
            if( 0 == $.trim($('#codes').val())){
                layer.msg('请选择优惠卷', {icon: 5,time:1500,shade: 0.1}, function(index){
                    layer.close(index);
                });
                return false;
            }
            
            if( '' == $.trim($('#data_photo').val())){
                layer.msg('请上传产品图片', {icon: 5,time:1500,shade: 0.1}, function(index){
                    layer.close(index);
                });
                return false;
            }
            

     }

        function complete(data){
            if(data.code == 1){
                layer.msg(data.msg, {icon: 6,time:1500,shade: 0.1}, function(index){
                    layer.close(index);
                    window.location.href=data.url;
                });
            }else{
                layer.msg(data.msg, {icon: 5,time:1500,shade: 0.1}, function(index){
                    layer.close(index);
                });
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
