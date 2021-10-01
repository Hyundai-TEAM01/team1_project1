$(function () {
    const explainContainer = $(".explain");
    const dDayContainer =  $(".d-day");
    const isproceeding = true; // 진행중인가?

      if(isproceeding) {
        getTime();
        timer = setInterval(getTime, 1000);
        $('.imgbtn').click(function(e) {
          e.preventDefault();
          alert("서버 리턴 값 출력할 예정입니다.");
        });
      } else {
        explainContainer.html("이벤트가 종료되었습니다.");
        dDayContainer.html("");
        $('.imgbtn').click(function(e) {
          e.preventDefault();
          alert("이벤트가 종료되었습니다.");
        });
      }


      function getTime() {
        const dDay = new Date("2021-12-25:00:00:00+0900");
        const now=new Date();
        const gap=dDay-now;

        if(gap > 0 ) { 
          explainContainer.html("- 이벤트 진행시간까지 -");
          const day=Math.floor(gap/(1000*60*60*24)); //일
          const hours=Math.floor((gap/(1000*60*60))%24); //시
          const minutes=Math.floor(((gap/1000)*60)%60); //분
          const seconds=Math.floor((gap/1000)%60); //초

          let text = day + "Day ";
          text += hours < 10 ? ("0" + hours) : hours;
          text += "h ";
          text += minutes < 10 ? ("0" + minutes) : minutes;
          text += "m ";
          text += seconds < 10 ? ("0" + seconds) : seconds;
          text += "s ";
          dDayContainer.html(text);
          // dDayContainer.html(`${day}Day ${hours<10?`0${hours}`:hours}h ${minutes<10?`0${minutes}`:minutes}m ${seconds<10? `0${seconds}`:seconds}s`);
        } else { // d-day 지남
          explainContainer.html("Click!!!");
        }
        
      }
});