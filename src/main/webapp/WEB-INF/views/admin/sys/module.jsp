<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<content tag="cssconfig">
    <link href="${ctx}/res-build/css/sys.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/res-build/res/plugin/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css"/>
</content>

<body>
<!-- BEGIN PAGE HEADER-->
<h3 class="page-title">
    模块管理
</h3>

<div class="page-bar clearfix">
    <ul class="page-breadcrumb">
        <li><i class="iconfont ico-home">&#xe60a;</i> <a href="index.html">主页</a> <i class="iconfont ico-angle-right">&#xe605;</i></li>
        <li><a href="#">模块管理</a></li>
    </ul>
</div>
<!-- END PAGE HEADER-->

<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-4">
        <!-- Begin: life time stats -->
        <div class="portlet portlet-blue portlet-module">
            <div class="portlet-title clearfix">
                <div class="caption">
                    <i class="iconfont">&#xe60b;</i> 模块管理
                </div>
                <div class="tools">
                    <button type="button" class="btn btn-default btn-xs" data-toggle="modal" <%--data-target="#addModal"--%> title="添加根模块"  id="addModuleSpan">添加根模块</button>
                </div>
            </div>
            <div class="portlet-body jstree-wrap">
                <div id="tree_3" class="tree-demo">
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <!-- Begin: life time stats -->
        <div class="portlet portlet-blue portlet-module">
            <div class="portlet-title clearfix">
                <div class="caption">
                    <i class="iconfont">&#xe60b;</i> 模块详细信息
                </div>
            </div>
            <div class="portlet-body form">
                <form class="form-horizontal" role="form" id="modifyModuleForm">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">模块名称</label>
                            <div class="col-md-7">
                                <input type="hidden" name="id">
                                <input type="text" class="form-control" placeholder="模块名称" name="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">模块编码</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" placeholder="模块编码" name="code">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">模块url地址</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" disabled placeholder="模块url地址" name="url">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">备 注</label>
                            <div class="col-md-7">
                                <textarea class="form-control" rows="3" placeholder="备注" name="intro"></textarea>
                            </div>
                        </div>
                        <div class="form-actions fluid clearfix ele-hide" id="update-node">
                            <div class="col-md-offset-3 col-md-7">
                                <button type="submit" class="btn btn-success">更 新</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">添加模块</h4>
            </div>
            <form class="form-horizontal" id="addModuleForm">
                <div class="modal-body">
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <div>
                            <input type="hidden" id="pcode" name="pcode">
                        </div>
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">上级模块</label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control " id="parentModuleInput" placeholder="上级模块" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">模块名称</label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" placeholder="名称" name="title">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">模块编码</label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" placeholder="名称" name="code">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">模块url地址</label>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" placeholder="关键词" name="url">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">备 注</label>
                                <div class="col-md-7">
                                    <textarea class="form-control" rows="3" placeholder="备注" name="intro"></textarea>
                                </div>
                            </div>
                        </div>
                        <!-- END FORM-->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" id="formSaveBtn">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade bs-example-modal-sm" id="deteleModalSure" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="">提示消息</h4>
            </div>
            <div class="modal-body">
                <div class="dialogtip-con-wrap clearfix dialogtipg-warning">
                      <div class="dialogtip-icon iconfont">&#xe614;</div>
                    <div class="dialogtip-con">
                        <h4 class="dialogtip-tit">确定删除该模块吗？</h4>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary j-sure-btn">确定删除</button>
            </div>
        </div>

    </div>
</div>

<!-- END PAGE CONTENT-->
<content tag="jsconfig">
    <script type="text/javascript" src="${ctx}/res-build/config.js" data-init="module.js"></script>

</content>
</body>

