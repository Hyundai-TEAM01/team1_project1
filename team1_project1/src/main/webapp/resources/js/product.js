let amountDict = {};
	
$(function () {
	setProductImgHtml(nowPcolor);
	setHtmlByColor(nowPcolor);
    $(".product-price").append(wonChange(nowPprice));
    setAmountHtml();
    $("input.amount").on('input', function(event) {
    	amountCheck($("input.amount").val());
    });
});

/* 제품 수량 조회 및 HTML 변경 */
function setHtmlByColor(pcolor){
	console.log(pcolor);
	$.ajax({
		url: 'getSizeAmount' + '?pcode=' + nowPcode + '&pcolor=' + pcolor,
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
		setModalOn('noSize');
		amountInput.val(1);
	} else if(isNaN(nowAmount)){
		amountInput.val(1);
	} else{
		let maxAmount = amountDict[selectedSize];
		if(nowAmount > maxAmount){
			setModalOn('overAmount')
			amountInput.val(maxAmount);
		} else if(nowAmount < 1){
			console.log('주문 수량 미만');
			amountInput.val(1);
		}
	}
	setTotalPrice();
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

/* 수량에 따른 상품 금액 HTML 변경 */
function setTotalPrice(){
	let totalPriceArea = $(".totalPrice");
	let html = '';
	html += '<i class="won sign icon"></i>';
	html += wonChange((nowPprice * $("input.amount").val()));
	totalPriceArea.html('');
	totalPriceArea.html(html);
}

/* 모달의 msg에 따른 HTML 변경 및 출력*/
function setModalOn(msg){
	let selectedSize = $(".product-size option:selected").val();
	let modalContentArea = $(".modal-content");
	let modalBtnArea = $(".modal-btns");
	let contentHtml = '';
	let btnHtml = '';
	// noSize, overAmount, addCart, 
	switch (msg){
		case 'noSize':
			contentHtml = '<p>사이즈를 선택해 주세요.</p>';
			btnHtml = '<a href="javascript:modalOff()" class="btn-continue">확인</a>';
			break;
		case 'overAmount':
			contentHtml = '<p>구매 가능한 재고 '+ amountDict[selectedSize] + '개만 선택하실 수 있습니다.</p>';
			btnHtml = '<a href="javascript:modalOff()" class="btn-continue">확인</a>';
			break;
		case 'addCart':
			contentHtml = '<p>쇼핑백에 담겼습니다.</p><p>확인하시겠습니까?</p>' 
			btnHtml = '<a href="javascript:modalOff()" class="btn-continue">계속쇼핑하기</a><a href="/cart/content" class="btn-tocart">쇼핑백 바로가기</a>'
			break;
	}
	modalContentArea.html('');
	modalBtnArea.html('');
	modalContentArea.html(contentHtml);
	modalBtnArea.html(btnHtml);
	modalOn();
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
	setModalOn('addCart');
}
function wonChange(num) {
    return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}