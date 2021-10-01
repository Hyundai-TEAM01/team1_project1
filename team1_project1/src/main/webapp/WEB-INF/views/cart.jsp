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
                <tbody>
                    <tr id="num2">
                        <td class="center aligned">
                            <input type="checkbox" name="check_box" />
                        </td>
                        <td>
                            <div class="ui items">
                                <div class="item">
                                    <div class="ui small image">
                                        <img src="http://newmedia.thehandsome.com/MM/2B/SS/MM2B4WPS087M_KE_W01.jpg/dims/resize/684x1032/" style="width: 100px; height: 150px" />
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
                                            <a class="ui right floated change-btn">옵션 변경</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="center aligned amount-icon">
                            <a href="javascript:amount(-1, 2)"><i class="minus square outline icon"></i></a>
                            <div class="ui mini input">
                                <input type="text" class="center aligned amount" value="1" maxlength="3" />
                            </div>
                            <a href="javascript:amount(1, 2)"><i class="plus square outline icon"></i></a>
                        </td>
                        <td class="center aligned">
                            <div class="init-price">180600</div>
                            <i class="won sign small icon"></i><span class="price">0</span>
                        </td>
                        <td class="center aligned">
                            <button class="ui basic button">삭제</button>
                        </td>
                    </tr>

                    <tr id="num1">
                        <td class="center aligned">
                            <input type="checkbox" name="check_box" />
                        </td>
                        <td>
                            <div class="ui items">
                                <div class="item">
                                    <div class="ui small image">
                                        <img src="http://newmedia.thehandsome.com/MM/2B/SS/MM2B4WPS087M_KE_W01.jpg/dims/resize/684x1032/" style="width: 100px; height: 150px" />
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
                                                <a class="ui right floated change-btn">옵션 변경</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="center aligned amount-icon">
                            <a href="javascript:amount(-1, 1)"><i class="minus square outline icon"></i></a>
                            <div class="ui mini input">
                                <input type="text" class="center aligned amount" value="1" maxlength="3" />
                            </div>
                            <a href="javascript:amount(1, 1)"><i class="plus square outline icon"></i></a>
                        </td>
                        <td class="center aligned">
                            <div class="init-price">180600</div>
                            <i class="won sign small icon"></i><span class="price">0</span>
                        </td>
                        <td class="center aligned">
                            <button class="ui basic button">삭제</button>
                        </td>
                    </tr>
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
                                    <div class="span-wrap">
                                        <i class="won sign icon small"></i>
                                        <span class="item-value" id="sumprice">0</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui divider"></div>
            <div class="ui five column center aligned padded grid">
                <div class="column">
                    <button class="ui button">선택 상품 삭제</button>
                </div>

                <div class="column">
                    <a class="ui secondary button" href="order"> 선택 상품 주문 </a>
                </div>
            </div>
        </div>

        <script>
            // 상품 수량 변경
            function amount(num, idx) {
                let input = $("#num" + idx + " input.amount");
                let total = $("#p_amount");

                let p_amount = total.html() == "" ? parseInt(0) : parseInt(total.html());

                let amount = parseInt(input.val());

                amount += num;

                // 재고값 가져오기
                let stock = 3;

                if (amount === 0) {
                    // 제거 질문 팝업
                } else {
                    input.val(amount);
                    calProductPrice($(input).closest("tr"));
                }
                allPriceSet();
            }

            // 제품 수량 변경 이벤트 발생 시 처리
            function updateAmoumtEvent() {
                $("tbody tr").each((idx, item) => {
                    // 재고값 가져오기
                    let stock = 3;
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

                                // 재고값으로 다시 설정
                                inputTag.val(stock);
                                calProductPrice(item);
                            } else if (change_val == 0) {
                                // 제거 질문 팝업
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
                let sum = 0;
                $("tbody tr").each((idx, item) => {
                    if (isChecked(item) == true) {
                        sum += calProductPrice(item);
                    }
                });

                $("#p_total").html(wonChange(sum));

                $("#sumprice").html(wonChange(parseInt($("#postprice").html()) + sum));
            }

            // 해당 상품 선택 여부
            function isChecked(item) {
                let result = $(item).find("input[name='check_box']").is(":checked");
                return result;
            }

            $(function () {
                initSetting();
            });

            // 초기 접속 시
            function initSetting() {
                calProductPriceAll();
                updateAmoumtEvent();
                allProductAmount();
                allPriceSet();

                // 전체 선택 체크박스 이벤트 추가
                let s_all = $("input[name='all_check']");
                s_all.change(function () {
                    if (s_all.prop("checked") === true) {
                        selectAll(true);
                    } else {
                        selectAll(false);
                    }
                    allPriceSet();
                    allProductAmount();
                });

                // 체크 박스별 상태 변경 이벤트 할당
                $("input[name='check_box']").each((idx, item) => {
                    $(item).change(function () {
                        if ($(item).prop("checked") === false) {
                            // 상품 선택 해제된 경우
                            s_all.prop("checked", false);
                            // 금액
                        }
                        allPriceSet();
                        allProductAmount();
                    });
                });

                // 옵션 변경 클릭 이벤트 등록
                $(".changebtn").each((idx, item) => {
                    $(item).click(changeOption);
                });
            }

            // 금액 형태로 변환
            function wonChange(num) {
                return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            }

            // 상품 삭제(db)
            function pDelete() {}

            // 상품 변경 반영(db)
            function pUpdate() {}

            // 상품 재고값 가져오기
            function getStockAmount() {}

            //상품 삭제 물음 띄우기
            function isdeleteModal() {}

            // 옵션 변경 클릭 시
            function changeOption(item) {
                let this_row = $(item).closest("tr");
                let this_id = this_row.attr("id");
                let html = "<tr id='" + this_id + "_op' class='op-add'>";
                if (typeof $("#" + this_id + "_op").html() == "undefined") {
                    console.log('run');
                    html += '<td class="center aligned"></td>';
                    html += '<td colspan="3"><div><div><span class="three wide small">COLOR</span>';

                    // color 칩 목록 추가

                    html += '</div><div><span class="small">SIZE</span>';

                    // size 목록 추가

                    html += "</div></div></td>";
                    html += '<td class="center aligned">';

                    html += '<button class="update">변경</button><br /><br />';
                    html += '<button class="cancel">취소</button>';
                    html += "</td></tr>";

                    this_row.after(html);
                }else{
                    
                }
            }
        </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
