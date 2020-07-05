<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改电子文档</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<body>

<div class="layui-container">
    <br>
    <br>
    <div align="center">
        <h2 style="font-family: '楷体';font-size: 38px;">新增/修改电子文档</h2>
    </div>
    <br>
    <br>
    <!-- 表单：layui-form -->
    <form class="layui-form" action="/doc/updateOne">
        <div class="layui-form-item">
            <label class="layui-form-label">文档编号</label>
            <div class="layui-input-inline"> <!-- layui-input-block 输入框长度顶边 -->
                <input type="text" name="id" readonly autocomplete="off" class="layui-input" style="background-color: lightgray"
                       value="${tbDocument.id}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文档名称</label>
            <div class="layui-input-inline"> <!-- layui-input-block 输入框长度顶边 -->
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input"
                       value="${tbDocument.name}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文本域</label>
            <div class="layui-input-block">
                <textarea name="description" class="layui-textarea">${tbDocument.description}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上传人</label>
            <div class="layui-input-inline"> <!-- layui-input-block 输入框长度顶边 -->
                <input type="text" name="author" required lay-verify="required" autocomplete="off" class="layui-input"
                       value="${tbDocument.author}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">分类</label>
            <div class="layui-input-inline">
                <select name="classId" lay-filter="aihao">
                    <c:forEach items="${classList}" var="cls">
                        <c:if test="${tbDocument.classId == cls.id}">
                            <option value="${cls.id}" selected>${cls.className}</option>
                        </c:if>
                        <c:if test="${tbDocument.classId != cls.id}">
                            <option value="${cls.id}">${cls.className}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">上传时间</label>
            <div class="layui-input-inline"> <!-- layui-input-block 输入框长度顶边 -->
                <input type="date" name="uploadTime" required lay-verify="required" autocomplete="off"
                       class="layui-input" value="${tbDocument.uploadTime}">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" align="center">
                <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                <button class="layui-btn" onclick="toShowAll()">返回</button>
            </div>
        </div>
    </form>
</div>

<script>
    // 必须导入 form 模块，才能保证表单正常渲染
    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return true; // true: 跳转到 form 的 action   false：不跳转
        });
    });
</script>


</body>
</html>
