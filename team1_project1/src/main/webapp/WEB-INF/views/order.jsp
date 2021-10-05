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
                        <tbody>
                            <tr>
                                <td>
                                    <div class="ui items">
                                        <div class="item">
                                            <div class="ui small image">
                                                <img src="http://newmedia.thehandsome.com/MM/2B/SS/MM2B4WPS087M_KE_W01.jpg/dims/resize/684x1032/" style="width: 80px; height: 120px" />
                                            </div>
                                            <div class="middle aligned content">
                                                <div class="description">
                                                    <p>CLUB MONACO</p>
                                                    <p>셋업 슬림 팬츠</p>
                                                    <p class="grey small">
                                                        color :
                                                        <span class="p_color">beige</span>
                                                        / size :
                                                        <span class="p_size">100</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="center aligned">
                                    <div>
                                        <div class="ui input input-wrap">
                                            <input type="text" class="center aligned amount" readonly value="1" />
                                        </div>
                                    </div>
                                </td>
                                <td class="center aligned"><i class="won sign icon small"></i><span class="price">180,600</span></td>
                            </tr>
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

                    <h3>배송지 정보</h3>
                    <form class="ui form">
                        <table class="ui definition table">
                            <tbody>
                                <tr>
                                    <td class="center aligned">배송지 주소</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="three wide field">
                                                <input type="text" class="addr1" placeholder="우편번호"/>
                                            </div>
                                            <a class="ui button" href="javascript:execDaumPostcode()">우편번호 검색</a>
                                        </div>
                                        <div class="field">
                                            <input type="text" class="addr2" placeholder="주소"/>
                                        </div>
                                        <div class="field">
                                            <input type="text" class="addr3" placeholder="상세주소"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned">수령인</td>
                                    <td>
                                        <div class="four wide field">
                                            <input type="text" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned">휴대폰 번호</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="three wide field">
                                                <select class="ui search dropdown" name="p-start">
                                                    <option value="010">010</option>
                                                    <option value="011">011</option>
                                                    <option value="016">016</option>
                                                </select>
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" maxlength="4" />
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" maxlength="4" />
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
                                                <input type="text" />
                                            </div>
                                            <div class="field">
                                                <span>-</span>
                                            </div>
                                            <div class="three wide field">
                                                <input type="text" />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned">배송 요청 사항</td>
                                    <td>
                                        <div class="ten wide field">
                                            <input type="text" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center aligned">수령인 E-mail</td>
                                    <td>
                                        <div class="inline fields">
                                            <div class="five wide field">
                                                <input type="text" />
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

                        <h3>결제 수단 선택</h3>
                        <table class="ui definition table">
                            <tbody>
                                <tr>
                                    <td>결제수단</td>
                                    <td>
                                        <div>
                                            <form>
                                                <input type="radio" value="card" name="payment" id="card" class="ml-10" checked />
                                                <label for="card">신용카드</label>
                                                <input type="radio" value="cash" name="payment" id="cash" class="ml-10" />
                                                <label for="cash">무통장 입금</label>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="payment-info">
                            <div class="inline fields">
                                <div class="three wide field">
                                    <select class="ui selection dropdown">
                                        <option value="">카드사</option>
                                        <option value="">현대</option>
                                        <option value="">비씨</option>
                                        <option value="">국민</option>
                                    </select>
                                </div>
                                <div class="ten wide field">
                                    <div class="ui input"><input type="text" placeholder="카드번호" /></div>
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
                                        <div class="ten wide column right aligned"><i class="won sign icon small"></i><span class="p-price">180,600</span></div>
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
                                            <span class="total-price">150,500</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-box">
                            <h5 class="color-555">구매 시 지급 예정 포인트</h5>
                            <div class="save-m">
                                <sapn>마일리지</sapn>
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
                $("input:radio[name='payment']").click(function () {
                    let payment = $("input:checked[name='payment']").val();
                    let info = $("div.payment-info");
                    info.html("");
                    let str = "";

                    if (payment === "card") {
                        str += '<div class="inline fields">';
                        str += '<div class="three wide field">';
                        str += '<select class="ui selection dropdown">';
                        str += '<option value="">카드사</option>';
                        str += '<option value="">현대</option>';
                        str += ' <option value="">비씨</option>';
                        str += '<option value="">국민</option>';
                        str += "</select>";
                        str += "</div>";

                        str += '<div class="ten wide field">';
                        str += '<input type="text" placeholder="카드번호">';
                        str += "</div>";
                        str += "</div>";
                    } else if (payment === "cash") {
                        str += '<div class="inline fields">';
                        str += '<div class="three wide field">';
                        str += '<select class="ui selection dropdown bank-seletion">';
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
            });
            
            
            $(function(){
                let s_email = $("select[name='select-email']");
        	   	s_email.change(function () {
                   if(s_email.val() !== ""){
                       $("#s_email").val(s_email.val()).prop('readonly',true);
                   }else{
                    $("#s_email").val(s_email.val()).prop('readonly',false);
                   }
        	   });
           });
            
            // https://postcode.map.daum.net/guide 사용
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
        </script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
