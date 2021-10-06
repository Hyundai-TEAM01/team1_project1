<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css"/>

<div class="home-container">
    <!-- <div class="filterWrap">필터</div> -->
    <ul class="itemlist"></ul>

    <div class="paging">
        <a href="#" class="prev2"><i class="angle double left icon"></i></a>
        <a href="#" class="prev"><i class="angle left icon"></i></a>
        <span class="paging-num">
            <a href="#" class="pageBtn on">1</a>
            <a href="#" class="pageBtn">2</a>
        </span>
        <a href="#" class="next"><i class="angle right icon"></i></a>
        <a href="#" class="next2"><i class="angle double right icon"></i></a>
    </div>
    
</div>
<script>
	$(function () {
	    init();
	    console.log("실행");
	});

	function init(){
		// ccode에 따른 productList, pager 출력
		printCategoryProductList();
	}
	
	function printCategoryProductList(){
		$.ajax({
			url: "getProductList",
		}).done((data) => {
			for(product of data.productList[0]){
				createCategoryProduct(product);
			}
			console.log(data);
			/* createPager(data.pager[0]); */
		});
	}
	
	function createCategoryProduct(product){
		console.log(product);
		let html = '<li class="column mg-product">';
	        html += '<a href="product/' + product.pcode + "_" + product.color[0].pcolor + "?ccode=" + product.ccode + '">';
	       	html += '<span><img class="main-img" src="' + product.color[0].imgurl1 + '"></span></a>';
	        html += '<a><span class="brand">' + product.pbrand + '</span>';
	        html += '<span class="title">' + product.pname + '</span>';
	        html += '<span class="price"><i class="won sign icon"></i>' + wonChange(product.pprice) + '</span>';
	        html += '<span class="flag"><span class="product">NEW</span></span></a>';
	        html += '<div class="color-more-wrap">';
	        for(color of product.color){
	        	html += '<a><img class="img-color-more" src="' + color.colorurl +'"></a>';
	        }
	    	html += '</div>';
	    	html += '</li>';
	    	$(".itemlist").append(html);
	}
	
	// pager 생성
	function createPager(pager){
		
	}
	
	function wonChange(num) {
        return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    }
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>