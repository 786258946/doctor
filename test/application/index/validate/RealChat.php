<?php
namespace app\index\validate;

use think\Validate;

class RealChat extends Validate
{
    protected $rule = [
        'send_type'  =>  'require|max:1',
        'content' =>  'require',
    ];
    protected $message=[
        'send_type.require'=>'发送类型不能为空',
        'send_type.max'=>'发送类型最高长度为1',
        'content.require'=>'内容不能为空',
    ];
}