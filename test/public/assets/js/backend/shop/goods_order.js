define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'shop/goods_order/index' + location.search,
                    add_url: 'shop/goods_order/add',
                    edit_url: 'shop/goods_order/edit',
                    send_url: 'shop/goods_order/send',
                    del_url: 'shop/goods_order/del',
                    multi_url: 'shop/goods_order/multi',
                    table: 'goods_order',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'goods.title', title: __('Goods.title')},
                        {field: 'goods.cover_img', title: __('Goods.cover_img'),formatter:Table.api.formatter.image,events:Table.api.events.image},
                        {field: 'order_num', title: __('Order_num')},
                        {field: 'createtime', title: __('Createtime'),formatter:Table.api.formatter.datetime,operate: 'RANGE', addclass: 'datetimerange'},
                        {field: 'paytime', title: __('Paytime'),formatter:Table.api.formatter.datetime,operate: 'RANGE', addclass: 'datetimerange'},
                        {field: 'num', title: __('Num')},


                        {field: 'goods.now_price', title: __('Goods.now_price'), operate:'BETWEEN'},
                        {field: 'goods.old_price', title: __('Goods.old_price'), operate:'BETWEEN'},
                        {field: 'state', title: __('State'),formatter: Table.api.formatter.status,searchList: {
                                "0": __('未支付'), "1": __('已完成'), "2": __('待发货'), "3": __('待收货'), "4": __('已退款')
                            },
                            // custom: {"0": __('danger'), "1": __('已完成'), "2": __('待发货'), "3": __('待收货'), "4": __('已退款')}
                                },
                        {field: 'operate', title: __('Operate'), formatter: Table.api.formatter.buttons,
                            table: table,buttons:[
                                {
                                    name: 'detail',
                                    text: __('查看详情'),
                                    title: __('查看详情'),
                                    classname: 'btn btn-xs btn-warning btn-dialog',

                                    url: 'shop/goods_order/detail',
                                    callback: function (data) {
                                        Layer.alert("接收到回传数据：" + JSON.stringify(data), {title: "回传数据"});
                                    },
                                    visible: function (row) {
                                        //返回true时按钮显示,返回false隐藏
                                        return true;
                                    }
                                }
                            ]
                            }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },

        send: function () {
            Form.api.bindevent($("form[role=form]"),function(r){
                window.parent.location.reload()
            });
        },
        detail:function(){
            $('.clickimg').click(function () {
                window.open($(this).attr('src'));
            });
            $('.btn-sendKt').click(function(){
                var id=$(this).data('id');

                Fast.api.open('shop/goods_order/send/ids/'+id,__('订单发货'),{
                    callback:function(value){
                        //在回调函数里可以调用你的业务代码实现前端的各种逻辑和效果

                        // layer.open({
                        //     type: 1,
                        //     title: '生成URL',
                        //     closeBtn: 2,
                        //     shadeClose: true,
                        //     area: ['600px', '300px'],
                        //     content: '<p style="padding: 10px;font-size: 16px;">'+value+'</p>'
                        // });
                    },
                });
            })

            $('.btn-danger').click(function(){
                var id=$(this).data('id');
                Fast.api.ajax({
                    url:"shop/goods_order/refund",
                    data:{id:id}
                    , function(data, ret){
                        //成功的回调
                        alert(ret.msg);
                        return false;
                    }, function(data, ret){
                        //失败的回调
                        alert(ret.msg);
                        return false;
                    }

                });

                // layer.confirm('确认退款？', {
                //     btn: ['确认','取消'] //按钮
                // }, function(){
                //
                // }, function(){
                //
                // });
            })
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});