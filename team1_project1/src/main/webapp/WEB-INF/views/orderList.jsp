<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderList.css" />

	        <h1 class="pg-title">주문 내역</h1>
	        <div class="ui container">
	            <form class="order-form">
	                <ul>
	                    <li>
	                        <label
	                            ><i class="circle outline icon"></i>조회기간</label
	                        >
	                        <input
	                            class="date"
	                            type="date"
	                            name="startdate"
	                        />
	                        <span>-</span>
	                        <input
	                            class="date"
	                            type="date"
	                            name="enddate"
	                        />
	                        <a id="setdatebtn1" href="javascript:void(0);" class="date-button">1주일</a>
	                        <a id="setdatebtn2" href="javascript:void(0);" class="date-button">1개월</a>
	                        <a id="setdatebtn3" href="javascript:void(0);" class="date-button">3개월</a>
	                    </li>
	                    <li>
	                        <label
	                            ><i class="circle outline icon"></i>검색구분</label
	                        >
	                        <select class="ui dropdown" name="searchtype">
	                            <option value="pname">상품명</option>
	                            <option value="porderno">주문번호</option>
	                        </select>
	                        <input
	                            class="search"
	                            type="text"
	                            name="search"
	                            placeholder=""
	                        />
	                    </li>
	                </ul>
	                <button class="submit-btn" type="submit">Submit</button>
	            </form>
	
	            
            	<h3 class="pt-subtitle">상품 주문 목록</h3>
	
	            <table class="pt-table">
	                <thead>
	                    <tr>
	                        <th>주문번호</th>
	                        <th class="pt-infos">상품정보</th>
	                        <th>수량</th>
	                        <th>판매가</th>
	                        <th>주문상태</th>
	                        <th>구분</th>
	                    </tr>
	                </thead>
	                <!-- Ajax 주문 목록 테이블 tr 생성 -->
	                <tbody id="otable"></tbody>
	            </table>
	            <div class="paging">
	                <a href="#" class="prev2"><i class="angle double left icon"></i></a>
	                <a href="#" class="prev"><i class="angle left icon"></i></a>
	                <span class="paging-num">
	                    <a href="#" class="pageBtn on">1</a>
	                    <a href="#" class="pageBtn">2</a>
	                </span>
	                <a href="#" class="next"><i class="angle right icon"></i></a>
	                <a href="#" class="next2"><i class="angle double right icon"></i></a>
	            </div>
	</div>

	<script src="${pageContext.request.contextPath}/resources/js/orderList.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
