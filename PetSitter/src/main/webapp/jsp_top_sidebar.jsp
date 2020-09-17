<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sidevarcheck = request.getParameter("sidevarcheck");
%>
<!DOCTYPE html>
<html>
	<style>
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
		body {
		  font-family: "Noto Sans KR", sans-serif !important;
		  font-weight: 390;
		} 
		a#MOVE_TOP_BTN {
			/* position : 화면에 고정
			right, bottom : 버튼의 위치 설정
			display : 화면에서 숨김
			z-index : 다른 태그들보다 위로 오도록 설정(z-index 가 설정된 다른 태그가 있다면 그 태그보다 커야 함)
			*/
			background: rgb(83, 220, 152);
			color : white;
			width : 90px;
			height : 40px;
			position: fixed; 
			padding : 7px 0 0 30.8px;
			border-radius : 22px;
			right: 2%;
			bottom: 50px;
			display: none;
			z-index: 999;
		}
		.site-mobile-menu {
			width: 300px;
			position: fixed;
			right: 0;
			z-index: 2000;
			padding-top: 20px;
			background: #d3d3d3!important;
			height: calc(100vh);
			-webkit-transform: translateX(110%);
			-ms-transform: translateX(110%);
			transform: translateX(110%);
			-webkit-box-shadow: -10px 0 20px -10px rgba(0, 0, 0, 0.1);
			box-shadow: -10px 0 20px -10px rgba(0, 0, 0, 0.1);
			-webkit-transition: .3s all ease-in-out;
			-o-transition: .3s all ease-in-out;
			transition: .3s all ease-in-out; 
		}
	  
		.site-mobile-menu .site-mobile-menu-body {
			background: #d3d3d3!important;
			overflow-y: scroll;
			-webkit-overflow-scrolling: touch;
			position: relative;
			padding: 0 20px 20px 20px;
			height: calc(100vh - 52px);
			padding-bottom: 150px; 
		}
		a#MOVE_SIDEBAR_BTN01{
			/* position : 화면에 고정
			right, bottom : 버튼의 위치 설정
			display : 화면에서 숨김
			z-index : 다른 태그들보다 위로 오도록 설정(z-index 가 설정된 다른 태그가 있다면 그 태그보다 커야 함)
			*/
			background: white;
			color : rgb(83, 220, 152);
			border : 1px solid #53DC98!important;
			width : 50px;
			height : 50px;
			position: fixed; 
			padding : 13px 0 0 7px;
			border-radius : 25px;
			left: 3.3%;
			bottom: 78%;
			display: none;
			z-index: 999;
			font-size : 13px;
		}
		a#MOVE_SIDEBAR_BTN02{
			/* position : 화면에 고정
			right, bottom : 버튼의 위치 설정
			display : 화면에서 숨김
			z-index : 다른 태그들보다 위로 오도록 설정(z-index 가 설정된 다른 태그가 있다면 그 태그보다 커야 함)
			*/
			background: white;
			color : rgb(83, 220, 152);
			border : 1px solid #53DC98!important;
			width : 50px;
			height : 50px;
			position: fixed; 
			padding : 13px 0 0 9px;
			border-radius : 25px;
			left: 3.3%;
			bottom: 78%;
			display: none;
			z-index: 999;
			font-size : 13px;
		}		
		div#MOVE_SIDEBAR{
			/* position : 화면에 고정
			right, bottom : 버튼의 위치 설정
			display : 화면에서 숨김
			z-index : 다른 태그들보다 위로 오도록 설정(z-index 가 설정된 다른 태그가 있다면 그 태그보다 커야 함)
			*/
			background : rgba(83, 220, 152, 0.15);
			color : #26bd72;
			width : 180px;
			height : 940px;
			position: fixed; 
			right: 90.55%;
			bottom: -15px;
			display: none;
			z-index: 900;
			font-size : 15px;
			text-align : center;
		}		

		.sideMenuBar{
		font-size : 15px;
		color : #26bd79;
		margin : 0 0 5px 0;
		}	
		.sideMenuBar:hover{
		font-size : 15px;
		color : white;
		margin : 0 0 5px 0;
		}
		
		.sideMenuBar02{
		font-size : 15px;
		color : white;
		margin : 0 0 5px 0;
		background : rgba(83, 220, 152, 0.7);
		}
				
		.sideMenuHover:hover{
		background : rgba(83, 220, 152, 0.7);
		}			
	</style>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700&display=swap" rel="stylesheet">
    
	<!-- 아이콘 css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/aos.css">
    
	<!-- MAIN CSS 다양한 폰트크기보유 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/petsitter-style.css">
</head>
<style>
	.dropdown:hover {
		background-color: rgb(83, 220, 153);
	}
	
	.dropdown:active {
		background-color: rgb(83, 220, 153);
	}
	.btn-secondary {
		background-color: rgb(83, 220, 153);
		border-color: rgb(83, 220, 153);
		vertical-align: baseline;
	}
	
	.btn-secondary:hover {
		background-color: rgb(83, 220, 153);
		border-color: rgb(83, 220, 153);
	}
	
	.btn-secondary:active {
		background-color: rgb(83, 220, 153);
		border-color: rgb(83, 220, 153);
	}
	
	.btn-secondary:focus {
		background-color: rgb(83, 220, 153);
		border-color: rgb(83, 220, 153);
		box-shadow: 0 0 0 0 rgb(83, 220, 153);
	}
	
	.dropdown-menu {
		min-width: 60px !important;
	}

	.dropdown-item:hover {
		background-color: rgb(83, 220, 153);
		color: rgb(255, 255, 255) !important;
	}
	
	.dropdown-item {
		 color: #53dc99 !important;
	}
</style>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<a href="#" class="">
						<span class="mr-2  icon-envelope-open-o"></span>
						<span class="d-none d-md-inline-block">petsitter@naver.com</span>
					</a>
					<span class="mx-md-2 d-inline-block"></span>
					<a href="#" class="">
						<span class="mr-2  icon-phone"></span>
						<span class="d-none d-md-inline-block">(02).2010.1010</span>
					</a>

					<div class="float-right" style="margin-bottom:8px;">
						<%
							if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
						%>
						<a href="loginform.me" >
							<span class = "font-size-14" >로그인 &amp; 회원가입</span>
						</a>
						<span class="mx-md-2 d-inline-block"></span>
						<%} else if(((String)session.getAttribute("rank")).equals("admin")) {%>
						<a href="admin.me">
							<span class="font-size-14" >${name }님</span>
						</a>&nbsp;&nbsp;&nbsp;
						<a href="logout.me">
							<span class="font-size-14">로그아웃</span>
						</a>
						<%} else if(((String)session.getAttribute("id")).contains("@")) { %> <!-- 일반 회원 마이 페이지 -->
						<a href="memberinfo.me">
							<span class="font-size-14" >${name }님</span>
						</a>&nbsp;&nbsp;&nbsp;
						<a href="logout.me">
							<span class="font-size-14">로그아웃</span>
						</a>
						<%} else {%> <!-- 펫시터 마이 페이지 -->
						<a href="petsitterinfo.me">
							<span class="font-size-14" >${name }님</span>
						</a>&nbsp;&nbsp;&nbsp;
						<a href="logout.me">
							<span class="font-size-14">로그아웃</span>
						</a>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<header class="site-navbar js-sticky-header site-navbar-target" role="banner" style = "background : rgb(83,220,152);">
		<div class="container" >
			<div class="row align-items-center position-relative" >
				<div class="site-logo">
					<a href="home.me" >
						<span class="main_whitefont">Petstiny</span>
					</a>
				</div>

				<div class="col-12">
					<nav class="site-navigation text-right ml-auto " role="navigation" >
						<ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
							<li class="dropdown">
								<button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 15px; font-weight: 390;">
									돌봄
								</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" >
									<a href="reservation2.br" class="dropdown-item" style="font-size:15px;">방문 돌봄</a>
									<a href="reservation1.br" class="dropdown-item" style="font-size:15px;" >위탁 돌봄</a>
								</div>
							</li>
							<li class="dropdown">
								<button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 15px; font-weight: 390;">
									게시판
								</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" >
									<a href="proboard.bo" class="dropdown-item" style="font-size:15px;" >전문가 상담 게시판</a>
									<a href="mboardlist.me" class="dropdown-item" style="font-size:15px;" >회원 게시판</a>
									<a href="pqboardlist.me" class="dropdown-item" style="font-size:15px;" >펫시터 게시판</a>
								</div>
							</li>
							<li>
								<a href="review_board.bo" class="nav-link" id="main_whitefont2" style="font-size: 15px; font-weight: 390;">이용 후기</a>
							</li>
							<li>
								<a href="noticeboardlist.me" class="nav-link" id="main_whitefont2" style="font-size: 15px; font-weight: 390;">공지사항</a>
							</li> 
						</ul>
					</nav>
				</div>
      
				<div class="toggle-button d-inline-block d-lg-none">
					<a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black">
						<span class="icon-menu h3"></span>
					</a>
				</div>
			</div>
		</div>
		<!-- 스크롤 위로올라가기 버튼 html-->
		<a id="MOVE_TOP_BTN" href="#">TOP</a>
		
		
		<a id="MOVE_SIDEBAR_BTN01" href="#">MENU</a>
		<a id="MOVE_SIDEBAR_BTN02" href="#">BACK</a>		
		<div id="MOVE_SIDEBAR">
			<br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<%if(sidevarcheck.equals("home")) {%>
			<a href="home.me" class = "sideMenuBar02"><div class = "sideMenuHover sideMenuBar02">HOME</div></a>
			<%}else{%>
			<a href="home.me" class = "sideMenuBar"><div class = "sideMenuHover">HOME</div></a>
			<%} %>
			
			<br/>
			<%if(sidevarcheck.equals("reservation2")) {%>			
			<a href="reservation2.br" class = "sideMenuBar02"><div class = "sideMenuHover sideMenuBar02">방문 돌봄</div></a>			
			<%}else{%>
			<a href="reservation2.br" class = "sideMenuBar"><div class = "sideMenuHover">방문 돌봄</div></a>		
			<%} %>
			
			<%if(sidevarcheck.equals("reservation1")) {%>				
			<a href="reservation1.br" class = "sideMenuBar02"><div class = "sideMenuHover sideMenuBar02">위탁 돌봄</div></a>			
			<%}else{%>
			<a href="reservation1.br" class = "sideMenuBar"><div class = "sideMenuHover">위탁 돌봄</div></a>				
			<%} %>			
												
			<br/>
			<%if(sidevarcheck.equals("proboard")) {%>					
			<a href="proboard.bo" style="font-size:15px;" class = "sideMenuBar02"><div class = "sideMenuHover sideMenuBar02">전문가 상담 게시판</div></a>
			<%}else{%>
			<a href="proboard.bo" style="font-size:15px;" class = "sideMenuBar"><div class = "sideMenuHover">전문가 상담 게시판</div></a>
			<%} %>					
			
			<%if(sidevarcheck.equals("mboardlist")) {%>										
			<a href="mboardlist.me" style="font-size:15px;" class = "sideMenuBar02"><div class = "sideMenuHover sideMenuBar02">회원 게시판</div></a>
			<%}else{%>			
			<a href="mboardlist.me" style="font-size:15px;" class = "sideMenuBar"><div class = "sideMenuHover">회원 게시판</div></a>
			<%} %>				
			
			<%if(sidevarcheck.equals("pqboardlist")) {%>				
			<a href="pqboardlist.me" style="font-size:15px;" class = "sideMenuBar02"><div class = "sideMenuHover sideMenuBar02">펫시터 게시판</div></a>
			<%}else{%>					
			<a href="pqboardlist.me" style="font-size:15px;" class = "sideMenuBar"><div class = "sideMenuHover">펫시터 게시판</div></a>
			<%} %>					
			
			<br/>
			<%if(sidevarcheck.equals("review_board")) {%>				
			<a href="review_board.bo" class = "sideMenuBar02"><div class = "sideMenuHover sideMenuBar02">이용 후기</div></a>	
			<%}else{%>				
			<a href="review_board.bo" class = "sideMenuBar"><div class = "sideMenuHover">이용 후기</div></a>				
			<%} %>				
			
			<%if(sidevarcheck.equals("noticeboardlist")) {%>						
			<a href="noticeboardlist.me" class = "sideMenuBar02"><div class = "sideMenuHover sideMenuBar02">공지사항</div></a>	
			<%}else{%>					
			<a href="noticeboardlist.me" class = "sideMenuBar"><div class = "sideMenuHover">공지사항</div></a>				
			<%} %>		

		</div>
</header>
</body>
</html>