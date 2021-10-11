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
                <p class="product-name">${product.pname}</p>
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
	                            	<li><a id="${color.pcolor}" class="color-item" href='javascript:setHtmlByColor("${color.pcolor}")'><img class="beige" src="${color.colorurl}"></a></li>
	                            </c:forEach>
	                            <li class="color-text">${color.pcolor}</li>
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
                                <div class="totalPrice"></div>
                                <a href="javascript:addCart()" class="ui button" name="addCartBtn">카트 담기</a>
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
        </div>
        <div class="modal-btns"></div>
    </div>
</div>
<script>
	/* model data 바인딩 */
	let imgUrl = ${imgurl};
	let nowPcolor = '${pcolor}';
	let nowPprice = ${product.pprice};
	let nowPcode = '${product.pcode}';
	let contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/product.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
