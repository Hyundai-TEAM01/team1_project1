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
              <tr id="num1">
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
                    <a href="javascript:amount(-1, 1)"><i class="minus square outline icon"></i></a>
                    <div class="ui mini input">
                        <input type="text" class="center aligned amount" value="1" maxlength="3">
                    </div>
                    <a href="javascript:amount(1, 1)"><i class="plus square outline icon"></i></a>
                </td>
                <td class="center aligned">
	                <div class="init-price">180600</div>
	                <i class="won sign small icon"></i><span class="price">0</span>
                </td>
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
                       총 <span class="yellow" id="p_amount">1</span>개 상품
                    </div>
                  </div>
                  <div class="column right aligned">
                    <div class="ui vertical">
                      <div class="item ">
                        <span class="item-key">상품합계</span>
                        <div class="span-wrap">
	                        <i class="won sign icon small "></i><span class="item-value" id="p_total">0</span>
                        </div>
                      </div>
                      <div class="item ">
                        <span class="item-key">배송비</span>
                        <div class="span-wrap">
	                        <i class="won sign icon small"></i><span class="item-value">0</span>
                        </div>
                      </div>
                      <div class="item">
                        <span class="item-key">합계</span>
                        <div class="span-wrap">
	                        <i class="won sign icon small"></i>
	                        <span class="item-value">0</span>
                        </div>
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
    
      <script>
      

      function amount(num, idx){
        let input = $("#num" + idx + " input.amount");
        let total = $("#p_amount");
       
        let p_amount = total.html()==""? parseInt(0) : parseInt(total.html());
 
        let amount = parseInt(input.val());

        amount += num;

        if(amount === 0){
			// 삭제할지 물어보고 처리
        }else{
          input.val(amount);
          total.html(p_amount+num);
          
        }
      }
      
      function selectAll(val){
    	  $("input[name='check_box']").each((idx,item)=>{
          	$(item).prop('checked',val);
          	
          	let tr_id = "#";
          	tr_id += $(item).closest('tr').attr('id');
          	let price =$(tr_id).find('span.price').html();
          	price = parseInt(price.replace(/,/g,''));
          	
          	if(val === true){          		
         	 	totalPriceUpdate(price,1);
          	}else{
         	 	totalPriceUpdate(price,0);          		
          	}
        });
      }
      
      function totalPriceUpdate(price, val){
    	  let p_total = $("#p_total");
    	  let totalPrice = parseInt(p_total.html().replace(/,/g,''));
    	  
    	  
    	  if(val === 0){
    		  p_total.html(wonChange(totalPrice-price));
    	  }else{
    		  p_total.html(wonChange(totalPrice+price));
    	  }
      }
      
      
      

      $(function(){
        let s_all = $("input[name='all_check']");
        s_all.change(function(){
            if(s_all.prop("checked") === true){
              selectAll(true);
            }else{
              selectAll(false);
            }
        });
        
        $("input[name='check_box']").each((idx,item)=>{
            $(item).change(function(){
            	if($(item).prop("checked") === false){
            		s_all.prop("checked",false);
            		// 금액
            	}
            });
        });
        
      })
      
      function initPrice(){
    	  
      }
      
	  function wonChange(num){
    	  return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
      }
      
	
      function pDelete(){
    	  
      }
      
      function pUpdate(){
    	  
      }
      
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
