<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:94:"D:\phpstudy\PHPTutorial\WWW\test\public/../application/admin\view\shop\goods_order\detail.html";i:1607500384;s:75:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\layout\default.html";i:1588765312;s:72:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\common\meta.html";i:1588765312;s:74:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\common\script.html";i:1588765312;}*/ ?>
<!DOCTYPE html>
<html lang="<?php echo $config['language']; ?>">
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<link rel="shortcut icon" href="/test/public/assets/img/favicon.ico" />
<!-- Loading Bootstrap -->
<link href="/test/public/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/test/public/assets/js/html5shiv.js"></script>
  <script src="/test/public/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>
    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG && !\think\Config::get('fastadmin.multiplenav')): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <ol class="breadcrumb pull-left">
                                    <li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>
                                </ol>
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <table class="table table-striped">
	<thead>
	<tr>

	</tr>
	</thead>
	<tbody>
	<h2>订单信息</h2>
	<?php if(is_array($other_info) || $other_info instanceof \think\Collection || $other_info instanceof \think\Paginator): $i = 0; $__LIST__ = $other_info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
	<tr>
		<td><?php echo __($key); ?></td>
		<td style="word-break: break-all;">
			<?php if((($key == 'refundtime')||($key == 'createtime')||($key == 'paytime')||($key == 'recivetime'))&&!empty($vo)): ?>
			<?php echo date("Y-m-d H:i:s",$vo); elseif($key == 'state'): switch($vo): case "0": ?>未支付<?php break; case "1": ?>已完成<?php break; case "2": ?>待发货<?php break; case "3": ?>待收货<?php break; case "4": ?>已退款<?php break; endswitch; else: ?>
			<?php echo $vo; endif; ?>

		</td>
	</tr>
	<?php endforeach; endif; else: echo "" ;endif; ?>

	</tbody>
</table>

<h2>收货信息</h2>
<table class="table table-striped">

	<tbody>

	<?php if(is_array($address) || $address instanceof \think\Collection || $address instanceof \think\Paginator): $i = 0; $__LIST__ = $address;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
	<tr>
		<td><?php echo __($key); ?></td>
		<td style="word-break: break-all;">
			<?php echo $vo; ?>
		</td>
	</tr>
	<?php endforeach; endif; else: echo "" ;endif; ?>

	</tbody>
</table>


<h2>产品信息</h2>
<table class="table table-striped">

	<tbody>

	<?php if(is_array($goods_info) || $goods_info instanceof \think\Collection || $goods_info instanceof \think\Paginator): $i = 0; $__LIST__ = $goods_info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
	<tr>
		<td><?php echo __($key); ?></td>
		<td style="word-break: break-all;">
		<?php if($key == 'cover_img'): ?>

			<img src="<?php echo $vo; ?>" alt="" style="width: 10rem;height:10rem" class="clickimg">

		<?php else: ?>
			<?php echo $vo; endif; ?>
		</td>
	</tr>
	<?php endforeach; endif; else: echo "" ;endif; ?>

	</tbody>
</table>


<div class="hide layer-footer">
	<label class="control-label col-xs-12 col-sm-2"></label>
	<div class="col-xs-12 col-sm-8">
		<button type="reset" class="btn btn-primary btn-embossed btn-close" onclick="Layer.closeAll();"><?php echo __('Close'); ?></button>
		<?php if($other_info['state'] == 2||$other_info['state'] == 3): ?>
		<button  class="btn btn-primary btn-embossed btn-sendKt" style="background: #753ECD" data-id="<?php echo $other_info['id']; ?>">
			<?php switch($other_info['state']): case "2": ?>
					<?php echo __('立即发货'); break; case "3": ?>
					<?php echo __('修改发货'); break; endswitch; ?>
		</button>

		<?php endif; if($other_info['state'] != 4): ?>
		<button  class="btn btn-primary btn-danger btn-refund" data-id="<?php echo $other_info['id']; ?>"><?php echo __('退款闭单'); ?></button>
		<?php endif; if($other_info['state'] != 1): ?>
		<button  class="btn btn-primary btn-warm btn-end" data-id="<?php echo $other_info['id']; ?>" style="background: green"><?php echo __('已完成'); ?></button>
		<?php endif; ?>
	</div>
</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/test/public/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/test/public/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>
    </body>
</html>