<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 700px;
  height: 500px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 58px 40px 0;
}
body .container .half.bg {
  background-image: url('resources/images/LOGINFORM.jpg');
  background-size: 400px;
  background-repeat: no-repeat;
}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 287px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
body .container .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
.inptcheck {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 2px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  background-color: #ED9CA5;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "✓";
}
body .container .content .submit-wrap {
  position: absolute;
  bottom: 0;
  width: 100%;
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}
a { 
text-decoration:none; 
} 
#popup{
 line-height : 40px;
 width : 250px;
 visibility : hidden;
 position : absolute;
 font-size: 14px;
 background-color : white;
 border-radius: 5px;
 border-style : solid;
 border-width : 1px;
 text-align:center;
}
</style>
</head>
<body>
<section class="container">
  				<div id="popup" class="PW1hoverpopup"></div>
  				<div id="popup" class="PW2hoverpopup"></div>
		    <article class="half">
			        <a href="home.me"><h1>PETSTINY</h1></a>
			        <div class="tabs">
				            <span class="tab idfind active"><a href="#idfind">아이디 찾기</a></span>
				            <span class="tab pwfind"><a href="#pwfind">비밀번호 찾기</a></span>
			        </div>
			        <div class="content">
				            <div class="idfind1-cont cont">
						             <input type="text" name="MEMBER_NAME" id="MEMBER_NAME1" class="inpt" required="required" placeholder="이름을 입력하세요">
						             <input type="text" name="MEMBER_TEL" id="MEMBER_TEL1" class="inpt" required="required" placeholder="전화번호를 입력하세요">
						    <div class="tabs">
            		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tab idfind2"><a href="#idfind2">아이디 찾기</a></span>
            		</div>
            		</div>
				<div class = 'idfind2-cont cont' style = "display : none;">
				<input type = "text" id = "idCheck" class = "inpt" value = "" readonly>
					<div class="tabs">
				    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<span class="tab idfind1"><a href="#idfind1">돌아가기</a></span>
				    </div>
				    </div>
    			<div class="pwfind1-cont cont" style = "display : none;">
                <input type="email" name="MEMBER_ID" id="MEMBER_ID2" class="inpt" required="required" placeholder="아이디를 입력하세요">
				<input type="text" name="MEMBER_NAME" id="MEMBER_NAME2" class="inpt" required="required" placeholder="이름을 입력하세요">
				<input type="text" name="MEMBER_TEL" id="MEMBER_TEL2" class="inpt" required="required" placeholder="전화번호를 입력하세요">
				<div class="tabs">
				    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<span class="tab pwfind2"><a href="#pwfind2">비밀번호 찾기</a></span>
				    </div>
            </div>
            <div class = "pwfind2-cont cont" style = "display :none;">
            <input type = "text" id = "pwCheck" class = "inpt" value = "" readonly>
            <input type = "text" id = "emailCheck" class = "inpt">
			<div class="tabs">
				    <span class="tab pwfind1"><a href="#pwfind1">돌아가기</a></span>
				    &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class = "tab pwfind3"  id = "pwspan"><a href="#pwfind3">비밀번호 찾기</a></span>
				   </div>
            </div>
            <div class = "pwfind3-cont cont" style = "display :none;">
            	<form action="memberPwUpdate.me" method="post">
            	<input type = "hidden" id="MEMBER_ID" name = "MEMBER_ID">
            	<input type = "password" id = "MEMBER_PW1" name = "MEMBER_PW" class = "inpt PW1check" placeholder = "새 비밀번호를 입력하세요">
            	<input type = "password" id = "MEMBER_PW2" class = "inpt PW2check" placeholder = "새 비밀번호 확인">
            	<div class="submit-wrap">
            		<input type="submit" id = "member_submit" value="Change Password" class="submit" style = "display : none;">
           		</div>
           		</form>
            </div>
            </div>
		    </article>
		    <div class="half bg"></div>
	</section>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
var num;
var memcheck1 = "N";
var memcheck2 = "N";

$('.PW2check').keyup(function(event){
	var pw1 = $('#MEMBER_PW1').val();
	
    if($(this).val() == pw1){
    	$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".PW2hoverpopup").css("display", "none"); 
    	});
    	memcheck2 = "Y";
    	if(memcheck1 == "Y" && memcheck2 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
    }else{
    	$(this).css({
    		"background-color" : "rgba(237, 156, 165, 0.15)"
    	});
    	$(this).mouseover(function(event){
    		$(".PW2hoverpopup").text('비밀번호가 일치하지 않습니다.');
    		$(".PW2hoverpopup").css("visibility", "Visible");
            $(".PW2hoverpopup").css("top", event.target.offsetTop + 200);
            $(".PW2hoverpopup").css("left", event.target.offsetLeft + 330);
            $(".PW2hoverpopup").css("display", "block"); 
    	});
    	$(this).mouseout(function(event){
    		$(".PW2hoverpopup").css("display", "none");
    	});
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
    	memcheck2 = "N";
    	if(memcheck1 == "Y" && memcheck2 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
    }
});

$('.PW1check').keyup(function(event){
    if($(this).val().length<6 || $(this).val().length>16){
    	$(this).css({
    		"background-color" : "rgba(237, 156, 165, 0.15)"
    	});
    	$(this).mouseover(function(event){
    		$(".PW1hoverpopup").text('비밀번호는 6~16글자 입니다.');
    		$(".PW1hoverpopup").css("visibility", "Visible");
            $(".PW1hoverpopup").css("top", event.target.offsetTop + 200);
            $(".PW1hoverpopup").css("left", event.target.offsetLeft + 330);
            $(".PW1hoverpopup").css("display", "block"); 
    	});
    	$(this).mouseout(function(event){
    		$(".PW1hoverpopup").css("display", "none");
    	});
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
		memcheck1 = "N";
    	if(memcheck1 == "Y" && memcheck2 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
    }else{
    	$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".PW1hoverpopup").css("display", "none");
    	});
    	memcheck1 = "Y";
    	if(memcheck1 == "Y" && memcheck2 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
    }
});



$('.tabs .tab').click(function(){
    if ($(this).hasClass('idfind')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.idfind1-cont').show();
    } 
    if ($(this).hasClass('pwfind')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.pwfind1-cont').show();
    }
    if ($(this).hasClass('idfind2')) {
    	var MEMBER_NAME = $('#MEMBER_NAME1').val();
    	var MEMBER_TEL = $('#MEMBER_TEL1').val();
    	$.ajax({
            url:'/petsitter/memberIdFind.bo',
            type:'POST',
            dataType : "text", // 서버에서 보내줄 데이터 타입
            data:{"MEMBER_NAME":MEMBER_NAME, "MEMBER_TEL":MEMBER_TEL},
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success:function(data){
            	if(data == "N"){
            		$('#idCheck').val('해당정보의 아이디가 없습니다');
            	}else{
            		$('#idCheck').val(data);
            	}
        	},
        	error:function(request,status,error){
    	        alert("list ajax통신 실패!!!");
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
    	}); 
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.idfind2-cont').show();
    }
    
    if ($(this).hasClass('idfind1')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.idfind1-cont').show();
    }
    
    if ($(this).hasClass('pwfind2')) {
    	var MEMBER_ID = $('#MEMBER_ID2').val();
    	var MEMBER_TEL = $('#MEMBER_TEL2').val();
    	var MEMBER_NAME = $('#MEMBER_NAME2').val();
    	$.ajax({
            url:'/petsitter/memberPwFind.bo',
            type:'POST',
            dataType : "text", // 서버에서 보내줄 데이터 타입
            data:{"MEMBER_NAME":MEMBER_NAME, "MEMBER_TEL":MEMBER_TEL, "MEMBER_ID" : MEMBER_ID},
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success:function(data){
            	if(data == "N"){
            		$('#pwCheck').val("해당정보의 아이디가 없습니다");
            		$('#pwspan').hide();
            		$('#emailCheck').hide();
            	}else{
            		num = data;
            		console.log("num = "+num);
            		$('#MEMBER_ID').val(MEMBER_ID);
            		$('#pwCheck').val("해당 이메일의 인증번호를 입력하세요");
            		$('#pwspan').show();
            		$('#emailCheck').show();
            	}
        		
        	},
        	error:function(request,status,error){
    	        alert("list ajax통신 실패!!!");
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
    	}); 
    	
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.pwfind2-cont').show();
    }

    if ($(this).hasClass('pwfind1')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.pwfind1-cont').show();
    }
    
    if ($(this).hasClass('pwfind3')) {
    	if($('#emailCheck').val() == num){
            $('.tabs .tab').removeClass('active');
            $(this).addClass('active');
            $('.cont').hide();
            $('.pwfind3-cont').show();
    	}else{
    		$('#pwCheck').val('인증번호가 일치하지 않습니다.');
    	}
    }
    
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>
</body>
</html>