<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderList.css" />

	        <h1 class="pg-title">주문 내역</h1>
	        <div class="ui container">
	            <form class="order-form">
	                <ul>
	                    <li>
	                        <label for=""
	                            ><i class="circle outline icon"></i>조회기간</label
	                        >
	                        <input
	                            class="date"
	                            type="date"
	                            name="orderdate"
	                            value="startdate"
	                        />
	                        <span>-</span>
	                        <input
	                            class="date"
	                            type="date"
	                            name="orderdate"
	                            value="enddate"
	                        />
	                        <button class="date-button">1주일</button>
	                        <button class="date-button">1개월</button>
	                        <button class="date-button">3개월</button>
	                    </li>
	                    <li>
	                        <label for=""
	                            ><i class="circle outline icon"></i>검색구분</label
	                        >
	                        <select class="ui dropdown">
	                            <option value="0">상품명</option>
	                            <option value="1">주문번호</option>
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
	                <tbody>
	                    <tr>
	                        <td rowspan="2" class="order-num">
	                            <p class="o-num">210928P10850546</p>
	                            <span class="sum-date">(2021.09.28)</span>
	                            <a href="${pageContext.request.contextPath}/orderdetail" class="btn-view">상세보기</a>
	                        </td>
	                        <td>
	                            <div class="pt-list">
	                                <a href="#"
	                                    ><img
	                                        src="${pageContext.request.contextPath}/resources/images/SH2B1WSD751M_BL_S01.jpg"
	                                        alt="상품이미지"
	                                /></a>
	                                <div class="pt-info">
	                                    <a href="#">
	                                        <span class="info-brand"
	                                            >[SYSTEM HOMME]</span
	                                        >
	                                        <span class="info-ptname"
	                                            >스트레치 드레스 셔츠</span
	                                        >
	                                    </a>
	                                    <p class="color">
	                                        color : BLUE
	                                        <span class="and-line">/</span>
	                                        size : 95
	                                    </p>
	                                </div>
	                            </div>
	                        </td>
	                        <td>1</td>
	                        <td><i class="won sign icon small"></i>150.500</td>
	                        <td>
	                            결제완료<span class="sum-date">(2021.09.28)</span>
	                        </td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div class="pt-list">
	                                <a href="#"
	                                    ><img
	                                        src="${pageContext.request.contextPath}/resources/images/MM2B3WSH029H4A_WT_S01.jpg"
	                                        alt="상품이미지"
	                                /></a>
	                                <div class="pt-info">
	                                    <a href="#">
	                                        <span class="info-brand"
	                                            >[CLUB MONACO]</span
	                                        >
	                                        <span class="info-ptname"
	                                            >[21SS] 스트라이프 블록 셔츠</span
	                                        >
	                                    </a>
	                                    <p class="pt-color">
	                                        color : WHITE
	                                        <span class="and-line">/</span>
	                                        size : M
	                                    </p>
	                                </div>
	                            </div>
	                        </td>
	                        <td>1</td>
	                        <td><i class="won sign icon small"></i>96.600</td>
	                        <td>
	                            결제완료<span class="sum-date">(2021.09.28)</span>
	                        </td>
	                        <td></td>
	                    </tr>
	                </tbody>
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

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
