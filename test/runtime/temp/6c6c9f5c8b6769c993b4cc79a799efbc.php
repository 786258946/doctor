<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:92:"D:\phpstudy\PHPTutorial\WWW\test\public/../application/admin\view\shop\goods_order\edit.html";i:1607319921;s:75:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\layout\default.html";i:1588765312;s:72:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\common\meta.html";i:1588765312;s:74:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\common\script.html";i:1588765312;}*/ ?>
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
                                <form id="edit-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_num'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_num" class="form-control" name="row[order_num]" type="text" value="<?php echo htmlentities($row['order_num']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Refundtime'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-refundtime" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[refundtime]" type="text" value="<?php echo $row['refundtime']?datetime($row['refundtime']):''; ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Recivetime'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-recivetime" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[recivetime]" type="text" value="<?php echo $row['recivetime']?datetime($row['recivetime']):''; ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Paytime'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-paytime" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[paytime]" type="text" value="<?php echo $row['paytime']?datetime($row['paytime']):''; ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Num'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-num" class="form-control" name="row[num]" type="number" value="<?php echo htmlentities($row['num']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('State'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-state" class="form-control" name="row[state]" type="number" value="<?php echo htmlentities($row['state']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Goods_id'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-goods_id" data-rule="required" data-source="goods/index" class="form-control selectpage" name="row[goods_id]" type="text" value="<?php echo htmlentities($row['goods_id']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('User_id'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-user_id" data-rule="required" data-source="user/user/index" data-field="nickname" class="form-control selectpage" name="row[user_id]" type="text" value="<?php echo htmlentities($row['user_id']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Address_id'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-address_id" data-rule="required" data-source="address/index" class="form-control selectpage" name="row[address_id]" type="text" value="<?php echo htmlentities($row['address_id']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Doctor_id'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-doctor_id" data-rule="required" data-source="doctor/index" class="form-control selectpage" name="row[doctor_id]" type="text" value="<?php echo htmlentities($row['doctor_id']); ?>">
        </div>
    </div>
    <div class="form-group layer-footer">
        <label class="control-label col-xs-12 col-sm-2"></label>
        <div class="col-xs-12 col-sm-8">
            <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('OK'); ?></button>
            <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
        </div>
    </div>
</form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/test/public/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/test/public/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>
    </body>
</html>