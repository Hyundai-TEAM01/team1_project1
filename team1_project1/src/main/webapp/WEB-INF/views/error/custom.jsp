<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">
		${errorTitle}
	</div>
	<div class="card-body">
		<p>${errorContent}</p>
		<div>
			<a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-sm">홈으로가기</a>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>