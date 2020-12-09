<?php
use think\Route;

//tp5路由测试
//动态注册
//Route::rule('路由表达式','路由地址','请求类型','路由参数（数组）','变量规则（数组）');
//     /[:abc]为可选参数，一般放在必选参数的最后
//Route::rule('demo/:name/:age/[:abc]', 'index/Index/demo', 'GET|POST', ['domain'=>'shop.com','ext'=>'html'], ['name'=>'\W+']);

//路由闭包
//Route::get('hello/:name/:sex',function($name,$sex){
//    return 'Hello,'.$name.$sex;
//});

 //表示网站的public，这样设置则为首页路径
// Route::get('/',function(){
//     return 'index.php/index';
// });

//跳转网页
// Route::get('login', 'index.php/index/login');

// Route::rule('new','index.php/index/login/login');
//动态分组
//Route::group('demo',[
//    ':num' =>  ['index/index    /demo2',  ['method'=>'get|post' , 'ext'=>'ps'] , ['num' => '\d{2,4}'] ],
//    ':str' =>  ['index/Index/demo3',  ['method'=>'get|post' , 'ext'=>'ps'] , ['str' => '[a-zA-Z]'] ],
//    ':bool' => ['index/Index/demo4',  ['method'=>'get|post' , 'ext'=>'ps'] , ['bool'=> '0|1'] ],
//]);


////动态闭包分组
//Route::group('demo', function(){
//    Route::any(':num','index/Index/demo2',['method'=>'get|post' , 'ext'=>'ps'] ,  ['num' => '\d{2,4}'] );
//    Route::any(':str','index/Index/demo3',['method'=>'get|post' , 'ext'=>'ps'] ,  ['str' => '[a-zA-Z]{}'] );
//    Route::any(':bool','index/Index/demo4',['method'=>'get|post' , 'ext'=>'ps'] , ['bool' => '0|1'] );
//});

//将公共的放在一起
//头重脚轻
//Route::group(['name' => 'demo','method'=>'get|post','ext'=>'ps','prefix'=>'index/Index/'], function(){
//    Route::any(':num','demo2',[] ,  ['num' => '\d{2,4}'] );
//    Route::any(':str','demo3',[] ,  ['str' => '[a-zA-Z]'] );
//    Route::any(':bool','demo4',[ 'ext'=>'ps'] , ['bool' => '0|1'] );
//});

//->改
//Route::group('demo', function(){
//    Route::any(':num','demo2');
//    Route::any(':str','demo3');
//    Route::any(':bool','demo4' );},
//    ['method'=>'get|post','ext'=>'ps','prefix'=>'index/Index/'],
//    ['num' => '\d{2,4}' , 'str' => '[a-zA-Z]' , 'bool' => '0|1' ]);


//动态的路由别名定义
//注意！路由别名不支持变量类型和路由条件判断，单纯只是为了缩短URL地址，并且在定义的时候需要注意避免和路由规则产生混淆。
//Route::alias('index','index/Index',['ext'=>'html']);
//Route::alias('user','index/Index');
//动态黑白名单(allow白名单 ， except黑名单)
//    Route::alias('index','index/Index',['ext'=>'html','allow'=> 'demo2']);

//批量注册
return [
	 //'login' => 'index/login',
    //统一变量名称一样的变量规则，（如果个别同时定义，则以个别的为准）
//    '__pattern__' => [
//              'name' => '\w+'
//    ],

//     "demo/:name/:age/[:abc]" => ['index/Index/demo' , ['method' => 'GET|POST' , 'ext' => 'html'] , ['name'=> '\W+']],

    //路由分组
    //根据专参不同，来决定进入哪个控制器
//    'demo/:num' =>  ['index/Index/demo2',  ['method'=>'get|post' , 'ext'=>'ps'] , ['num' => '\d{2,4}'] ],
//    'demo/:str' =>  ['index/Index/demo3',  ['method'=>'get|post' , 'ext'=>'ps'] , ['str' => '[a-zA-Z]'] ],
//    'demo/:bool' => ['index/Index/demo4',  ['method'=>'get|post' , 'ext'=>'ps'] , ['bool'=> '0|1'] ],

    //分组
//    '[demo]' =>[
//            ':num' =>  ['index/Index/demo2',  ['method'=>'get|post' , 'ext'=>'ps'] , ['num' => '\d{2,4}'] ],
//            ':str' =>  ['index/Index/demo3',  ['method'=>'get|post' , 'ext'=>'ps'] , ['str' => '[a-zA-Z]'] ],
//            ':bool' => ['index/Index/demo4',  ['method'=>'get|post' , 'ext'=>'ps'] , ['bool'=> '0|1'] ],
//    ],

//批量定义路由别名
    // '__alias__' =>[
    //     'index' => 'index.php/index',
    // ]

//黑白名称
//    '__alias__' =>[
//        'index' => ['index/index',[
//            'ext'=>'html',
//            'allow' => 'demo2',
//        ]],
//    ]
];