$(function () {
	// 처음 로딩 시 주문목록 렌더링
    printOrderList(1);
	
	// 시간 제거
	function printDate(inputDate) {
		return inputDate.split(" ")[0];
	}
	
	// 금액 형태로 변환
    function wonChange(num) {
        return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    }
    
    // 주문목록 렌더링
    function printOrderList(pageNo) {
		$.ajax({
		url: 'getorderlist',
		data: {"pageNo" : pageNo} // 페이지 번호 넘김
		})
		.done((data) => {
			if(data && data.result) { // 데이터 잘 불러왔는가
				console.log(data.result);
				if(data.result !== 'fail') {
					let itemStr = "";
					
					// 1 : M 관계 -- 3개의 주문 각 주문 마다 여러 개의 아이템
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
						item.orderItems.forEach((orderItem) => {
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
				} else { // 주문목록 불러오기 실패 시
					let itemStr = '<tr></tr>';
					itemStr += '<td class="no-data" colspan="6">주문내역이 없습니다.</td>';
					$('#otable').html(itemStr);
				}

				// 페이징 버튼 생성
				if(data.pagination.totalPageNo > 0){
		            setHtml(data.pagination); // 페이징 버튼 렌더링
		            setAction(data.pagination); // 페이징 버튼 기능 추가
		        }else{
		        	$(".paging").html(''); // 페이징 버튼 없애기
		        }
				
			}
			else {
				let itemStr = '<tr></tr>';
				itemStr += '<td class="no-data" colspan="6">주문내역이 없습니다.</td>';
				$('#otable').html(itemStr);
			}
			
		}); // done
		
	}
	
	// pager 생성
	function setHtml(pagination){
		$(".paging").html('');
		
		let pagingHtml = '';
		let firstPageBtn = '<a href="javascript:void(0);" class="prev2"><i class="angle double left icon"></i></a>';
		let prevPageBtn = '<a href="javascript:void(0);" class="prev"><i class="angle left icon"></i></a>';
		let pageBtn = '<span class="paging-num">';
		for(let i = pagination.startPageNo; i <= pagination.endPageNo; i++){
			let pageNum = i;
			let activeClass = '';
			if(pageNum == pagination.pageNo) activeClass = ' on ';
			pageBtn += '<a href="javascript:void(0);" class="pageBtn' + activeClass + '" pageNum="' + pageNum + '">' + pageNum + '</a>';
		}
		
		pageBtn += '</span>';
		
		let nextPageBtn = '<a href="javascript:void(0);" class="next"><i class="angle right icon"></i></a>';
        let endPageBtn = '<a href="javascript:void(0);" class="next2"><i class="angle double right icon"></i></a>';
        
        pagingHtml = firstPageBtn + prevPageBtn + pageBtn + nextPageBtn + endPageBtn;
        
        $(".paging").html(pagingHtml);
	}
	
	// 페이지 버튼에 기능 추가
	function setAction(pagination){
		let thisArea = $(".paging");
	    
        thisArea.find(".prev2").click(function(){
            goPage(1);
        });

        thisArea.find(".prev").click(function(){
            let pageNum = pagination.startPageNo - 1;
            if(pageNum < 1) pageNum = 1;
            goPage(pageNum);
        });

        thisArea.find(".pageBtn").click(function(){
            goPage($(this).attr("pageNum"));
        });

        thisArea.find(".next").click(function(){
            let pageNum = pagination.endPageNo + 1;
            if(pageNum > pagination.totalPageNo) pageNum = pagination.endPageNo;
            goPage(pageNum);
        });

        thisArea.find(".next2").click(function(){
            goPage(pagination.totalPageNo);
        });
	}
	
	// 페이지 버튼 클릭 시 pageNo 넘김
	function goPage(pageNo){
		$("#otable").html(''); // tbody 주문목록 초기화
		printOrderList(pageNo);
    };
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