<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>PetSitter Login Page</title>

<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
.btn-file{
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }
body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 720px;
  height: 560px;
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
  height: 300px;
}
#Signinform{
position: relative;
  height: 300px;
}
#Signinform3{
position: relative;
  height: 350px;
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
body .container .content label:nth-of-type(4), body .container .content input:nth-of-type(4), body .container .content .more:nth-of-type(4) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(5), body .container .content input:nth-of-type(5), body .container .content .more:nth-of-type(5) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(6), body .container .content input:nth-of-type(6), body .container .content .more:nth-of-type(6) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(7), body .container .content input:nth-of-type(7), body .container .content .more:nth-of-type(7) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(8), body .container .content input:nth-of-type(8), body .container .content .more:nth-of-type(8) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(9), body .container .content input:nth-of-type(9), body .container .content .more:nth-of-type(9) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(10), body .container .content input:nth-of-type(10), body .container .content .more:nth-of-type(10) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(11), body .container .content input:nth-of-type(11), body .container .content .more:nth-of-type(11) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(12), body .container .content input:nth-of-type(12), body .container .content .more:nth-of-type(12) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(13), body .container .content input:nth-of-type(13), body .container .content .more:nth-of-type(13) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(14), body .container .content input:nth-of-type(14), body .container .content .more:nth-of-type(14) {
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
body .container .content label:not([for='remember1']) {
  display: none;
}
body .container .content label:not([for='remember2']) {
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

.inptcheck2 {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 2px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #5e5e5e!important;
  border: 1px solid #d9d9d9;
  background: transparent;
  background-color: #ED9CA5;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.input {
  font-size: 12px;
  width: 73%;
  height: 35px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}

body .container .content input.input1 {
  font-size: 12px;
  width: 64%;
  height: 35px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
.textarea{
  font-size: 12px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  resize:none;
}
.box{
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
.member_type{
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
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

.button1{
	border : 1px solid;
	background-color : rgba(0,0,0,0);
	color: #999999;
}

.button1:hover{
	background-color: #263238;
  	color: #ffffff;
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
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>

<section class="container">
  				<div id="popup" class="IDhoverpopup"></div>
  				<div id="popup" class="PW1hoverpopup"></div>
  				<div id="popup" class="PW2hoverpopup"></div>
  				<div id="popup" class="TELhoverpopup"></div>
  				<div id="popup" class="TELhoverpopup"></div>
  				
  				<div id="popup" class="MEMBER_IDhoverpopup"></div>
  				<div id="popup" class="MEMBER_PW1hoverpopup"></div>
  				<div id="popup" class="MEMBER_PW2hoverpopup"></div>
  				<div id="popup" class="MEMBER_TELhoverpopup"></div>
<article class="half">
	<a href="home.me"><h1>PETSTINY</h1></a>
		<!-- 상단 메뉴 -->
        <div class="tabs">
            <span class="tab signin active"><a href="#signin">로그인</a></span>
            <span class="tab signup"><a href="#signup">일반 회원가입</a></span>
            <span class="tab signup-petsitter"><a href="#signup-petsitter">펫시터 회원가입</a></span>
        </div>
        <div class="content">
        <!-- 로그인 -->
            <div class="signin-cont cont">
            <div class="member_type">
                	<input type="radio" value="MEMBER" name="member_type" checked>일반 로그인&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="PETSITTER" name="member_type">펫시터 로그인
                	</div>
                <form action="member_login.me" method="post" id="Signinform">
                    <input type="email" name="MEMBER_ID" id="MEMBER_ID" class="inpt" required="required" placeholder="이메일을 입력해주세요">
                    <input type="password" name="MEMBER_PW" id="MEMBER_PW" class="inpt" required="required" placeholder="패스워드를 입력해주세요">
                    <input type="checkbox" id="remember1" class="checkbox" >
                    <label for="remember1">Remember me</label>
                    <div class="submit-wrap">
                        <input type="submit" value="Sign in" class="submit">
                        <a href="memberFind.bo" class="more">Forgot your password?</a>
                    </div>
		        </form>
		        <form action="petsitter_login.me" method="post"  id="Signinform2">
		            <input type="text" class="inpt" required="required" name="PETSITTER_ID"  required="required" placeholder="아이디를 입력해주세요">
                    <input type="password" name="PETSITTER_PW" id="PETSITTER_PW" class="inpt" required="required" placeholder="패스워드를 입력해주세요">
                    <input type="checkbox" id="remember2" class="checkbox" >
                    <label for="remember2">Remember me</label>
                    <div class="submit-wrap">
                    <input type="submit" value="Sign in" class="submit" >
                    <a href="petsitterFind.bo" class="more">Forgot your password?</a>
                    </div>
		        </form>
	        </div>
	        
	        <!-- 일반회원 회원가입 -->
	        <div class="signup-cont cont">
	  	      <form action="member_join.me" method="post" enctype="multipart/form-data" id="Signinform3">
	          <input type="text" name="MEMBER_ID" id= "MEMBER_JOIN_ID" class="inpt" required="required" placeholder="이메일을 입력해주세요">
					<input type="password" name="MEMBER_PW" id="MEMBER_PW1" class="inpt MEMBER_PW1check" required="required" placeholder="패스워드를 입력해주세요">
                    <input type="password" name="password2" id="MEMBER_PW2" class="inpt MEMBER_PW2check" required="required" placeholder="패스워드를 확인해주세요">
				    <input type="text" name="MEMBER_NAME" id="MEMBER_NAME" class="inpt" required="required" placeholder="이름을 입력해주세요">
 					<input type="tel" name="MEMBER_TEL" id="MEMBER_TEL" class="inpt MEMBER_TELcheck" required="required" placeholder="전화번호를 입력해주세요">
                    <div class="submit-wrap">
                        <input type="submit" value="Sign up" class="submit" id="member_submit" style = "display : none;">
                        <a href="#" class="more">Terms and conditions</a>
                    </div>
           </form>
        	</div>

        	<!-- 펫시터 회원가입1 -->
			<form action="petsitter_join.me" id = "petsitter_submit_form" method="post" enctype="multipart/form-data">
				<div class="signup-cont-cont cont">
				
				<input type="text" name="PETSITTER_ID" id="PETSITTER_ID" class="inpt IDcheck" required="required" placeholder="아이디를 입력해주세요 ">
      			<input type="password" name="PETSITTER_PW" id="PETSITTER_PW1" class="inpt PW1check" required="required" placeholder="패스워드를 입력해주세요">
    			<input type="password" id="PETSITTER_PW2" class="inpt PW2check" required="required" placeholder="패스워드를 확인해주세요">
  				<input type="text" name="PETSITTER_NAME" class="inpt" required="required" placeholder="이름을 입력해주세요">
  				<input type="tel" name="PETSITTER_TEL" id="PETSITTER_TEL" class="inpt TELcheck" required="required" placeholder="전화번호를 입력해주세요">


  				<div class="tabs">
            	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span class="tab signup-petsitter2"><a href="#signup-petsitter2">다음</a></span></div>
            	</div>
            <!-- 펫시터 회원가입2 -->
            	<div class="signup-cont-cont2 cont">
            	<input type="text" name="PETSITTER_EMAIL" id = "PETSITTER_EMAIL" class="inpt" required="required" placeholder="이메일을 입력해주세요 ">
            	<input type="button" class= "button1" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
           		<input type="text" name="PETSITTER_ADDRESS" id="sample4_postcode" class="input1" placeholder="우편번호" required="required" readonly>
				<input type="text" name="PETSITTER_ADDRESS" id="sample4_roadAddress" class="inpt" placeholder="도로명주소" readonly>
				<input type="text" id="sample4_jibunAddress" class="inpt" placeholder="지번주소" readonly>
				<input type="hidden" id="guide" style="color:#999;display:none">
				<input type="text" name="PETSITTER_ADDRESS" id="sample4_detailAddress" class="inpt" placeholder="상세주소">
				<input type="hidden" id="sample4_extraAddress" class="inpt" placeholder="참고항목" readonly>
				<input type="hidden" name = "PETSITTER_ADDRX" id="addrX" value = 0>
				<input type="hidden" name = "PETSITTER_ADDRY" id="addrY" value = 0>

<!-- 주소검색 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<div class="tabs">
	<span class="tab signup-petsitter3-back"><a href="#signup-petsitter3">이전</a></span>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    <span class="tab signup-petsitter3"><a href="#signup-petsitter3">다음</a></span></div>
</div>
	<!-- 펫시터 회원가입3 -->
    <div class="signup-cont-cont3 cont">
   	<div class="box">
   	<input type = "checkbox" name = "PETSITTER_TYPE_LIST" id = "pet1" value = "방문"> 방문
   	<input type = "checkbox" name = "PETSITTER_TYPE_LIST" id = "pet2" value = "위탁"> 위탁
   	</div>
   	<input type="text" name="PETSITTER_PRICE_30M" id="30mP" class="inpt" placeholder="방문 30분 가격  ex) 15000">
   	<input type="text" name="PETSITTER_PRICE_60M" id="60mP" class="inpt" placeholder="위탁 60분 가격  ex) 15000">
   	<input type="text" name="PETSITTER_PRICE_12H" id="12hP" class="inpt" placeholder="데이케어 가격  ex) 15000">
   	<input type="text" name="PETSITTER_PRICE_24H" id="24hP" class="inpt" placeholder="1박케어 가격  ex) 15000">
		<div class="tabs">
		<span class="tab signup-petsitter4-back"><a href="#signup-petsitter4">이전</a></span>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
   	<span class="tab signup-petsitter4"><a href="#signup-petsitter4">다음</a></span></div>
   	</div>
   	<!-- 펫시터 회원가입4 -->
<div class="signup-cont-cont4 cont">
	<div class="box" id = "box1">
        <input type = "checkbox" name = "PETSITTER_SERVICE" id="pickup" value="픽업 가능"> 픽업 여부
        </div>
        <div class="box" id = "box2">
        <input type = "checkbox" name = "PETSITTER_SERVICE" id="yard" value="마당 존재"> 마당 유무
        </div>
        <div class="box">
        <input type = "checkbox" name = "PETSITTER_SERVICE" id="bigsize" value="대형견 케어 가능"> 대형견 케어 가능 유무
       	</div>
        <div class="box">
        <input type = "checkbox" name = "PETSITTER_SERVICE" id="olddog" value="노견 케어 가능"> 노견 케어 가능 유무
       	</div>
       	<div class="tabs">
       	<span class="tab signup-petsitter5-back"><a href="#signup-petsitter5">이전</a></span>
       	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
       	<span class="tab signup-petsitter5"><a href="#signup-petsitter5">다음</a></span></div>
	</div>
	<!-- 펫시터 회원가입5 -->
	<div class="signup-cont-cont5 cont">
	<input type="text" name="peoplephoto" id="peoplephoto" class="inpt" placeholder="증명사진을 첨부해주세요" readonly>
	<input type="file" id = "file3" name = "PETSITTER_PHOTO" style="display:none;"/>
	<input type="button" id= "btn-upload3" class="button1" name = "button3" value="사진 첨부">
	<input type="text" id="fileName3" class="input" name="fileName" value = "파일 이름" readonly>
	
	<input type="text" name="peoplephoto" id="peoplephoto2" class="inpt" placeholder="프로필사진을 첨부해주세요" readonly>
	<input type="file" id = "file7" name = "PETSITTER_PHOTO_PROFILE" style="display:none;"/>
	<input type="button" id= "btn-upload7" class="button1" name = "button7" value="사진 첨부">
	<input type="text" id="fileName7" class="input" name="fileName" value = "파일 이름" readonly>
	
	<div class="tabs">
	<span class="tab signup-petsitter6-back"><a href="#signup-petsitter6">이전</a></span>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<span class="tab signup-petsitter6"><a href="#signup-petsitter6">다음</a></span></div>
	</div>
	<!-- 펫시터 회원가입6 -->
       	<div class="signup-cont-cont6 cont">
       	<input type="text" name="PETSITTER_CERT" id="cret" class="inpt" placeholder="자격증 이름">
       	<input type="file" id = "file" name = "PETSITTER_PHOTO_CERT" style="display:none;"/>
       	<input type="button" id= "btn-upload" class="button1" name = "button" value="사진 첨부">
       	<input type="button" id= "btn-delete" class="button1" name = "delete_button1" value="사진 삭제">
       	<input type="text" id="fileName" class="input" name="fileName" value = "파일 이름" readonly>
       	
       	<input type="text" name="PETSITTER_CERT" id="cret1" class="inpt" placeholder="자격증 이름">
       	<input type="file" id = "file1" name = "PETSITTER_PHOTO_CERT" style="display:none;"/>
       	<input type="button" id= "btn-upload1" class="button1" name = "button1" value="사진 첨부">
       	<input type="button" id= "btn-delete1" class="button1" name = "delete_button2" value="사진 삭제">
       	<input type="text" id="fileName1" class="input" name="fileName" value="파일 이름" readonly>
       	
       	<input type="text" name="PETSITTER_CERT" id="cret2" class="inpt" placeholder="자격증 이름">
       	<input type="file" id = "file2" name = "PETSITTER_PHOTO_CERT" style="display:none;"/>
       	<input type="button" id= "btn-upload2" class="button1" name = "button2" value="사진 첨부">
       	<input type="button" id= "btn-delete2" class="button1" name = "delete_button3" value="사진 삭제">
       	<input type="text" id="fileName2" class="input" name="fileName" value="파일 이름" readonly>
       	<div class="tabs">
       	<span class="tab signup-petsitter7-back"><a href="#signup-petsitter7">이전</a></span>
       	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
       	<span class="tab signup-petsitter7"><a href="#signup-petsitter7">다음</a></span></div>
       	</div>
       	
    <!-- 펫시터 회원가입7 -->
       	<div class="signup-cont-cont7 cont">
       	<input type="text" name="house" id="house" class="inpt" placeholder="집 사진" readonly>
       	<input type="file" id = "file4" name = "PETSITTER_PHOTO_HOME" style="display:none;"/>
       	<input type="button" id= "btn-upload4" class="button1" name = "button4" value="사진 첨부">
       	<input type="button" id= "btn-delete4" class="button1" name = "delete_button4" value="사진 삭제">
       	<input type="text" id="fileName4" class="input" name="fileName" value = "파일 이름" readonly>
       	
       	<input type="text" name="house" id="house1" class="inpt" placeholder="집 사진" readonly>
       	<input type="file" id = "file5" name = "PETSITTER_PHOTO_HOME" style="display:none;"/>
       	<input type="button" id= "btn-upload5" class="button1" name = "button5" value="사진 첨부">
       	<input type="button" id= "btn-delete5" class="button1" name = "delete_button5" value="사진 삭제">
       	<input type="text" id="fileName5" class="input" name="fileName" value="파일 이름" readonly>
       	
       	<input type="text" name="house" id="house2" class="inpt" placeholder="집 사진" readonly>
       	<input type="file" id = "file6" name = "PETSITTER_PHOTO_HOME" style="display:none;"/>
       	<input type="button" id= "btn-upload6" class="button1" name = "button6" value="사진 첨부">
       	<input type="button" id= "btn-delete6" class="button1" name = "delete_button6" value="사진 삭제">
       	<input type="text" id="fileName6" class="input" name="fileName" value="파일 이름" readonly>
       	
       	<div class="tabs">
       	<span class="tab signup-petsitter8-back"><a href="#signup-petsitter8">이전</a></span>
       	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
       	<span class="tab signup-petsitter8"><a href="#signup-petsitter8">다음</a></span></div>
       	</div>
    <!-- 펫시터 회원가입8 -->
       	<div class="signup-cont-cont8 cont">
       	<input type="text" name="intro" id="intro" class="inpt" placeholder="자기 소개" readonly>
       	<textarea name = "PETSITTER_INTRODUCE" class="textarea" rows="8" cols="39" onFocus = "clearMessage(this.form);" onKeyUp="checkByte(this.form);">내용을 입력해주세요 (2000 Byte)</textarea>
       	<input type="text" name = "messagebyte" value="0" size="1" maxlength="4" readonly>/2000 Byte
       	<div class="tabs">
       	<span class="tab signup-petsitter9-back"><a href="#signup-petsitter9">이전</a></span></div>
       	<input type="submit" value="Sign up" class="submit" id="petsitter_submit" style="display: none;" >

       	</div>
   					</form>
   				
  </div>
			        
		    </article>
		    <div class="half bg"></div>
	</section>

<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24e91ec8fe5a3a10070597915f67d6ba&libraries=services"></script>
<script>
var geocoder = new kakao.maps.services.Geocoder();
var callback = function(result, status) { //입력된 도로명주소의 좌표값을 구하는 함수
    if (status === kakao.maps.services.Status.OK) {
    	var coords = new kakao.maps.LatLng(result[0].x, result[0].y);
    	$("#addrX").val(result[0].x);
    	$("#addrY").val(result[0].y);
    }
};


function geocoderAddr(){ //입력된 도로명주소의 좌표값을 구하는 함수
	geocoder.addressSearch($("#sample4_roadAddress").val(), callback);
};
	
var memcheck1 = "N";
var memcheck2 = "N";
var memcheck3 = "N";
var memcheck4 = "N";
$('#MEMBER_JOIN_ID').keyup(function(event){
	var reg_email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(!reg_email.test($('#MEMBER_JOIN_ID').val())){
		$(this).css({
			"background-color" : "rgba(237, 156, 165, 0.15)"
		});
		$(this).mouseover(function(event){
			$(".MEMBER_IDhoverpopup").text('이메일 형식이 올바르지 않습니다.');
			$(".MEMBER_IDhoverpopup").css("visibility", "Visible");
            $(".MEMBER_IDhoverpopup").css("top", event.target.offsetTop + 196);
            $(".MEMBER_IDhoverpopup").css("left", event.target.offsetLeft + 330);
            $(".MEMBER_IDhoverpopup").css("display", "block"); 
		});
		$(this).mouseout(function(event){
			$(".MEMBER_IDhoverpopup").css("display","none");
		});
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
		memcheck = "N";
		if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
	}else{
		$(this).css({
			"background-color" : "white"
		});
		$(this).mouseover(function(event){
			$(".MEMBER_IDhoverpopup").css("display","none");
		});
		
		$.ajax({
            url:'/petsitter/memberIdCheck.bo',
            type:'POST',
            dataType : "text", // 서버에서 보내줄 데이터 타입
            data:{"MEMBER_ID":$('#MEMBER_JOIN_ID').val()},
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success:function(data){
    			if(data == "N"){
    				$('#MEMBER_JOIN_ID').css({
    					"background-color" : "rgba(237, 156, 165, 0.15)"
    		    	});
    		    	$('#MEMBER_JOIN_ID').mouseover(function(event){
    		    		$(".MEMBER_IDhoverpopup").text('중복된 이메일 입니다.');
    		    		$(".MEMBER_IDhoverpopup").css("visibility", "Visible");
    		            $(".MEMBER_IDhoverpopup").css("top", event.target.offsetTop + 196);
    		            $(".MEMBER_IDhoverpopup").css("left", event.target.offsetLeft + 330);
    		            $(".MEMBER_IDhoverpopup").css("display", "block"); 
    		    	});
    		    	$('#MEMBER_JOIN_ID').mouseout(function(event){
    		    		$(".MEMBER_IDhoverpopup").css("display", "none");
    		    	});
    		    	memcheck1 = "N";
    		    	if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		    		$('#member_submit').show();
    		    	}else{
    		    		$('#member_submit').hide();
    		    	}
    			}else{
    				$('#MEMBER_JOIN_ID').css({
    		    		"background-color" : "white"
    		    	});
    				
    				$('#MEMBER_JOIN_ID').mouseover(function(event){
    		            $(".MEMBER_IDhoverpopup").css("display", "none"); 
    		    	});
    				memcheck1 = "Y";
    				if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		    		$('#member_submit').show();
    		    	}else{
    		    		$('#member_submit').hide();
    		    	}
    			}

        	},
        	error:function(request,status,error){
    	        alert("list ajax통신 실패!!!");
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
    	});

	}
});

$('.MEMBER_PW2check').keyup(function(event){
	var pw1 = $('#MEMBER_PW1').val();
    if($(this).val() == pw1){
    	$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".MEMBER_PW2hoverpopup").css("display", "none"); 
    	});
    	memcheck3 = "Y";
    	if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
    }else{
    	$(this).css({
    		"background-color" : "rgba(237, 156, 165, 0.15)"
    	});
    	$(this).mouseover(function(event){
    		$(".MEMBER_PW2hoverpopup").text('비밀번호가 일치하지 않습니다.');
    		$(".MEMBER_PW2hoverpopup").css("visibility", "Visible");
            $(".MEMBER_PW2hoverpopup").css("top", event.target.offsetTop + 196);
            $(".MEMBER_PW2hoverpopup").css("left", event.target.offsetLeft + 330);
            $(".MEMBER_PW2hoverpopup").css("display", "block"); 
    	});
    	$(this).mouseout(function(event){
    		$(".MEMBER_PW2hoverpopup").css("display", "none");
    	});
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
    	memcheck3 = "N";
    	if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
    }
});

$('.MEMBER_PW1check').keyup(function(event){
    if($(this).val().length<6 || $(this).val().length>16){
    	$(this).css({
    		"background-color" : "rgba(237, 156, 165, 0.15)"
    	});
    	$(this).mouseover(function(event){
    		$(".MEMBER_PW1hoverpopup").text('비밀번호는 6~16글자 입니다.');
    		$(".MEMBER_PW1hoverpopup").css("visibility", "Visible");
            $(".MEMBER_PW1hoverpopup").css("top", event.target.offsetTop + 196);
            $(".MEMBER_PW1hoverpopup").css("left", event.target.offsetLeft + 330);
            $(".MEMBER_PW1hoverpopup").css("display", "block"); 
    	});
    	$(this).mouseout(function(event){
    		$(".MEMBER_PW1hoverpopup").css("display", "none");
    	});
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
    	memcheck2 = "N";
    	if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
    }else{
    	$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".MEMBER_PW1hoverpopup").css("display", "none"); 
    	});
    	if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		};
    	memcheck2 = "Y";
    	if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
    }
});

$('.MEMBER_TELcheck').keyup(function(event){
	var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	if(!regExp.test($('#MEMBER_TEL').val())){
		$(this).css({
			"background-color" : "rgba(237, 156, 165, 0.15)"
    	});
    	$(this).mouseover(function(event){
    		$(".MEMBER_TELhoverpopup").text('전화번호 형식이 올바르지 않습니다.');
    		$(".MEMBER_TELhoverpopup").css("visibility", "Visible");
            $(".MEMBER_TELhoverpopup").css("top", event.target.offsetTop + 196);
            $(".MEMBER_TELhoverpopup").css("left", event.target.offsetLeft + 330);
            $(".MEMBER_TELhoverpopup").css("display", "block"); 
    	});
    	$(this).mouseout(function(event){
    		$(".MEMBER_TELhoverpopup").css("display", "none");
    	});
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
    	memcheck4 = "N";
    	if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
	}else{
		$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".MEMBER_TELhoverpopup").css("display", "none"); 
    	});
    	memcheck4 = "Y";
    	if(memcheck1 == "Y" && memcheck2 == "Y" && memcheck3 == "Y" && memcheck4 == "Y"){
    		$('#member_submit').show();
    	}else{
    		$('#member_submit').hide();
    	}
	}
});
	
var petcheck1 = "N";
var petcheck2 = "N";
var petcheck3 = "N";
var petcheck4 = "N";
var petcheck5 = "N";
$('#PETSITTER_EMAIL').keyup(function(event){
	var reg_email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(!reg_email.test($('#PETSITTER_EMAIL').val())){
		$(this).css({
			"background-color" : "rgba(237, 156, 165, 0.15)"
		});
		$(this).mouseover(function(event){
			$(".EMAILhoverpopup").text('이메일 형식이 올바르지 않습니다');
			$(".EMAILhoverpopup").css("visibility", "Visible");
            $(".EMAILhoverpopup").css("top", event.target.offsetTop + 196);
            $(".EMAILhoverpopup").css("left", event.target.offsetLeft + 330);
            $(".EMAILhoverpopup").css("display", "block"); 
		});
		$(this).mouseout(function(event){
			$(".EMAILhoverpopup").css("display","none");
		});
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
		petcheck5 = "N";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
    	}
	}else{
		$(this).css({
			"background-color" : "white"
		});
		$(this).mouseover(function(event){
			$(".EMAILhoverpopup").css("display","none");
		});
		petcheck5 = "Y";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
    	}

	}
});

$('.TELcheck').keyup(function(event){
	var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	if(!regExp.test($('#PETSITTER_TEL').val())){
		$(this).css({
			"background-color" : "rgba(237, 156, 165, 0.15)"
    	});
    	$(this).mouseover(function(event){
    		$(".TELhoverpopup").text('전화번호 형식이 올바르지 않습니다');
    		$(".TELhoverpopup").css("visibility", "Visible");
            $(".TELhoverpopup").css("top", event.target.offsetTop + 196);
            $(".TELhoverpopup").css("left", event.target.offsetLeft + 330);
            $(".TELhoverpopup").css("display", "block"); 
    	});
    	$(this).mouseout(function(event){
    		$(".TELhoverpopup").css("display", "none");
    	});
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
    	petcheck4 = "N";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
    	}
	}else{
		$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".TELhoverpopup").css("display", "none"); 
    	});
    	petcheck4 = "Y";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
    	}
	}
});

$('.PW2check').keyup(function(event){
	var pw1 = $('#PETSITTER_PW1').val();
	
    if($(this).val() == pw1){
    	$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".PW2hoverpopup").css("display", "none"); 
    	});
    	petcheck3 = "Y";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
    	}
    }else{
    	$(this).css({
    		"background-color" : "rgba(237, 156, 165, 0.15)"
    	});
    	$(this).mouseover(function(event){
    		$(".PW2hoverpopup").text('비밀번호가 일치하지 않습니다.');
    		$(".PW2hoverpopup").css("visibility", "Visible");
            $(".PW2hoverpopup").css("top", event.target.offsetTop + 196);
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
    	petcheck3 = "N";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
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
            $(".PW1hoverpopup").css("top", event.target.offsetTop + 196);
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
    	petcheck2 = "N";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
    	}
    }else{
    	$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".PW1hoverpopup").css("display", "none"); 
    	});
    	petcheck2 = "Y";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
    	}
    }
});


$('.IDcheck').keyup(function(event){
    if (!(event.keyCode >=37 && event.keyCode<=40)) {
        var inputVal = $(this).val();
        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
    }
    if($(this).val().length<4 || $(this).val().length>12){
    	$(this).css({
    		"background-color" : "rgba(237, 156, 165, 0.15)"
    	});
    	$(this).mouseover(function(event){
    		$(".IDhoverpopup").text('아이디는 4~12글자 입니다.');
    		$(".IDhoverpopup").css("visibility", "Visible");
            $(".IDhoverpopup").css("top", event.target.offsetTop + 196);
            $(".IDhoverpopup").css("left", event.target.offsetLeft + 330);
            $(".IDhoverpopup").css("display", "block"); 
    	});
    	$(this).mouseout(function(event){
    		$(".IDhoverpopup").css("display", "none");
    	})
		if($(this).val().length == 0){
			$(this).css({
				"background-color" : "white"
			})
		}
    	petcheck1 = "N";
    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		$('#petsitter_submit').show();
    	}else{
    		$('#petsitter_submit').hide();
    	}
    	
        }else{
    	$(this).css({
    		"background-color" : "white"
    	});
    	$(this).mouseover(function(event){
            $(".IDhoverpopup").css("display", "none"); 
    	});
    	$.ajax({
            url:'/petsitter/petsitterIdCheck.bo',
            type:'POST',
            dataType : "text", // 서버에서 보내줄 데이터 타입
            data:{"PETSITTER_ID":$('#PETSITTER_ID').val()},
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success:function(data){
    			if(data == "N"){
    				$('#PETSITTER_ID').css({
    					"background-color" : "rgba(237, 156, 165, 0.15)"
    		    	});
    		    	$('#PETSITTER_ID').mouseover(function(event){
    		    		$(".IDhoverpopup").text('중복된 아이디 입니다.');
    		    		$(".IDhoverpopup").css("visibility", "Visible");
    		            $(".IDhoverpopup").css("top", event.target.offsetTop + 196);
    		            $(".IDhoverpopup").css("left", event.target.offsetLeft + 330);
    		            $(".IDhoverpopup").css("display", "block"); 
    		    	});
    		    	$('#PETSITTER_ID').mouseout(function(event){
    		    		$(".IDhoverpopup").css("display", "none");
    		    	});
    		    	petcheck1 = "N";
    		    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		    		$('#petsitter_submit').show();
    		    	}else{
    		    		$('#petsitter_submit').hide();
    		    	}
    			}else{
    				$('#PETSITTER_ID').css({
    		    		"background-color" : "white"
    		    	});
    				
    				$('#PETSITTER_ID').mouseover(function(event){
    		            $(".IDhoverpopup").css("display", "none"); 
    		    	});
    				petcheck1 = "Y";
    		    	if(petcheck1 == "Y" && petcheck2 == "Y" && petcheck3 == "Y" && petcheck4 == "Y" && petcheck5 == "Y"){
    		    		$('#petsitter_submit').show();
    		    	}else{
    		    		$('#petsitter_submit').hide();
    		    	}
    			}

        	},
        	error:function(request,status,error){
    	        alert("list ajax통신 실패!!!");
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
    	}); 
    	
    }
    
});

var clearChk=true;
var limitByte = 2000; //바이트 최대 크기

//textarea에 마우스가 클릭되었을때 초기 메시지를 클리어
function clearMessage(frm){
	if(clearChk){
		frm.PETSITTER_INTRODUCE.value="";
		clearChk=false;
	}
}

//textarea에 입력된 문자의 바이트 수를 체크
function checkByte(frm){
	var totalByte=0;
	var message = frm.PETSITTER_INTRODUCE.value;
	
	for(var i =0;i<message.length;i++){
		var currentByte = message.charCodeAt(i);
		if(currentByte > 128){
			totalByte += 3;
		}else{
			totalByte++;
		}
		
		frm.messagebyte.value=totalByte;
		if(totalByte>limitByte){
			alert(limitByte+"Byte까지 작성가능합니다.");
			frm.PETSITTER_INTRODUCE.value=message.substring(0,limitByte);
		}
	}
}

//브라우저 확인하는 함수
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();


$(document).ready(function(){

	//아이디 저장함수
	var key1 = getCookie("member_id_key");
	$("#MEMBER_ID").val(key1);

	if($("#MEMBER_ID").val()!=""){
		$("#remember1").attr("checked",true);
	}

	$("#remember1").change(function(){
		if($("#remember1").is(":checked")){
			setCookie("member_id_key",$("#MEMBER_ID").val(),7);
		}else{
			deleteCookie("member_id_key");
		}
	});

	$("#MEMBER_ID").keyup(function(){
		if($("remember1").is(":checked")){
			setCookie("member_id_key",$("#MEMBER_ID").val(),7);
		}
	});
	
	var key2 = getCookie("petsitter_id_key");
	$("#PETSITTER_ID").val(key2);
	
	if($("#PETSITTER_ID").val()!=""){
		$("#remember2").attr("checked",true);
	}
	
	$("#remember2").change(function(){
		if($("#remember2").is("checked")){
			setCookie("petsitter_id_key",$("#PETSITTER_ID").val(),7);
		}else{
			deleteCookie("petsitter_id_key");
		}
	});
	
	$("#PETSITTER_ID").keyup(function(){
		if($("remember2").is(":checked")){
			setCookie("petsitter_id_key",$("#PETSITTER_ID").val(),7);
		}
	});
	
	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
		exdate.setDate(exdate.getDate()+exdays);
		var cookieValue = escape(value)+((exdays==null) ? "": ";expires="+exdate.toGMTString());
		document.cookie = cookieName + "= " + cookieValue;
	}
	
	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate()-1);
		document.cookie = cookirName + "= " + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName){
		cookieName = cookieName+'=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if(start != -1){
			start += cookieName.length;
			var end = cookieData.indexOf(';',start);
			if(end == -1)end = cookieData.length;
			cookieValue = cookieData.substring(start,end);
		}
		return unescape(cookieValue);
	}
	
	//delete버튼 클릭시 첨부파일 초기화하는 작업
	$(function(){
		$('#btn-delete').click(function(e){
			if($.browser.msie){
				$("#file").replaceWith($("#file").clone(true));
			}else{
				$("#file").val("");
			}
			$("#fileName").val("파일 이름");
			$("input:button[name=button]").show(); // 사진첨부버튼 보이게하기
			$("input:button[name=delete_button1]").hide(); // 사진삭제버튼 안보이게하기
		});
	});
	
	$(function(){
		$('#btn-delete1').click(function(e){
			if($.browser.msie){
				$("#file1").replaceWith($("#file1").clone(true));
			}else{
				$("#file1").val("");
			}
			$("#fileName1").val("파일 이름");
			$("input:button[name=button1]").show();
			$("input:button[name=delete_button2]").hide();
		});
	});
	
	$(function(){
		$('#btn-delete2').click(function(e){
			if($.browser.msie){
				$("#file2").replaceWith($("#file2").clone(true));
			}else{
				$("#file2").val("");
			}
			$("#fileName2").val("파일 이름");
			$("input:button[name=button2]").show();
			$("input:button[name=delete_button3]").hide();
		});
	});
	
	$(function(){
		$('#btn-delete4').click(function(e){
			if($.browser.msie){
				$("#file4").replaceWith($("#file4").clone(true));
			}else{
				$("#file4").val("");
			}
			$("#fileName4").val("파일 이름");
			$("input:button[name=button4]").show();
			$("input:button[name=delete_button4]").hide();
		});
	});
	
	$(function(){
		$('#btn-delete5').click(function(e){
			if($.browser.msie){
				$("#file5").replaceWith($("#file5").clone(true));
			}else{
				$("#file5").val("");
			}
			$("#fileName5").val("파일 이름");
			$("input:button[name=button5]").show();
			$("input:button[name=delete_button5]").hide();
		});
	});
	
	$(function(){
		$('#btn-delete6').click(function(e){
			if($.browser.msie){
				$("#file6").replaceWith($("#file6").clone(true));
			}else{
				$("#file6").val("");
			}
			$("#fileName6").val("파일 이름");
			$("input:button[name=button6]").show();
			$("input:button[name=delete_button6]").hide();
		});
	});
	
	//upload 버튼 클릭시 input file 실행함수
	$(function(){
		$('#btn-upload').click(function(e){
			e.preventDefault();
			$('#file').click();

		});
	});
	
	$(function(){
		$('#btn-upload1').click(function(e){
			e.preventDefault();
			$('#file1').click();

		});
	});
	
	$(function(){
		$('#btn-upload2').click(function(e){
			e.preventDefault();
			$('#file2').click();

		});
	});
	
	$(function(){
		$('#btn-upload3').click(function(e){
			e.preventDefault();
			$('#file3').click();
		});
	});
	
	$(function(){
		$('#btn-upload4').click(function(e){
			e.preventDefault();
			$('#file4').click();

		});
	});
	
	$(function(){
		$('#btn-upload5').click(function(e){
			e.preventDefault();
			$('#file5').click();

		});
	});
	
	$(function(){
		$('#btn-upload6').click(function(e){
			e.preventDefault();
			$('#file6').click();
		});
	});
	$(function(){
		$('#btn-upload7').click(function(e){
			e.preventDefault();
			$('#file7').click();
		});
	});
		
	//file의 값이 변할경우 실행되는 함수
	$('#file').on('change',function(){
			var fileValue = $("#file").val().split("\\"); //파일명을 배열상태로 구하는 함수
			var fileName = fileValue[fileValue.length-1]; //파일명
			$("#fileName").val(fileName); //fileName text를 파일명으로 바꿈
	 		$("#cret1").show(); //file이 등록되었을때 두번째 사진첨부칸 보여줌
	 		if(!($("input:button[name=delete_button2]").is(":visible"))){ //delete_button2가 hide상태일때 true
		 		$("input:button[name=button1]").show();
	 		}
		 	$("#fileName1").show();
			$("input:button[name=button]").hide(); //file이 등록되었을때 사진첨부 버튼 가리기
			$("input:button[name=delete_button1]").show(); //사진첨부 버튼 자리에 삭제버튼 보이기
	});
	
	$('#file1').on('change',function(){
		var fileValue1 = $("#file1").val().split("\\");
		var fileName1 = fileValue1[fileValue1.length-1];
		$("#fileName1").val(fileName1);
 		$("#cret2").show();
 		if(!($("input:button[name=delete_button3]").is(":visible"))){
 			$("input:button[name=button2]").show();
 		}
 		$("#fileName2").show();
 		$("input:button[name=button1]").hide();
		$("input:button[name=delete_button2]").show();
		
});
	$('#file2').on('change',function(){
		var fileValue2 = $("#file2").val().split("\\");
		var fileName2 = fileValue2[fileValue2.length-1];
		$("#fileName2").val(fileName2);	
		$("input:button[name=button2]").hide();
		$("input:button[name=delete_button3]").show();
});
	$('#file3').on('change',function(){
		var fileValue3 = $("#file3").val().split("\\");
		var fileName3 = fileValue3[fileValue3.length-1];
		$("#fileName3").val(fileName3);
	});
	
	$('#file4').on('change',function(){
		var fileValue5 = $("#file4").val().split("\\");
		var fileName5 = fileValue5[fileValue5.length-1];
		$("#fileName4").val(fileName5);
 		$("#house1").show();
 		if(!($("input:button[name=delete_button5]").is(":visible"))){
 			$("input:button[name=button5]").show();
 		}
 		$("#fileName5").show();
 		$("input:button[name=button4]").hide();
		$("input:button[name=delete_button4]").show();
		
});
	$('#file5').on('change',function(){
		var fileValue6 = $("#file5").val().split("\\");
		var fileName6 = fileValue6[fileValue6.length-1];
		$("#fileName5").val(fileName6);
 		$("#house2").show();
 		if(!($("input:button[name=delete_button6]").is(":visible"))){
 			$("input:button[name=button6]").show();
 		}
 		$("#fileName6").show();
 		$("input:button[name=button5]").hide();
		$("input:button[name=delete_button5]").show();
		
});
	$('#file6').on('change',function(){
		var fileValue7 = $("#file6").val().split("\\");
		var fileName7 = fileValue7[fileValue7.length-1];
		$("#fileName6").val(fileName7);	
		$("input:button[name=button6]").hide();
		$("input:button[name=delete_button6]").show();
});
	$('#file7').on('change',function(){
		var fileValue7 = $("#file7").val().split("\\");
		var fileName7 = fileValue7[fileValue7.length-1];
		$("#fileName7").val(fileName7);
	});
	
	//처음부터 숨겨놓은 input 모음
 		$("#30mP").hide();
 		$("#60mP").hide();
 		$("#12hP").hide();
 		$("#24hP").hide();
 		$("#cret1").hide();
 		$("input:button[name=button1]").hide();
 		$("#fileName1").hide();
 		$("#cret2").hide();
 		$("input:button[name=button2]").hide();
 		$("#fileName2").hide();
 		$("input:button[name=delete_button1]").hide();
 		$("input:button[name=delete_button2]").hide();
 		$("input:button[name=delete_button3]").hide();
 		$("#house1").hide();
 		$("input:button[name=button5]").hide();
 		$("#fileName5").hide();
 		$("#house2").hide();
 		$("input:button[name=button6]").hide();
 		$("#fileName6").hide();
 		$("input:button[name=delete_button4]").hide();
 		$("input:button[name=delete_button5]").hide();
 		$("input:button[name=delete_button6]").hide();
 		$("#box1").hide();
 		$("#box2").hide();
 		$("#Signinform2").hide();

 		//일반 로그인, 펫시터로그인 라디오체크시 실행되는 함수
 		$("input:radio[name=member_type]").click(function(){
 			if($("input[name=member_type]:checked").val()=="MEMBER"){ //value값이 MEMBER 일때 true
 		 		$("#Signinform").show();
 		 		$("#Signinform2").hide();
 			}else if($("input[name=member_type]:checked").val()=="PETSITTER"){
 		 		$("#Signinform").hide();
 		 		$("#Signinform2").show();
 			}
 		})
 		
 		$('#pet1').change(function(){ //방문 체크박스 변경시 실행되는 함수
 			if($("#pet1").is(":checked")){ //방문 체크박스 체크시 true
 				$("#30mP").show();
 		 		

 			}else{
	
 		 		$("#30mP").hide();
 		 		$("#60mP").hide();

 			}
 		});
 		
 		$('#pet2').change(function(){ //위탁 체크박스 변경시 실행되는 함수
 			if($("#pet2").is(":checked")){ //위탁 체크박스 체크시 true
 				$("#60mP").show();
  		 		$("#box1").show();
 		 		$("#box2").show();
 			}else{
 				$("#60mP").hide();
 		 		$("#box1").hide();
 		 		$("#box2").hide();
 			}
 		});

});
//다음 클릭시 다음 cont로 이동하는 함수
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
    if ($(this).hasClass('signup-member')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont2').show();
    }
    if ($(this).hasClass('signup-petsitter')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont').show();
    }
    if ($(this).hasClass('signup-petsitter2')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont2').show();
    }
    if ($(this).hasClass('signup-petsitter3')) {
    	geocoder.addressSearch($("#sample4_roadAddress").val(), callback);
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont3').show();
        
    }
    if ($(this).hasClass('signup-petsitter4')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont4').show();
    }
    if ($(this).hasClass('signup-petsitter5')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont5').show();
    }
    if ($(this).hasClass('signup-petsitter6')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont6').show();
    }
    if ($(this).hasClass('signup-petsitter7')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont7').show();
    }
    if ($(this).hasClass('signup-petsitter8')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont8').show();
    }
    
    //이전 클릭시 이전 cont로 이동하는 함수
    if ($(this).hasClass('signup-petsitter3-back')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont').show();
    }
    if ($(this).hasClass('signup-petsitter4-back')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont2').show();
    }
    if ($(this).hasClass('signup-petsitter5-back')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont3').show();
    }
    if ($(this).hasClass('signup-petsitter6-back')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont4').show();
    }
    if ($(this).hasClass('signup-petsitter7-back')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont5').show();
    }
    if ($(this).hasClass('signup-petsitter8-back')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont6').show();
    }
    if ($(this).hasClass('signup-petsitter9-back')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont-cont7').show();
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
