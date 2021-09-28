<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>

        
        <!-- semantic UI -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
        />
        <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            crossorigin="anonymous"
        ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

        <!-- custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
        
    </head>
    <body>
        <header>
            <div class="header-container">
                <div class="header-left">
                    <a
                        class="header-logo"
                        >thehandsome.com</a>
                </div>

                <div class="header-menu">
                    <ul class="header-category">
                        <li><a>남성</a></li>
                        <li><a>여성</a></li>
                    </ul>
                </div>

                <div class="header-right">
                    <ul class="header-option">
                        <li>
							<sec:authorize access="isAnonymous()">
							<a href="${pageContext.request.contextPath}/ch17/loginForm" class="btn btn-success btn-sm">로그인</a>
							</sec:authorize>
					
							<sec:authorize access="isAuthenticated()">
								<%-- 사이트간 요청 위조 방지가 비활성화되어 있을 경우 --%>  
								<%-- 
								<a href="${pageContext.request.contextPath}/logout" 
								   class="btn btn-success btn-sm">로그아웃</a> 
								--%>
								   
								<%-- 사이트간 요청 위조 방지가 활성화되어 있을 경우 --%>   
								<form method="post" action="${pageContext.request.contextPath}/logout">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<button class="btn btn-success btn-sm">로그아웃</button>
								</form>
							</sec:authorize>
						</li>
                        <li><a>마이페이지</a></li>
                        <li><i class="icon-shop"></i>(0)</li>
                    </ul>
                </div>
            </div>
        </header>