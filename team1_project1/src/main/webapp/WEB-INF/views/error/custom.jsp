<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error.css">
<div class="error-container">
	<div class="ui card custom-card">
	  <div class="content">
	    <div class="header"><i class="exclamation icon"></i>${errorTitle}</div>
	  </div>
	  <div class="extra content">
	    <h4 class="ui sub header error-content">${errorContent}</h4>
	    <div class="btn-wrap">
		    <a href="${pageContext.request.contextPath}/" class="ui red button small home-btn">홈으로가기</a>
	    </div>
	  </div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>