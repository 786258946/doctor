define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'shop/address/index' + location.search,
                    add_url: '',
                    edit_url: '',
                    del_url: 'shop/address/del',
                    multi_url: 'shop/address/multi',
                    table: 'address',
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
                        {field: 'userName', title: __('Username')},
                        {field: 'telNumber', title: __('Telnumber')},
                        {field: 'provinceName', title: __('Provincename')},
                        {field: 'cityName', title: __('Cityname')},
                        {field: 'countyName', title: __('Countyname')},
                        {field: 'detailInfo', title: __('Detailinfo')},

                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});