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
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.lazy/1.7.9/jquery.lazy.min.js"></script>        
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
                            <a href="${pageContext.request.contextPath}/productList?ccode=MEN&pageNo=1">남성</a>
                            <div class="sub-category-wrap sub-man">
                                <ul class="sub-category">
                                    <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN&pageNo=1">전체보기</a></li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=MEN_OUTER&pageNo=1">아우터</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_OUTER_JACKET&pageNo=1">재킷</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_OUTER_JUMPER&pageNo=1">점퍼</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_OUTER_CARDIGAN/VEST&pageNo=1">가디건/베스트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_OUTER_TRENCHCOAT&pageNo=1">트랜치코트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_OUTER_COAT&pageNo=1">코트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_OUTER_DOWNJUMPER&pageNo=1">다운/패딩</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=MEN_TOP&pageNo=1">탑</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_TOP_T-SHIRTS&pageNo=1">티셔츠</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_TOP_SHIRTS&pageNo=1">셔츠</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_TOP_KNIT&pageNo=1">니트</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=MEN_PANTS&pageNo=1">팬츠</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_PANTS_루즈/테이퍼드&pageNo=1">루즈/테이퍼드</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_PANTS_스트레이트&pageNo=1">슬림/스트레이트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_PANTS_조거/트랙&pageNo=1">조거/트랙</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_PANTS_데님&pageNo=1">데님</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_PANTS_쇼츠&pageNo=1">쇼츠</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=MEN_Suit&pageNo=1">수트</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_Suit_DRESSSHIRTS&pageNo=1">드레스셔츠</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_Suit_SUITJACKET&pageNo=1">수트재킷</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=MEN_Suit_SUITPANTS&pageNo=1">수트팬츠</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="depth1 dth-woman">
                            <a href="${pageContext.request.contextPath}/productList?ccode=WOMEN&pageNo=1">여성</a>
                            <div class="sub-category-wrap sub-woman">
                                <ul class="sub-category">
                                    <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN&pageNo=1">전체보기</a></li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_OUTER&pageNo=1">아우터</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_OUTER_JACKET&pageNo=1">재킷</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_OUTER_JUMPER&pageNo=1">점퍼</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_OUTER_Cardigan/Vest&pageNo=1">가디건/베스트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_OUTER_TRENCHCOAT&pageNo=1">트랜치코트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_OUTER_COAT&pageNo=1">코트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_OUTER_DOWNJUMPER&pageNo=1">다운/패딩</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_Top&pageNo=1">탑</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_Top_T-Shirts&pageNo=1">티셔츠</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_Top_Blouse&pageNo=1">블라우스</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_Top_Shirts&pageNo=1">셔츠</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_Top_Knit&pageNo=1">니트</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_DRESS&pageNo=1">드레스</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_DRESS_MINIDRESS&pageNo=1">미니 드레스</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_DRESS_MIDIDRESS&pageNo=1">미디 드레스</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_DRESS_LONG/MAXIDRESS&pageNo=1">롱/맥시 드레스</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_PANTS&pageNo=1">팬츠</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_PANTS_CASUAL&pageNo=1">캐주얼</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_PANTS_FORMAL&pageNo=1">포멀</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_PANTS_DENIM&pageNo=1">데님</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_PANTS_SHORTS&pageNo=1">쇼츠</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_SKIRT&pageNo=1">스커트</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_SKIRT_MINISKIRT&pageNo=1">미니 스커트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_SKIRT_PENCILSKIRT&pageNo=1">펜슬 스커트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_SKIRT_FLARESKIRT&pageNo=1">플레어 스커트</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_SKIRT_LONG/MAXISKIRT&pageNo=1">롱/맥시 스커트</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_FASHIONACC.&pageNo=1">패션잡화</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_FASHIONACC._BAGS&pageNo=1">가방</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_FASHIONACC._SCARF/MUFFLER&pageNo=1">스카프/머플러</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=WOMEN_FASHIONACC._ETC&pageNo=1">기타소품</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="depth1 dth-lifestyle">
                            <a href="${pageContext.request.contextPath}/productList?ccode=LIFESTYLE&pageNo=1">라이프스타일</a>
                            <div class="sub-category-wrap sub-lifestyle">
                                <ul class="sub-category">
                                    <li><a href="${pageContext.request.contextPath}/productList?ccode=LIFESTYLE&pageNo=1">전체보기</a></li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=LIFESTYLE_HOME&pageNo=1">홈</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=LIFESTYLE_HOME_FABRIC&pageNo=1">패브릭</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=LIFESTYLE_HOME_FRAGRANCE&pageNo=1">프래그런스</a></li>
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=LIFESTYLE_HOME_OTHERACCESSORIES&pageNo=1">기타소품</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/productList?ccode=LIFESTYLE_BATH&pageNo=1">배스</a>
                                        <ul class="sub-content">
                                            <li><a href="${pageContext.request.contextPath}/productList?ccode=LIFESTYLE_BATH_OTHERACCESSORIES&pageNo=1">기타소품</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="depth1">
                        	<a href="/event">이벤트</a>
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
                        <li class="my-page">
                            <a href="${pageContext.request.contextPath}/mypage/orderlist">마이페이지</a>
                            <ul class="sub-option">
                                <li><a href="${pageContext.request.contextPath}/mypage/orderlist">주문조회</a></li>
                                <li><a href="${pageContext.request.contextPath}/mypage/couponlist">쿠폰조회</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/cart/content"><i class="shopping bag icon"></i>(<span class="cartcnt">0</span>)</a></li>
                    </ul>
                </div>
            </div>
        </header>