define(['jquery', 'bootstrap', 'backend', 'table', 'form','selectpage'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'calorie/calorie_product/index' + location.search,
                    add_url: 'calorie/calorie_product/add',
                    edit_url: 'calorie/calorie_product/edit',
                    del_url: 'calorie/calorie_product/del',
                    multi_url: 'calorie/calorie_product/multi',
                    table: 'calorie_product',
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
                        {field: 'cover_img', title: __('Cover_img'), formatter: Table.api.formatter.image,events:Table.api.events.image},
                        {field: 'name', title: __('Name')},
                        {field: 'kcal', title: __('Kcal')},
                
                        {field: 'unit', title: __('Unit')},
                 
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