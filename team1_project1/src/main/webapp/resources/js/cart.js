let s_all = $("input[name='all_check']");


// 해당 상품 선택 여부
function isChecked(item) {
	let result = $(item).find("input[name='check_box']").is(":checked");
	return result;
}



// 금액 형태로 변환
function wonChange(num) {
	return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}


// 재고량 저장 전역 변수
var amountDic = {};

// 서버에서 받은 상품 목록 표시
function printProductList() {
	$.ajax({
		url: "getCartProductInfoList"
	}).done((data) => {
		let solditem = false;
		for (product of data.infoList[0]) {
			createProduct(product);
		};
		calProductPriceAll();


		// 재고량 가져오기 
		for (stock of data.stockList[0]) {
			let keys = Object.keys(stock);
			let amount = stock[keys[0]];
			amountDic[keys[0]] = amount;
			
			if(amount =='0'){
				console.log("품절 상품 포함");
				solditem = true;
			}
			
		};


		// 옵션 변경 클릭 이벤트 등록
		$(".change-btn").each((idx, item) => {
			$(item).click(() => {
				changeOption(item);
			});
		});

		$(".delete-btn").each((idx, item) => {
			$(item).click(() => {
				let cdno = $(item).closest("tr").fattr('id').replace('num', '');
				console.log("run dbtn");

				// 삭제할지 물어보는 팝업 생성

				$(".modal-delete .btn-tocart").attr("href", "javascript:pDelete("+cdno+",'modal-delete')");
				modalOn("modal-delete");
				$(".modal-delete .btn-tocart").attr("href", "javascript:pDelete("+cdno+",'modal-delete')");
			})
		})
		updateAmoumtEvent();
		
		// 체크 박스별 상태 변경 이벤트 할당
		$("input[name='check_box']").each((idx, item) => {
			$(item).change(function() {
				console.log("change");
				if ($(item).prop("checked") === false) {
					// 상품 선택 해제된 경우
					s_all.prop("checked", false);
					// 금액
				}
				allPriceSet();
				allProductAmount();
			});
		});

		if(solditem){
			$(".info-body tr").each((idx,item)=>{
				let id = $(item).attr("id").replace("num","");
				if(amountDic[id] == '0'){
					let info = "";
					$(item).find(".sold-info").each((idx,item)=>{
						info += $(item).html();
					})
					$(".deleteProductInfo").append("<p>"+info+"</p>");
					pDelete(id, "modal-info");
				}
			});
			modalOn("modal-info");
		}

	});

}

// 상품 목록 생성
function createProduct(product) {
	let html = '<tr id="num' + product.cartdetailno + '">';
	html += '<td class="center aligned">';
	html += '<input type="checkbox" name="check_box" />';
	html += "</td>";
	html += "<td>";
	html += '<div class="ui items">';
	html += ' <div class="item">';
	html += '<div class="ui small image">';
	html += '<img src="' + product.imgurl + '" style="width: 100px; height: 150px" />';
	html += "</div>";
	html += '<div class="middle aligned content">';
	html += '<div class="description">';
	html += "<p class='sold-info'>" + product.pbrand + "</p>";
	html += "<p class='sold-info'>" + product.pname + "</p>";
	html += '<p class="grey small">';
	html += "color&nbsp:&nbsp";
	html += '<span class="p_color">' + colorFormatting(product.pcolor) + "</span>";
	html += "&nbsp/&nbspsize&nbsp:&nbsp";
	html += '<span class="p_size">' + product.psize + "</span>";
	html += '<a class="ui right floated change-btn">옵션 변경</a>';
	html += "</p></div></div></div></div></td>";
	html += '<td class="center aligned amount-icon">';
	html += '  <a href="javascript:amount(-1,' + product.cartdetailno + ')"><i class="minus square outline icon"></i></a>';
	html += '<div class="ui mini input">';
	html += '<input type="text" class="center aligned amount" value="' + product.amount + '" maxlength="3" />';
	html += "</div>";
	html += '<a href="javascript:amount(1,' + product.cartdetailno + ')"><i class="plus square outline icon"></i></a>';
	html += "</td>";
	html += '<td class="center aligned">';
	html += '<div class="init-price">' + product.pprice + "</div>";
	html += '<i class="won sign small icon"></i><span class="price">0</span>';
	html += "</td>";
	html += '<td class="center aligned">';
	html += '<button class="ui basic button delete-btn">삭제</button>';
	html += "</td>";
	html += "</tr>";

	$(".info-body").append(html);
}

// 색상 용어 변경 함수
function colorFormatting(color) {
	return color;
}

// 상품 삭제(db)
function pDelete(cdno, modalname) {
	cdno = parseInt(cdno);
	console.log("cdno "+cdno);
	console.log("삭제 실행");
	$.ajax({
		url: "cartDetailDelete",
		method: 'POST',
		data: JSON.stringify({"cdno":cdno}),
		contentType : "application/json"
	}).done((data) => {
		// 데이터 삭제 성공 여부 확인 후 처리하기!
		if (data.result == "1") {
			console.log("정상적으로 삭제");
		} else {
			console.log("삭제 실패");
		}
	});
	
	if(modalname === "modal-delete"){	
		modalOff("modal-delete");
	}
}

//모달 띄우기
function modalOn(what) {
	$("." + what).addClass("on");
}

// 모달 종료
function modalOff(what) {
	$("." + what).removeClass("on");
	if(what == "modal-delete"){
		$("input.amount").each((idx, item)=>{
			if($(item).val() == '0')
				window.location.reload();
		});
	}else if(what == "modal-info"){
		window.location.reload();
	}
	
}



// 상품 변경 반영(db)
function pUpdate(num, amount) {
	console.log("실행");
	$.ajax({
		url : "cartDetailUpdate",
		method:"patch",
		data : JSON.stringify({'cartDetailNo' : num, 'amount':amount}),
		contentType : "application/json; chartset=UTF-8"
	}).done((data)=>{
		console.log(data.result);
	})
		
}

// 상품 재고값 가져오기
function getStockAmount() {}



// 옵션 변경
function changeOption(item) {
	let this_row = $(item).closest("tr");
	let this_id = this_row.attr("id");
	let html = "<tr id='" + this_id + "_op' class='op-add'>";
	if (typeof $("#" + this_id + "_op").html() == "undefined") {
		html += '<td class="center aligned"></td>';
		html += '<td colspan="3"><div><div><span class="three wide small">COLOR</span>';

		// 해당 제품의 컬러 칩셋과 사이즈 목록을 가져오기!
		// 해당 컬러의 사이즈 품절의 경우 색 변경
		// color 칩 목록 추가
		html += '</div><div><span class="small">SIZE</span>';

		// size 목록 추가

		html += "</div></div></td>";
		html += '<td class="center aligned">';

		html += '<button id="u_btn_'+this_id+'" class="btn update">변경</button><br /><br />';
		html += '<button id="c_btn_'+this_id+'" class="btn cancel">취소</button>';
		html += "</td></tr>";

		this_row.after(html);
		// 변경 버튼 이벤트 할당
		
		
		// 취소 버튼 이벤트 할당
		$("#c_btn_"+this_id).click(function(){                    	
			$("#" + this_id + "_op").hide();
		})
		
	} else { 
		if($("#" + this_id + "_op").is(":visible")){                		
			$("#" + this_id + "_op").hide();
		}else{
			$("#" + this_id + "_op").show();                		
		}
	}
}  

// 상품 수량 변경
function amount(num, idx) {
	let input = $("#num" + idx + " input.amount");
	let total = $("#p_amount");

	let p_amount = total.html() == "" ? parseInt(0) : parseInt(total.html());

	let amount = parseInt(input.val());

	amount += num;
	// 재고값 가져오기
	let stockAmount = parseInt(amountDic[idx]);

	if (amount === 0) {
		// 제거 질문 팝업
		modalOn("modal-delete");
	} else if(stockAmount < amount){
		// 재고 초과 팝업
		modalOn("modal-soldout");
		input.val(stockAmount);
		calProductPrice($(input).closest("tr"));
		pUpdate(num,stockAmount);
	}
	else {
		input.val(amount);
		calProductPrice($(input).closest("tr"));
		pUpdate(idx,amount);
	}
	allPriceSet();
	
}

// 제품 수량 변경 이벤트 발생 시 처리
function updateAmoumtEvent() {
	$("tbody tr").each((idx, item) => {
		// 재고값 가져오기
		let item_id = $(item).attr("id").replace('num','');
		let stock = parseInt(amountDic[item_id]);
		let inputTag = $(item).find("input.amount");
		let before_val;
		inputTag
			.focus(function () {
				// 변경 전 값 가져오기
				before_val = parseInt(this.value);
			})
			.change(function () {
				let change_val = parseInt($(this).val());

				if (change_val > stock) {
					// 재고 알림 팝업
					modalOn("modal-soldout");
					// 재고값으로 다시 설정
					inputTag.val(stock);
					calProductPrice(item);
					pUpdate(item_id,stock);
				} else if (change_val == 0) {
					// 제거 질문 팝업
					modalOn("modal-delete");
				} else {
					amount(change_val, $(item).attr("id"));
					calProductPrice(item);
				}

				allPriceSet();
			});
	});
}

// 체크박스 전체 선택 또는 전체 취소 함수
function selectAll(val) {
	$("input[name='check_box']").each((idx, item) => {
		$(item).prop("checked", val);
	});
}

// 제품 가격 합 변경 ?
function totalPriceUpdate(price, val) {
	let p_total = $("#p_total");
	let totalPrice = parseInt(p_total.html().replace(/,/g, ""));

	if (val === 0) {
		p_total.html(wonChange(totalPrice - price));
	} else {
		p_total.html(wonChange(totalPrice + price));
	}
}

// 제품 수량 가져오기
function getProductAmount(item) {
	let amount = parseInt($(item).find("input.amount").val());
	return amount;
}

// 전체 수량 계산
function allProductAmount() {
	let sum = 0;
	$("tbody tr").each((idx, item) => {
		if (isChecked(item) == true) {
			sum += getProductAmount(item);
		}
	});
	$("#p_amount").html(sum);
}

// 제품 가격 계산
function calProductPrice(item) {
	let price = parseInt($(item).find("div.init-price").html());
	let amount = parseInt($(item).find("input.amount").val());
	$(item)
		.find("span.price")
		.html(wonChange(price * amount));
	return price * amount;
}

// 전체 제품 가격 계산
function calProductPriceAll() {
	$("tbody tr").each((idx, item) => {
		calProductPrice(item);
	});
}

// 전체 제품 가격 합 적용
function allPriceSet() {
	console.log("all price set run");
	let sum = 0;
	$("tbody tr").each((idx, item) => {

		if (isChecked(item) == true) {
			sum += calProductPrice(item);
		}
	});
	console.log(sum);

	$("#p_total").html(wonChange(sum));

	$("#sumprice").html(wonChange(parseInt($("#postprice").html()) + sum));
}

// 선택 상품 삭제
function pListDelete(){
	let pList =[];
	$("tbody input[name='check_box']").each((idx,item)=>{
		if($(item).prop("checked") === true){
			pList.push($(item).closest("tr").attr("id").replace("num",""));
		}
	});
	
	if(pList.length === 0){
		return;
	}
	
	$.ajax({
		url: "cartDetailListDelete",
		method : "post",
		data : JSON.stringify({"pList":pList}),
		contentType : "Application/json"
	}).done((data)=>{
		modalOff("modal-deletelist");
		window.location.reload();
	});
}

$(function() {
	initSetting();
});

// 초기 접속 시	
function initSetting() {
	printProductList();
	allProductAmount();
	allPriceSet();

	// 전체 선택 체크박스 이벤트 추가

	s_all.change(function() {
		if (s_all.prop("checked") === true) {
			selectAll(true);
		} else {
			selectAll(false);
		}
		allPriceSet();
		allProductAmount();
	});


	// 선택 삭제 버튼 이벤트 할당
	$("button.select-delete").click(function(){
		//선택 된거 없으면 실행 x
		let checked = 0;
		$(".info-body tr").each((idx,item)=>{
			if(isChecked(item)){
				checked += 1;
			}
		});
		if(checked != 0)
			modalOn("modal-deletelist");
	} );

	// 선택 상품 주문 버튼 이벤트 할당
	$("button.select-order").click(pListOrder);


	console.log(amountDic);
}