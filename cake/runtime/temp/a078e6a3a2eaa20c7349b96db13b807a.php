<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:59:"D:\cake\public/../application/admin\view\product\index.html";i:1515719302;s:59:"D:\cake\public/../application/admin\view\public\header.html";i:1515673654;s:59:"D:\cake\public/../application/admin\view\public\footer.html";i:1515674134;}*/ ?>
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
            <h5>产品列表（Tigs:批量排序或批量到积分商城无需勾选！enjoyIt）</h5>
        </div>

        <div class="ibox-content">
            <!--搜索框开始--> 
            <form name="admin_list_sea" class="form-search" method="get" action="<?php echo url('product/index'); ?>">    <div class="row">
                    <div class="col-sm-12">   
                        <div  class="col-sm-2" style="width: 100px">
                            <div class="input-group" >  
                                <a href="<?php echo url('product/createProduct'); ?>"><button class="btn btn-outline btn-primary" type="button">添加产品</button></a> 
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <input type="text" id="title" class="form-control" name="title" value="<?php echo $title; ?>" placeholder="输入需查询的产品标题" />   
                            </div>
                        </div>
                        <div class="col-sm-2" >
                            <div class="input-group">
                                <input type="text" id="keyword" class="form-control" name="keyword" value="<?php echo $keyword; ?>" placeholder="输入需查询的产品关键字" />   
                            </div>
                        </div>
                        <div class="col-sm-2" >
                            <select class="form-control m-b chosen-select" name="pcate_id" id="pcate_id">
                                <option value="-1">按分类</option>
                                <?php if(!empty($cates)): if(is_array($cates) || $cates instanceof \think\Collection || $cates instanceof \think\Paginator): if( count($cates)==0 ) : echo "" ;else: foreach($cates as $key=>$vo): ?>
                                        <option value="<?php echo $vo['id']; ?>" <?php if(($vo['id'] == $pcate_id)): ?>selected<?php endif; ?>><?php echo $vo['name']; ?></option>
                                    <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <select class="form-control m-b chosen-select" name="status" id="status">
                                <option value="-1">按状态</option>
                                <option value="1" <?php if(($status == 1)): ?>selected<?php endif; ?>>上架中</option>
                                <option value="0" <?php if(($status == 0)): ?>selected<?php endif; ?>>已下架</option>
                            </select>
                        </div>  
                        <div class="col-sm-2">
                            <select class="form-control m-b chosen-select" name="code" id="code">
                                <option value="-1">按优惠规则</option>
                                <?php if(!empty($codes)): if(is_array($codes) || $codes instanceof \think\Collection || $codes instanceof \think\Paginator): if( count($codes)==0 ) : echo "" ;else: foreach($codes as $key=>$vo): ?>
                                        <option value="<?php echo $vo['id']; ?>" <?php if(($vo['id'] == $code)): ?>selected<?php endif; ?>><?php echo $vo['name']; ?></option>
                                    <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                            </select>
                        </div>                       
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <select class="form-control m-b chosen-select" name="sale" id="sale">
                            <option value=0 <?php if(($sale == 0)): ?>selected<?php endif; ?>>按销量</option>
                            <option value=-1 <?php if(($sale == -1)): ?>selected<?php endif; ?>>销量低到高</option>
                            <option value=1 <?php if(($sale == 1)): ?>selected<?php endif; ?>>销量高到低</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <select class="form-control m-b chosen-select" name="integral" id="integral">
                            <option value=0 <?php if(($integral == 0)): ?>selected<?php endif; ?>>按商城积分</option>
                            <option value=-1 <?php if(($integral == -1)): ?>selected<?php endif; ?>>积分低到高</option>
                            <option value=1 <?php if(($integral == 1)): ?>selected<?php endif; ?>>积分高到低</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <select class="form-control m-b chosen-select" name="isShop" id="isShop">
                            <option value=0 <?php if(($isShop == 0)): ?>selected<?php endif; ?>>显示所有商品</option>
                            <option value=1 <?php if(($isShop == 1)): ?>selected<?php endif; ?>>积分商城</option>
                        </select>
                    </div>
                    <div class="col-sm-1">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> 搜索</button>
                    </div>
                    <div  class="col-sm-2" style="width: 100px">
                        <div class="input-group" >  
                            <button class="btn btn-success" type="button" id="reset">重置搜索</button>
                        </div>
                    </div> 
                </div>
            </form> 
            <div class="hr-line-dashed"></div>
            <div class="row">
                <div class="col-sm-12">   
                    <div  class="col-sm-2" style="width: 120px">
                        <div class="input-group" >  
                            <button class="btn btn-outline btn-success" type="button" id="move">批量移入分类</button>
                        </div>
                    </div>   
                    <div class="col-sm-3">
                        <select class="form-control m-b chosen-select" name="productcate_id" id="productcate_id">
                            <?php if(!empty($cates)): if(is_array($cates) || $cates instanceof \think\Collection || $cates instanceof \think\Paginator): if( count($cates)==0 ) : echo "" ;else: foreach($cates as $key=>$vo): ?>
                                    <option value="<?php echo $vo['id']; ?>"><?php echo $vo['name']; ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                        </select>
                    </div> 
                    <div  class="col-sm-2" >
                        <div class="input-group" >  
                            <button class="btn btn-outline btn-success" type="button" id="toIntegral">批量移入积分商城</button>
                        </div>
                    </div> 
                    <!-- 批量修改优惠 -->
                    <!-- <div  class="col-sm-2" style="width: 120px">
                        <div class="input-group" >  
                            <button class="btn btn-outline btn-success" type="button" id="favorable">批量设置优惠</button>
                        </div>
                    </div>  -->  
                    <!-- <div class="col-sm-3">
                        <select class="form-control m-b chosen-select" name="code_id" id="code_id">
                            <?php if(!empty($codes)): if(is_array($codes) || $codes instanceof \think\Collection || $codes instanceof \think\Paginator): if( count($codes)==0 ) : echo "" ;else: foreach($codes as $key=>$vo): ?>
                                    <option value="<?php echo $vo['id']; ?>"><?php echo $vo['name']; ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                        </select>
                    </div> --> 
                    <div  class="col-sm-2" style="width: 100px;">
                        <div class="input-group" >  
                            <button class="btn btn-outline btn-primary" type="button" id="up">批量上架</button>
                        </div>
                    </div> 
                    <div  class="col-sm-2" style="width: 100px">
                        <div class="input-group" >  
                            <button class="btn btn-outline btn-danger" type="button" id="down">批量下架</button>
                        </div>
                    </div> 
                    <div  class="col-sm-2" style="width: 100px">
                        <div class="input-group" >  
                            <a><button class="btn btn-outline btn-danger" type="button" id="delete">批量删除</button></a> 
                        </div>
                    </div>  
                                
                </div>
            </div>
            <!--搜索框结束-->
            <div class="hr-line-dashed"></div>
            <form method="post" action="<?php echo url('product/sort'); ?>" id="ProductSort">
                
                <table id="demo" lay-filter="test" lay-data="{id: 'idTest'}"></table>
                <!-- <button class="btn btn-sm  btn-primary" type="submit" style="margin-left: 1060px;margin-top:-80px;">确定排序</button> --> 
            </form>
            <!-- End Example Pagination -->
        </div>
    </div>
</div>
<!-- End Panel Other -->
</div>

<!-- 加载动画 -->
<div class="spiner-example">
    <div class="sk-spinner sk-spinner-three-bounce">
        <div class="sk-bounce1"></div>
        <div class="sk-bounce2"></div>
        <div class="sk-bounce3"></div>
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

<script>
    layui.use('table', function(){

        var table = layui.table;
        table.render({ //其它参数在此省略
            id: 'idTest',  // 设定容器唯一ID
            elem: '#demo', // 绑定表格元素
            skin: 'row', //行边框风格
            even: true, //开启隔行背景
            size: 'lg', //大小尺寸的表格
            cols:  [[ //标题栏
                //{checkbox: true,width:'5%'},
                {field:'',type:'checkbox',width:'5%'},
                {field:'',title:'序号',type:'numbers',width:'5%'},
                //{field: 'id', title: 'ID', width: '5%' ,sort:true,align:'center',unresize:true},
                {field: 'title', title: '产品名称', width: '10%' , sort:true,align:'center',unresize:true},
                {field: "productcate", title: '产品所属分类', width: '10%' ,height: 120 ,sort:true,align:'center',unresize:true,templet : '#productcateTpl'},
                {field: 'status', title: '状态', width: '10%' ,height: 120 ,sort:true,align:'center',templet:'#statusTpl',unresize:true },
                {field: 'integral', title: '积分价', width: '7%' , sort:true,align:'center',templet:'#integralTpl',unresize:true},
                {field: 'keyword', title: '关键字' , width: '15%',sort:true,align:'center',unresize:true},
                {field: 'sort',title: '排序号' , width: '10%',sort:true,align:'center',templet:'#sortTpl',unresize:true},
                {field: 'sale', title: '销量', width: '8%' , sort:true,align:'center',unresize:true},
                {fixed:'right',width:'20%', align:'center', toolbar: '#barDemo',title:'操作',unresize:true}
            ]],
            url: "<?php echo url('product/getData'); ?>",//后台请求的路径
            where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val(),sale:$('#sale').val(),integral:$('#integral').val(),isShop:$('#isShop').val()}, //如果无需传递额外参数，可不加该参数
            method: 'get', //如果无需自定义HTTP类型，可不加该参数
            page: true, //是否开启分页
            limit : 10, // 请求条数
            limits: [5,10,15], //变换请求条数
            //request: {} //如果无需自定义请求参数，可不加该参数
            //response: {} //如果无需自定义数据响应名称，可不加该参数
            done: function(res, curr, count){
                //  console.log(res);
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                //得到当前页码
                //console.log(curr); 
                $('.spiner-example').css('display','none');
                //得到数据总量
                //console.log(count);
            }
        });
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            //console.log(obj);return false;
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值
            var tr = obj.tr; //获得当前行 tr 的DOM对象
             
            if(layEvent === 'detail'){ //查看
                //do somehing
                var checkStatus = table.checkStatus('idTest'); 
                console.log(checkStatus.data);
            } else if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    //obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    //layer.close(index);
                    //  俩中方法 方法一利用框架自带模板跳转，方法二通过ajax异步请求完成
                    //window.location.href="index.php?m=admin&c=user&a=delete&id="+obj.data.id;
                    // console.log(obj.data.id);
                    $.ajax({
                        url:"<?php echo url('product/delete'); ?>",
                        data : {id:obj.data.id},
                        dataType : 'json',
                        type: 'get',
                        success : function( data ){
                            if(data.code == 1){
                                layer.msg(data.msg,{icon:1,time:1000},function(index){
                                    layer.close(index);
                                    //window.location.href = '/admin/admin';
                                    //window.location.href="/admin/admin";
                                    table.reload('idTest', {     //指定容器唯一ID
                                        url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
                                        where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val(),sale:$('#sale').val(),integral:$('#integral').val(),isShop:$('#isShop').val()} //设定异步数据接口的额外参数
                                    });
                                });
                            }
                        },
                        error : function(){
                            layer.msg('无权删除',{icon:4,time:1500,shade: 0.1},function(index){
                                layer.close(index);
                            });
                        }

                    })
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                location.href = './editProduct?id='+obj.data.id;
                //同步更新缓存对应的值
            }else if(layEvent === 'editStandard'){
                location.href = './index_standard?id='+obj.data.id;
            }
        });
        // 重置搜索
        $('#reset').click(function(){
            location.href="<?php echo url('product/index'); ?>";
        });
        // 批量软删除
        $('#delete').click(function(){
            layer.confirm('真的删除么',function(index1){
                layer.close(index1);
                var checkStatus = table.checkStatus('idTest');
                if(checkStatus.data.length == 0){
                    layer.msg('请勾选删除',{icon:2,time:1000},function(index){
                        layer.close(index);
                    });
                    return false;
                }
                var arrIds = [];
                for( var i = 0 ; i < checkStatus.data.length ; i++){
                    arrIds.push(checkStatus.data[i].id);
                }

                $.ajax({
                    url:"<?php echo url('product/productDeleteMany'); ?>",
                    type:'post',
                    data:{'arrIds':arrIds},
                    dataType: 'json',
                    success : function( data ){
                        console.log(data);
                        if(data.code == 1){
                            layer.msg(data.msg,{icon:1,time:1500},function(index){
                                layer.close(index);
                                table.reload('idTest', {     //指定容器唯一ID
                                    url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
                                    where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val(),sale:$('#sale').val(),integral:$('#integral').val(),isShop:$('#isShop').val()} //设定异步数据接口的额外参数
                                });
                            });
                            
                        }
                    },
                    error : function(data){
                        layer.msg('无权访问',{icon:4,time:1500});
                    }
                })
            })
        }); 
        // 批量移入
        $('#move').click(function(){
            layer.confirm('真的移入么',function(index1){
                //layer.close(index1);
                var checkStatus = table.checkStatus('idTest');
                // console.log(checkStatus.data);
                // console.log(checkStatus.isAll );
                if(checkStatus.data.length == 0){
                    layer.msg('请勾选产品',{icon:2,time:1000},function(index){
                        layer.close(index);
                    });
                    return false;
                }
                var arrIds = [];
                for( var i = 0 ; i < checkStatus.data.length ; i++){
                    arrIds.push(checkStatus.data[i].id);
                }

                $.ajax({
                    url:"<?php echo url('product/productMoveMany'); ?>",
                    type:'post',
                    data:{'arrIds':arrIds,'productcate_id':$('#productcate_id').val()},
                    dataType: 'json',
                    success : function( data ){
                        console.log(data);
                        if(data.code == 1){
                            layer.msg(data.msg,{icon:1,time:1500},function(index){
                                layer.close(index);
                                //window.location.href="/admin/admin"; //看你个人风格
                                table.reload('idTest', {     //指定容器唯一ID
                                    url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
                                    where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val(),sale:$('#sale').val(),integral:$('#integral').val(),isShop:$('#isShop').val()} //设定异步数据接口的额外参数
                                });
                            });
                            
                        }
                    },
                    error : function(data){
                        layer.msg('无权访问',{icon:4,time:1500});
                    }
                })
            })
        }); 
        // 批量设置优惠
        // $('#favorable').click(function(){
        //     layer.confirm('确定设置优惠么',function(index1){
        //         //layer.close(index1);
        //         var checkStatus = table.checkStatus('idTest');
        //         // console.log(checkStatus.data);
        //         // console.log(checkStatus.isAll );
        //         if(checkStatus.data.length == 0){
        //             layer.msg('请勾选产品',{icon:2,time:1000},function(index){
        //                 layer.close(index);
        //             });
        //             return false;
        //         }
        //         var arrIds = [];
        //         for( var i = 0 ; i < checkStatus.data.length ; i++){
        //             arrIds.push(checkStatus.data[i].id);
        //         }

        //         $.ajax({
        //             url:"<?php echo url('product/productFavorableMany'); ?>",
        //             type:'post',
        //             data:{'arrIds':arrIds,'code_id':$('#code_id').val()},
        //             dataType: 'json',
        //             success : function( data ){
        //                 console.log(data);
        //                 if(data.code == 1){
        //                     layer.msg(data.msg,{icon:1,time:1500},function(index){
        //                         layer.close(index);
        //                         //window.location.href="/admin/admin"; //看你个人风格
        //                         table.reload('idTest', {     //指定容器唯一ID
        //                             url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
        //                             where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val()} //设定异步数据接口的额外参数
        //                         });
        //                     });
                            
        //                 }
        //             },
        //             error : function(data){
        //                 layer.msg('无权访问',{icon:4,time:1500});
        //             }
        //         })
        //     })
        // });
        // 批量上架
        $('#up').click(function(){
            layer.confirm('确定上架么',function(index1){
                //layer.close(index1);
                var checkStatus = table.checkStatus('idTest');
                // console.log(checkStatus.data);
                // console.log(checkStatus.isAll );
                if(checkStatus.data.length == 0){
                    layer.msg('请勾选产品',{icon:2,time:1000},function(index){
                        layer.close(index);
                    });
                    return false;
                }
                var arrIds = [];
                for( var i = 0 ; i < checkStatus.data.length ; i++){
                    arrIds.push(checkStatus.data[i].id);
                }

                $.ajax({
                    url:"<?php echo url('product/productUpMany'); ?>",
                    type:'post',
                    data:{'arrIds':arrIds},
                    dataType: 'json',
                    success : function( data ){
                        console.log(data);
                        if(data.code == 1){
                            layer.msg(data.msg,{icon:1,time:1500},function(index){
                                layer.close(index);
                                //window.location.href="/admin/admin"; //看你个人风格
                                table.reload('idTest', {     //指定容器唯一ID
                                    url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
                                    where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val(),sale:$('#sale').val(),integral:$('#integral').val(),isShop:$('#isShop').val()} //设定异步数据接口的额外参数
                                });
                            });
                            
                        }
                    },
                    error : function(data){
                        layer.msg('无权访问',{icon:4,time:1500});
                    }
                })
            })
        });
        // 批量下架
        $('#down').click(function(){
            layer.confirm('确定下架么',function(index1){
                //layer.close(index1);
                var checkStatus = table.checkStatus('idTest');
                // console.log(checkStatus.data);
                // console.log(checkStatus.isAll );
                if(checkStatus.data.length == 0){
                    layer.msg('请勾选产品',{icon:2,time:1000},function(index){
                        layer.close(index);
                    });
                    return false;
                }
                var arrIds = [];
                for( var i = 0 ; i < checkStatus.data.length ; i++){
                    arrIds.push(checkStatus.data[i].id);
                }

                $.ajax({
                    url:"<?php echo url('product/productDownMany'); ?>",
                    type:'post',
                    data:{'arrIds':arrIds},
                    dataType: 'json',
                    success : function( data ){
                        console.log(data);
                        if(data.code == 1){
                            layer.msg(data.msg,{icon:1,time:1500},function(index){
                                layer.close(index);
                                //window.location.href="/admin/admin"; //看你个人风格
                                table.reload('idTest', {     //指定容器唯一ID
                                    url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
                                    where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val(),sale:$('#sale').val(),integral:$('#integral').val(),isShop:$('#isShop').val()} //设定异步数据接口的额外参数
                                });
                            });
                            
                        }
                    },
                    error : function(data){
                        layer.msg('无权访问',{icon:4,time:1500});
                    }
                })
            })
        });
        // 批量排序
        $('#ProductSort').ajaxForm({
            dataType:'json',
            success : function(data){
                layer.msg(data.msg,{icon:1,time:1000,shade: 0.1,},function(index){
                    layer.close(index);
                    table.reload('idTest', {     //指定容器唯一ID
                        url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
                        where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val(),sale:$('#sale').val(),integral:$('#integral').val(),isShop:$('#isShop').val()} //设定异步数据接口的额外参数
                    });
                });   
            }
        });
        // 批量排序 批量到积分商城
        $('#toIntegral').click(function(){
            layer.confirm('确定批量上架到积分商城吗？',function(index){
                layer.close(index);
                // $('#ProductSort').ajaxSubmit({
                //     dataType:'json',
                //     success : function(data){
                //         layer.msg(data.msg,{icon:1,time:1000,shade: 0.1,},function(index){
                //             layer.close(index);
                //             table.reload('idTest', {     //指定容器唯一ID
                //                 url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
                //                 where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val()} //设定异步数据接口的额外参数
                //             });
                //         });   
                //     }
                // })
                $.ajax({
                    url : "<?php echo url('product/sort'); ?>",
                    data:$("#ProductSort").serialize(),
                    type:"post",
                    success : function(data){
                        layer.msg(data.msg,{icon:1,time:1000,shade: 0.1,},function(index){
                            layer.close(index);
                            table.reload('idTest', {     //指定容器唯一ID
                                url: "<?php echo url('product/getData'); ?>",  // 后台请求路径
                                where: {title: $('#title').val(),keyword:$('#keyword').val(),code:$('#code').val(),status:$('#status').val(),pcate_id:$('#pcate_id').val(),sale:$('#sale').val(),integral:$('#integral').val(),isShop:$('#isShop').val()} //设定异步数据接口的额外参数
                            });
                        });
                    }
                });
            });
        })
    });
    function user_state(id){
        $.ajax({
            url : "<?php echo url('product/status'); ?>", 
            data : {id:id},
            type : 'get',
            dataType : 'json',
            success : function(data){
                if(data.code==1){
                    var a='<span class="label label-danger">已下架</span>'
                    $('#zt'+id).html(a);
                    layer.msg(data.msg,{icon:2,time:1500,shade: 0.1,});
                    return false;
                }else{
                    var b='<span class="label label-info">上架中</span>'
                    $('#zt'+id).html(b);
                    layer.msg(data.msg,{icon:1,time:1500,shade: 0.1,});
                    return false;
                }
            },
            error : function(data){
                layer.msg('未通过验证',{icon:4,time:1500});
            }
        });
    }
    

</script>
<script type="text/html" id="barDemo">
    <!-- <a class="btn btn-success btn-outline btn-xs" lay-event="detail"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp; -->
    <a class="btn btn-primary btn-outline btn-xs" lay-event="edit"><i class="fa fa-paste"></i>编辑</a>&nbsp;&nbsp;
    <a class="btn btn-danger btn-outline btn-xs" lay-event="del"><i class="fa fa-trash-o"></i>删除</a>
    <button class="btn btn-xs  btn-outline btn-primary" type="submit" style="margin-left: 3px;">确定排序</button> 
    <a class="btn btn-xs  btn-outline btn-primary" lay-event="editStandard" style="margin-left: 3px;">编辑规格</a>
</script>


    <script type="text/html" id="statusTpl">
        {{# if(d.status==1){ }}
            <a class="red" href="javascript:;" onclick="user_state({{d.id}});">
                <div id="zt{{d.id}}"><span class="label label-info">上架中</span></div>
            </a>
        {{# }else{ }}
            <a class="red" href="javascript:;" onclick="user_state({{d.id}});">
                <div id="zt{{d.id}}"><span class="label label-danger">已下架</span></div>
            </a>
        {{# } }}
    </script>


    <!-- <script type="text/html" id="codeTpl">
        {{# if(d.code){ }}
            {{d.code.name}}
        {{# }else{ }}
            此优惠已下架
        {{# } }}
    </script> -->
    
    <script type="text/html" id="integralTpl">
        <div>
            <input name="in{{d.id}}" value="{{d.integral}}" width="50%" style="text-align:center;" class="form-control">
        </div>
    </script>
    <script type="text/html" id="sortTpl">
        <div >
            <input name="{{d.id}}" value="{{d.sort}}" width="50%" style="text-align:center;" class="form-control">
        </div>
    </script>

    <script type="text/html" id="productcateTpl">
        {{# if(d.productcate){ }}
            {{d.productcate.name}}
        {{# }else{ }}
            此分类已下架
        {{# } }}
    </script>

</body>
</html>