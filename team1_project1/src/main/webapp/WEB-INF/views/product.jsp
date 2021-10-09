<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css"/>

<div class="product-container">
    <div class="ui two column vertically padded grid product-view">
        <div class="column">
            <div>
                <ul class="product-img-view"></ul>
            </div>
        </div>
        
        <div class="column">
            <div class="info-sect">
                <div class="product-brand">${product.pbrand}</div>
                <span class="product-name">${product.pname}</span>
                <div class="product-content-box">
                	<div class="round-style">
                		<p>${product.pcontent}</p>
                	</div>
                </div>
                <p class="product-price"><i class="won sign icon"></i></p>
                <div class="ui divider"></div>
            </div>

            <form>
                <div class="info-sect">
                    <ul>
                        <li>
                            <span class="title">색상</span>
                            <ul class="color">
	                            <c:forEach items="${product.color}" var="color">
	                            	<li><a href='javascript:setHtmlByColor("${color.pcolor}")'><img class="beige" src="${color.colorurl}"></a></li>
	                            </c:forEach>
                            </ul>
                        </li>

                        <li class="li-size">
                            <span class="title">사이즈</span>
                            <select class="ui dropdown product-size"></select>
                        </li>
                        
                        <li>
                            <div class="product-amount"></div>
                        </li>

                    </ul>
                    
                    <div class="ui divider"></div>
                </div>
    
                <div class="info-sect">
                    <div class="ui grid">
                        <div class="two column row total-price">
                            <div class="left floated column">
                                총 합계
                            </div>
                            <div class="right floated column center aligned">
                                <div class="totalPrice"><i class="won sign icon"></i>${product.pprice}</div>
                                <a href="javascript:cartAdd()" class="ui button">카트 담기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            
        </div>
    </div>
</div>

<div class="fullscreen">
    <div class="modal">
        <div class="close-row">
            <a href="javascript:modalOff()"><i class="close icon"></i></a>
        </div>
        <div class="modal-content">
            <p>쇼핑백에 담겼습니다.</p>
            <p>확인하시겠습니까?</p>
        </div>
        <div class="modal-btns"><a href="javascript:modalOff()" class="btn-continue">계속쇼핑하기</a><a href="/cart/content" class="btn-tocart">쇼핑백 바로가기</a></div>
    </div>
</div>
<script>
	/* model data 바인딩 */
	let imgUrl = ${imgurl};
	let nowPcolor = '${pcolor}';
	let nowPprice = ${product.pprice};
	let nowPcode = '${product.pcode}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/product.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
