$(function () {
    $.ajax({
		url: 'getorderlist'
	})
	.done((data) => {
		if(data && data.result) { // 데이터 잘 불러왔는가
			console.log(data.result);
			if(data.result !== 'fail') {
				let itemStr = "";
							
				data.result.forEach((item) => {
					let porderno = item.porderno;
					let porderdate = item.porderdate;
					let itemCnt = item.orderItems.length;
					itemStr += "<tr>"
					
					itemStr += "<td rowspan=" + itemCnt + '" class="order-num">';
					itemStr += '<p class="o-num">' + porderno + '</p>';
					itemStr += '<span class="sum-date">(' + printDate(porderdate) + ')</span>';
					itemStr += '<a href="orderdetail?code=' + porderno + '" class="btn-view">상세보기</a>';
					itemStr += '</td>';
					item.orderItems.forEach((orderItem, idx) => {
						let imgurl1 = orderItem.imgurl1;
						let pbrand = orderItem.pbrand;
						let pname = orderItem.pname;
						let pcolor = orderItem.pcolor;
						let psize = orderItem.psize;
						let pprice = orderItem.podprice;
						let porderamount = orderItem.podamount;
						let podstatus = orderItem.podstatus;
	
						itemStr += '<td>'
						itemStr += '<div class="pt-list">';
						itemStr += '<a href="#"><img src="' + imgurl1 + '" alt="상품이미지"/></a>';
						itemStr += '<div class="pt-info">';
						itemStr += '<a href="#"><span class="info-brand">[' + pbrand +']</span><span class="info-ptname">' + pname+ '</span></a>';
						itemStr += '<p class="pt-color">color : ' + pcolor + '<span class="and-line">/</span>size : ' +  psize + '</p></div></div></td>';
						itemStr += '<td>'+ porderamount +'</td>';
						itemStr += '<td><i class="won sign icon small"></i>' + wonChange(pprice) + '</td>';
						itemStr += '<td>'+ podstatus + '<span class="sum-date">(' + printDate(porderdate) + ')</span></td>';
			            itemStr += '<td></td>';
			            itemStr += '</tr>';
						});
				});	
				$('#otable').html(itemStr);
			} else {
				let itemStr = '<tr></tr>';
				itemStr += '<td class="no-data" colspan="6">주문내역이 없습니다.</td>';
				$('#otable').html(itemStr);
			}
			
		}
		else {
			let itemStr = '<tr></tr>';
			itemStr += '<td class="no-data" colspan="6">주문내역이 없습니다.</td>';
			$('#otable').html(itemStr);
		}
		
	}); // done
	
	// 시간 제거
	function printDate(inputDate) {
		return inputDate.split(" ")[0];
	}
	
	// 금액 형태로 변환
    function wonChange(num) {
        return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    }
});
/*
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
	                                    <p class="pt-color">
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
*/