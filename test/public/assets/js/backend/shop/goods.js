define(['jquery', 'bootstrap', 'backend', 'table', 'form','selectpage'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'shop/goods/index' + location.search,
                    add_url: 'shop/goods/add',
                    edit_url: 'shop/goods/edit',
                    del_url: 'shop/goods/del',
                    multi_url: 'shop/goods/multi',
                    table: 'goods',
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
                        {field: 'title', title: __('Title')},
                        {field: 'cover_img', title: __('Cover_img'), formatter: Table.api.formatter.image,events:Table.api.events.image},
                        {field: 'sale', title: __('Sale')},
                        {field: 'now_price', title: __('Now_price'), operate:'BETWEEN'},
                        {field: 'old_price', title: __('Old_price'), operate:'BETWEEN'},
                        {field: 'createtime', title: __('Createtime'),formatter: Table.api.formatter.datetime, addclass: 'datetimerange'},
                        {field: 'endtime', title: __('Endtime'),formatter: Table.api.formatter.datetime, addclass: 'datetimerange'},
                        {field: 'updatetime', title: __('Updatetime'),formatter: Table.api.formatter.datetime, addclass: 'datetimerange'},
                        {field: 'state', title: __('State'),formatter:Table.api.formatter.toggle},

                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate,buttons:[
                                {
                                    name: 'ewm',
                                    text: __('二维码'),
                                    title: __('二维码'),
                                    classname: 'btn btn-xs btn-warning btn-dialog',

                                    url: 'shop/goods/ewm',
                                    callback: function (data) {
                                        Layer.alert("接收到回传数据：" + JSON.stringify(data), {title: "回传数据"});
                                    },
                                    visible: function (row) {
                                        //返回true时按钮显示,返回false隐藏
                                        return true;
                                    }
                                }
                            ]}
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
        ewm: function () {
            $("#c-doctor").data("eSelect", function(obj){
                var id=obj.id;
                var g_id=$("#g_id").val();
                upload = layer.msg('加载中。。。', {
                    icon: 16
                    , shade: 0.2,
                    time: false
                });
                Fast.api.ajax({
                    url:"shop/goods/getEwm",
                    data:{id:id,g_id:g_id},
                    loading:false
                    , success:function(data, ret){
                        //成功的回调
                        console.log(data)
                        var str=`<img src="http://localhost/test/public/`+data+`" alt="" width="20%">`
                        $('.ewm').empty();
                        $('.ewm').append(str)
                        layer.close(upload);
                        return false;
                    }, function(data, ret){
                        //失败的回调
                        alert(ret.msg);
                        return false;
                    }

                });
            });

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