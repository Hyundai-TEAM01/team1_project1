<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css"/>

<div class="home-container">
    <!-- <div class="filterWrap">필터</div> -->
    <ul class="itemlist">
        <li class="column">
            <a href="product/content">
                <span><img src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01.jpg"></span>
            </a> <a>
                <span class="brand">CLUB MONACO</span> <span class="title">하운드투스 체크 셔츠</span> <span class="price"><i class="won sign icon"></i>168,000</span> <span class="flag"><span class="product">NEW</span></span>
            </a>
            <div class="color-more-wrap">
                <a></a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
            </div></li>

        <li class="column">
            <a href="product/content">
                <span><img src="http://newmedia.thehandsome.com/MM/2B/FW/MM2B9WSH029HOA_GY_T01.jpg"></span>
            </a> <a>
                <span class="brand">CLUB MONACO</span> <span class="title">포켓 체크 셔츠</span> <span class="price"><i class="won sign icon"></i>178,000</span> <span class="flag"><span class="product">NEW</span></span>
            </a>
            <div class="color-more-wrap">
                <a></a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
            </div></li>

        <li class="column">
            <a href="product/content">
                <span><img src="http://newmedia.thehandsome.com/SH/2B/FW/SH2B9WSHT06M_MD_T01.jpg"></span>
            </a> <a>
                <span class="brand">SYSTEM HOMME</span> <span class="title">[PARIS] 코듀로이 셔츠</span> <span class="price"><i class="won sign icon"></i>275,000</span> <span class="flag"></span>
            </a>
            <div class="color-more-wrap">
                <a></a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
            </div></li>

        <li class="column">
            <a href="product/content">
                <span><img src="http://newmedia.thehandsome.com/TH/2B/FW/TH2B9WSH713M_BL_T01.jpg"></span>
            </a> <a>
                <span class="brand">TIME HOMME</span> <span class="title">투톤 체크 셔츠</span> <span class="price"><i class="won sign icon"></i>395,000</span> <span class="flag"></span>
            </a>
            <div class="color-more-wrap">
                <a></a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
            </div></li>

        <li class="column">
            <a href="product/content">
                <span><img src="http://newmedia.thehandsome.com/TH/2B/FW/TH2B9WSH708M_BR_T01.jpg"></span>
            </a> <a>
                <span class="brand">TIME HOMME</span> <span class="title">트위드 셔츠</span> <span class="price"><i class="won sign icon"></i>850,000</span> <span class="flag"></span>
            </a>
            <div class="color-more-wrap">
                <a></a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img class="img-color-more" src="${pageContext.request.contextPath}/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
            </div></li>

    </ul>

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
	});

	function init(){
		// ccode에 따른 productList 출력
		printCategoryProductList();
	}
	
	function printCategoryProductList(){
		$.ajax({
			url: "getProductList",
		}).done((data) => {
			for(product of data.productList){
				createCategoryProduct(product);
			}
		});
	}
	
	function createCategoryProduct(product){
		console.log(product)
		/* let html = '<li class="column" targetcode="' + product.pcode + '">'; */

	}
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>