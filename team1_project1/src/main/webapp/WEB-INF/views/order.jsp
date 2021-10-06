<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css">

<div class="ui container">
	        <div class="ui one column padded grid center aligned">
	            <h1 class="column">쇼핑백</h1>
	        </div>
            <div class="ui grid">
                <div class="ten wide column">
                    <table class="ui celled table pinfo-table">
                        <thead>
                            <tr>
                                <th class="center aligned">상품정보</th>
                                <th class="center aligned">수량</th>
                                <th class="center aligned">판매가</th>
                            </tr>
                        </thead>
                        <tbody class="info-body">
                            
                        </tbody>
                    </table>

                    <div class="ui center aligned">
                        <div class="header">
                            <h3>주문자 정보</h3>
                        </div>
                        <table class="ui definition table user-table">
                            <tbody>
                                <tr>
                                    <td class="center aligned">주문자</td>
                                    <td>홍길동</td>
                                </tr>
                                <tr>
                                    <td class="center aligned">휴대폰</td>
                                    <td>010-0000-0000</td>
                                </tr>
                                <tr>
                                    <td class="center aligned">E-mail</td>
                                    <td>user @ google.com</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <h3>배송지 정보<span class="explain"><span class="star">*</span> 표시는 필수항목입니다.</span></h3>
                    <form class="ui form">
                        <table class="ui definition table">
                            <tbody>
                                <tr>
                                    <td class="center aligned"><span class="star">*</span>배송지 주소</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="three wide field">
                                                <input type="text" class="addr1 " placeholder="우편번호" required name="addr1"/>
                                            </div>
                                            <a class="ui button" href="javascript:execDaumPostcode()">우편번호 검색</a>
                                        </div>
                                        <div class="field">
                                            <input type="text" class="addr2" placeholder="주소" required name="addr2"/>
                                        </div>
                                        <div class="field">
                                            <input type="text" class="addr3" placeholder="상세주소" required name="addr3"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned"><span class="star">*</span>수령인</td>
                                    <td>
                                        <div class="four wide field">
                                            <input type="text" required name="pordername" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned"><span class="star">*</span>휴대폰 번호</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="three wide field">
                                                <select class="ui search dropdown" name="p-start" required >
                                                    <option value="010">010</option>
                                                    <option value="011">011</option>
                                                    <option value="016">016</option>
                                                </select>
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" minlength="3" maxlength="4"  name="phone2" pattern="[0-9]+"/>
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" minlength="3" maxlength="4" name="phone3" pattern="[0-9]+"/>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned">연락처</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="three wide field">
                                                <select class="ui search dropdown" name="t-start">
                                                    <option value="">선택</option>
                                                    <option value="02">02</option>
                                                    <option value="031">031</option>
                                                </select>
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" name="tel2" pattern="[0-9]+"/>
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" name="tel3" pattern="[0-9]+"/>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned">배송 요청 사항</td>
                                    <td>
                                        <div class="ten wide field">
                                            <input type="text" name="porderrequest"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned">수령인 E-mail</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="five wide field">
                                                <input type="text" name="porderemail"/>
                                            </div>
                                            <div class="field">
                                                <span>@</span>
                                            </div>
                                            <div class="five wide field">
                                                <input type="text" id="s_email"/>
                                            </div>
                                            <div class="five wide field">
                                                <select class="ui search dropdown" name="select-email">
                                                    <option value="">직접 입력</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="google.com">google.com</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
						<h3>마일리지 적용<span class="explain"><span class="star">*</span>100M 단위로 사용 가능합니다.</span></h3>
						<div class="m-wrap">
							<input class="ui input" type="text" placeholder="총 500M" name="porderdiscount" pattern="[0-9]+">
							<button class="ui button m-apply">적용</button>
						</div>
   
                        
                        <h3>결제 수단 선택</h3>
                        <table class="ui definition table">
                            <tbody>
                                <tr>
                                    <td>결제수단</td>
                                    <td>
                                        <div>
                                                <input type="radio" value="card" name="payment" id="card" class="ml-10" checked/>
                                                <label for="card">신용카드</label>
                                                <input type="radio" value="cash" name="payment" id="cash" class="ml-10" />
                                                <label for="cash">무통장 입금</label>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="payment-info">
                            <div class="inline fields">
                                <div class="three wide field">
                                    <select class="ui selection dropdown" required name="porderpayname">
                                        <option value="">카드사</option>
                                        <option value="">현대</option>
                                        <option value="">비씨</option>
                                        <option value="">국민</option>
                                    </select>
                                </div>
                                <div class="ten wide field">
                                    <div class="ui input"><input type="text" minlength="16" placeholder="카드번호" required name="porderpayno"/></div>
                                </div>
                            </div>
                        </div>
                        

                    </form>
                </div>

                <div class="five wide column">
                    <div class="six wide column center aligned">
                        <div class="price-table">
                            <div class="pt-top">
                                <h4 class="text-center">최종 결제 금액</h4>
                                <div class="ui divider"></div>
                                <div class="ui grid color-555-small">
                                    <div class="row">
                                        <div class="six wide column left aligned">상품 합계</div>
                                        <div class="ten wide column right aligned"><i class="won sign icon small"></i><span class="p-price"></span></div>
                                    </div>
                                    <div class="row">
                                        <div class="six wide column left aligned">배송비</div>
                                        <div class="ten wide column right aligned"><i class="won sign icon small"></i><span class="post-price">0</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="t-p">
                                <div class="ui grid">
                                    <div class="four wide column left aligned">
                                        <h3 class="color-555">합계</h3>
                                    </div>
                                    <div class="twelve wide column right aligned">
                                        <h3 class="t-p-color">
                                            <i class="won sign icon small"></i>
                                            <span class="total-price"></span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-box">
                            <h5 class="color-555">구매 시 지급 예정 포인트</h5>
                            <div class="save-m">
                                <span>마일리지</span>
                                <div class="save-m-point">0</div>
                                <span>M</span>
                            </div>
                        </div>
                        <div class="pay-btn">
                            <a>결제하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            $(function () {
            	// 쇼핑백에서 가져온 상품 목록
            	var productList = "";
                <c:forEach items="${pList}" var="item">
               		productList +=(${item})+",";
            	</c:forEach>
            	
            	productList = productList.slice(0,-1);
   
            	$.ajax({
            		url : "getOrderList",
            		data : {"productList":productList}
            	}).done((data)=>{
            		for(item of data.infoList[0]){
            			createProduct(item);
            		}
            	   	setSumPrice();
            	   	setTotalPrice();
            		
            	});
            	
            	
            	
                $("input:radio[name='payment']").click(function () {
                    let payment = $("input:checked[name='payment']").val();
                    let info = $("div.payment-info");
                    info.html("");
                    let str = "";

                    if (payment === "card") {
                        str += '<div class="inline fields">';
                        str += '<div class="three wide field">';
                        str += '<select class="ui selection dropdown" required name="porderpayname">';
                        str += '<option value="">카드사</option>';
                        str += '<option value="">현대</option>';
                        str += ' <option value="">비씨</option>';
                        str += '<option value="">국민</option>';
                        str += "</select>";
                        str += "</div>";

                        str += '<div class="ten wide field">';
                        str += '<input type="text" placeholder="카드번호" minlength="16" required name="porderpayno">';
                        str += "</div>";
                        str += "</div>";
                    } else if (payment === "cash") {
                        str += '<div class="inline fields">';
                        str += '<div class="three wide field">';
                        str += '<select class="ui selection dropdown bank-seletion" required name="porderpayname">';
                        str += '<option value="">은행사</option>';
                        str += '<option value="">현대</option>';
                        str += '<option value="">비씨</option>';
                        str += '<option value="">국민</option>';
                        str += "</select>";
                        str += "</div>";
                        str += '<div class="ten wide field">';
                        str += '<input type="text" placeholder="123412341234" readonly>';
                        str += "</div>";
                        str += "</div>";
                    }

                    info.html(str);
                });
                
                // 이메일 입력 설정
                let s_email = $("select[name='select-email']");
        	   	s_email.change(function () {
                   if(s_email.val() !== ""){
                       $("#s_email").val(s_email.val()).prop('readonly',true);
                   }else{
                    $("#s_email").val(s_email.val()).prop('readonly',false);
                   }
        	   });
        	   	
        	   	
        	   	// 결제하기 버튼 이벤트 할당
               	$(".pay-btn").click(order);
        	   	
        	   	// 마일리지 적용 버튼 이벤트 할당
               	$(".m-apply").click(function(){
               		event.preventDefault();
               		let mpoint = $("input[name='porderdiscount']").val();
               		if(mpoint !== ""){
               			console.log("run");
               			let realm = Math.floor(parseInt(mpoint)/100) * 100;
               			$("input[name='porderdiscount']").val(realm);
               			let html = '<div class="row">';
               			html += '<div class="six wide column left aligned">마일리지</div>';
               			html += '<div class="ten wide column right aligned"><i class="minus icon small"></i>&nbsp<i class="won sign icon small"></i><span class="m-discount">'+realm+'</span></div></div>';
               			
						$(".color-555-small").append(html);    
               		}
               	});
   
            });
            
			
            function order(){
            	
            	$("form").attr("method","post");
            	$("form").attr("action","newOrder");
            	
            	if(document.getElementsByTagName("form")[0].reportValidity()){            		
            		$("form").submit();
            	}
            }
            
            
            
            
            
            // 우편번호 검색 api , https://postcode.map.daum.net/guide 사용
            function execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function (data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ""; // 주소 변수
                        var extraAddr = ""; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === "R") {
                            // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else {
                            // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        // if(data.userSelectedType === 'R'){
                        //     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        //     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        //     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        //         extraAddr += data.bname;
                        //     }
                        //     // 건물명이 있고, 공동주택일 경우 추가한다.
                        //     if(data.buildingName !== '' && data.apartment === 'Y'){
                        //         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        //     }
                        //     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        //     if(extraAddr !== ''){
                        //         extraAddr = ' (' + extraAddr + ')';
                        //     }
                        //     // 조합된 참고항목을 해당 필드에 넣는다.
                        //     document.getElementById("sample6_extraAddress").value = extraAddr;

                        // } else {
                        //     document.getElementById("sample6_extraAddress").value = '';
                        // }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        $(".addr1").val(data.zonecode);
                        $(".addr2").val(addr);
                        // 커서를 상세주소 필드로 이동한다.
                        $(".addr3").focus();
                    },
                }).open();
            }
           	
            function wonChange(num) {
            	return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            }
            
            // 가져온 상품 html로 변환
            function createProduct(product){
                let html = "";
                html += '<tr id='+product.cartdetailno+'>';
                html += '<td>';
                html += '<div class="ui items">';
                html += '<div class="item">';
                html += '<div class="ui small image">';
                html += '<img src="'+ product.imgurl +'" style="width: 80px; height: 120px" />';
                html += '</div>';
                html += '<div class="middle aligned content">';
                html += '<div class="description">';
                html += '<p>'+ product.pbrand +'</p>';
                html += '<p>'+ product.pname+'</p>';
                html += '<p class="grey small">';
                html += 'color&nbsp:&nbsp';
                html += '<span class="p_color">'+product.pcolor+'</span>';
                html += '&nbsp/&nbspsize&nbsp:&nbsp';
                html += '<span class="p_size">'+ product.psize +'</span>';
                html += '</p>';
                html += '</div>';
                html += '</div>';
                html += '</div>';
                html += '</div>';
                html += '</td>';
                html += '<td class="center aligned">';
                html += '<div>';
                html += '<div class="ui input input-wrap">';
                html += '<input type="text" class="center aligned amount" readonly value="'+product.amount+'" />';
                html += '</div>';
                html += '</div>';
                html += '</td>';
                html += '<td class="center aligned"><i class="won sign icon small"></i><span class="price">'+wonChange(parseInt(product.amount)*parseInt(product.pprice))+'</span></td>';
                html += '</tr>';
                $("tbody.info-body").append(html);
            }
            
            function setSumPrice(){
            	let sum = 0;
            	$("span.price").each((idx,item)=>{
            		sum += parseInt($(item).html().replace(",",""));
            	});
            	$(".p-price").html(wonChange(sum));
            }
            
            function setTotalPrice(){
            	let pPrice = parseInt($(".p-price").html().replace(",",""));
            	let postPrice = parseInt($(".post-price").html().replace(",",""));
            	$(".total-price").html(wonChange(pPrice+postPrice));
            }
        </script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
