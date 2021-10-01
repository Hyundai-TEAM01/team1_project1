<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%-- <%@ include file="/WEB-INF/views/common/header.jsp" %> --%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>SpringFramework</title>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"/>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginForm.css"/>
		
	</head>
	<body>
		
		<div class="ui middle aligned center aligned grid">
			<div class="column">
				<a href="/"><img src="${pageContext.request.contextPath}/resources/images/top-header-handsome-logo.png" class="image"></a>
		
				<form class="ui large form" method="post" action="${pageContext.request.contextPath}/login">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="ui segment transparent">
						<div class="field">
							<div class="ui left input transparent gray-background">
								<input class="text" type="text" name="mid" placeholder="아이디" autocomplete="off">
							</div>
						</div>
						<div class="field">
							<div class="ui left input transparent gray-background">
								<input class="text" type="password" name="mpassword" placeholder="비밀번호">
							</div>
						</div>
						
						<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
							<div class="ui visible transparent red-text" role="alert">
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials'}">
									아이디 또는 비밀번호가 틀립니다.
								</c:if>
								<c:if test="${fn:contains(SPRING_SECURITY_LAST_EXCEPTION.message, 'principal exceeded')}">
									인증 횟수가 초과되었습니다.
								</c:if>
							</div>
						</c:if>
						
						<button type="submit" class="ui fluid button">로그인</button>
						<div class="ui fluid button">
							<a class="white-text" href="#">회원 가입</a>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</body>
</html>