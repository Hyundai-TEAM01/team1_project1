$(function () {
    var $menuman = $(".dth-man");
    var $subman = $(".sub-man");

    // 마우스 hover 드롭다운 메뉴
    $menuman.on({
        mouseenter: function () {
            $subman.addClass("wrap-on");
        },
        mouseleave: function () {
            $subman.removeClass("wrap-on");
        },
    });

    var $menuwoman = $(".dth-woman");
    var $subwoman = $(".sub-woman");

    // 마우스 hover 드롭다운 메뉴
    $menuwoman.on({
        mouseenter: function () {
            $subwoman.addClass("wrap-on");
        },
        mouseleave: function () {
            $subwoman.removeClass("wrap-on");
        },
    });
    
    
    $.ajax({
		url : "/member/memberdata"
	}).done((data)=>{
		$(".cartcnt").html(data.cartcnt);
	});
    
});