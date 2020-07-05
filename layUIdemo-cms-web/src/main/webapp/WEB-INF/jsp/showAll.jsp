<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>电子文档列表</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">文档管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <br>
        <div align="left">
            <h2 style="font-family: '楷体';font-size: 38px;">电子文档列表</h2>
        </div>
        <br>

        <%--主体内容表格--%>
        <table class="layui-hide" id="test" lay-filter="test"></table>
        <%--<table id="demo" lay-filter="test" width="900px"></table>--%>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-fluid">
                <div class="layui-input-inline">
                    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="toAdd">新增一个</button>
                </div>
                <%--                <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>--%>
                <%--                <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
                <%--                <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
                <div class="layui-input-inline">
                    <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="toDel">批量删除</button>
                </div>


                <div class="layui-input-inline">
                    分类：
                </div>
                <div class="layui-input-inline">
                    <div class="selectOption">
                        <select name="classId" id="cls">
                            <option value="">全部</option>
                            <c:forEach items="${classList}" var="cls">
                                <option value="${cls.id}">${cls.className}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-input-inline">
                    <button class="layui-btn layui-btn-sm" data-type="reload" id="searchByClass">查询</button>
                </div>

            </div>
        </script>

        <!--js定义两个操作表格的按钮：编辑、删除-->
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © layui.com - 底部固定区域
        </div>
    </div>
</div>

</body>
<%--<script>--%>
<%--    //JavaScript代码区域--%>
<%--    layui.use('element', function () {--%>
<%--        var element = layui.element;--%>

<%--    });--%>
<%--</script>--%>

<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#test' // 页面中渲染 table 的 id
            , toolbar: '#toolbarDemo' // 开启头部工具栏，并为其绑定左侧模板
            , height: 730 // table 的整体高度
            , cellMinWidth: 80 // 单元格最小宽度
            , defaultToolbar: ['filter', 'exports', 'print', { // 自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , title: '用户数据表'
            //,url: 'test.json' // JSON 格式的测试数据
            , url: '/doc/findAll' // 后台获取的真实数据
            //,page: true // 开启分页(默认分页样式+每页10条)
            , page: {
                limit: 15 // 默认limit 是 pageSize, page 是 pageNum
                , limits: [15, 20, 30] // 下拉框，可选 pageSize，第一个值要与 limit 相同
                , first: '首页'
                , last: '尾页'
                , prev: '<i class="layui-icon layui-icon-prev"></i>' // 上一页图标样式
                , next: '<i class="layui-icon layui-icon-next"></i>' // 下一页图标样式
                , layout: ['prev', 'page', 'next', 'count', 'limit', 'skip', 'refresh']  // 自定义分页布局
            }
            , cols: [[ // 表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: '编号', width: 80, sort: true, fixed: 'left'}
                , {field: 'name', title: '文档名称', width: 150}
                , {field: 'description', title: '文档摘要'}
                , {field: 'author', title: '上传人', width: 100}
                , {field: 'uploadTime', title: '上传时间', width: 177}
                , {field: 'className', title: '分类', width: 177}
                , {field: 'right', title: '操作', width: 120, toolbar: '#barDemo'}
            ]]
            // 表格 reload 后继续监听按钮事件，否则按钮会在第一次查询后失效
            , done: function () {
                // 监听查询 btn 的点击事件
                $('#searchByClass').on('click', function () {
                    var type = $(this).data('type');
                    active[type] ? active[type].call(this) : '';
                });
            }
        });

        var active = {
            reload: function () {
                // 获取下拉框的 value，用于设置表格重新渲染时的 where 条件
                var option = jQuery("#cls option:selected");
                layer.msg("查询：" + option.val() + " " + option.text());
                // 执行重载
                table.reload('test', {
                    page: {
                        curr: 1 // 重新从第 1 页开始渲染表格
                    }
                    , where: {
                        classId: option.val()  // 重新渲染条件，可设为多个条件
                    }
                }, 'data');

                // 重新渲染 select 的 option
                var array = new Array();
                var ids = new Array();
                $("#cls option").each(function () {
                    // 遍历保存 option 的 val 和 text
                    var txt = $(this).text();
                    var id = $(this).val();
                    if (txt !== "全部" && txt !== option.text()) {
                        array.push(txt);
                        ids.push(id);
                    }
                    // 清空原有的 option
                    $(this).val('');
                    $(this).text('');
                })

                // 回显当前选中的 option 到选项框
                jQuery("#cls option:selected").text(option.text());
                // 回显包含 全部 和其他 option 到选项框
                var str = "";
                for (var i = 0; i < array.length; i++) {
                    str += "<option value='" + ids[i] + "'>" + array[i] + "</option>";
                }
                //layer.msg(str);
                // 追加到 select 标签内
                $("#cls").append("<option value=\"\">全部</option>" + str);
            }
        };

        //头工具栏事件 lay-event
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
                case 'toAdd':
                    location.href = "/doc/toAdd";
                    break;
                case 'toDel':
                    layer.confirm('确定删除此行数据吗？', function (index) {
                        var data = checkStatus.data;
                        //layer.msg(JSON.stringify(data));

                        var params = "";
                        for (var i in data) {
                            //alert(data[i].vid+"---");
                            params += "&ids=" + data[i].id;
                        }

                        $.ajax({
                            type: "POST",
                            url: "/doc/deleteByIds",
                            data: params,
                            success: function (msg) {
                                layer.msg(msg);
                                table.reload("test", {});//重新加载当前页面表格
                            }
                        });
                    });
                    break;
            }
        });

        //监听行工具事件 lay-event
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么？', function (index) {
                    // 页面删除（假删）
                    obj.del();
                    layer.close(index);

                    // 向服务端发送更新请求 - 服务器删除（真删，本质也是加标记，不真实删除）
                    $.ajax({
                        type: "post",
                        url: "/doc/toDelete",
                        data: {"id": data["id"]}, // 使用 data['列名'] 取 table 中的实际值
                        success: function (data) {
                            //layer.alert(data.flag + " " + data.msg);
                            if (data.msg === 'success') {
                                layer.msg(data.msg);
                                table.reload("test", {});//重新加载当前页面表格
                            } else {
                                alert("未知错误，请重试！");
                            }
                        },
                        dataType: "json",
                    });
                });
            } else if (obj.event === 'edit') {
                alert(JSON.stringify(data));
                // 向服务端发送更新请求
                $.ajax({
                    type: "post",
                    url: "/doc/toUpdate",
                    data: JSON.stringify(data), // 使用 JSON 对象转换，当前行信息传入控制器
                    contentType: "application/json",  // JSON 格式传入，控制器使用 @RequestBody 接收
                    success: function (data) {
                        //layer.msg(data.flag + " " + data.msg);
                        if (data.msg === 'success') {
                            location.href = "/doc/update";
                        } else {
                            alert("未知错误，请重试！");
                        }
                    },
                    dataType: "json",
                });
            }
        });
    });
</script>


</html>
