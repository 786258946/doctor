<?php

namespace app\admin\model\shop;

use think\Model;


class GoodsOrder extends Model
{

    

    

    // 表名
    protected $table = 'goods_order';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'refundtime_text',
        'recivetime_text',
        'paytime_text'
    ];
    

    



    public function getRefundtimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['refundtime']) ? $data['refundtime'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getRecivetimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['recivetime']) ? $data['recivetime'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getPaytimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['paytime']) ? $data['paytime'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setRefundtimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setRecivetimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setPaytimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }


    public function user()
    {
        return $this->belongsTo('app\admin\model\user\User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function goods()
    {
        return $this->belongsTo('app\admin\model\shop\Goods', 'goods_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
    public function address()
    {
        return $this->belongsTo('app\admin\model\shop\Address', 'address_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
