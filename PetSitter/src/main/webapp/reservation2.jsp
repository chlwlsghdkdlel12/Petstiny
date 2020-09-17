<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.PetsitterVO" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	PetsitterVO petsittervo = (PetsitterVO)request.getAttribute("petsittervo");
	ArrayList<PetsitterVO> petsitterlist = (ArrayList<PetsitterVO>)request.getAttribute("petsitterlist");
	ArrayList<UsinglistVO> usinglist = (ArrayList<UsinglistVO>)request.getAttribute("usinglist");

%>
<jsp:include page="./jsp_top_sidebar.jsp">
	<jsp:param value="reservation2" name="sidevarcheck"/>
</jsp:include>
<!-- 위탁 돌봄 -->
<!doctype html>
<html lang="ko">
<head>
	<title>방문 돌봄 예약 페이지</title>
	<!--  언택 추가 CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/UT_CSS/reservation2.css?after">
	
	<!-- 데이트피커 ver.2(bootstrap) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<!-- 데이트피커ver.2(bootstrap_design) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
	  
	<!-- 타임피커 -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- 본 기능 추가 시작 -->
<!-- top_box 시작 -->      
<!-- 주소 검색 & 예약날짜 & 맞춤조건 등.. 시작-->
<form name="frm_ins" method="post" enctype="multipart/form-data" target="frm_hiddenFrame" onsubmit="return check_reservation();">
<section class="top_box">
	<div class="container">
	
		<div class="row justify-content-center">
			<div class="col-3">
			</div>
			<div class="col-6">
				<div class="top_box_title">
					<h1 class="top_box_text1">방문 돌봄</h1>
					<p class="top_box_text2">시터가 회원님 집으로 방문하여 돌봐드립니다!</p>	
				</div>
			</div>
			<div class="col-3">
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="col">
				<div class="date">
					<h1 class="top_box_text3">날짜를 설정해주세요!</h1>
					<input type="text" id="datePicker_start" class="form-control" placeholder="시작 날짜">
				</div>
			</div>
			<div class="col">	
				<div class="time">
					<h1 class="top_box_text3">시간을 설정해주세요!</h1>
					<input type="text" name="time" class="timepicker" id="timePicker_start" placeholder="시작 시간">
					<i class="fas fa-arrow-right"></i>
  				<input type="text" name="time" class="timepicker" id="timePicker_end" placeholder="종료 시간">
				</div>
			</div>
		</div>
		
		<!-- 지역 선택 필터 -->
		<div class="row">
			<div class="col">
				<div class="address">
					<h1 class="top_box_text4">원하는 지역을 한군데 선택해주세요!</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="fuckyou">
					<label for="area_ck1" class="area_lb" id="area_lb1"> 서울/경기</label>
						<input type="checkbox" name="area" id="area_ck1" value="서울/경기" class="hide" />
					<label for="area_ck2" class="area_lb" id="area_lb2"> 인천</label>
						<input type="checkbox" name="area" id="area_ck2" value="인천" class="hide" />
					<label for="area_ck3" class="area_lb" id="area_lb3"> 강원</label>
						<input type="checkbox" name="area" id="area_ck3" value="강원" class="hide" />
					<label for="area_ck4" class="area_lb" id="area_lb4"> 부산/울산/경남</label>
						<input type="checkbox" name="area" id="area_ck4" value="부산/울산/경남" class="hide" />
					<label for="area_ck5" class="area_lb" id="area_lb5"> 대구/경북</label>
						<input type="checkbox" name="area" id="area_ck5" value="대구/경북" class="hide" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="fuckyou">
					<label for="area_ck6" class="area_lb" id="area_lb6"> 전북</label>
						<input type="checkbox" name="area" id="area_ck6" value="전북" class="hide" />
					<label for="area_ck7" class="area_lb" id="area_lb7"> 광주/전남</label>
						<input type="checkbox" name="area" id="area_ck7" value="광주/전남" class="hide" />
					<label for="area_ck8" class="area_lb" id="area_lb8"> 충북</label>
						<input type="checkbox" name="area" id="area_ck8" value="충북" class="hide" />
					<label for="area_ck9" class="area_lb" id="area_lb9"> 대전/충남</label>
						<input type="checkbox" name="area" id="area_ck9" value="대전/충남" class="hide" />
					<label for="area_ck10" class="area_lb" id="area_lb10"> 제주</label>
						<input type="checkbox" name="area" id="area_ck10" value="제주" class="hide" />
				</div>
			</div>
		</div>
		
		<!-- 픽업, 대형견, 마당, 노견 조건 필터 -->
		<div class ="row">
			<div class="col">
				<div class="custom">
					<h1 class="top_box_text4">원하는 조건을 선택해주세요!</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="fuckyou">
					<label for="custom_ck1" class="custom_lb" id="custom_lb1"> 픽업 </label> 
						<input type="checkbox" name="custom" id="custom_ck1" value="픽업" class="hide"/>
					<label for="custom_ck2" class="custom_lb" id="custom_lb2"> 대형견</label>
						<input type="checkbox" name="custom" id="custom_ck2" value="대형견" class="hide" />
					<label for="custom_ck3" class="custom_lb" id="custom_lb3"> 마당 </label> 
						<input type="checkbox" name="custom" id="custom_ck3" value="마당"  class="hide" />
				  <label for="custom_ck4" class="custom_lb" id="custom_lb4"> 노견 </label> 
				  	<input type="checkbox" name="custom" id="custom_ck4" value="대형견" class="hide"/>
				</div>
			</div>
		</div>
		
			
	</div>
</section></form>




<!-- 예약날짜 & 맞춤조건 등.. 종료-->      
<!-- top_box 종료 --> 


<!-- middle_box 시작 -->
<!-- 맞춤조건에 의한 펫시터 뷰 시작-->
<section class="middle_box">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="middle_box_title">
					<h1 class="middle_box_text1">모든 펫시터를 만나보세요!</h1>
				</div>
			</div>
			<div class="col">
		  	<div class="middle_box_btn">
		  		<label for="order_ck1" class="order_lb" id="order_lb1">최신순</label>
		  			<input type="radio" name="order" id="order_ck1" value="최신순" class="hide" />
		  		<label for="order_ck2" class="order_lb" id="order_lb2">평점순</label>
						<input type="radio" name="order" id="order_ck2" value="평점순" class="hide" />
				</div>
			</div>
		</div>

		
		
		<div class="row" id="petsitter_middle_box">
			
		</div></div><br><br>
</section>

     
<!-- 맞춤조건에 의한 펫시터 뷰 종료-->     
<!-- middle_box 종료 -->





<!-- 본 기능 추가 종료 -->
<%@ include file="jsp_bottom.jsp" %>
 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
  
<!--
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		★★★★★★★★★★★★★★★★★★★★★기능구현 JS★★★★★★★★★★★★★★★★★★★★★
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
-->
	<script src="<c:url value="/resources/js/UT_JS/reservation_color.js"/>"></script>
  <script src="<c:url value="/resources/js/UT_JS/reservation_view2.js"/>"></script>
<!--
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		★★★★★★★★★★★★★★★★★★★★★기능구현 JS★★★★★★★★★★★★★★★★★★★★★
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--> 

<!-- 아이콘 -->   
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>  
	
<!-- 데이트피커 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- 달력(한국어버젼_) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
	
<!-- 타임피커 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
	
	
	
	
<!-- 데이트피커 자스코드 -->
<!-- 시작날짜 -->
	<script type="text/javascript">
		$('#datePicker_start').datepicker({
				format : "yyyy-mm-dd", 			//달력에서 클릭시 표시할 값 형식
				language : "ko", 						//언어
				orientation: "bottom auto", //아래에 뜨게
				todayHighlight : true,			//오늘날짜 색상표시
				autoclose : true						//날짜누르면 닫힘.
		});
	</script>	
	
	
<!-- 타임피커 자스코드 -->
<!-- 시작시간 -->
	<script type="text/javascript">
		$('#timePicker_start').timepicker({
				timeFormat: 'p h:mm',
 		    interval: 60,
		    startTime: '',  
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true,
		    minTime: '09',
		    maxTime: '11:00pm',
		});
	</script>
	<script type="text/javascript">
<!-- 종료시간 -->		
		$('#timePicker_end').timepicker({
				timeFormat: 'p h:mm',
		    interval: 60,
		    minTime: '09',
		    maxTime: '11:00pm',
		    /* defaultTime: '14', */
		    startTime: '00:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	</script>
</body>
</html>