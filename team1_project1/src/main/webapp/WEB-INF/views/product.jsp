<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css"/>

<div class="product-container">
    <div class="ui two column vertically padded grid product-view">
        <div class="column">
            <div>
                <ul class="product-img-view">
                	<c:forEach items="${product.color}" var="color">
                       	<c:if test="${color.pcolor == pcolor}">
                       		<li><a><img class="product-img" src="${color.imgurl1}"></a></li>
                       		<li><a><img class="product-img" src="${color.imgurl2}"></a></li>
                       		<li><a><img class="product-img" src="${color.imgurl3}"></a></li>
                       	</c:if>
					</c:forEach>
                </ul>
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
                            <select class="ui dropdown">
                            	<option value="">Size</option>
                                <option value="95">95</option>
                                <option value="100">100</option>
                                <option value="105">105</option>
                                <option value="110">110</option>
                            </select>
                        </li>
                        
                        <li>
                            <div>
                                <i class="minus square outline icon"><a></a></i>
                                <div class="ui mini input">
                                    <input type="text" class="center aligned amount">
                                </div>
                                <i class="plus square outline icon"></i>
                            </div>
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
                                <div><i class="won sign icon"></i>168,000</div>
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
	$(function () {
	    console.log("product page 실행");
	    console.log("${product}");
	    $(".product-price").append(wonChange(${product.pprice}));
	    $(".product-img-view").html = '';
	});
	
	function setHtmlByColor(pcolor){
		/* if(window.location.search != ''){
			let urlParams = new URLSearchParams(window.location.search);
			pageNo = urlParams.get('pageNo');
			ccode = urlParams.get('ccode');
			console.log("urlParam : " + pageNo + " " +ccode);	
		} */
		console.log(pcolor);
		$.ajax({
			url: "getSizeAmount" + "?pcode=${product.pcode}" + '&pcolor=' + pcolor,
		}).done((data) => {
			console.log(data);
			setProductImgHtml(pcolor)
		});
	}
	
	function setProductImgHtml(pcolor){
		console.log("setProductImgHtml 실행");
		let html = '<c:forEach items="${product.color}" var="color">';
       	html += '<c:if test="${color.pcolor == ' + pcolor + '}">';
       	html += '<li><a><img class="product-img" src="${color.imgurl1}"></a></li>';
       	html += '<li><a><img class="product-img" src="${color.imgurl2}"></a></li>';
       	html += '<li><a><img class="product-img" src="${color.imgurl3}"></a></li>';
       	html += '</c:if>';
		html += '</c:forEach>';
		console.log(html);
		
		$(".product-img-view").html(html);
	}
	
	function cartAdd() {
		/* $.ajax({
			url: '/cartadd',
			method: 'POST'
		})
		.done((data) => {
			if(data.msg)
				modalOn();
			else {
				location.href = '/login';
			}
		}); */
		modalOn();
	}
	function wonChange(num) {
        return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    }
</script>
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
