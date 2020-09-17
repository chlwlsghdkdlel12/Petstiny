<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.petsitter.MemberController.*" %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<PetVO> list = (ArrayList<PetVO>)request.getAttribute("list");
	String memberId = (String)request.getAttribute("memberId");
	String petPhoto = (String)request.getAttribute("petPhoto");
	String petName = (String)request.getAttribute("petName");	
%>
<%@ include file="../jsp_top.jsp" %>
<!-- 반려동물 등록 -->
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
	<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/myPet.css?after">
	<!-- 모달창 제이쿼리 UI -->
	<link href="/resources/jqueryui/jquery-ui.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="/resources/jqueryui/jquery-ui.js"></script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- 본 기능 추가 시작 -->
<section class="top_box">
	<div class="container">
		<div class="row">
		
			<div class="col-4">
				<div class="insert">
					<div class="p1">
						<p><i class="fas fa-paw" id="i_1"></i></p>
					</div>
					<div class="p2">
						<p>서비스 이용을 위해서</p>
						<p>마이펫 등록을 해주세요</p>
					</div>
					<div class="insert_div">
						<a href="petRegister.me" class="insert_btn">마이펫 등록	</a>
					</div>
				</div>
			</div>
												  	
			<div class="col-4">
				<div class="update">
					<div class="p1">
						<p><i class="fas fa-pencil-alt" id="i_2"></i></p>
					</div>
					<div class="p2">
						<p>1년 주기로</p>
						<p>정보 수정을 권장합니다</p>
					</div>
					<div class="update_div">
						<a href="#" class="update_btn" onclick="openModalUp();">마이펫 수정</a>
					</div>
				</div>
			</div>
			
			<div class="col-4">
				<div class="delete">
					<div class="p1">
						<p><i class="far fa-trash-alt" id="i_3"></i></p>
					</div>
					<div class="p2">
						<p>삭제가 필요할 경우</p>
						<p>아래 버튼을 눌러주세요</p>
					</div>
					<div class="delete_div">
						<a href="#" class="delete_btn" onclick="openModalDel();">마이펫 삭제</a>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col">
				<div class="lr">
					<div class="left">
						<div class="l-1">
							<a href="memberinfo.me?id=${id}" class="left-btn"><i class="far fa-hand-point-left" id="left-icon"></i></a>
						</div>
						<div class="l-2">
							<a href="memberinfo.me?id=${id}" class="left-text">마이페이지</a>
						</div>
					</div>

					<div class="right">
						<div class="r-1">
							<a href="reservation1.br" class="right-text">예약하기</a>
						</div>
						<div class="r-2">
							<a href="reservation1.br" class="right-btn"><i class="far fa-hand-point-right" id="right-icon"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<!-- 모달 모달 모달 --><!-- 모달 모달 모달 --><!-- 모달 모달 모달 -->
<!-- 모달 모달 모달 --><!-- 모달 모달 모달 --><!-- 모달 모달 모달 -->
<!-- 수정 모달창 -->
<!-- 모달창 백그라운드 -->
<div id="modalUp" class="searchModalUp">
	<!-- 모달창 내용물 -->
	<div class="search-modal-content">
		<div class="page-header">
			<h1 class="md-header">마이펫 현황</h1>
			<p class="md-header-p">정보수정을 원하는 펫을 선택해주세요!</p>
		</div>
		<div class="row">
			
			<%
  			for(int i=0; i<list.size(); i++) {
	  		PetVO pet = list.get(i);
			%>
			<div class="col-4">
				<div class="list-div">
					<div class="pet-div">
						<div class="petName">
							<%=pet.getPET_NAME()%>
						</div>
						<div class="petPhoto">
							 <a href ="petSelect.me?name=<%=pet.getPET_NAME()%>"><img class="petImg" id="pet-<%=i%>" src="/filepath/<%=pet.getPET_PHOTO()%>"></a> 
						</div>
					</div>
				</div>
			</div>
		<% } %>
		</div>
		<div class="row">
			<div class="close" onClick="closeModalUp();">
				<p class="close_btn">닫기</p>
			</div>
		</div>
	</div><hr>
</div>


<!-- 삭제 모달창  시작-->
<!-- 모달창 백그라운드 -->
<div id="modalDel" class="searchModalDel">
	<!-- 모달창 내용물 -->
	<div class="search-modal-content">
		<div class="page-header">
			<h1 class="md-header">마이펫 현황</h1>
			<p class="md-header-p">정보삭제를 원하는 펫을 선택해주세요!</p>
		</div>
		<div class="row">
			
			<%
  			for(int i=0; i<list.size(); i++) {
	  		PetVO pet = list.get(i);
			%>
			<div class="col-4">
				<div class="list-div">
					<div class="pet-div">
						<div class="petName">
							<%=pet.getPET_NAME()%>
						</div>
						<div class="petPhoto">
							 <a href ="petDelete.me?name=<%=pet.getPET_NAME()%>"><img class="petImg" id="pet-<%=i%>" src="/filepath/<%=pet.getPET_PHOTO()%>"></a> 
						</div>
					</div>
				</div>
			</div>
		<% } %>
					
		</div>
		<div class="row">
			<div class="close" onClick="closeModalDel();">
				<p class="close_btn">닫기</p>
			</div>
		</div>
	</div><hr>
</div>
<!-- 모달 모달 모달 --><!-- 모달 모달 모달 --><!-- 모달 모달 모달 -->
<!-- 모달 모달 모달 --><!-- 모달 모달 모달 --><!-- 모달 모달 모달 -->

<!-- 본 기능 추가 종료 -->
<%@ include file="../jsp_bottom.jsp" %>
 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
    <!-- 아이콘 -->   
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    
<!-- 툴팁창 -->
<script>
  $(function () {
		$('[data-toggle="tooltip"]').tooltip()
	});
</script>

<!-- 모델 열고 닫기 (수정)-->
<script>
	function openModalUp() {
		$("#modalUp").show();
	};

	function closeModalUp() {
		$('.searchModalUp').hide();
	};
</script>

<!-- 모델 열고 닫기 (삭제)-->
<script>
	function openModalDel() {
		$("#modalDel").show();
	};

	function closeModalDel() {
		$('.searchModalDel').hide();
	};
</script>
</body>
</html>