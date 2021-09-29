<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="ui container">
    <div class="ui centered grid">
      <div class="row">
        <div class="ten wide column center aligned">
          <div class="item">            
            <div>
              <table class="ui padded celled table">
                <thead>
                  <tr>
                    <th class="center aligned"><input type="checkbox" name="all_check"></th>
                    <th class="center aligned">상품정보</th>
                    <th class="center aligned">수량</th>
                    <th class="center aligned">판매가</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="center aligned"><input type="checkbox" name="check_box"></td>
                    <td>
                        <div class="ui items">
                            <div class="item">
                                <div class="ui small image">
                                    <img src="http://newmedia.thehandsome.com/MM/2B/SS/MM2B4WPS087M_KE_W01.jpg/dims/resize/684x1032/" style="width: 100px; height: 150px;">
                                </div>
                                <div class="middle aligned content">
                                    <div class="description">
                                        <p>CLUB MONACO</p>
                                        <p>셋업 슬림 팬츠</p>
                                        <p class="grey small">color : <span class="p_color">beige</span> / size : <span class="p_size">100</span> </p>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="center aligned">
                        <div class="ui mini input">
                            <input type="text" class="center aligned amount" readonly value="1">
                        </div>
                    </td>
                    <td class="center aligned"><span class="price">₩180,600</span></td>
                  </tr>
                </tbody>
              </table>
            </div>

          </div>
          <div class="item">       
            <div class="header">
              <h3>주문자 정보</h3>
            </div>      
            <table class="ui definition table">
              <tbody>
                <tr>
                  <td>주문자</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td>휴대폰</td>
                  <td>010-0000-0000</td>
                </tr>
                <tr>
                  <td>E-mail</td>
                  <td>user@google.com</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="item">
            <h3>배송지 정보</h3>
              <form class="ui form">
                <table class="ui definition table">
                  <tbody>
                    <tr>
                      <td>배송지 주소</td>
                      <td>
                        <div class="inline fields">
                          <div class="three wide field">
                            <input type="text">
                          </div>
                          <button class="ui button">우편번호 검색</button>
                        </div>
                        <div class="field">
                          <input type="text">
                        </div>
                        <div class="field">
                          <input type="text">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>수령인</td>
                      <td>
                        <div class="four wide field">
                          <input type="text">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>휴대폰 번호</td>
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
                            <input type="text" maxlength="4">
                          </div>
                          <div class="field">
                            <span>-</span>
                          </div>
                          <div class="three wide field">
                            <input type="text" maxlength="4">
                          </div>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>연락처</td>
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
                            <input type="text">
                          </div>
                          <div class="field">
                            <span>-</span>
                          </div>
                          <div class="three wide field">
                            <input type="text">
                          </div>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>배송 요청 사항</td>
                      <td>
                        <div class="ten wide field">
                          <input type="text">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>수령인 E-mail</td>
                      <td>
                        <div class="inline fields">
                          <div class="five wide field">
                            <input type="text">
                          </div>
                          <div class="field">
                            <span>@</span>
                          </div>
                          <div class="five wide field">
                            <input type="text">
                          </div>
                          <div class="five wide field">
                              <select class="ui search dropdown">
                                <option value="">직접 입력</option>
                                <option value="naver">naver.com</option>
                                <option value="google">google.com</option>
                              </select>
                          </div>
                        </div>
 
                      </td>
                    </tr>
                  </tbody>
                </table>
              </form>

          </div>
          <div class="item">
            <h3>결제 수단 선택</h3>
              <table class="ui definition table">
                <tbody>
                  <tr>
                    <td>결제수단</td>
                    <td>

                      <div>
                        <form>
                          <input type="radio" value="card" name="payment" id="card" class="ml-10">
                          <label for="card">신용카드</label>
                          <input type="radio" value="cash" name="payment" id="cash" class="ml-10">
                          <label for="cash">무통장 입금</label>
                        </form>
                      </div>

                    </td>
                  </tr>
                </tbody>
              </table>
          </div>
        </div>

        <div class="six wide column center aligned">
          <div class="item">최종 결제 금액</div>
          <div class="item">마일리지 내역</div>
          <div class="item center aligned">
            <button class="positive ui button">Positive Button</button>
          </div>
        </div>
      </div>
    </div>
  </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
