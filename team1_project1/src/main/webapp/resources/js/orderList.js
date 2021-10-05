$(function () {
    $.ajax({
		url: 'getorderlist'
	})
	.done((data) => {
		console.log(data);
	})
});