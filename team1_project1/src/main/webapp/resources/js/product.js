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

/* 수량에 따른 상품 금액 HTML 변경 */
function setTotalPrice(){
	let totalPriceArea = $(".totalPrice");
	let html = '';
	html += '<i class="won sign icon"></i>';
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