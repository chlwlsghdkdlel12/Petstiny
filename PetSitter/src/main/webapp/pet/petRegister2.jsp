<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<%@ include file="../jsp_top.jsp" %>
<!-- 반려동물 등록 완료 페이지 -->
<!doctype html>
<html lang="ko">
<style>
	/*펫시터 메인 폰트컬러 */
	.main_mintfont{
	color : #53DC98!important;
	}
	
	.main_whitefont{
	color : #ffffff!important;
	}
	
	#main_whitefont2{
	color : #ffffff!important;
	}
	
	#main_grayfont1{
	color : #707070!important;
	}
	
	#main_grayfont2{
	color : #949494!important;
	}
	/*펫시터 메인 폰트컬러 끝*/
</style>
<head>
	<title>반려동물 등록 페이지</title>
	<!-- 언택 추가 CSS -->
	<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/petRegister2.css?after">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- 본 기능 추가 시작 -->
<section class="one_box">
	<div class="container">
	
		<div class="row justify-content-center">
			<div class="col-3">
				<div class="left">
					<img class ="left_dog" src="resources/images/pet/PET8.jpg">
				</div>
			</div>
			
			<div class="col-6">
				<div class="one_title">
					<h1 class="one_text1">환영합니다!</h1>
					<!-- ID값 받아오기 -->
					<p class="one_text2">
						${id }님 마이펫 등록을 축하합니다!<br>
						보살펴조에서는 항상 회원님들의 입장에서<br>
						보다 좋은 서비스를 받으실 수 있도록 <br>
						노력하겠습니다. 감사합니다:)<br>
						
					</p>
				</div>
				<div class="one_a">
					<a href="home.me" class="go_main">메인으로</a>
				</div>
				
			</div>
			
			<div class="col-3">
				<div class="right">
					<img class="right_dog" src="resources/images/pet/PET7.jpg">
				</div>
			</div>
		</div>
		

		
		
	</div>
</section>
<!-- 본 기능 추가 종료 -->
<%@ include file="../jsp_bottom.jsp" %>
 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
</body>
</html>