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
 * 小程序登录
 * @internal
 */
class Login extends Frontend
{
	    /**
     * 设置信息
     * @param code
     * @param appid
     * @param secret  密钥
     */
  //  public function Login()
  //  {
  //      $params = input('post.');

  //      $url = "https://api.weixin.qq.com/sns/jscode2session?appid=$appid&secret=$secret&js_code=$code&grant_type=authorization_code";
  //      $res = file_get_contents($url);
  //      $res = json_decode($res, true);
		// $params=$res;
		// $file=fopen('1.text','w');
		// fwrite($file,json_encode($res));
		// fclose($file);
  //      // $params['openid']=$res['openid'];
  //      $user = new User();
  //      $params['createtime'] = time();
  //      $row = $user->where('openid', $params['openid'])->find();
  //      if (!$row) {
  //          $res = $user->allowField(true)->save($params);
  //          if ($res) {
  //              $params['id'] = $user->id;
  //              Session('info', $params);
  //      		return returnApi(1,'success',['session_id'=>Session_id(),'data'=>$res]);
  //          }
  //      } else {
       
  //          Session('info', $row);
            
  //      	 return returnApi(1,'success',['session_id'=>Session_id()]);
  //      }

  //  }

	public function editInfo(){
		$params=$this->request->patch();
		$user = new User();
		$res = $user->allowField(true)->save($params,['openid'=>$params['openid']]);
		if ($res) {
                $params['id'] = $user->id;
                Session('info', $params);
        		return returnApi(1,'success',['session_id'=>Session_id(),'data'=>$res]);
         }

	}
	







    /**
     * 获取个人信息
     * @param id 用户ID
     */
    public function getInfo()
    {
        $params = $this->request->get();
        $row = Db::table('user')->where($params)->field('openid', true)->find();
        $row['defaultaddress'] = Db::table('address')->where('u_id', $params['id'])->where('default', 1)->find();//获取默认地址
        if ($row) {
            return ['code' => 1, 'data' => $row];
        } else {
            return ['code' => 0, 'msg' => '没有该人员信息'];
        }
    }

    //
    public function Login()
    {
        vendor('PHP.wxBizDataCrypt');
        $appid = Config::get('wechat.app_id');
        $secret = Config::get('wechat.app_sercet');
        $code = input('param.code');
        $url = "https://api.weixin.qq.com/sns/jscode2session?appid=$appid&secret=$secret&js_code=$code&grant_type=authorization_code";
        
        $res = file_get_contents($url);
        $res = json_decode($res, true);
        // $params['openid']=$res['openid'];
        $sessionKey = $res['session_key'];
        $encryptedData = input('param.encryptedData');
        $iv = input('param.iv');
        $pc = new \WXBizDataCrypt($appid, $sessionKey);
        $errCode = $pc->decryptData($encryptedData, $iv, $data);
        $data=json_decode($data,true);
        
	    $user = new User();
	    
        $param['createtime'] = time();
        $param['sex']=$data['gender']?'男':'女';
        $param['openid']=$data['openId'];
		$param['name']=$data['nickName'];
		$param['city']=$data['city'];
		$param['province']=$data['province'];
		$param['country']=$data['country'];
		$param['img_url']=$data['avatarUrl'];
	
        $row = $user->where('openid', $param['openid'])->find();
        if (!$row) {
            $res = $user->allowField(true)->save($param);
            if ($res) {
                $param['id'] = $user->id;
                Session('info', $param);
        		return returnApi(1,'success',['session_id'=>Session_id()]);
            }
        } else {
       
            Session('info', $row);
            
        	 return returnApi(1,'success',['session_id'=>Session_id()]);
        }

    }
    // public function ceshi(){
    //     $num=rand(1111,9999);
    //     Session('a',$num);
    //     return json_encode(['code'=>1,'data'=>Session_id(),'num'=>$num]);
    // }
    // public function getnum(){
    //     $Session_id=input('param.session_id');
    //     Session_id($Session_id);
    //     dump(Session_id());
    //     dump($Session_id);
    //     return json_encode(['code'=>1,'data'=>Session('a')]);
    // }
    
    public function loginDoctor(){
    	$param=input('get.');
    	if(!isset($param['username'])||!isset($param['password'])){
    		return returnApi(1,'error',['errmsg'=>'请填写账号或密码']);
    	}
    	
    	if(empty($param['username'])||empty($param['password'])){
    		return returnApi(1,'error',['errmsg'=>'账号或密码不能为空']);
    	}
    	
    	$row=Db::table('doctor')
    	->where($param)
    	->find();
    	if($row){
    		Session('doctor_info', $row);
    		$row['img_url']=$this->domain.$row['img_url'];
    		return returnApi(1,'success',['doctor_info'=>$row,'session_id'=>Session_id()]);
    	}else{
    		return returnApi(0,'error',['errmsg'=>'账号或密码错误']);
    	}
    }
    /*
     * @param table_name  user  doctor
     * @param data 修改数据 [k=>v]
     * @param Session_id
     * @param type	1 填写代表 是医生 ，0代表是用户
    */
    public function updateInfo(){
    	$param=$this->request->put();
   
        if(!$param['type']){
	        $info=haveSession($param);
        }else{
          	$info=haveSession($param,0);
        }
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }
    	$row=Db::table($param['table_name'])
    		->where('id',$info['id'])
    		->update($param['data']);
    	if($row){
    		return returnApi(1,'success',['msg'=>'修改成功']);
    	}else{
    		return returnApi(0,'error',['errmsg'=>'修改失败']);
    	}	
    }
}
