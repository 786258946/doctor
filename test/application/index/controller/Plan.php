<?php


namespace app\index\controller;


use app\common\controller\Frontend;
use think\Session;
use think\Db;
use think\Validate;
use think\Request;

/**
 * Author: Wang
 * Date: 2020/9/22
 * Time: 9:41
 * Class Plan
 * @title 养治计划  我的档案
 * @package app\index\controller
 */
class Plan extends Frontend
{
    /**
     * Notes:获取首页信息
     */
    public function getPlan(){
        $row=Db::table('plan')->cache(true,60)->select();
        if(!$row){
            return returnApi(0,'error',['errmsg'=>'请在后台添加养治计划']);
        }
        $row=$row[0];
        $row['img_url']=explode(',',$row['img_url']);
        if(count($row['img_url'])){
            foreach($row['img_url'] as &$v){
                $v=$this->domain.$v;
            }
        }
        return returnApi(1,'success',['data'=>$row]);
    }

    /**
     * Notes:获取用户信息
     * param:
     */
    public function getInfo(){
        $param=$this->request->get();
       
        $info=haveSession($param);

        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }
       
    
        $row=Db::table('user')
            ->field('name,sex,img_url,mobile,province,city,district,weight,height,BMI,waistline')
            ->find($info['id']);
        if($row){
            return returnApi(1,'success',['data',$row]);
        }else{
        	 return returnApi(0,'error',['errms'=>'没有该用户']);
        }

    }

    /**
     * Notes:获取档案列表
     * @param:session_id
     * @param offset 开始
     * @param length 数量
     * @param type 1
     * @param id
     * 
     */
    public function getList(){
        $param=$this->request->get();
        if(!$param['type']){
	        $info=haveSession($param);
	        if(isset($info['code'])){
	        	return returnApi($info['code'],$info['msg']);
	        }
	        $id=$info['id'];
        }else{
        	if(!isset($param['id']))return returnApi(0,'error',['errmsg'=>'请填写患者ID。']);
        	$id=$param['id'];
        }
        $row=Db::table('archives')
        	->alias('a')
        	->join('user u','u.id=a.user_id')
            ->where('a.user_id',$id)
            ->order('a.id desc')
            ->field('a.*,u.name')
            ->limit($param['offset'],$param['length'])
            ->select();
        if($row){
        	foreach($row as $k=>&$v){
        		$v['createtime']=date('Y-m-d',$v['createtime']);
        		$v['img_url']=json_decode($v['img_url'],true);
        	}
            return returnApi(1,'success',['data'=>$row]);
        }else{
            return returnApi(2,'error',['errmsg'=>'没有档案数据']);
        }
    }

    /**
     * Notes:获取档案详情
     * @param:session_id
     * @param:id 档案id
     * @param user_id
     */
    public function getDetail(){
        $param=$this->request->get();
        $info=haveSession($param);
	      if(!$param['type']){
	        $info=haveSession($param);
	    
	        if(isset($info['code'])){
	        	return returnApi($info['code'],$info['msg']);
	        }
	        $user_id=$info['id'];
	      }else{
	      	$user_id=$param['user_id'];
	      }

        if(!isset($param['id'])){
            return returnApi(0,'error',['errmsg'=>'请上传档案Id']);
        }
        $row=Db::table('archives')
            ->where(['id'=>$param['id'],'user_id'=>$user_id])
            ->find();
            $row['createtime']=date('Y-m-d H:i:s',$row['createtime']);
        if($row){
            return returnApi(1,'success',['data'=>$row]);
        }else{
            return returnApi(0,'error',['errmsg'=>'没有用该档案']);
        }
    }

    /**
     * Notes:获取体检报告列表
     * @param:session_id
     * @param:id 档案id
     * @param offset 开始
     * @param length 数量
     */
    public function reportList(){
        $param=$this->request->get();
        $info=haveSession($param);
        
        if(!$param['type']){
	        $info=haveSession($param);
        
	    	if(isset($info['code'])){
	        	return returnApi($info['code'],$info['msg']);
	        }
	        $user_id=$info['id'];
          }else{
          	$user_id=$param['user_id'];
          }

        
        if(!isset($param['id'])){
            return returnApi(0,'请上传档案Id');
        }
     
        $row=Db::table('test_report')
            ->where(['archives_id'=>$param['id'],'user_id'=>$user_id])
            ->order('id desc')
            ->limit($param['offset'],$param['length'])
            ->field('user_id,archives_id',true)
            ->select();
            
        if($row){
        	foreach($row as $k=>&$v){
        		$v['createtime']=date('Y-m-d',$v['createtime']);
        		$v['img_url']=explode(',',$v['img_url']);
        	}
            return returnApi(1,'success',['data'=>$row]);
        }else{
            return returnApi(0,'error',['errmsg'=>'没有用体检报告']);
        }
    }

    /**
     * Notes:上传体检报告
     * @param:content 内容
     * @param string img_url 图片 逗号隔开
     * @param string session_id
     * @param int archives_id 档案id
     */
    public function uploadReport(){
        $param=$this->request->post();
        $info=haveSession($param);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }        
        if(!isset($param['archives_id'])){
            return returnApi(0,'error',['errmsg'=>'请上传档案Id']);
        }
        $param['createtime']=time();
        unset($param['session_id']);
    	$param['user_id']=$info['id'];
    	$doctor_id=Db::table('user_doctor')->where('user_id',$info['id'])->value('doctor_id');
        $row=Db::table('test_report')->insert($param);
        if($row){
        	
        	Db::table('doctor_mes')->insert([
	        	'title'=>$info['name'].'体检报告',
	        	'createtime'=>time(),
	        	'content'=>'请及时查看该患者的体检报告.',
	        	'doctor_id'=>$doctor_id
	        	]);
        	
            return returnApi(1,'success');
        }else{
            return returnApi(0,'error');
        }
    }

    /**
     * Notes:获取报告详情
     * @param:
     */
    public function reportDetail(){
        $param=$this->request->get();
        $info=haveSession($param);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }        
        if(!isset($param['id'])){
            return returnApi(0,'error',['errmsg'=>'请上传报告Id']);
        }
        $row=Db::table('test_report')
            ->where(['id'=>$param['id'],'user_id'=>$info['id']])
            ->find();
        if($row){

        		$row['createtime']=date('Y-m-d',$row['createtime']);
        		$row['img_url']=explode(',',$row['img_url']);
    	
            return returnApi(1,'success',['data'=>$row]);
        }else{
            return returnApi(0,'error',['errmsg'=>'没有该报告']);
        }
    }

    /**
     * Notes:修改报告
     * Methods:PUT
     * @param id
     * @param img_url
     * @param content
     *
     */
    public function updateReport(){
        $param=Request::instance()->put(); // 获取全部的put变量（经过过滤）
        if(!isset($param['id'])){
            return returnApi(0,'error',['errmsg'=>'请上传报告Id']);
        }
        $row=Db::table('test_report')
            ->where('id',$param['id'])
            ->update($param);
        if($row){
            return returnApi(1,'success');
        }else{
            return returnApi(0,'error',['errmsg'=>'修改失败']);
        }

    }

}