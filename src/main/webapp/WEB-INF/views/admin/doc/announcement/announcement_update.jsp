﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<content tag="cssconfig">
<link href="${ctx}/res-build/css/bas.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/res-build/res/plugin/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/res-build/res/plugin/bootstrap-summernote/summernote.css" rel="stylesheet">
<link href="${ctx}/res-build/css/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
</content>
<content tag="headerjsconfig"> <%--<script type="text/javascript" src="http://api.map.baidu.com/api?type=quick&ak=&v=1.0"></script>--%> <script
	type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=lYUVYI1SUwbp3mtDMzOEmQZ8"></script> <script
	src="${ctx}/res-build/res/plugin/bootstrap-summernote/summernote.js"></script> <%--    <script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&ak=7tnSzYbr5FC01f6aCKgDFqro&services=&t=20150506165027"></script>--%>
</content>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<body>
	<h3 class="page-title">
		院内公告 <small>编辑公告</small>
	</h3>

	<div class="page-bar clearfix">
		<ul class="page-breadcrumb">
			<li><i class="iconfont ico-home">&#xe60a;</i> <a href="index.html">主页</a> <i class="iconfont ico-angle-right"> &#xe605;</i></li>
			<li><a href="${ctx}/admin/doc/announcement?pcode=DmdRe&subcode=DocAnnouncement">院内公告</a> <i class="iconfont ico-angle-right"> &#xe605;</i></li>
			<li><a href="#">编辑公告</a></li>
		</ul>
	</div>



	<div class="row">

		<div class="col-md-12">
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" id="form_edit" class="form-horizontal" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${id}"> <input type="hidden" name="region" />

					<div class="form-body">
						<div class="form-actions-topbox">
							<div class="form-actions-fixtop">
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
										<!-- <button type="button" class="btn btn-success j-edit">
											<i class="iconfont"> &#xe61c;</i>我要编辑
										</button> -->
										<button type="submit" class="btn btn-success j-save">
											<i class="iconfont"> &#xe62c;</i>保存
										</button>
										<a href="${ctx}/admin/doc/announcement?pcode=DmdRe&subcode=DocAnnouncement" class="btn btn-default">返回</a>
										<%--<button type="button" class="btn btn-success j-edit"><i class="iconfont">&#xe61c;</i>
                                        我要编辑
                                    </button>--%>
									</div>
								</div>
							</div>
						</div>
						<div class="form-body">
							<!-- <div class="form-group" style="display: none">
								<label class="control-label col-md-3">发布时间</label>

								<div class="col-md-4">
									<input type="text" id="publishtime" name="publishtime" placeholder="发布时间" class="form-control">
								</div>
							</div> -->
							<div class="form-group">
								<label class="control-label col-md-3">公告标题</label>

								<div class="col-md-4">
									<input type="text" id="title" name="title" placeholder="标题" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3"> 发布人</label>

								<div class="col-md-4">
									<input type="text" id="publishusername" name="publishusername" placeholder="发布人" class="form-control">
								</div>
							</div>
							

							<div class="form-group">
								<label class="control-label col-md-3">公告正文</label>

								<div class="col-md-9" style="width: 50%">
									<%--   <div id="summernote">summernote 1</div>--%>
									<textarea id="summernote" name="content" class="form-control" rows="3"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">附件</label>
								<!-- Enclosure附件 -->
								<div class="col-md-4">
									<div id="selImg" class="form-control">
										<i class="iconfont">&#xe626;</i> <span>选择附件</span>
									</div>
									<input type="file" id="file" name="file" class="">
								</div>
								<a href="" id="imgurl" target="_blank"></a>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3"></label>
								<!-- Enclosure附件 -->
								<div class="col-md-4">
									<div id="selImg2" class="form-control">
										<i class="iconfont">&#xe626;</i> <span>选择附件</span>
									</div>
									<input type="file" id="file2" name="file" class="">
								</div>
								<a href="" id="imgurl2" target="_blank"></a>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3"></label>
								<!-- Enclosure附件 -->
								<div class="col-md-4">
									<div id="selImg3" class="form-control">
										<i class="iconfont">&#xe626;</i> <span>选择附件</span>
									</div>
									<input type="file" id="file3" name="file" class="">
								</div>
								<a href="" id="imgurl3" target="_blank"></a>
							</div>
							<div class="form-group">
							<div class="col-md-4 col-md-offset-3" style="line-height: 34px; color: #888888">请上传gif，jpg，jpeg，png，xlsx，docx格式的文件</div>
						</div>
							<div class="form-actions">
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
<!-- 										<button type="button" class="btn btn-success j-edit">
											<i class="iconfont">&#xe61c;</i>我要编辑
										</button> -->
										<button type="submit" class="btn btn-success j-save">
											<i class="iconfont"> &#xe62c;</i>保存
										</button>
										<a href="${ctx}/admin/doc/announcement?pcode=DmdRe&subcode=DocAnnouncement" class="btn btn-default">返回</a>
									</div>
								</div>
							</div>

						</div>
				</form>
			</div>
		</div>
	</div>

	<div>
		<input type="hidden" id="webBasePath" value="${ctx}">
	</div>
	<div class="modal fade bs-example-modal-sm" id="modal-box" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">

			<div class="modal-content">

				<div class="modal-body">
					<div class="dialogtip-con-wrap clearfix dialogtipg-success">
						<div class="dialogtip-icon iconfont">&#xe614;</div>
						<div class="dialogtip-con">
							<h4 class="dialogtip-tit">操作成功</h4>

							<div class="dialogtip-msg">数据保存成功</div>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<a href="${ctx}/admin/doc/announcement?pcode=DmdRe&subcode=DocAnnouncement&currentpage=${currentpage}" class="btn btn-success">返回机构列表</a> <a
						href="#" class="btn btn-danger j-modal-closebtn">关闭</a>
				</div>
			</div>

		</div>
	</div>
	<div class="modal fade bs-example-modal-sm" id="modal-box-error" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">

			<div class="modal-content">

				<div class="modal-body">
					<div class="dialogtip-con-wrap clearfix dialogtipg-error">
						<div class="dialogtip-icon iconfont">&#xe616;</div>
						<div class="dialogtip-con">
							<h4 class="dialogtip-tit">操作失败</h4>

							<div class="dialogtip-msg">请上传gif|jpg|jpeg|png格式的图片</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-danger" data-dismiss="modal">我知道了</button>
				</div>
			</div>

		</div>
	</div>
	<content tag="jsconfig"> <script type="text/javascript">
        var announcementID = ${id};
    </script> <script type="text/javascript" src="${ctx}/res-build/config.js" data-init="announcement-update.js"></script> </content>
</body>

