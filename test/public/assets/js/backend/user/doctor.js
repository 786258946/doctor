define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/doctor/index' + location.search,
                    add_url: 'user/doctor/add',
                    edit_url: 'user/doctor/edit',
                    del_url: 'user/doctor/del',
                    multi_url: 'user/doctor/multi',
                    table: 'doctor',
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
                        {field: 'name', title: __('Name')},
                        {field: 'major', title: __('Major')},
                        {field: 'position', title: __('Position')},
                        {field: 'hospital', title: __('Hospital')},
                        {field: 'username', title: __('Username')},
                        {field: 'img_url', title: __('Img_url'), formatter: Table.api.formatter.image,events:Table.api.events.image},
                        {field: 'state', title: __('状态'), formatter: Table.api.formatter.toggle},
                        
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