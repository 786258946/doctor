<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Db;

class Calorie extends Frontend
{

    //卡路里接口

    /**
     * @ApiTitle 卡路里类型列表
     * @param num
     * @param length
     */
    public function getType()
    {
    	$params=input('get.');
        $row = Db::table('calorie_type')->limit($params['offset'],$params['length'])->select();

        if ($row) {
        	return returnApi(1,'success',$row);
        } else {
            return returnApi(0,'error',['errmsg'=>'没有数据']);
        }
    }
	
	public function searchType(){
		$params = $this->request->get();
	
        $row = Db::table('calorie_type')->where('name','like','%' . $params['name'] . '%')->limit($params['offset'], $params['length'])->select();
        	
        if ($row) {
            return returnApi(1,'success',$row);
        } else {
            return returnApi(0,'error',['errmsg'=>'没有数据']);
        }
	}
	
    /**
     * @ApiTitle  获取某个类型下的所有东西
     * @param type_id 类型ID
     * @param offset 下标
     * @param length 长度
     * @method GET
     */
    public function getProduct()
    {
        $params = $this->request->get();
        $row = Db::table('calorie_product')->where('type_id', $params['type_id'])->field('name,cover_img,kcal,id')->limit($params['offset'], $params['length'])->select();
        if ($row) {
            return returnApi(1,'success',$row);
        } else {
            return returnApi(0,'error',['errmsg'=>'没有数据']);
        }
    }

    /**
     * @ApiTitle  搜索名称
     * @param name 名称
     * @param offset 下标
     * @param length 长度
     * @method GET
     */
    public function searchProduct()
    {
        $params = $this->request->get();
        $row = Db::table('calorie_product')->where('name','like', '%' . $params['name'] . '%')->field('name,cover_img,kcal,id')->limit($params['offset'], $params['length'])->select();
        if ($row) {
            return returnApi(1,'success',$row);
        } else {
            return returnApi(0,'error',['errmsg'=>'没有数据']);
        }
    }

    /**
     * @ApiTitle  详情
     * @param id 产品ID
     * @method GET
     */
    public function getDetail()
    {
        $params = $this->request->post();
        $row = Db::table('calorie_product')->where($params)->find();
        if ($row) {
            if ($row['carbohydrate'] != null)$row['carbohydrate_bfb'] = round($row['carbohydrate'] / $total * 100);
            if ($row['protein'] != null)    $row['protein_bfb'] = round($row['protein'] / $total * 100);
            if ($row['fat'] != null)        $row['fat_bfb'] = round($row['fat'] / $total * 100);
            // $total = $row['carbohydrate'] + $row['protein'] + $row['fat'];
       
        
     
            return returnApi(1,'success',$row);
        } else {
            return returnApi(0,'error',['errmsg'=>'没有数据']);
        }
    }

}
