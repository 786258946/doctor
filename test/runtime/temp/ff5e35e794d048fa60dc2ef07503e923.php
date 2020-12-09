<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:86:"D:\phpstudy\PHPTutorial\WWW\test\public/../application/admin\view\shop\goods\edit.html";i:1607413803;s:75:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\layout\default.html";i:1588765312;s:72:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\common\meta.html";i:1588765312;s:74:"D:\phpstudy\PHPTutorial\WWW\test\application\admin\view\common\script.html";i:1588765312;}*/ ?>
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
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Title'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-title" class="form-control" name="row[title]" type="text" value="<?php echo htmlentities($row['title']); ?>">
        </div>
    </div>

    <div class="form-group">
        <label for="c-cover_img" class="control-label col-xs-12 col-sm-2"><?php echo __('Cover_img'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <div class="input-group">
                <input id="c-cover_img" class="form-control" size="35" name="row[cover_img]" type="text" value="<?php echo htmlentities($row['cover_img']); ?>">
                <div class="input-group-addon no-border no-padding">
                    <span><button type="button" id="plupload-cover_img" class="btn btn-danger plupload"
                                  data-input-id="c-cover_img" data-mimetype="image/gif,image/jpeg,image/png,image/jpg,image/bmp"
                                  data-multiple="false" data-preview-id="p-cover_img"><i class="fa fa-upload"></i>
                            <?php echo __('Upload'); ?></button></span>
                    <span><button type="button" id="fachoose-cover_img" class="btn btn-primary fachoose"
                                  data-input-id="c-cover_img" data-mimetype="image/*" data-multiple="false"><i
                            class="fa fa-list"></i> <?php echo __('Choose'); ?></button></span>
                </div>
                <span class="msg-box n-right">

                </span>
            </div>
            <ul class="row list-inline plupload-preview" id="p-cover_img"></ul>
        </div>

    </div>
    <div class="form-group">
        <label for="c-banner_img" class="control-label col-xs-12 col-sm-2"><?php echo __('Banner_img'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <div class="input-group">
                <input id="c-banner_img" class="form-control" size="35" name="row[banner_img]" type="text" value="<?php echo htmlentities($row['banner_img']); ?>">
                <div class="input-group-addon no-border no-padding">
                    <span><button type="button" id="plupload-banner_img" class="btn btn-danger plupload"
                                  data-input-id="c-banner_img" data-mimetype="image/gif,image/jpeg,image/png,image/jpg,image/bmp"
                                  data-multiple="false" data-preview-id="p-banner_img"><i class="fa fa-upload"></i>
                            <?php echo __('Upload'); ?></button></span>
                    <span><button type="button" id="fachoose-banner_img" class="btn btn-primary fachoose"
                                  data-input-id="c-banner_img" data-mimetype="image/*" data-multiple="false"><i
                            class="fa fa-list"></i> <?php echo __('Choose'); ?></button></span>
                </div>
                <span class="msg-box n-right">

                </span>
            </div>
            <ul class="row list-inline plupload-preview" id="p-banner_img"></ul>
        </div>

    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Stock'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-stock" class="form-control" name="row[stock]" type="number" value="<?php echo htmlentities($row['stock']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Sale'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-sale" class="form-control" name="row[sale]" type="number" value="<?php echo htmlentities($row['sale']); ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Now_price'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-now_price" class="form-control" name="row[now_price]" type="number" value="<?php echo htmlentities($row['now_price']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Old_price'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-old_price" class="form-control" name="row[old_price]" type="number" value="<?php echo htmlentities($row['old_price']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('运费'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-fre_price" class="form-control" name="row[fre_price]" type="number" value="<?php echo htmlentities($row['fre_price']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Endtime'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-endtime" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[endtime]" type="text" value="<?php echo $row['endtime']?datetime($row['endtime']):''; ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('State'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <?php echo build_radios('row[state]',['1'=>__('上架'), '0'=>__('下架')],$row['state']); ?>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Content'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <textarea id="c-content" class="form-control editor" rows="5" name="row[content]" cols="50"><?php echo htmlentities($row['content']); ?></textarea>
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