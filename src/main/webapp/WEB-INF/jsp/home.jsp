<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/layouts/Header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="page">
	<div class="container">
		<span class="margin"></span>
		<c:forEach var="s" items="${listOfStatus}" varStatus="loop">
			<div class="media">
				<div class="pull-left" style="padding: 8px;">
					<img class="media-object" src="https://invatar0.appspot.com/svg/${fn:substring(s.user.firstName, 0, 1)}${fn:substring(s.user.lastName, 0, 1)}.jpg">
				</div>
				<div class="media-body">
					<h4 class="media-heading">
						${s.user.firstName} ${s.user.lastName}
					</h4>
					<ul class="list-inline list-unstyled">
						<li><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;${s.location.name}</li>
						<li><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;<span class="createDate${loop.index}">${s.createdDate}</span></li>
					</ul>
					<p>${s.content}</p>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@include file="/WEB-INF/jsp/layouts/Footer.jsp"%>
<script type="text/javascript">
	$(function(){
		for(var i=0;i<'${fn:length(listOfStatus)}';i++){
			$('.createDate'+i).html($.app.convertTimeStamp($('.createDate'+i).html()));
		}
	});
</script>