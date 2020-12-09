<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Session;
use think\Db;
use think\Validate;
/**
 * Author: Wang
 * Date: 2020/9/21
 * Time: 14:31
 * Class RealChat
 * @mes 首页实时咨询
 * @package app\index\controller
 */
class RealChat extends Frontend
{
    /**
     * Notes:获取实时咨询信息
     * @param:session_id
     * @param offset 开始
     * @param length 数量
     * @param type 查看信息的用户
     * @param id 用户Id
     */
    public function getMessage(){
        $param=$this->request->get();
        if(!$param['type']){
	        $info=haveSession($param);
          }else{
          	$info=haveSession($param,0);
          }
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }
        
        if(!$param['type']){
	        $doctor_id=Db::table('user_doctor')
	            ->where('user_id',$info['id'])
	            ->cache(true,60)
	            ->value('doctor_id');
	        if(!$doctor_id){
	            return returnApi(0,'error',['errmsg'=>'没有绑定的营养师,请联系后台管理人员。']);
	        }
	        $id=$info['id'];
			Db::table('real_chat')->where(['is_look'=>0,'to_id'=>$id])->update(['is_look'=>1]);
        }else{
        	$doctor_id=$info['id'];
        	if(!isset($param['id']))return returnApi(0,'error',['errmsg'=>'请填写患者ID。']);
        	$id=$param['id'];
        	$user=Db::table('user')
        	->where('id',$id)
        	->find();
        	Db::table('real_chat')->where(['is_look'=>0,'to_id'=>$doctor_id])->update(['is_look'=>1]);
        }
		
        $doctor_img_url=Db::table('doctor')
            ->where('id',$doctor_id)
            ->value('img_url');
	
		
        $row=Db::table('real_chat')
            ->where(function ($query) use ($id,$doctor_id){
            	$query->where(['send_id'=>$id,'to_id'=>$doctor_id]);
            })
            ->whereOr(function($query) use ($id,$doctor_id){
            	$query->where(['send_id'=>$doctor_id,'to_id'=>$id]);
            })
            ->order('id asc')
            ->limit($param['offset'],$param['length'])
            ->select();

        foreach($row as &$v){
            $v['createtime']=date('Y-m-d H:i:s',$v['createtime']);
            
            if(!isset($param['type'])){
                $v['img_url']=!empty($info['img_url'])?$info['img_url']:$this->domain.DS.'uploads'.DS.'common'.DS.'default_head.jpg';
            }else{
                $v['img_url']=!empty($user['img_url'])?$user['img_url']:$this->domain.DS.'uploads'.DS.'common'.DS.'default_head.jpg';	
            }
            $v['doctor_img_url']=$this->domain.$doctor_img_url?:$this->domain.DS.'uploads'.DS.'common'.DS.'default_head.jpg';
            
            
            //type 类型  0为自己发送的数据 1为营养师发送的数据
            switch ($v['send_id']){
                case $id:
                    $v['type']=0;
                    $v['send_name']=Db::table('user')->where('id',$v['send_id'])->value('name');
                    $v['to_name']=Db::table('doctor')->where('id',$v['to_id'])->value('name');
	
                    break;
                default:
                    $v['type']=1;
                    $v['send_name']=Db::table('doctor')->where('id',$v['send_id'])->value('name');
                    $v['to_name']=Db::table('user')->where('id',$v['to_id'])->value('name');
                    break;
            }
            if($v['send_type']==2){
            	$v['content']=explode(',',$v['content']);
            	foreach ($v['content'] as &$v1){
	            	$v1=$this->domain.$v1;
	            }
            }

            unset($v['send_id']);
            unset($v['to_id']);
        }
        if($row){
            return returnApi(1,'success',['data'=>$row]);
        }else{
            return returnApi(2,'error',['errmsg'=>'没有更多数据']);
        }
    }

    /**
     * Notes:发送信息
     * @param:session_id
     * @param:content 发送内容
     * @param send_type 发送类型:1为文字,2为图片
     * @param type 发送的人 0为用户 1为医生
     * @return
     */
    public function sendMessage(){
        $param=$this->request->post();
         
         if(!$param['type']){
	        $info=haveSession($param);
	        $img_url=Db::table('user')->where('id',$info['id'])->value('img_url');
          }else{
          	$info=haveSession($param,0);
          	$img_url=Db::table('doctor')->where('id',$info['id'])->value('img_url');
          	$img_url=$this->domain.$img_url;
          }
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }
        $send_id=$info['id'];
        if(!$param['type']){
	        $to_id=Db::table('user_doctor')
	            ->where('user_id',$info['id'])
	            ->cache(true,60)
	            ->value('doctor_id');
	        if(!$to_id){
	            return returnApi(0,'error',['errmsg'=>'没有绑定的营养师,请联系后台管理人员。']);
	        }
	         
        }else{

        	if(!isset($param['id']))return returnApi(0,'error',['errmsg'=>'请填写患者ID。']);


        	$to_id=$param['id'];
        	$user=Db::table('user')
        	->where('id',$to_id)
        	->find();
        }
            
            
       $validate=Validate('RealChat');

        if(!$validate->check($param)){
            return returnApi(0,'error',['errmsg'=>$validate->getError()]);
        }

        $data['content']=$param['content'];
        $data['createtime']=time();
        $data['send_type']=$param['send_type'];
        $data['send_id']=$send_id;
        $data['to_id']=$to_id;
        $data['type']=$param['type'];
		// if(2==$param['send_type']){
		// 	$data['content']=json_encode($data['content']);
		// }
        $row=Db::table('real_chat')->insert($data);
        if($row){
        	$data['createtime']=date('Y-m-d H:i:s',$data['createtime']);
            return returnApi(1,'success',['data'=>$data,'img_url'=>$img_url]);
        }else{
            return returnApi(0,'error',['errmsg'=>'添加失败']);
        }

    }
        /**
     * Notes:群发信息
     * @param:session_id
     * @param:text 文字
     * @param img_url 逗号隔开
     * @return
     */
    public function sendAllMes(){
            $param=$this->request->post();
        
	        $info=haveSession($param,0);
	    	if(isset($info['code'])){
        		return returnApi($info['code'],$info['msg']);
    		 }
    		 $allid=Db::table('user_doctor')
    		 ->where('doctor_id',$info['id'])
    		 ->column('user_id');
    		 
	  
	        $data['createtime']=time();
	   
	        $data['send_id']=$info['id'];
	        $data['type']=0;
	        $alldata=[];

	        
	        
	        if(isset($param['text'])){
	        	$data['content']=$param['text'];
	        	$data['send_type']=1;
		        foreach($allid as $v){
		        	$data['to_id']=$v;
		        	array_push($alldata,$data);
		        }
	        	
	        }
	      	        

	        if(isset($param['img_url'])){
	        	$data['content']=$param['img_url'];
	        	$data['send_type']=2;
		        foreach($allid as $v){
		        	$data['to_id']=$v;
		        	array_push($alldata,$data);
		        }
	        	
	        }	        
	        
	        
	        

	        
    	    $row=Db::table('real_chat')->insertAll($alldata);
	        if($row){
	            return returnApi(1,'success',['msg'=>'发送成功']);
	        }else{
	            return returnApi(0,'error',['errmsg'=>'添加失败']);
	        }
	        
    }
}