<?php

namespace app\admin\controller\user;

use app\common\controller\Backend;
use think\Db;

/**
 * 患者
 *
 * @icon fa fa-user
 */
class User extends Backend
{

    /**
     * User模型对象
     * @var \app\admin\model\user\User
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\user\User;
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    public function choose()
    {
        $id = input('param.id');
        $res = Db::table('user_doctor')->where('user_id', $id)->find();
        if (!$res) {
            Db::table('user_doctor')->insert(['user_id' => $id]);
        }
        $res = Db::table('user_doctor')->where('user_id', $id)->find();
        $this->assign('res', $res);
        if ($this->request->isPost()) {
            $params = $this->request->post('row/a');
            $row=Db::table('user_doctor')->where('id',$params['id'])->update(['doctor_id'=>$params['doctor_id']]);
            if($row)$this->success('修改成功');
        }

        return $this->fetch();
    }
}
