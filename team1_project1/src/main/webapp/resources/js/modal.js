function modalOn() 
{
	console.log("modal on");
    document.querySelector('.fullscreen').classList.add('on');
}
function modalOff() {
	console.log("modal off");
    document.querySelector('.fullscreen').classList.remove('on');
}