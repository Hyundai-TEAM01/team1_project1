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
                <th class="center aligned"><input type="checkbox" name="all_check"></th>
                <th class="center aligned">상품정보</th>
                <th class="center aligned">수량</th>
                <th class="center aligned">판매가</th>
                <th class="center aligned">선택</th>
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
                <td class="center aligned amount-icon">
                    <i class="minus square outline icon"><a></a></i>
                    <div class="ui mini input">
                        <input type="text" class="center aligned amount" placeholder="1" maxlength="3">
                    </div>
                    <i class="plus square outline icon"></i>
                </td>
                <td class="center aligned"><span class="price"><i class="won sign small icon"></i>180,600</span></td>
                <td class="center aligned"><button class="ui basic button">삭제</button></td>
              </tr>
            </tbody>
          </table>
          <div class="ui divider"></div>
          <div>
       
            <div class="ui center aligned three column grid">
                <div class="row">
                  <div class="column">
                  </div>
                  <div class="column">
                    <div class="ui vertical ">
                      <div class= "item">
                        총 <span class="yellow">2</span>개 상품
                      </div>
                    </div>
                  </div>
                  <div class="column right aligned">
                    <div class="ui vertical">
                      <div class="item ">
                        <span class="item-key">상품합계</span><span class="item-value"><i class="won sign icon small"></i>180,600</span>
                      </div>
                      <div class="item ">
                        <span class="item-key">배송비</span><span class="item-value"><i class="won sign icon small"></i>0</span>
                      </div>
                      <div class="item">
                        <span class="item-key">합계</span><span class="item-value"><i class="won sign icon small"></i>180,600</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
          </div>
          <div class="ui divider "></div>
          <div class="ui five column center aligned padded grid">
            <div class="column">
                <button class="ui button">
                    선택 상품 삭제
                </button>
            </div>
    
            <div class="column">
                <a class="ui secondary button" href="order">
                    선택 상품 주문
                </a>
            </div>
    
          </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
