
//데이트피커
let date1 = document.getElementById("datePicker_start");
let date2 = document.getElementById("datePicker_end");

//데이트피커(input type text)
let hide1 = document.getElementById("hide1");
let hide2 = document.getElementById("hide2");

//위탁&방문 라벨
let we = document.getElementById("custom_lb1");
let bang = document.getElementById("custom_lb2");

//예약페이지로 넘어올때의 값 (ex: 위탁 or 방문)
let check2 = document.getElementById('track2').value;


//방문에서 넘어왔을때 방문라벨에 색상 주는 함수
$(document).ready(function(){
	if(check2.includes("bang") == true)
		{
			we.style.background = "rgb(190, 190, 190)";
			bang.style.background = "rgb(83, 220, 152)";
			date1.style.width = "330px";
			date2.style.display = "none";
        	hide1.style.marginRight = '30px';
        	hide2.style.display = "none";

		}
});



//버튼 클릭시 데이트피커스타일변화주는 함수
$(document).ready(function(){
	    //방문버튼
		$("#custom_rd2").change(function(){
	        if($("#custom_rd2").is(":checked") == true)
	        {
	        	date1.style.width = "330px";
	        	date2.style.display = "none";
	        	hide1.style.marginRight = '30px';
	        	hide2.style.display = "none";
	        	we.style.background = "rgb(190, 190, 190)";
	        	bang.style.background = "rgb(83, 220, 152)";
	        	$("#END_DATE").val('$("#START_DATE").val()');
	        }
	    });

		//위탁버튼
	    $("#custom_rd1").change(function(){
			if($("#custom_rd1").is(":checked") == true)
	        {

	        	date1.style.width = "152px";
	        	date2.style.display = "block";
	     
	        	hide2.style.display = "block";
	        	hide2.style.marginLeft = '-25px';
	        	
	        	we.style.background = "rgb(83, 220, 152)";
	        	bang.style.background = "rgb(190, 190, 190)";
	        }     
	    });
	});

//서비스유형에따른 보여주기 변화
$(document).ready(function(){
	
	//PETSITTER_SERVIE 값
	let check = document.getElementById('track').value;
	//픽업가능, 대형견가능, 마당존재, 노견 케어 가능
	let service1 = document.getElementById('service1');
	let service2 = document.getElementById('service2');
	let service3 = document.getElementById('service3');
	let service4 = document.getElementById('service4');
	
	//아이콘 
	let check1 = document.getElementById('check1');
	let check2 = document.getElementById('check2');
	let check3 = document.getElementById('check3');
	let check4 = document.getElementById('check4');
	

	var sv = new Array(); //배열선언
		sv = check.split(',');

	switch (sv[0]) 
	{
	  case "픽업 가능" : 
	    service1.style.color = "black";
		check1.style.color = "black";
	    break;
	    
	  case "대형견 케어 가능" : 
	    service2.style.color = "black";
		check2.style.color = "black";
		break;
		
	  case "마당 존재" :
	    service3.style.color = "black";
		check3.style.color = "black";
		break;
		
	  case "노견 케어 가능" :
	    service4.style.color = "black";
		check4.style.color = "black";
	  default :
	    break;
	}
	
	switch (sv[1]) 
	{
	  case "픽업 가능" : 
	    service1.style.color = "black";
		check1.style.color = "black";
	    break;
	    
	  case "대형견 케어 가능" : 
	    service2.style.color = "black";
		check2.style.color = "black";
		break;
		
	  case "마당 존재" :
	    service3.style.color = "black";
		check3.style.color = "black";
		break;
		
	  case "노견 케어 가능" :
	    service4.style.color = "black";
		check4.style.color = "black";
	  default :
	    break;
	}
	
	switch (sv[2]) 
	{
	  case "픽업 가능" : 
	    service1.style.color = "black";
		check1.style.color = "black";
	    break;
	    
	  case "대형견 케어 가능" : 
	    service2.style.color = "black";
		check2.style.color = "black";
		break;
		
	  case "마당 존재" :
	    service3.style.color = "black";
		check3.style.color = "black";
		break;
		
	  case "노견 케어 가능" :
	    service4.style.color = "black";
		check4.style.color = "black";
	  default :
	    break;
	}
	
	switch (sv[3]) 
	{
	  case "픽업 가능" : 
	    service1.style.color = "black";
		check1.style.color = "black";
	    break;
	    
	  case "대형견 케어 가능" : 
	    service2.style.color = "black";
		check2.style.color = "black";
		break;
		
	  case "마당 존재" :
	    service3.style.color = "black";
		check3.style.color = "black";
		break;
		
	  case "노견 케어 가능" :
	    service4.style.color = "black";
		check4.style.color = "black";
	  default :
	    break;
	}
});



//펫시터 견적 보여주기 함수(위탁)
$(document).ready(function() {
	
	var count = 1;
	let price_all_1 = 0;
	if($("#custom_rd1").is(":checked") == true)
	{
		
		$("#plus1").click(function(){
			count++;
			
			//select 선택값(펫이름,사이즈) 변수로 지정.
			var selectOption = document.getElementById("choicepet");
			var selectName = document.getElementById("choicepet");
				selectOption = selectOption.options[selectOption.selectedIndex].value;
				
				
				
			
			//bak : (체크아웃 - 체크인) ill : (bak + 1) dayTime : (날짜를 시간으로 계산하기위함)
			var selectOption = document.getElementById("choicepet");
			var selectName = document.getElementById("choicepet");
				selectOption = selectOption.options[selectOption.selectedIndex].value;
				

			//bak : (체크아웃 - 체크인) ill : (bak + 1) dayTime : (날짜를 시간으로 계산하기위함)
			var sdd = (String) ($("#datePicker_start").data('datepicker').getFormattedDate('yyyy-mm-dd'));
			var edd = (String) ($("#datePicker_end").data('datepicker').getFormattedDate('yyyy-mm-dd'));

		    var ar1 = sdd.split('-');
		    var ar2 = edd.split('-');
		    
		    
		    var da1 = new Date(ar1);
		    var da2 = new Date(ar2);

		    var dif = da2 - da1;
		    var cDay = 24 * 60 * 60 * 1000;
		    
		    var bak = (String) ((parseInt)(dif/cDay));
		    var ill = (String) (1 + (parseInt)(dif/cDay));
		    var dayTime = (String) (24 * (parseInt)(dif/cDay));
			
			var test1 = (String) ($('#timePicker_start').timepicker("getTime"));
			var test2 = (String) ($('#timePicker_end').timepicker("getTime"));
			
			var time1 = test1.substr( 16, 2 );
			var time2 = test2.substr( 16, 2 ); 
			
			var test3 = (parseInt)(time1);
			var test4 = (parseInt)(time2);
			var test5 = test4 - test3;
			
			var sixty = parseInt(document.getElementById("price").value);
			var allTime = ( ((parseInt)(dayTime)) + (test5) );
			var	price =  ( (parseInt(sixty)) * (allTime) );
			
			if(selectOption.includes( '대형' ) == true)
			{
				 sixty += 1000;
				 allTime = ( ((parseInt)(dayTime)) + (test5) );
				 price = ( (parseInt(sixty)) * (allTime) );
			}
			if(isNaN(price) || isNaN(allTime) || isNaN(bak) || isNaN(ill)) {
				price = 0;
				allTime = 0;
				bak = 0;
				ill = 0;
			}
			
			
			//'추가'클릭시 추가되는 태그
			if(count == 2)
			{
				//처음에만 비워줌
				$("#cost1").empty();
			}
			
			
		
			$("#cost1").append("<p class='plusPet' id='p"+count+"'>" +selectOption+", " +bak+ "박" +ill+ "일, " +
								"총 "+allTime+"시간, 비용 : " +price+ "원 <button type='button' class='x_btn' id='x"+count+"' value='"+price+"'>x</button></p>"); 
			
			price_all_1 += price;
			$("#cost2").empty();
			$("#cost2").append("<p class='allCost' id='"+price_all_1+"'>예상 총 비용 : " +price_all_1+ "원</p>");
			
			//모달창에서 결제비용 추가..
			$("#p33").empty();
			$("#p33").append("+KRW "+price_all_1);
			$(".p5").empty();
			$(".p5").append("KRW "+price_all_1);
			
			
			//'x' 클릭시 해당p태그 삭제 예상 총비용 변화
			$("#x"+count).click(function(){ 
				
				var price_select = parseInt($('#x'+count).val());
				price_all_1 = price_all_1 - price_select;
					
				$("#p"+count).empty();
				$("#cost2").empty();
				$("#cost2").append("<p class='allCost'>예상 총 비용 : " +price_all_1+ "원</p>");
				
				//모달창에서 결제비용 추가..
				$("#p33").empty();
				$("#p33").append("+KRW "+price_all_1);
				count--;
			});
			
			$("#PAY_AMOUNT").val(price_all_1);
			var start_date = (String)($("#datePicker_start").data('datepicker').getFormattedDate('yyyy-mm-dd'));
			var end_date = (String)($("#datePicker_end").data('datepicker').getFormattedDate('yyyy-mm-dd'));
			var start_time = (String) ($("#timePicker_start").timepicker("getTime"));
			var end_time = (String) ($("#timePicker_end").timepicker("getTime"));
			
			$("#START_DATE").val(start_date);
			$("#END_DATE").val(end_date);
			$("#START_TIME").val(start_time.substr(16, 5));
			$("#END_TIME").val(end_time.substr(16, 5));
			
			
		});
	}
	
	
});









//펫시터 견적 보여주기 함수(방문)
$(document).ready(function() {
	var count_2 = 1;
	let price_all_2 = 0;
	if($("#custom_rd2").is(":checked") == true)
	{
		$("#plus1").click(function(){

			count_2++;
			
			//select 선택값 변수로 지정.(option:이름)
			var selectOption = document.getElementById("choicepet");
			var selectName = document.getElementById("choicepet");
				selectOption = selectOption.options[selectOption.selectedIndex].value;
			

			var test1 = (String) ($('#timePicker_start').timepicker("getTime"));
			var test2 = (String) ($('#timePicker_end').timepicker("getTime"));
			
			var time1 = test1.substr( 16, 2 );
			var time2 = test2.substr( 16, 2 ); 
			
			var test3 = (parseInt)(time1);
			var test4 = (parseInt)(time2);
			var test5 = test4 - test3;
			
			var thirty = document.getElementById("price2").value;
			var sixty =  2 * (parseInt)(thirty);
			
			var price =  sixty * test5;

			
			if(selectOption.includes( '대형' ) == true)
			{
				 sixty += 1000;
				 price = sixty * test5;
			}
			if(isNaN(price) || isNaN(test5)) {
				price = 0;
				test5 = 0;
				
			}
			
			
			//'추가'클릭시 추가되는 태그
			if(count_2 == 2)
			{
				//처음에만 비워줌
				$("#cost1").empty();
			}

			$("#cost1").append("<p class='plusPet' id='p"+count_2+"'>" +selectOption+", 총" +test5+"시간, 비용 : " +price+ "원 " +
							 "<button type='button' class='x_btn' id='x"+count_2+"' value='"+price+"'>x</button></p>"); 

			price_all_2 += price;
			$("#cost2").empty();
			$("#cost2").append("<p class='allCost'>예상 총 비용 : " +price_all_2+ "원</p>");
			
			//모달창에서 결제비용 추가..
			$("#p33").empty();
			$("#p33").append("+KRW "+price_all_2);
			$(".p5").empty();
			$(".p5").append("KRW "+price_all_2);
			
			
			//'x' 클릭시 해당p태그 삭제 예상 총비용 변화
			$("#x"+count_2).click(function(){ 

				var price_select = parseInt($('#x'+count_2).val());
				price_all_2 = price_all_2 - price_select;
		
				$("#p"+count_2).empty();
				$("#cost2").empty();
				$("#cost2").append("<p class='allCost'>예상 총 비용 : " +price_all_2+ "원</p>");
				
				//모달창에서 결제비용 추가..
				$("#p33").empty();
				$("#p33").append("+KRW "+price_all_2);
				
				count_2--;
			});
			
			$("#PAY_AMOUNT").val(price_all_2);
			$("#PAY_TYPE").val('방문');
			var start_date = (String)($("#datePicker_start").data('datepicker').getFormattedDate('yyyy-mm-dd'));
			var end_date = (String)($("#datePicker_end").data('datepicker').getFormattedDate('yyyy-mm-dd'));
			var start_time = (String) ($("#timePicker_start").timepicker("getTime"));
			var end_time = (String) ($("#timePicker_end").timepicker("getTime"));
			
			$("#START_DATE").val(start_date);
			$("#END_DATE").val(start_date);
			$("#START_TIME").val(start_time.substr(16, 5));
			$("#END_TIME").val(end_time.substr(16, 5));
		});
	}
	
});