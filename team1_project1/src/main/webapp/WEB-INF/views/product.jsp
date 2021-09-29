<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
    .product-container {
        max-width: 1205px;
        min-width: 1100px;
        margin: 0 auto;
        margin-top: 50px;
    }

    .product-img {
        max-width: 100%;
    }

    span.title {
        display: block;
        margin-top: 15px;
        margin-bottom: 10px;
    }

    .color li {
        display: inline;
        margin: 0 10px 5px 0;
    }

    .info-sect {
        margin-left: 20px;
    }

    input.amount {
        width: 40px;
    }

    .ui.button {
        width: 120px;
        border-radius: 0px;
        background: #4a4a4a;
        color: white;
        margin-top: 12px;
    }
</style>

<div class="product-container">
        <div class="ui two column vertically padded grid">
            <div class="column">
                <div>
                    <ul>
                        <li>
                            <img class="product-img" src="/resources/images/product/MM2B7WSH021H9A_BK_T01_684_1032.jpg">
                        </li>
                    </ul>
                </div>
            </div>
            <form method="post" action="cart/content">
                <div class="column">
                    <div class="info-sect">
                        <div><a>CLUB MONACO</a></div>
                        <span>하운드투스 체크 셔츠</span>
                        <p><i class="won sign icon">168,000</i></p>
                        <div class="ui divider"></div>
                    </div>
        
                    <div class="info-sect">
                        <li>
                            <span class="title">색상</span>
                            <ul class="color">
                                <li><a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_24_24.jpg"></a></li>
                                <li><a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_24_24.jpg"></a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="title">사이즈</span>
                            <select class="ui dropdown">
                                <option value="3">95</option>
                                <option value="2">100</option>
                                <option value="1">105</option>
                                <option value="0">110</option>
                            </select>
                        </li>
                        <li>
                            <div>
                                <i class="minus square outline icon"><a></a></i>
                                <div class="ui mini input">
                                    <input type="text" class="center aligned amount">
                                </div>
                                <i class="plus square outline icon"></i>
                            </div>
                        </li>
                        <div class="ui divider"></div>
                    </div>
        
                    <div class="info-sect">
                        <div class="ui grid">
                            <div class="two column row">
                                <div class="left floated column">
                                    총 합계
                                </div>
                                <div class="right floated column center aligned">
                                    <div><i class="won sign icon"></i>168,000</div>
                                    <button type="submit" class="ui button">카트 담기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
