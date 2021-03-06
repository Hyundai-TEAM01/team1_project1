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
                                    <td>${mname}</td>
                                </tr>
                                <tr>
                                    <td class="center aligned">휴대폰</td>
                                    <td class="mphone">${mphone}</td>
                                </tr>
                                <tr>
                                    <td class="center aligned">E-mail</td>
                                    <td>${memail}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <h3>배송지 정보<span class="explain"><span class="star">*</span> 표시는 필수항목입니다.</span></h3>
                    <form class="ui form" id="infoForm">
                        <table class="ui definition table">
                            <tbody>
                                <tr>
                                    <td class="center aligned"><span class="star">*</span>배송지 주소</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="three wide field">
                                                <input type="text" class="addr1 " placeholder="우편번호" required name="porderaddr1" autocomplete='off'/>
                                            </div>
                                            <a class="ui button" href="javascript:execDaumPostcode()">우편번호 검색</a>
                                        </div>
                                        <div class="field">
                                            <input type="text" class="addr2" placeholder="주소" required name="porderaddr2" autocomplete='off'/>
                                        </div>
                                        <div class="field">
                                            <input type="text" class="addr3" placeholder="상세주소" required name="porderaddr3" autocomplete='off'/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned"><span class="star">*</span>수령인</td>
                                    <td>
                                        <div class="four wide field">
                                            <input type="text" required name="pordername" autocomplete='off'/>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="phone-wrap">
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
                                                <input type="text" minlength="3" maxlength="4"  name="phone2" pattern="[0-9]+" required autocomplete='off'/>
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" minlength="4" maxlength="4" name="phone3" pattern="[0-9]+" required autocomplete='off'/>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="tel-wrap">
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
                                                <input type="text" name="tel2" minlength="3" maxlength="4" pattern="[0-9]+" autocomplete='off'/>
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" name="tel3" minlength="4" maxlength="4" pattern="[0-9]+" autocomplete='off'/>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned">배송 요청 사항</td>
                                    <td>
                                        <div class="ten wide field">
                                            <input type="text" name="porderrequest" maxlength="49" autocomplete='off'/>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="email-wrap">
                                    <td class="center aligned">수령인 E-mail</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="five wide field">
                                                <input type="text" name="porderemail" autocomplete='off'/>
                                            </div>
                                            <div class="field">
                                                <span>@</span>
                                            </div>
                                            <div class="five wide field">
                                                <input type="text" id="s_email" name="s_email"/>
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
							<input class="ui input" type="text" placeholder="${mpoint}" name="porderdiscount" pattern="[0-9]+" autocomplete='off'>
							<button class="ui button m-apply">적용</button>
						</div>
   
                        
                        <h3>결제 수단 선택</h3>
                        <table class="ui definition table">
                            <tbody>
                                <tr>
                                    <td>결제수단</td>
                                    <td>
                                        <div>
                                                <input type="radio" value="0" name="porderpayment" id="card" class="ml-10" checked/>
                                                <label for="card">신용카드</label>
                                                <input type="radio" value="1" name="porderpayment" id="cash" class="ml-10" />
                                                <label for="cash">무통장 입금</label>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="payment-info">
                            <div class="inline fields">
                                  <select required name="porderpayname" class="small-input">
                                      <option value="">카드사</option>
                                      <option value="현대">현대</option>
                                      <option value="비씨">비씨</option>
                                      <option value="국민">국민</option>
                                  </select>
                      
                                  <input class="ui input" type="text" minlength="16" maxlength="16" placeholder="카드번호" required name="porderpayno" pattern="[0-9]+" autocomplete='off'/>
                              	
                              	<select required name="porderpayinstallment" class="small-input">
                                      <option value="일시불">일시불</option>
                                      <option value="3개월">3개월</option>
                                      <option value="6개월">6개월</option>
                                      <option value="12개월">12개월</option>
                                  </select>
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
        const myMpoint = ${mpoint};
        const inputs = $("input");
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
            
            
            
            $("input:radio[name='porderpayment']").click(function () {
                let payment = $("input:checked[name='porderpayment']").attr("id");
                let info = $("div.payment-info");
                info.html("");
                let str = "";

                if (payment === "card") {
                    str += '<div class="inline fields">';
                    str += '<select required name="porderpayname" class="small-input">';
                    str +=  '<option value="">카드사</option>';
                    str +=  '<option value="현대">현대</option>';
                    str += '<option value="비씨">비씨</option>';
                    str += '<option value="국민">국민</option>';
                    str += '</select>';
                    
                    str += '<input class="ui input" type="text" minlength="16" maxlength="16" placeholder="카드번호" required name="porderpayno" pattern="[0-9]+" autocomplete="off"/>';
                    
                    str += '<select required name="porderpayinstallment" class="small-input">';
                    str += '<option value="일시불">일시불</option>';
                    str += '<option value="3개월">3개월</option>';
                    str += '<option value="6개월">6개월</option>';
                    str += '<option value="12개월">12개월</option>';
                    str += '</select>';
                    str += '</div>';                    
                } else if (payment === "cash") {
                    str += '<div class="inline fields">';
                    str += '<div class="three wide field">';
                    str += '<select class="ui selection dropdown bank-seletion" required name="porderpayname">';
                    str += '<option value="">은행사</option>';
                    str += '<option value="국민">국민</option>';
                    str += '<option value="농협">농협</option>';
                    str += '<option value="하나">하나</option>';
                    str += "</select>";
                    str += "</div>";
                    str += '<div class="ten wide field">';
                    str += '<input type="text" value="123412341234" name="porderpayno" readonly>';
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
            
            // 이메일 입력 시 뒤에 부분 필수 처리
            $("input[name='porderemail']").change(function(){
                if($(this).val() === ""){
                    $("[name='s_email']").attr("required",false);
                }else{
                    $("[name='s_email']").attr("required",true);        	   			
                }
            });
            
            
            
            // 결제하기 버튼 이벤트 할당
            $(".pay-btn").click(order);
            
            // 마일리지 적용 버튼 이벤트 할당
            $(".m-apply").click(function(){
                event.preventDefault();
                let mpoint = $("input[name='porderdiscount']").val();
                if(mpoint !== ""){
                    let realm = Math.floor(parseInt(mpoint)/100) * 100;
					realm = realm < 0 ? 0 : realm;
                    realm = realm > parseInt(myMpoint) ? myMpoint : realm;
                    $("input[name='porderdiscount']").val(realm);

                    if($(".usedMpoint").length != 0){
                        $(".m-discount").html(realm);
                        setTotalPrice();
                    }else{               				
                        let html = '<div class="row usedMpoint">';
                        html += '<div class="six wide column left aligned">마일리지</div>';
                        html += '<div class="ten wide column right aligned"><i class="minus icon small"></i>&nbsp<i class="won sign icon small"></i><span class="m-discount">'+realm+'</span></div></div>';
                        $(".color-555-small").append(html);    
                        setTotalPrice();
                    }
                    
                }
            });
            
        	// custom error message
            const validityMessage = {
	              badInput: "잘못된 입력입니다.",
	              patternMismatch: "숫자만 입력해주세요.",
	              rangeOverflow: "입력 범위를 초과하였습니다.",
	              rangeUnderflow: "입력 값이 부족합니다.",
	              stepMismatch: "간격에 맞게 입력하세요.",
	              tooLong: "입력하신 정보를 다시 확인해주세요.",
	              tooShort: "입력하신 정보를 다시 확인해주세요.",
	              typeMismatch: "형식에 맞게 입력하세요.",
	              valueMissing: "필수입력 사항입니다.",
            }
            
        	function getValidityMessage(vali){
        		for(let key in validityMessage){
        			if(vali[key]){
        				return validityMessage[key];
        			}
        		}
        	}
        	
        	inputs.each((idx,item)=>{
        		item.addEventListener("invalid",()=>{
        			showError(item);
                });
        	});
        	
        	function showError(input){
        		input.setCustomValidity(getValidityMessage(input.validity) || "");
        	}
        	
            
        });
        </script>
        <script src="${pageContext.request.contextPath}/resources/js/order.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
