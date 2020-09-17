
// 원하는 조건 선택시 라벨 색상 변화
// 픽업, 대형견, 마당, 노견 
	//체크박스
   let ck1 = document.getElementById("custom_ck1");
   let ck2 = document.getElementById("custom_ck2");
   let ck3 = document.getElementById("custom_ck3");
   let ck4 = document.getElementById("custom_ck4");
   
   //라벨
   let clb1 = document.getElementById("custom_lb1");
   let clb2 = document.getElementById("custom_lb2");
   let clb3 = document.getElementById("custom_lb3");
   let clb4 = document.getElementById("custom_lb4");
   

   $(document).ready(function(){
	    $("#custom_ck1").change(function(){
	        if($("#custom_ck1").is(":checked")){
	        	clb1.style.background = "rgb(0, 200, 83)";
	        }else{
	        	clb1.style.background = "rgb(83, 220, 152)";
	        }
	    });
	});

   $(document).ready(function(){
	    $("#custom_ck2").change(function(){
	        if($("#custom_ck2").is(":checked")){
	        	clb2.style.background = "rgb(0, 200, 83)";
	        }else{
	        	clb2.style.background = "rgb(83, 220, 152)";
	        }
	    });
	});   
   
   $(document).ready(function(){
	    $("#custom_ck3").change(function(){
	        if($("#custom_ck3").is(":checked")){
	        	clb3.style.background = "rgb(0, 200, 83)";
	        }else{
	        	clb3.style.background = "rgb(83, 220, 152)";
	        }
	    });
	});   

   $(document).ready(function(){
	    $("#custom_ck4").change(function(){
	        if($("#custom_ck4").is(":checked")){
	        	clb4.style.background = "rgb(0, 200, 83)";
	        }else{
	        	clb4.style.background = "rgb(83, 220, 152)";
	        }
	    });
	});   
 

// 원하는 조건 선택시 라벨 색상 변화
// 최신순, 평점순 

   //체크박스
   let order1 = document.getElementById("order_ck1");
   let order2 = document.getElementById("order_ck2");
   
   //라벨   
   let olb1 = document.getElementById("order_lb1");
   let olb2 = document.getElementById("order_lb2");
   
   $(document).ready(function(){
	    $("#order_ck1").change(function(){
	        if($("#order_ck1").is(":checked"))
	        {
	        	olb1.style.background = "rgb(0, 200, 83)";
	        	olb2.style.background = "rgb(83, 220, 152)";
	        }
	    });
	});

	$(document).ready(function(){
	    $("#order_ck2").change(function(){
	        if($("#order_ck2").is(":checked"))
	        {
	        	olb2.style.background = "rgb(0, 200, 83)";
	        	olb1.style.background = "rgb(83, 220, 152)";
	        }
	    });
	});

// 원하는 조건 선택시 라벨 색상 변화
// 지역 
	//체크박스
	let area1 = document.getElementById("area_ck1");
	let area2 = document.getElementById("area_ck2");
	let area3 = document.getElementById("area_ck3");
	let area4 = document.getElementById("area_ck4");
	let area5 = document.getElementById("area_ck5");
	let area6 = document.getElementById("area_ck6");
	let area7 = document.getElementById("area_ck7");
	let area8 = document.getElementById("area_ck8");
	let area9 = document.getElementById("area_ck9");
	let area10 = document.getElementById("area_ck10");

	//라벨
	let alb1 = document.getElementById("area_lb1");
	let alb2 = document.getElementById("area_lb2");
	let alb3 = document.getElementById("area_lb3");
	let alb4 = document.getElementById("area_lb4");
	let alb5 = document.getElementById("area_lb5");
	let alb6 = document.getElementById("area_lb6");
	let alb7 = document.getElementById("area_lb7");
	let alb8 = document.getElementById("area_lb8");
	let alb9 = document.getElementById("area_lb9");
	let alb10 = document.getElementById("area_lb10");
	
	
	
	//코드 간결하게 수정할예정..(지역부분 클릭시 색상변화)
	$(document).ready(function(){
	    $("#area_ck1").change(function(){
	        if($("#area_ck1").is(":checked")){
	        	alb1.style.background = "rgb(0, 200, 83)";
	        	alb1.style.color="white";
	        	
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";

	        }else{
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        		
	        }
	    });
	});


	$(document).ready(function(){
	    $("#area_ck2").change(function(){
	        if($("#area_ck2").is(":checked")){
	        	alb2.style.background = "rgb(0, 200, 83)";
	        	alb2.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";
	        	

	        }else{
	        	alb2.style.background = "#ffffff";
	        	alb2.style.color="#5E5E5E"
	        }
	    });
	});
	
	$(document).ready(function(){
	    $("#area_ck3").change(function(){
	        if($("#area_ck3").is(":checked")){
	        	alb3.style.background = "rgb(0, 200, 83)";
	        	alb3.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";
	        	
	        	
	        	
	        	
	        }else{
	        	alb3.style.background = "#ffffff";
	        	alb3.style.color="#5E5E5E"
	        }
	    });
	});
	
	$(document).ready(function(){
	    $("#area_ck4").change(function(){
	        if($("#area_ck4").is(":checked")){
	        	alb4.style.background = "rgb(0, 200, 83)";
	        	alb4.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";
	        	
	        	
	        }else{
	        	alb4.style.background = "#ffffff";
	        	alb4.style.color="#5E5E5E"
	        }
	    });
	});
	
	$(document).ready(function(){
	    $("#area_ck5").change(function(){
	        if($("#area_ck5").is(":checked")){
	        	alb5.style.background = "rgb(0, 200, 83)";
	        	alb5.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";
	        	
	        }else{
	        	alb5.style.background = "#ffffff";
	        	alb5.style.color="#5E5E5E"
	        }
	    });
	});
	
	$(document).ready(function(){
	    $("#area_ck6").change(function(){
	        if($("#area_ck6").is(":checked")){
	        	alb6.style.background = "rgb(0, 200, 83)";
	        	alb6.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";
	        	
	        }else{
	        	alb6.style.background = "#ffffff";
	        	alb6.style.color="#5E5E5E"
	        }
	    });
	});
	
	$(document).ready(function(){
	    $("#area_ck7").change(function(){
	        if($("#area_ck7").is(":checked")){
	        	alb7.style.background = "rgb(0, 200, 83)";
	        	alb7.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";
	        	
	        	
	        }else{
	        	alb7.style.background = "#ffffff";
	        	alb7.style.color="#5E5E5E"
	        }
	    });
	});
	
	$(document).ready(function(){
	    $("#area_ck8").change(function(){
	        if($("#area_ck8").is(":checked")){
	        	alb8.style.background = "rgb(0, 200, 83)";
	        	alb8.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";
	        	
	        	
	        }else{
	        	alb8.style.background = "#ffffff";
	        	alb8.style.color="#5E5E5E"
	        }
	    });
	});
	
	$(document).ready(function(){
	    $("#area_ck9").change(function(){
	        if($("#area_ck9").is(":checked")){
	        	alb9.style.background = "rgb(0, 200, 83)";
	        	alb9.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	alb10.style.background = "white";
	        	alb10.style.color="#5E5E5E";
	        	
	        	
	        }else{
	        	alb9.style.background = "#ffffff";
	        	alb9.style.color="#5E5E5E"
	        }
	    });
	});
	
	$(document).ready(function(){
	    $("#area_ck10").change(function(){
	        if($("#area_ck10").is(":checked") == true){
	        	alb10.style.background = "rgb(0, 200, 83)";
	        	alb10.style.color="#ffffff";
	        	
	        	alb1.style.background = "white";
	        	alb1.style.color="#5E5E5E";
	        	alb3.style.background = "white";
	        	alb3.style.color="#5E5E5E";
	        	alb4.style.background = "white";
	        	alb4.style.color="#5E5E5E";
	        	alb5.style.background = "white";
	        	alb5.style.color="#5E5E5E";
	        	alb6.style.background = "white";
	        	alb6.style.color="#5E5E5E";
	        	alb7.style.background = "white";
	        	alb7.style.color="#5E5E5E";
	        	alb8.style.background = "white";
	        	alb8.style.color="#5E5E5E";
	        	alb9.style.background = "white";
	        	alb9.style.color="#5E5E5E";
	        	alb2.style.background = "white";
	        	alb2.style.color="#5E5E5E";
	        	
	        	
	        }else if ($("#area_ck10").is(":checked") == false){
	        	
	        	
	        	alb10.style.background = "#ffffff";
	        	alb10.style.color="#5E5E5E"
	        }
	    });
	});
	
	
	
	
	//체크박스를 라디오 처럼
	$(document).ready(function() {
	    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
	    $('input[type="checkbox"][name="area"]').click(function(){
	        //클릭 이벤트 발생한 요소가 체크 상태인 경우
	        if ($(this).prop('checked')) {
	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="area"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});
	
	
	
	
	
	

			
