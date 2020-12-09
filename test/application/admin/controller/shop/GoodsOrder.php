<?php

namespace app\admin\controller\shop;

use app\common\controller\Backend;
use think\Db;

/**
 * 订单管理
 *
 * @icon fa fa-circle-o
 */
class GoodsOrder extends Backend
{
    
    /**
     * GoodsOrder模型对象
     * @var \app\admin\model\shop\GoodsOrder
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\shop\GoodsOrder;

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    

    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax())
        {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField'))
            {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                    ->with(['user','goods','address'])
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                    ->with(['user','goods','address'])
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();

            foreach ($list as $row) {
                
                
            }
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    public function detail(){

        $ids=input('param.ids');

        $row=Db::table('goods_order')
            ->alias('o')
//            ->join('user u','u.id=o.user_id')
            ->join('goods g','g.id=o.goods_id')
            ->join('address a','o.address_id=a.id')
            ->join('doctor d','o.doctor_id','left')
            ->where('o.id',$ids)
            ->field('o.id,o.order_num,o.state,o.payprice,d.name doctor_name,o.num,o.createtime,o.paytime,o.recivetime,o.refundtime,
            a.userName,a.provinceName,a.cityName,a.countyName,a.detailInfo,a.telNumber,
            g.now_price,g.title,g.fre_price,g.cover_img')
            ->find();


        list($address,$goods_info,$other_info)=$this->sortCategory($row);
        $this->assign('address',$address);
        $this->assign('goods_info',$goods_info);
        $this->assign('other_info',$other_info);
        return $this->fetch();
    }

    public function sortCategory($data){
        //地址
        $address=[];
        $address['userName']=$data['userName'];unset($data['userName']);
        $address['telNumber']=$data['telNumber'];
        $address['detailInfo']=$data['provinceName'].$data['cityName'].$data['countyName'].$data['detailInfo'];
        unset($data['userName']);
        unset($data['telNumber']);
        unset($data['provinceName']);
        unset($data['cityName']);
        unset($data['countyName']);
        unset($data['detailInfo']);

        //商品信息
        $goods_info=[];
        $goods_info['title']=$data['title'];
        $goods_info['cover_img']=$data['cover_img'];
        $goods_info['now_price']=$data['now_price'];
        $goods_info['fre_price']=$data['fre_price'];
        unset($data['title']);
        unset($data['cover_img']);
        unset($data['now_price']);
        unset($data['fre_price']);
        //其他信息
        $other_info=$data;

        return [$address,$goods_info,$other_info];


    }
    public function send(){

        if($this->request->post()){
            $params=input('param.');
            $params['row']['state']=3;
            $res=$this->model->save($params['row'],['id'=>$params['id']]);
            if($res){
                $this->success('保存成功');
            }else{
                $this->error('修改失败');
            }


        }else{
            $ids=input('param.ids');
            $row=$this->model->field('id,kd_num,kd_company')->find($ids);

            $this->assign('row',$row);
            return $this->fetch();
        }


    }

    public function refund(){
        $id=input('param.id');

        $res=$this->model->save(['state'=>4,'refundtime'=>time()],['id'=>$id]);
        if($res){
            $this->success('退款成功');
        }else{
            $this->error('修改失败');
        }
    }
    public function end(){
        $id=input('param.id');

        $res=$this->model->save(['state'=>1],['id'=>$id]);
        if($res){
            $this->success('订单完成');
        }else{
            $this->error('修改失败');
        }
    }
}
