<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<content tag="cssconfig">
<link href="${ctx}/res-build/css/bas.css" rel="stylesheet" type="text/css" />

<link href="${ctx}/res-build/res/module/ajaxpage/css/page.css" rel="stylesheet" type="text/css" />
</content>

<body>
	<!-- BEGIN PAGE HEADER-->
	<h3 class="page-title">
		<i class="iconfont">&#xe622;</i> 院内公告
	</h3>

	<div class="page-bar clearfix">
		<ul class="page-breadcrumb">
			<li><i class="iconfont ico-home">&#xe60a;</i> <a href="index.html">主页</a> <i class="iconfont ico-angle-right">&#xe605;</i></li>
			<li><a href="#">院内公告</a> <i class="iconfont ico-angle-right">&#xe605;</i></li>
			<li><a href="#">院内公告列表</a></li>
		</ul>
		<ul class="page-breadcrumb"></ul>
		<div class="page-bar-actions">
			<a class="btn btn-success btn-sm" href="${ctx}/admin/doc/announcement/addView?pcode=DmdRe&subcode=DocAnnouncement"> <i class="iconfont">&#xe612;</i>
				<span class="hidden-480">新建公告</span>
			</a>
		</div>
	</div>
	<!-- END PAGE HEADER-->

	<div>
		<div class="row">
			<div class="col-md-12">
				<div class="portlet">
					<div class="portlet-search clearfix">
						<form class="form-inline" id="search-form">
							<div class="form-group">
								<label for="title"> <select class="form-control" id="searchScope">
										<option>标题</option>
										<option>发布人</option>
										<option>创建者</option>
								</select>
								</label> <input type="text" class="form-control" name="title" id="title" placeholder="请输入要查找的标题">
							</div>
							<button type="submit" class="btn btn-info">搜索</button>
							<button type="button" class="btn btn-success j-showall">查看全部</button>
						</form>
					</div>
					<div class="portlet-body" id="announce-list">
						<div class="table-pages clearfix">
							<div class="table-page clearfix"></div>
							<div class="page-length">
								<span class="seperator">|</span> 每页显示 <select name="j-length" aria-controls="datatable_ajax"
									class="j-length input-xsmall input-sm input-inline">
									<option value="10">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="75">75</option>
									<option value="100">100</option>
								</select> 条记录
							</div>
							<div class="page-info" role="status" aria-live="polite">
								<span class="seperator">|</span> 总共获取 <span class="page-info-num"></span> 条记录
							</div>
						</div>
						<div class="table-container">
							<table class="table table-striped table-bordered table-hover dataTable no-footer" id="datatable_ajax" aria-describedby="datatable_ajax_info"
								role="grid">
								<thead>
									<tr role="row">
										<th class="sorting_desc">发布时间</th>
										<th class="sorting">标题</th>
										<th class="sorting">发布人</th>
										<th class="sorting">创建者</th>
										<th class="sorting">操作</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
						<div class="table-pages clearfix">
							<div class="table-page clearfix"></div>
							<div class="page-length">
								<span class="seperator">|</span> 每页显示 <select name="j-length" aria-controls="datatable_ajax"
									class="j-length input-xsmall input-sm input-inline">
									<option value="10">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="75">75</option>
									<option value="100">100</option>
								</select> 条记录
							</div>
							<div class="page-info" role="status" aria-live="polite">
								<span class="seperator">|</span> 总共获取 <span class="page-info-num"></span> 条记录
							</div>
						</div>
					</div>
				</div>
				<div>
					<ul id='paging'></ul>
				</div>
				<!-- End: life time stats -->
			</div>
		</div>
		<div>
			<input type="hidden" id="webBasePath" value="${ctx}">
		</div>
	</div>
</body>

<content tag="jsconfig"> <script type="text/javascript">
	var currentpage = $
	{
		currentpage
	};
</script> <script type="text/javascript" src="${ctx}/res-build/config.js" data-init="announcement.js"></script> </content>