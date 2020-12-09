<?php


namespace app\index\controller;


use app\common\controller\Frontend;
use think\Db;

class Doctor extends Frontend
{
    /**
     * Notes:医生端 首页
     * Methods:GET
     * @param session_id
     */
    public function index()
    {
        $param = $this->request->get();
        $info = haveSession($param,0);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }          

        $patientNum = Db::table('user_doctor')
            ->where('doctor_id', $info['id'])
            ->count();
        $mesNum = Db::table('doctor_mes')
            ->where(['doctor_id' => $info['id'], 'is_look' => 0])
            ->count();

        return returnApi(1, 'success', ['patientNum' => $patientNum, 'mesNum' => $mesNum]);
    }

    /**
     * Notes:获取消息列表
     * Methods:GET
     * @param session_id
     * @param offset 开始
     * @param length 数量
     * @param type 1
     * @param is_look
     * @return array
     */
    public function mesList()
    {
        $param = $this->request->get();
        $info = haveSession($param,0);
        $where=['doctor_id' => $info['id']];
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }    
        if(isset($param['type'])){
        	$where['is_look']=0;
        }
        if(isset($param['is_look'])){
        	$where['is_look']=$param['is_look'];
        }
	
        // if (!isset($param['id'])) {
        //     return returnApi(0, '请上传消息id');
        // }
        $row = Db::table('doctor_mes')
            ->where($where)
            ->order('createtime desc')
            ->limit($param['offset'], $param['length'])
            ->select();
        if ($row) {
        	foreach($row as $k=>&$v){
        		$v['createtime']=date('Y-m-d H:i:s',$v['createtime']);
        	}
            return returnApi(1, 'success', ['data' => $row]);
        } else {
            return returnApi(2, '没有更多消息');
        }
    }


    /**
     * Notes:获取消息详情
     * Methods:GET
     * @return array
     */
    public function mesDetail()
    {
        $param = $this->request->get();
        if (!isset($param['id'])) {
            return returnApi(0, '请上传消息id');
        }
        $row = Db::table('doctor_mes')
            ->find($param['id']);
        if ($row) {
        	$row['createtime']=date('Y-m-d H:i:s',$row['createtime']);
            Db::table('doctor_mes')->where('id', $param['id'])->update(['is_look' => 1]);
            return returnApi(1, 'success', ['data' => $row]);
        } else {
            return returnApi(2, 'error');
        }
    }

    /**
     * Notes:医生端 获取自己管理的患者
     * Methods:GET
     * @return array
     */
    public function patientList()
    {
        $param = $this->request->get();
        $info = haveSession($param,0);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }          
        $row = Db::table('user_doctor')
            ->alias('d')
            ->join('user u', 'u.id=d.user_id')
            ->where('d.doctor_id', $info['id'])
            ->field('u.name,u.img_url,u.id')
            ->select();
        if ($row) {
            return returnApi(1, 'success', ['data' => $row]);
        } else {
            return returnApi(0, 'error');
        }
    }

    /**
     * Notes:搜索医生下面的患者
     * Methods:GET
     * @param name 患者名称
     * @param session_id
     */
    public function searchPatient()
    {
        $param = $this->request->get();
        $info = haveSession($param,0);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }          
        $row = Db::table('user_doctor')
            ->alias('d')
            ->join('user u', 'u.id=d.user_id')
            ->where(['d.doctor_id' => $info['id'], 'u.name' =>['like','%'.$param['name'].'%']])
            ->field('u.name,u.img_url,u.id')
            ->select();
        if ($row) {
            return returnApi(1, 'success', ['data' => $row]);
        } else {
            return returnApi(2, '没有搜索到该名称');
        }
    }

    /**
     * Notes: 群发消息
     * Methods:POST
     * @param img_url
     * @param content
     * @param createtime
     * @param session_id
     *
     */
    public function sendMesAll(){
        $param = $this->request->post();
        $info = haveSession($param,0);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }
        
        unset($param['session_id']);
        $data=[];
        $allid=Db::table('user_doctor')
            ->where('doctor_id',$info['id'])
            ->column('user_id');
        foreach($allid as $v){
            $a=$param;
            $a['user_id']=$v;
            $a['createtime']=time();
            array_push($data,$a);
        }
        $row=Db::table('archives')
            ->insertAll($data);
        if ($row) {
            return returnApi(1, 'success');
        } else {
            return returnApi(2, 'error');
        }

    }


    /**
     * Notes: 单发消息
     * Methods:POST
     * @param img_url
     * @param content
     * @param createtime
     * @param session_id
     * @param user_id 用户ID
     *
     */
    public function sendMesOne(){
        $param = $this->request->post();
        $info = haveSession($param,0);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        }          
        unset($param['session_id']);
        $allid=Db::table('user_doctor')
            ->where('doctor_id',$info['id'])
            ->column('user_id');
        if(!in_array($param['user_id'],$allid)){
            return returnApi(0, 'error',['errmsg'=>'请发送给自己管理的患者']);
        }
        $param['createtime']=time();
        $row=Db::table('archives')
            ->insert($param);
        if ($row) {
            return returnApi(1, 'success');
        } else {
            return returnApi(2, 'error');
        }

    }
    /**
     * Notes: 批量发消息
     * Methods:POST
     * @param img_url
     * @param content
     * @param createtime
     * @param session_id
     * @param user_id 逗号隔开的批量
     */
    public function sendMesBatch(){
        $param = $this->request->post();
        $info = haveSession($param,0);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        } 
        unset($param['session_id']);
        $data=[];
        $allid=Db::table('user_doctor')
            ->where('doctor_id',$info['id'])
            ->column('user_id');
        $user_id=explode(',',$param['user_id']);
        $allid=array_intersect($user_id,$allid);
        foreach($allid as $v){
            $a=$param;
            $a['user_id']=$v;
            array_push($data,$a);
        }

        $row=Db::table('archives')
            ->insertAll($data);
        if ($row) {
            return returnApi(1, 'success');
        } else {
            return returnApi(2, 'error');
        }

    }
    /**
     * @param session_id
     * @method Get
    */
    public function getInfo(){
        $param = $this->request->get();
        $info = haveSession($param,0);
        if(isset($info['code'])){
        	return returnApi($info['code'],$info['msg']);
        } 
        $data=Db::table('doctor')->where('id',$info['id'])->find();
		// $data['img_url']=$this->domain.$data['img_url'];
        return returnApi(1, 'sucess',['data'=>$data]);
    }
}