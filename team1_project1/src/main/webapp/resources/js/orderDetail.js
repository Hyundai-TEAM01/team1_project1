$(function () {
    $.ajax({
		url: 'getorderdetaillist'
	})
	.done((data) => {
		console.log(data);
	})
});