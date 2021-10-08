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
	let imgUrl = ${imgurl};
	let amountDict = {};
	
	$(function () {
		setProductImgHtml('${pcolor}');
		setHtmlByColor('${pcolor}');
	    $(".product-price").append(wonChange(${product.pprice}));
	    setAmountHtml();
	    $("input.amount").on('input', function(event) {
	    	amountCheck($("input.amount").val());
	    });
	});
	
	/* 제품 수량 조회 및 HTML 변경 */
	function setHtmlByColor(pcolor){
		console.log(pcolor);
		$.ajax({
			url: "getSizeAmount" + "?pcode=${product.pcode}" + '&pcolor=' + pcolor,
		}).done((data) => {
			console.log(data.productAmountList);
			setProductImgHtml(pcolor)
			console.log(data.productAmountList.amount);
			setProductSizeHtml(data.productAmountList.amount);
			setAmountDict(data.productAmountList.amount);
		});
	}
	
	/* 제품 사진 HTML 변경 */
	function setProductImgHtml(pcolor){
		let imgView = $(".product-img-view");
		imgView.html('');
		let html = '';
		
		for(colorUrl of imgUrl[pcolor]){
			html += '<li><a><img class="product-img" src="' + colorUrl + '"></a></li>';
		}
		imgView.html(html);
	}
	
	/* 사이즈 옵션 HTML 추가 */
	function setProductSizeHtml(amountList){
		sizeSort(amountList);
		let sizeView = $(".product-size");
		let html = '';
		sizeView.html('');
		html += '<option value="">Size</option>';
		for(amount of amountList){
			html += '<option value="' + amount.psize + '">' + amount.psize + '</option>';
		}
		sizeView.html(html);
	}
	
	/* 수량  */
	function setAmountHtml(){
		let amountView = $(".product-amount");
		amountView.html('');
		let html = '';
		html += '<div class="amount-icon">';
		html += '<a href="javascript:amountBtnClick(-1)"><i class="minus square outline icon"></i></a>';
		html += '<div class="ui mini input">';
		html += '<input type="text" class="center aligned amount" value="1" maxlength="3" />';
		html += "</div>";
		html += '<a href="javascript:amountBtnClick(1)"><i class="plus square outline icon"></i></a>';
		html += "</div>";
		amountView.html(html);
	}
	
	/* 수량 변경 및 재고 확인 */
	function amountCheck(nowAmount){
		let selectedSize = $(".product-size option:selected").val();
		let amountInput = $("input.amount");
		if(!selectedSize){
			console.log('사이즈 선택 필요');
			amountInput.val(1);
		} else if(isNaN(nowAmount)){
			amountInput.val(1);
		} else{
			let maxAmount = amountDict[selectedSize];
			if(nowAmount > maxAmount){
				console.log('주문 수량 초과');
				amountInput.val(maxAmount);
			} else if(nowAmount < 1){
				console.log('주문 수량 미만');
				amountInput.val(1);
			}
		}
	}
	
	/* 수량 변경 버튼 클릭 */
	function amountBtnClick(num){
		let amountInput = $("input.amount");
		let sumAmount = Number(amountInput.val()) + num;
		amountInput.val(sumAmount);
		amountCheck(sumAmount);
	}
	
	/* 선택한 컬러의 사이즈별 재고 저장 */
	function setAmountDict(amountList){
		$("input.amount").val(1);
		amountList.forEach(function (amount){
			amountDict[amount.psize] = amount.pamount;
		});
	}
	
	
	/* 사이즈 정렬 */
	function sizeSort(arr){
		var sizeDict = {
			'XSS' : -1,
			'XXS' : 0,
			'XS' : 1,
			'S' : 2,
			'MS' : 3,
			'M' : 4,
			'ML' : 5,
			'L' : 6,
			'XL' : 7,
			'XXL' : 8,
			'XXXL' : 9,
			'FR' : 100
		}
		arr.sort(function(a, b) {
			let tempA = a.psize;
			let tempB = b.psize;
			if (isNaN(tempA)){
				tempA = sizeDict[tempA];
			}
			if (isNaN(tempB)){
				tempB = sizeDict[tempB];
			}
			if (tempA > tempB){
				return 1;
			} else if (tempA < tempB){
				return -1;
			} else {
				return 0;
			}
		});
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
