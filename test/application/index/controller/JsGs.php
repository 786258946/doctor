<?php
namespace app\index\controller;

use think\Controller;

//计算体脂秤公式

Class JsGs extends Controller{
    public $weight=null;//体重
    public $height=null;//身高
    /**
     * 体重指数 
     * 计算公式 体重(kg)/身高(m)的平方
     */
    public function getBMI(){
        return $this->weight/(pow($this->height/100,2));
    }
      /**
     * 肥胖度
     * 计算公式 (实际体重-理想体重)/理想体重*100%
     */
    public function getFatDegree(){

    }


}