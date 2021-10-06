<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">

           <div class="ui container">
            <div class="ui one column padded grid center aligned">
                <h1 class="column">쇼핑백</h1>
            </div>
            <table class="ui padded celled table">
                <thead>
                    <tr>
                        <th class="center aligned">
                            <input type="checkbox" name="all_check" />
                        </th>
                        <th class="center aligned">상품정보</th>
                        <th class="center aligned">수량</th>
                        <th class="center aligned">판매가</th>
                        <th class="center aligned">선택</th>
                    </tr>
                </thead>
                <tbody class="info-body">
                    
                </tbody>
            </table>
            <div class="ui divider"></div>
            <div>
                <div class="ui center aligned three column grid">
                    <div class="row">
                        <div class="column"></div>
                        <div class="column">
                            <div class="ui vertical">총 <span class="yellow" id="p_amount">0</span>개 상품</div>
                        </div>
                        <div class="column right aligned">
                            <div class="ui vertical">
                                <div class="item">
                                    <span class="item-key">상품합계</span>
                                    <div class="span-wrap"><i class="won sign icon small"></i><span class="item-value" id="p_total">0</span></div>
                                </div>
                                <div class="item">
                                    <span class="item-key">배송비</span>
                                    <div class="span-wrap"><i class="won sign icon small"></i><span class="item-value" id="postprice">0</span></div>
                                </div>
                                <div class="item">
                                    <span class="item-key">합계</span>
                                    <div class="span-wrap"><i class="won sign icon small"></i><span class="item-value" id="sumprice">0</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui divider"></div>
            <div class="ui five column center aligned padded grid">
                <div class="column">
                    <button class="ui button select-delete">선택 상품 삭제</button>
                </div>

                <div class="column">
                    <button class="ui secondary button select-order" > 선택 상품 주문 </button>
                </div>
            </div>
        </div>
        
        <div class="modal-soldout modal-wrap">
		    <div class="modal">
		        <div class="close-row">
		            <a href="javascript:modalOff('modal-soldout')"><i class="close icon"></i></a>
		        </div>
		        <div class="modal-content">
		            <p>재고가 부족합니다.</p>
		        </div>
		        <div class="modal-btns"><a href="javascript:modalOff('modal-soldout')" class="btn-continue">확인</a></div>
		    </div>
		</div>
        <div class="modal-delete modal-wrap">
		    <div class="modal">
		        <div class="close-row">
		            <a href="javascript:modalOff('modal-delete')"><i class="close icon"></i></a>
		        </div>
		        <div class="modal-content">
		            <p>해당 상품을 쇼핑백에서 삭제하시겠습니까?</p>
		        </div>
		        <div class="modal-btns"><a href="#" class="btn-tocart">삭제</a><a class="btn-continue" href="javascript:modalOff('modal-delete')">취소</a></div>
		    </div>
		</div>
        <div class="modal-deletelist modal-wrap">
		    <div class="modal">
		        <div class="close-row">
		            <a href="javascript:modalOff('modal-delete')"><i class="close icon"></i></a>
		        </div>
		        <div class="modal-content">
		            <p>선택한 상품들을 쇼핑백에서 삭제하시겠습니까?</p>
		        </div>
		        <div class="modal-btns"><a href="javascript:pListDelete()" class=" btn-tocart">삭제</a><a class="btn-continue" href="javascript:modalOff('modal-deletelist')">취소</a></div>
		    </div>
		</div>
		
		
        <script>

    	 	// 선택 상품 주문
	        function pListOrder(){
	        	let pList = [];
	        	$("tbody input[name='check_box']").each((idx,item)=>{
	        		if($(item).prop("checked") === true){
	        			pList.push($(item).closest("tr").attr("id").replace("num",""));
	        		}
	        	});
	        	
	        	if(pList.length === 0){
	        		return;
	        	}
	        
	        	
	        	let form = $("<form></form>");
	        	let input = $("<input></input>");
	        	input.attr("type","hidden");
	        	input.attr("name","pList");
	        	input.attr("value", pList);
	        	form.append(input);
	        	form.attr("method","post");
	        	form.attr("action","order");
	        	$("body").append(form);
				form.submit();
	        }
	            
        </script>
        <script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
