<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error.css">

<div class="error-container">
	<div class="ui card custom-card">
	  <div class="content">
	    <div class="header"><i class="exclamation icon"></i>알 수 없는 오류가 발생하였습니다.</div>
	  </div>
	  <div class="extra content">
	    <h4 class="ui sub header error-content">일시적인 서버 오류입니다. 잠시후 다시 시도해 주세요.<br/>오류가 반복될 경우 관리자에게 연락바랍니다.</h4>
	    <div class="btn-wrap">
		    <a href="${pageContext.request.contextPath}/" class="ui red button small home-btn">홈으로가기</a>
	    </div>
	  </div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>