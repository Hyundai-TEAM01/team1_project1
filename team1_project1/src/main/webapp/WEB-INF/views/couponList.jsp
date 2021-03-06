<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/couponList.css" />

			<h1 class="pg-title">나의 쿠폰</h1>
			
			<div class="ui container">
				<div class="cp-wrap">
					<h3 class="cp-subtitle">온라인 쿠폰 목록</h3>
					<select class="ui dropdown" name="searchtype">
						<option value="0">미사용</option>
						<option value="1">사용완료</option>
						<option value="2">기간만료</option>
					</select>
				</div>
			
				<table class="cp-table">
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th class="pt-infos">쿠폰정보</th>
							<th>할인</th>
							<th>유효기간</th>
						</tr>
					</thead>
					<!-- Ajax 쿠폰 목록 테이블 tr 생성 -->
					<tbody id="ctable"></tbody>
				</table>
				<!-- Ajax 쿠폰 페이징 버튼 생성 -->
				<div class="paging"></div>
			</div>

<script	src="${pageContext.request.contextPath}/resources/js/couponList.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
