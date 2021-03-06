<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderDetail.css" />

	    <h1 class="pg-title">주문 상세 조회</h1>
        <div class="ui container">
            <div class="pt-title">
                <div class="o-num">
                    <strong>주문번호 : </strong><span class="ono"></span>
                </div>
                <div class="o-date">주문일시 : <span class="odate"></span></div>
            </div>

            <h3 class="pt-subtitle">주문상품</h3>
            <table class="pt-table o-table">
                <thead>
                    <tr>
                        <th class="pt-infos">상품정보</th>
                        <th>수량</th>
                        <th>판매가</th>
                        <th>적립 한섬마일리지</th>
                        <th>주문상태</th>
                    </tr>
                </thead>
                <!-- ajax table tr 생성 -->
                <tbody id="odtable"></tbody>
            </table>

            <h3 class="pt-subtitle">결제정보</h3>
            <table class="pt-table pay-table">
                <thead>
                    <tr>
                        <th class="pt-infos">판매가</th>
                        <th>배송비</th>
                        <th>총할인금액</th>
                        <th>총결제금액</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="order-num"><i class="won sign icon small"></i><span class="podsaleprice"></span></td>
                        <td><i class="won sign icon small"></i><span class="poddeliveryprice"></span></td>
                        <td>-<i class="won sign icon small"></i><span class="poddiscount"></span></td>
                        <td class="pay-money">
                            <i class="won sign icon small"></i><span class="podpayprice"></span>
                        </td>
                    </tr>
                </tbody>
            </table>

            <table class="pt-table paydetail-table">
                <tr>
                    <th>주 결제수단</th>
                    <td><span class="podpayname">비씨카드</span>(<span class="podpayno"></span>)</td>
                </tr>
                <tr>
                    <th>실 결제금액</th>
                    <td><i class="won sign icon small"></i><span class="podpayprice"></span></td>
                </tr>
                <tr>
                    <th>할부 개월 수</th>
                    <td><span class="podpayinstallment">일시불</span></td>
                </tr>
            </table>

            <h3 class="pt-subtitle">배송지 정보</h3>
            <table class="pt-table shipping-table">
                <tr>
                    <th>배송지 주소</th>
                    <td>
                    	(<span class="podaddr1"></span>) 
                    	<span class="podaddr2"></span> 
                    	<span class="podaddr3"></span>
                    </td>
                </tr>
                <tr>
                    <th>수령인</th>
                    <td><span class="podname"></span></td>
                </tr>
                <tr>
                    <th>휴대폰</th>
                    <td><span class="podphone"></span></td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td><span class="podtel"></span></td>
                </tr>
                <tr>
                    <th>배송요청사항</th>
                    <td><span class="podrequest"></span></td>
                </tr>
            </table>
        </div>
        
      <script src="${pageContext.request.contextPath}/resources/js/orderDetail.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
