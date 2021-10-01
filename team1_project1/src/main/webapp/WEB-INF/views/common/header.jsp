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
        
        <!-- fomantic UI -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.8/dist/semantic.min.css">
		<script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.8/dist/semantic.min.js"></script>

       <!-- custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
        
        <!-- custom JS -->
        <script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
    </head>
    <body>
        <header>
            <div class="header-container">
                <div class="header-left">
                    <a 
                    	href="/"
                        class="header-logo"
                        >thehandsome.com</a>
                </div>

                <div class="header-menu">
                    <ul class="header-category">
                        <li class="depth1 dth-man">
                            <a>남성</a>
                            <div class="sub-category-wrap sub-man">
                                <ul class="sub-category">
                                    <li><a href="#">전체보기</a></li>
                                    <li>
                                        <a href="#">아우터</a>
                                        <ul class="sub-content">
                                            <li><a href="#">재킷</a></li>
                                            <li><a href="#">점퍼</a></li>
                                            <li><a href="#">가디건/베스트</a></li>
                                            <li><a href="#">트랜치코트</a></li>
                                            <li><a href="#">코트</a></li>
                                            <li><a href="#">다운/패딩</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">탑</a>
                                        <ul class="sub-content">
                                            <li><a href="#">티셔츠</a></li>
                                            <li><a href="#">셔츠</a></li>
                                            <li><a href="#">니트</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">팬츠</a>
                                        <ul class="sub-content">
                                            <li><a href="#">루즈/테이퍼드</a></li>
                                            <li><a href="#">슬림/스트레이트</a></li>
                                            <li><a href="#">조거/트랙</a></li>
                                            <li><a href="#">데님</a></li>
                                            <li><a href="#">쇼츠</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">수트</a>
                                        <ul class="sub-content">
                                            <li><a href="#">드레스셔츠</a></li>
                                            <li><a href="#">수트재킷</a></li>
                                            <li><a href="#">수트팬츠</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">패션잡화</a>
                                        <ul class="sub-content">
                                            <li><a href="#">가방</a></li>
                                            <li><a href="#">슈즈</a></li>
                                            <li><a href="#">모자</a></li>
                                            <li><a href="#">타이</a></li>
                                            <li><a href="#">양말</a></li>
                                            <li><a href="#">스카프/머플러</a></li>
                                            <li><a href="#">비치웨어</a></li>
                                            <li><a href="#">기타소품</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="depth1 dth-woman">
                            <a>여성</a>
                            <div class="sub-category-wrap sub-woman">
                                <ul class="sub-category">
                                    <li><a href="#">전체보기</a></li>
                                    <li>
                                        <a href="#">아우터</a>
                                        <ul class="sub-content">
                                            <li><a href="#">재킷</a></li>
                                            <li><a href="#">점퍼</a></li>
                                            <li><a href="#">가디건/베스트</a></li>
                                            <li><a href="#">트랜치코트</a></li>
                                            <li><a href="#">코트</a></li>
                                            <li><a href="#">다운/패딩</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">탑</a>
                                        <ul class="sub-content">
                                            <li><a href="#">티셔츠</a></li>
                                            <li><a href="#">블라우스</a></li>
                                            <li><a href="#">셔츠</a></li>
                                            <li><a href="#">니트</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">드레스</a>
                                        <ul class="sub-content">
                                            <li><a href="#">미니 드레스</a></li>
                                            <li><a href="#">미디 드레스</a></li>
                                            <li><a href="#">롱/맥시 드레스</a></li>
                                            <li><a href="#">데님</a></li>
                                            <li><a href="#">쇼츠</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">팬츠</a>
                                        <ul class="sub-content">
                                            <li><a href="#">캐주얼</a></li>
                                            <li><a href="#">포멀</a></li>
                                            <li><a href="#">데님</a></li>
                                            <li><a href="#">쇼츠</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">스커트</a>
                                        <ul class="sub-content">
                                            <li><a href="#">미니 스커트</a></li>
                                            <li><a href="#">펜슬 스커트</a></li>
                                            <li><a href="#">플레어 스커트</a></li>
                                            <li><a href="#">롱/맥시 스커트</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">패션잡화</a>
                                        <ul class="sub-content">
                                            <li><a href="#">가방</a></li>
                                            <li><a href="#">슈즈</a></li>
                                            <li><a href="#">모자</a></li>
                                            <li><a href="#">주얼리</a></li>
                                            <li><a href="#">스카프/머플러</a></li>
                                            <li><a href="#">양말</a></li>
                                            <li><a href="#">비치웨어</a></li>
                                            <li><a href="#">기타소품</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="depth1">
                        	<a>이벤트</a>
                        </li>
                    </ul>
                </div>

                <div class="header-right">
                    <ul class="header-option">
                        <li>
							<sec:authorize access="isAnonymous()">
							<a href="${pageContext.request.contextPath}/member/loginForm">로그인</a>
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
									<button class="header-logout">로그아웃</button>
								</form>
							</sec:authorize>
						</li>
                        <li><a href="${pageContext.request.contextPath}/orderlist">마이페이지</a></li>
                        <li><a href="${pageContext.request.contextPath}/cart/content"><i class="shopping bag icon"></i>(0)</a></li>
                    </ul>
                </div>
            </div>
        </header>