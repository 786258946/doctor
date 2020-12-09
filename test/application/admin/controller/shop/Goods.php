<?php

namespace app\admin\controller\shop;

use app\common\controller\Backend;
use think\Config;

/**
 * 商品管理
 *
 * @icon fa fa-circle-o
 */
class Goods extends Backend
{
    
    /**
     * Goods模型对象
     * @var \app\admin\model\shop\Goods
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\shop\Goods;

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    
    public function ewm(){
        $g_id=input('param.ids');

        $this->assign('g_id',$g_id);
        return $this->fetch();
    }

    public function getEwm(){
        $data=input('param.');
        $param=base64_encode(json_encode($data));
        $token=$this->getToken();
        $url="https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=$token";
        $param=['scene'=>$param];
        $data=posturl($url,$param);

        $jpg = $data;//得到post过来的二进制原始数据
        $file_name='ewm.jpg';
        $file = fopen($file_name,"w");//创建件准备写入，文件名xcxcode/wxcode1.jpg为自定义
        fwrite($file,$jpg);//写入
        fclose($file);//关闭
        return $file_name;
    }


    public function getToken(){
        $appid = Config::get('wechat.app_id');
        $secret = Config::get('wechat.app_sercet');
        $url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$secret";
        $data=geturl($url);
        $token=$data['access_token'];
        return $token;
    }


}
