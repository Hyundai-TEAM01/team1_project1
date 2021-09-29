<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderDetail.css" />

	    <h1 class="pg-title">주문 상세 조회</h1>
        <div class="ui container">
            <div class="pt-title">
                <div class="o-num">
                    <strong>주문번호 : </strong><span>210928P10850546</span>
                </div>
                <div class="o-date">주문일시 : 2021.09.28. 11:00</div>
            </div>

            <h3 class="pt-subtitle">주문상품</h3>
            <table class="pt-table o-table">
                <thead>
                    <tr>
                        <th class="pt-infos">상품정보</th>
                        <th>수량</th>
                        <th>판매가</th>
                        <th>실결제금액</th>
                        <th>적립 한섬마일리지</th>
                        <th>주문상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
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
                                    <p class="pt-color">
                                        color : BLUE
                                        <span class="and-line">/</span>
                                        size : 95
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td>1</td>
                        <td><i class="won sign icon small"></i>150,500</td>
                        <td><i class="won sign icon small"></i>150,500</td>
                        <td rowspan="2">1.000 P</td>
                        <td>
                            결제완료<span class="sum-date">(2021.09.28)</span>
                        </td>
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
                        <td><i class="won sign icon small"></i>96,600</td>
                        <td><i class="won sign icon small"></i>150,500</td>
                        <td>
                            결제완료<span class="sum-date">(2021.09.28)</span>
                        </td>
                    </tr>
                </tbody>
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
                        <td><i class="won sign icon small"></i>247,100</td>
                        <td><i class="won sign icon small"></i>0</td>
                        <td>-<i class="won sign icon small"></i>0</td>
                        <td class="pay-money">
                            <i class="won sign icon small"></i>247,100
                        </td>
                    </tr>
                </tbody>
            </table>

            <table class="pt-table paydetail-table">
                <tr>
                    <th>주 결제수단</th>
                    <td>비씨카드 (5389-****-****-****)</td>
                </tr>
                <tr>
                    <th>실 결제금액</th>
                    <td><i class="won sign icon small"></i>247,100</td>
                </tr>
                <tr>
                    <th>할부 개월 수</th>
                    <td>일시불</td>
                </tr>
            </table>

            <h3 class="pt-subtitle">배송지 정보</h3>
            <table class="pt-table shipping-table">
                <tr>
                    <th>배송지 주소</th>
                    <td>
                        (08045) 서울특별시 양천구 신정이펜2로 55(신정동, 신정
                        이펜하우스 2단지) 909동 1004호
                    </td>
                </tr>
                <tr>
                    <th>수령인</th>
                    <td>허준범</td>
                </tr>
                <tr>
                    <th>휴대폰</th>
                    <td>010-1234-1004</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td></td>
                </tr>
                <tr>
                    <th>배송요청사항</th>
                    <td>올 때 메로나</td>
                </tr>
            </table>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
