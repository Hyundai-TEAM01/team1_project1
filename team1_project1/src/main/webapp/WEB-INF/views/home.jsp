<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css"/>

<div class="home-container">
    <!-- <div class="filterWrap">필터</div> -->
    <ul class="itemlist"></ul>

    <div class="paging"></div>
    
</div>
<script>
	$(function () {
	    init();
	    console.log("실행");
	});

	function init(){
		// ccode에 따른 productList, pager 출력
		printCategoryProductList(1, "WOMEN_Top_Shirts");
	}
	
	function printCategoryProductList(pageNo, ccode){
		$.ajax({
			url: "getProductList",
			data: {"pageNo" : pageNo, "ccode" : ccode},
		}).done((data) => {
			console.log(data);
			for(product of data.productList){
				createCategoryProduct(product);
			}
			/* createPager(data.pager[0]); */
			if(data.pager.totalPageNo>0){
	            setHtml(data.pager);
	            setAction(data.pager);
	        }else{
	        	$(".paging").html('');
	        }
			
		});
	}
	
	function createCategoryProduct(product){
		
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
	function setHtml(pager){
		$(".paging").html('');
		
		let pagingHtml = '';
		let firstPageBtn = '<a href="javascript:void(0);" class="prev2"><i class="angle double left icon"></i></a>';
		let prevPageBtn = '<a href="javascript:void(0);" class="prev"><i class="angle left icon"></i></a>';
		let pageBtn = '<span class="paging-num">';
		for(let i = pager.startPageNo; i <= pager.endPageNo; i++){
			let pageNum = i;
			let activeClass = '';
			if(pageNum == pager.pageNo) activeClass = ' on ';
			pageBtn += '<a href="javascript:void(0);" class="pageBtn' + activeClass + '" pageNum="' + pageNum + '">' + pageNum + '</a>';
		}
		
		pageBtn += '</span>';
		
		let nextPageBtn = '<a href="javascript:void(0);" class="next"><i class="angle right icon"></i></a>';
        let endPageBtn = '<a href="javascript:void(0);" class="next2"><i class="angle double right icon"></i></a>';
        
        pagingHtml = firstPageBtn + prevPageBtn + pageBtn + nextPageBtn + endPageBtn;
        
        $(".paging").html(pagingHtml);
	}
	
	function setAction(pager){
		let thisArea = $(".paging");
		console.log(pager);
	    
        thisArea.find(".prev2").click(function(){
            goPage(1, pager.ccode);
            if($(".itemlist").length > 0){
                $(document).scrollTop(0);
            }
        });

        thisArea.find(".prev").click(function(){
            let pageNum = pager.startPageNo - 1;
            if(pageNum < 1) pageNum = 1;
            goPage(pageNum, pager.ccode);
            if($(".itemlist").length > 0){
                $(document).scrollTop(0);
            }
        });

        thisArea.find(".pageBtn").click(function(){
            goPage($(this).attr("pageNum"), pager.ccode);
            if($(".itemlist").length > 0){
                $(document).scrollTop(0);
            }
        });

        thisArea.find(".next").click(function(){
            let pageNum = pager.endPageNo + 1;
            if(pageNum>pager.totalPageNo) pageNum = pager.endPageNo;
            goPage(pageNum, pager.ccode);
            if($(".itemlist").length > 0){
                $(document).scrollTop(0);
            }
        });

        thisArea.find(".next2").click(function(){
            goPage(pager.totalPageNo, pager.ccode);
            if($(".itemlist").length > 0){
                $(document).scrollTop(0);
            }
        });
	}
	
	function goPage(pageNo, ccode){
		$(".itemlist").html('');
		printCategoryProductList(pageNo, ccode);
    };

	
	function wonChange(num) {
        return String(num).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    }
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>