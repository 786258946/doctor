<?php

namespace app\index\controller;

use app\admin\model\User;
use app\common\controller\Frontend;
use think\Cache;
use think\Lang;
use think\Db;
use think\Config;
use think\Session;

/**
 * 患者端首页
 * @internal
 */
class index extends Frontend
{
    /**
     * 获取该患者的营养师
     * @param session_id
     */
    public function getMyDoctor(){
        $param=$this->request->get();
        $info=haveSession($param);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }
        $doctor_info=Db::table('user_doctor')
            ->alias('u')
            ->join('doctor d','u.doctor_id=d.id')
            ->where('u.user_id',$info['id'])
            ->field('d.name,d.major,d.position,d.hospital,d.img_url,d.id')
            ->find();
		
        if(!$doctor_info){
            $doctor_info['name']='未设置营养师';
            $doctor_info['img_url']=$this->domain.DS.'uploads'.DS.'common'.DS.'default_head.jpg';
        }else{
        	$doctor_info['img_url']=$this->domain.$doctor_info['img_url'];
        }
        $num=Db::table('real_chat')
            ->where(['to_id'=>$info['id'],'is_look'=>'0'])
            ->count();

        return returnApi(200,'success',['data'=>$doctor_info,'num'=>$num]);
    }


}
