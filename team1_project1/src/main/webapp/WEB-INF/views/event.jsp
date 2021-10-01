<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event.css" />
	
	    <h1 class="pg-title">이벤트</h1>

        <div class="ui container">
            <h2 class="pt-title">진행 중인 이벤트</h2>
            <div class="couproceed">
                <h3 class="pt-subtitle">선착순 이벤트 쿠폰</h3>
                <!-- 이벤트 쿠폰 -->
                <div class="couoption">
                    <div class="coutimer">
                        <p class="explain"></p>
                        <p class="d-day"></p>
                    </div>
                    <p class="coucontent">50% 할인</p>
                    <a class="imgbtn" href="#"><img src="${pageContext.request.contextPath}/resources/images/coupone.png" alt="쿠폰이미지" /></a>
                </div>
            </div>
            <h2 class="pt-title">종료된 이벤트</h2>
            <div class="couended">
                <h3 class="pt-subtitle">가입 축하 쿠폰</h3>
                <img src="${pageContext.request.contextPath}/resources/images/coupone2.png" alt="쿠폰이미지" />
                <img src="${pageContext.request.contextPath}/resources/images/coupone3.png" alt="쿠폰이미지" />

                <h3 class="pt-subtitle">FRIEND 등급 쿠폰</h3>
                <img src="${pageContext.request.contextPath}/resources/images/coupone4.png" alt="쿠폰이미지" />
                <img src="${pageContext.request.contextPath}/resources/images/coupone5.png" alt="쿠폰이미지" />
                <img src="${pageContext.request.contextPath}/resources/images/coupone6.png" alt="쿠폰이미지" />
                <h3 class="pt-subtitle">H.Point 통합 마일리지 해택</h3>
                <img src="${pageContext.request.contextPath}/resources/images/coupone7.png" alt="쿠폰이미지" />
                <img src="${pageContext.request.contextPath}/resources/images/coupone8.png" alt="쿠폰이미지" />
                <img src="${pageContext.request.contextPath}/resources/images/coupone9.png" alt="쿠폰이미지" />
            </div>
        </div>

	<script src="${pageContext.request.contextPath}/resources/js/event.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
