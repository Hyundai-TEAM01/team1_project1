<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	.home-container {
		max-width: 1205px;
		margin: 0 auto;
	}
	
	a span {
		display: block;
	}
	
	.itemlist {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
		row-gap: 10px;
		column-gap: 10px;
		/* grid-template-columns: repeat(auto-fill, minmax(25%, auto)); */
	}
	.filterWrap {
	    font-size: 15px;
	    margin: 10px 0px 10px 0px;
	    font-weight: bolder;
	}
</style>

<div class="home-container">
	<div class="filterWrap">필터</div>
	<ul class="itemlist">
		<li class="column">
			<a href="product/content">
				<span><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01.jpg"></span>
			</a> <a>
				<span class="brand">CLUB MONACO</span> <span class="title">하운드투스 체크 셔츠</span> <span class="price"><i class="won sign icon"></i>168,000</span> <span class="flag"><span class="product">NEW</span></span>
			</a>
			<div class="color_more_wrap">
				<a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
			</div></li>

		<li class="column"><a>
				<span><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01.jpg"></span>
			</a> <a>
				<span class="brand">CLUB MONACO</span> <span class="title">하운드투스 체크 셔츠</span> <span class="price"><i class="won sign icon"></i>168,000</span> <span class="flag"><span class="product">NEW</span></span>
			</a>
			<div class="color_more_wrap">
				<a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
			</div></li>

		<li class="column"><a>
				<span><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01.jpg"></span>
			</a> <a>
				<span class="brand">CLUB MONACO</span> <span class="title">하운드투스 체크 셔츠</span> <span class="price"><i class="won sign icon"></i>168,000</span> <span class="flag"><span class="product">NEW</span></span>
			</a>
			<div class="color_more_wrap">
				<a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
			</div></li>

		<li class="column"><a>
				<span><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01.jpg"></span>
			</a> <a>
				<span class="brand">CLUB MONACO</span> <span class="title">하운드투스 체크 셔츠</span> <span class="price"><i class="won sign icon"></i>168,000</span> <span class="flag"><span class="product">NEW</span></span>
			</a>
			<div class="color_more_wrap">
				<a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
			</div></li>

		<li class="column"><a>
				<span><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01.jpg"></span>
			</a> <a>
				<span class="brand">CLUB MONACO</span> <span class="title">하운드투스 체크 셔츠</span> <span class="price"><i class="won sign icon"></i>168,000</span> <span class="flag"><span class="product">NEW</span></span>
			</a>
			<div class="color_more_wrap">
				<a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_KG_13_14.jpg"></a>
                <a><img src="/resources/images/product/MM2B7WSH021H9A_BK_T01_PR_13_14.jpg"></a>
			</div></li>

	</ul>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
