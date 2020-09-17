<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.petsitter.ReservationController.*" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>

<%
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>)request.getAttribute("member_list");
	List<PetsitterVO> petsitterList = (List<PetsitterVO>)request.getAttribute("petsitter_list");
	List<PetsitterQnaBoardVO> pqboardlist = (List<PetsitterQnaBoardVO>)request.getAttribute("pqboard_list");

	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();


SimpleDateFormat format1;
format1 = new SimpleDateFormat("yyyy-MM-dd");

	ArrayList<PetVO> list = (ArrayList<PetVO>)request.getAttribute("list");
	String memberId = (String)request.getAttribute("memberId");
	String petPhoto = (String)request.getAttribute("petPhoto");
	String petName = (String)request.getAttribute("petName");	
	int point = (int)request.getAttribute("point");
%>

<% 
	 /*분류 (아이디 / 주소 / 닉네임 / 등급 / 후기개수 / 자격증이름 / 자격증여부x2 / 자기소개 / 가능서비스 / 자격증 보유개수)*/
	 String startdate = (String)request.getAttribute("startdate");
	 String enddate = (String)request.getAttribute("enddate");
	 String petsitter_id= (String)request.getAttribute("petsitter_id");
	 String addr = (String)request.getAttribute("addr");
	 String mapaddr1 = "";
	 String mapaddr2 = ""; //상세주소
	 String ad = (String)request.getAttribute("safeaddr");
	 String[] safeaddr = ad.split(",");
	 String address= (String)request.getAttribute("address");
 	 if(safeaddr[0].equals("N")){
 		 mapaddr1 = addr; //도로명
 		 mapaddr2 = address; //경기 안산시
	 }else{
	 	 mapaddr1 = safeaddr[0];
	 	 mapaddr2 = safeaddr[1];
	 }
	 String nickname= (String)request.getAttribute("nickname");
	 String rank= (String)request.getAttribute("rank");
	 int review_count= (int)request.getAttribute("review_count");
	 String cert_list= (String)request.getAttribute("cert_list");
	 String introduce= (String)request.getAttribute("introduce");
	 String service = (String)request.getAttribute("service");

	 
	 String cert_count = (String)request.getAttribute("cert_count");
	 
	 
	 /*분류 (사진 ㅡ 프로필 / 자격증 / 집 / 증명사진)*/
	 String profile= (String)request.getAttribute("profile");	
	 String cert_photo1= (String)request.getAttribute("cert_photo1");
	 String cert_photo2= (String)request.getAttribute("cert_photo2");
	 String cert_photo3= (String)request.getAttribute("cert_photo3");
	 String home_photo1 = (String)request.getAttribute("home_photo1");
	 String home_photo2 = (String)request.getAttribute("home_photo2");
	 String home_photo3 = (String)request.getAttribute("home_photo3");
	 String proof = (String)request.getAttribute("photo_upfile");
	 
	 /*분류 (날짜  / 시간)*/ 
	 String start_date= (String)request.getAttribute("start_date");
	 String end_date= (String)request.getAttribute("end_date");
	 String start_time= (String)request.getAttribute("start_time");
	 String end_time= (String)request.getAttribute("end_time");

	 String radio_basic= (String)request.getAttribute("radio_basic");
	 
	 /*분류  (위탁60분가격 / 방문 30분가격 / 위탁1박가격 / 위탁1박가격(+대형견) / 방문60분가격 / 방문60분가격(+대형견)*/
	 String price = (String)request.getAttribute("price");
	 String price2 = (String)request.getAttribute("price2");
	 int eprice24= (int)request.getAttribute("price24");
	 String price24 = String.valueOf(eprice24);
	 int ebigPrice= (int)request.getAttribute("bigPrice");
	 String bigPrice = String.valueOf(ebigPrice);
	 int eprice60= (int)request.getAttribute("price60");
	 String price60 = String.valueOf(eprice60);
	 int ebigPrice2= (int)request.getAttribute("bigPrice2");
	 String bigPrice2 = String.valueOf(ebigPrice2);
%> 
<%@ include file="jsp_top.jsp" %>
<!doctype html>
<html lang="ko">
<style>
.datepicker table{
	width : 330px!important;
	height : 330px!important;
}
.disabled-date{
	background-color : rgb(83, 220, 152)!important;
}
.datepicker table tr td.active.active.focus, .datepicker table tr td.active.active:focus, .datepicker table tr td.active.active:hover, .datepicker table tr td.active.highlighted.active.focus, .datepicker table tr td.active.highlighted.active:focus, .datepicker table tr td.active.highlighted.active:hover, .datepicker table tr td.active.highlighted:active.focus, .datepicker table tr td.active.highlighted:active:focus, .datepicker table tr td.active.highlighted:active:hover, .datepicker table tr td.active:active.focus, .datepicker table tr td.active:active:focus, .datepicker table tr td.active:active:hover {
    background-color: rgb(83, 220, 152)!important;
    border-color: rgb(83, 220, 152)!important;
}

.my-hr1 {
	border: 0;
  height: 1.7px;
  width : 97%;
  background: #ccc;    
}		
	
.my-hr2 {
	border: 0;
  height: 1.5px;
  width : 97%;
  background: #ccc;
}	 

	.my-hr3 {
	border: 0;
  height: 1.5px;
  width : 100%;
  background: #ccc;   
}	 
	
.petup {
	height : 52px; 
	margin : 8px 0 0 0; 
	padding : 8px 0 0 0;
}

.dateP{ 
	text-align : center; 
	font-size : 15px;
}
	
choiceP{ 
	text-align : center; 
	font-size : 15px;
}
.postscript {
	width : 100%; 
	height : 40px; 
	font-weight : bold;
	padding : 3px 0 0 10px; 
	margin-left : 3.3%;
	border-radius : 5px;	
}
.ui-datepicker{
    margin-top: 300px;
}	  	   

.mybold {
	font-weight : bold;
}

.main_redfont0{
	color : rgba(211,84,0)!important;
}

.postscriptimg { 
	width : 130px; 
	height: 130px; 
	border-radius : 5px;
}

.postscriptimg02 {
	margin : 0 5px 0 0; 
	width : 80px; 
	height: 80px; 
	border-radius : 3px;
}


.circleprofileimg {
	width : 70px; 
	height : 70px; 
	border-radius : 35px; 
	background : gray;	
	}
	
.circleprofileimg02 {
	width : 60px; 
	height : 60px; 
	border-radius : 30px; 
	background : gray;	
	}

	
/*테이블 css 시작*/
th, td {
			color : #5e5e5e!important;
			font-size : 15px;
	}
		
		/*nth-child(1) 칼럼 순서 불러서 css 입혀준다.*/
th:nth-child(1), th:nth-child(2), th:nth-child(3), th:nth-child(4), th:nth-child(5) {
	text-align: center;
 }
	
td:nth-child(1), td:nth-child(2), td:nth-child(4), td:nth-child(5) {
	text-align: center;
}
.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
	background-color: #F8F8F8;
}
		/*테이블 css 종료*/
</style>
<head>
	<title>돌봄 예약 페이지</title>
	<!-- 데이트피커 ver.2(bootstrap) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<!-- 데이트피커ver.2(bootstrap_design) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
	  
	<!-- 타임피커 -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js">
	  
	<!-- 추가CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/UT_CSS/foster_view.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/JH_CSS/foster_view.css?after">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- 본 기능 추가 시작 -->
	<input type="hidden" value="${id }" id="MEMBER_ID" />
		<div class = "container">
			<div class = "row justify-content-center">
				<div class = "col-md-5" style = "margin-top : 50px;">
					<div>
						<hr class ="my-hr1" style = "margin-top : 8%" />
						<div class = "row justify-content-center">				
							<div class ="col-10">
								<!--선택된 큰 이미지  -->
								<div class = "row">
									<div class ="col-12">
										<%
											if(home_photo1.equals("N") || home_photo1.equals("undefined"))
											{
										%>
										<img src = "resources/images/noimg.png"  id ="choiceimage">									
										<%
											} else
											{
										%>
										<img src = "/filepath/<%=home_photo1%>" id ="choiceimage">
										<%
											}
										%>	 
									</div>
								</div>
							</div>	
						</div>
						<p/>
						<div>
							<hr class ="my-hr1" />
						</div>
						
						<div class = "row justify-content-center">
							<div class = "col-10">
								<div class = "row">
									<!-- 집 사진  3장-->
									<div class = "col-4">
											<%if(home_photo1.equals("N") || home_photo1.equals("undefined"))
											  {
											%>	<a href = "#" onclick ="toggleImg1()"><img class="home_photo" src = "resources/images/noimg.jpg"></a>										
											<%}else
												 {
											%>	<a href = "#" onclick ="toggleImg1()"><img class="home_photo" src = "/filepath/<%=home_photo1%>"></a>
											<% } %>		
										</div>
										
										<div class = "col-4">
											<%if(home_photo2.equals("N") || home_photo2.equals("undefined"))
											  {
											%>	<a href = "#" onclick ="toggleImg2()"><img class="home_photo" src = "resources/images/noimg.jpg"></a>										
											<%}else
												 {
											%>	<a href = "#" onclick ="toggleImg2()"><img class="home_photo" src = "/filepath/<%=home_photo2%>"></a>
											<% } %>		
										</div>
										
										<div class = "col-4">
											<%if(home_photo3.equals("N") || home_photo3.equals("undefined"))
											  {
											%>	<a href = "#" onclick ="toggleImg3()"><img class="home_photo" src = "resources/images/noimg.jpg"></a>										
											<%}else
												 {
											%>	<a href = "#" onclick ="toggleImg3()"><img class="home_photo" src = "/filepath/<%=home_photo3%>"></a>
											<% } %>	
										</div>
										
									</div>
									
									<hr class ="my-hr1" />
	
								</div>	
							</div>

      			</div>	
      		</div>			
  			 	<!-- 예약 폼 -->
      		<div class = "col-md-5" style = "margin-top : 50px;">
      			<div class ="row justify-content-center">
      				<!-- 본작업 시 height 지우고 하기 -->
      				<div class = "col-10" style = "background : rgba(224, 224, 224, 0.65);  height : 100%; border-radius: 25px;">
      					<div class = "row justify-content-center">
      						<div class = "col-12 font-size-18 main_grayfont3 text-center mybold" style = "margin : 24px 0 3px 0;">
      							<div>예약하기</div>
      						</div>
      						<div class = "col-12 font-size-13 main_grayfont3 text-center">
      							<div>자신의 애견정보를 기입하지 않으신 분은</div>
      							<span class = "mybold">나의 반려동물 등록하기</span><span>를 누르세요 </span>
      						</div>
      						<div class = "col-12 main_mint text-center petup" style="border-radius: 0px 50px 50px 0px;">
      							<a class = "font-size-21 main_whitefont mybold" id="petinsert" href="#">나의 반려동물 등록하기 GO!</a>
      						</div>
      						<div class = "col-12 text-center">
      							<label for="custom_rd1" class="custom_lb" id="custom_lb1"> 위탁</label>
											<input type="radio" name="type" id="custom_rd1" value="위탁" class="hide" 
											
											<%if(radio_basic.equals("we"))
											{
											%>
												checked="checked"/>	
											<% 
											}else if(!radio_basic.equals("we"))
											{
											%>	/>
											<% }  %> <!-- radio default값 설정해주기(위탁으로 들어왔을경우 default값 위탁체크) -->
											
								
      							<label for="custom_rd2" class="custom_lb" id="custom_lb2">방문</label>
      								<input type="radio" name="type" id="custom_rd2" value="방문" class="hide"
      								<%if(radio_basic.equals("bang"))
											{
											%>
												checked="checked"/>	
											<% 
											}else if(!radio_basic.equals("bang"))
											{
											%>	/>
											<% }  %> <!-- radio default값 설정해주기(방문으로 들어왔을경우 default값 방문체크) -->
									</div>

									
									<div class = "col-12 text-center font-size-15 main_grayfont3 mybold" style = "margin-top : 8px;">
									펫시터 이용 날짜
									</div>
									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;"id="hide1">
												<input type="text" id="datePicker_start" class="form-control dateP" placeholder ="Check In Date" value="<%=start_date%>" style = "height : 41px;" autocomplete=off>
											</div>
											<div class = "col-1" id = "hide2" style = "padding : 0 0">
												<svg class="bi bi-chevron-compact-right main_grayfont4" width="30px" height="30px" style = "margin-top : 11px;"viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
												</svg>
											</div>
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" id="datePicker_end" class="form-control dateP" placeholder ="Check Out Date" style="height:41px;" autocomplete=off
                                    <%if(end_date.equals("undefined")) {%><%}else {%> value="<%=end_date%>" <%}%>> 
											</div>
										</div>
									</div>

									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class="col" style ="color: #5e5e5e; font-weight: bold; font-size: 15px; margin-top: 10px;">
												펫시터 이용 시간
											</div>

										</div>
									</div>
									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" name="time" class="form-control timepicker dateP" id="timePicker_start" placeholder="Check In Time" value="<%=start_time%>" style = "height : 41px;" autocomplete=off>
											</div>
											<div class = "col-1" style = "padding : 0 0">
												<svg class="bi bi-chevron-compact-right main_grayfont4" width="30px" height="30px" style = "margin-top : 11px;"viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
												</svg>
											</div>
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" name="time" class="form-control timepicker dateP" id="timePicker_end" placeholder="Check Out Time" value="<%=end_time%>" style = "height : 41px;" autocomplete=off>
											</div>
										</div>
									</div>
									<div class = "col-12 text-center font-size-15 main_grayfont3 mybold" style = "margin-top: 15px; margin-bottom: -8px">
									나의 반려동물 정하기
									</div>
									<div class = "col-10 text-center font-size-15 main_grayfont3 mybold float-left" style = "margin-top : 8px;">
										<div class ="row">
											<div class = "col-10" style = "padding : 0; margin : 4px 0 0 0;">
											  <select id="choicepet" name="choicepet" class="form-control choiceP" style = "height : 37px; width : 95%; border-radius: 50px;">
											  <option value="">마이펫을 선택해주세요 :)</option>
												  	<% 
												  		for(int i=0; i<list.size(); i++) {
												  		PetVO pet = list.get(i);
												  	%>
												  		<option value="<%=pet.getPET_NAME()%>(<%=pet.getPET_SIZE()%>)" id="op<%=i%>" class="petOption"><%=pet.getPET_NAME()%></option>
												  	<%	
												  		}
												  	%>
		
										 		</select>
											</div>
											<div class = "col-2" style = "padding : 0; margin : 4px 0 0 0;">
												<button type="button" class="plus" id="plus1">추가</button>
												<input type="hidden" value="<%=price%>" id="price"/>
												<input type="hidden" value="<%=price2%>" id="price2"/>
												
											</div>
										</div>
									</div>
									
									<div class = "col-11 text-center font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;">
										<div class = "petcost1" id="cost1">
											<p class="p_view"> 펫을 추가하시면 견적이나와요! </p>
											<!-- 자바스크립트에서 태그 추가됨 -->
										</div>
										
										<hr class = "my-hr3" style = "margin : 8px 0;">
										<div class="petcost2" id="cost2">
										<p>예상 총 비용 : </p>
										</div>
											<button type="button" class="go-regi" id= "paycheck">예약 신청</button>
									</div>
      					</div>
      				</div>
      			</div>
      		</div>
     		</div>
     	</div>	
<!--이미지와 메인 예약 폼 종료 -->


<br/><br/><hr class ="my-hr2" />

	
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="aa">
					<div class="a1">
						<span>Profile</span>
					</div>
					<div class="a2">
						<span>Introduce</span>
					</div>
				</div>
				
				<div class="imgDiv">
					<div class="profile">
						<%if( profile.equals("N") || profile.equals("undefined") ){
							%>	<img class="profileImg" src="resources/images/noimg.jpg" />
							<%
								}else{				
							%>	<img class="profileImg" src="/filepath/<%=profile%>" />
							<% 	
								}
							%>
					</div>
					<div class="introduce">
						<div class="middle_div1">
							<p class="middle_text1">
								<%if(introduce.equals("N")){
								%>	등록된 자기소개가 없습니다.
								<%
									}else{
								%>	<%=introduce%>
								<%  	
									}
								%>
							</p>
						</div>
						
					</div>
				</div>
				
				<div class="bb">
					<div class="b1">
					</div>
				</div>
				
			</div>
		</div>


		<div class="row">	
			<div class="col">
				<div class="top-cert">
					cert
				</div>
			</div>
			
			<div class="col">
					<div class="top-info">
						info
					</div>
			</div>
		</div>
		
		<div class="row">	
		
			<div class="col">
				<div class="cert">
					<div class="certImg1">
							<%if(cert_photo1.equals("N") || cert_photo1.equals("undefined"))
								  {
								%>	<img src = "resources/images/noimg.jpg"  id ="choiceimage2">									
								<%}else
									 {
								%>	<img src = "/filepath/<%=cert_photo1%>" id ="choiceimage2">
								<% } %>	 
					</div>
						
					<div class="certImg2">
						<%if(cert_photo1.equals("N") || cert_photo1.equals("undefined"))
					  {
						%>	<a href = "#none" onclick ="toggleImg4()"><img class="imgCert" id="cert_photo1" src = "resources/images/noimg.jpg"></a>										
						<%}else
							 {
						%>	<a href = "#none" onclick ="toggleImg4()"><img class="imgCert" src = "/filepath/<%=cert_photo1%>"></a>
						<% } %>		
						
						<%if(cert_photo2.equals("N") || cert_photo2.equals("undefined"))
					  {
						%>	<a href = "#none" onclick ="toggleImg5()"><img class="imgCert" id="cert_photo2" src = "resources/images/noimg.jpg"></a>										
						<%}else
							 {
						%>	<a href = "#none" onclick ="toggleImg5()"><img class="imgCert" src = "/filepath/<%=cert_photo2%>"></a>
						<% } %>	

						<%if(cert_photo3.equals("N") || cert_photo3.equals("undefined"))
					  {
						%>	<a href = "#none" onclick ="toggleImg6()"><img class="imgCert" id="cert_photo3" src = "resources/images/noimg.jpg"></a>										
						<%}else
							 {
						%>	<a href = "#none" onclick ="toggleImg6()"><img class="imgCert" src = "/filepath/<%=cert_photo3%>"></a>
						<% } %>	
					</div>
				</div>
			</div>

			
			<input type="hidden" id="track2" value="<%=radio_basic%>">
			
			<div class="col">
				<div class="info">
					<div class="infoText">
						<p>닉네임 : 
							<span>
							<%if(nickname.equals("N") || nickname.equals("undefined"))
							{
							%>   -
							<%}
								 else
								{
							%>  <%=nickname%>
							<% }	%>
							</span>
						</p>
							
						<p>지역 : <span><%=address%></span></p>
						<p>등급 : <span><%=rank%></span></p>
					  <p>활동수 : <span><%=review_count%>회</span></p>
						<p>자격증 : <span><%=cert_count%>개 보유</span></p>
					</div>
				</div>
		</div>
	</div>   	 
</div>     	 
<!--펫시터 이용가능 서비스 요금 정보 시작 -->		
			<!--펫시터 이용가능 서비스 -->	
			<div class = "container" style="margin-top:-0px;">
				<div class = "row justify-content-center" id="serviceRow">
 					<div class = "col-md-4">
 						<div class="c1">
 							Service
 						</div>
 						
						<div class = "row main_grayfont3" id="serviceDiv">
							<div class ="col-12 font-size-16 text-center">
							</div>
							
							<div class="row justify-content-center font-size-14">
								<div class="col">
									<div class="service">
										<input type="hidden" id="track" value="<%=service%>">
										<p class="serviceList" id="service1">픽업 가능<i class="fas fa-check-circle" id="check1"></i></p>
										<p class="serviceList" id="service2">대형견 가능<i class="fas fa-check-circle" id="check2"></i></p>
										<p class="serviceList" id="service3">마당 존재	<i class="fas fa-check-circle" id="check3"></i></p>
										<p class="serviceList" id="service4">노견 케어 가능<i class="fas fa-check-circle" id="check4"></i>	</p>
									</div>
								</div>
							</div>	

						<div class="c3">
						
						</div>

						</div>	
					</div> 

					
					<!--펫시터 요금 정보  -->	
					<div class = "col-md-5">
						<div class = "row justify-content-center">
						 <div class = "col-10 text-center">
						 	<div class ="row align-items-center">
						 	
						 	<div class="c2">
						 	Price
						 	</div>
						 	
						 		<div class = "col-12 font-size-14 main_grayfont3" style = "background : white;  height : 248px;">
						 			<div class = "col-12 font-size-14 main_grayfont3">
									 <svg class="bi bi-book" width="22px" height="22px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style = "margin-left : 10px; margin-top: 4px;">
					  			 	<path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
					 		  		<path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
									 </svg>
									 	<p>위탁 기본 1박 : 
										 	<% if(price24.equals("NaN") || price24.equals("null") || price24.equals("undefined") || price24.equals("N"))
										 		{
										 	%>	(미등록)  
											<%}else {%>
													<%=price24%>원
											<%} %>			
									 	</p>
									 	<p>대형견 추가요금 : 1,000원</p>
									 	
									 	<p>시간당 
									 		<% if(price.equals("NaN") || price.equals("null") || price.equals("undefined") || price.equals("N")) 
									 			{
									 		%>	(미등록)
									 		<%}else { %>
									 			<%=price%>원 추가
									 		<%} %> 
									 		
									 		(대형견	 
									 			<% if(bigPrice.equals("NaN") || bigPrice.equals("null") || bigPrice.equals("undefined") || bigPrice.equals("N")) 
									 			{
									 			%> (미등록))
									 			<%}else { %>
									 			<%=bigPrice%>원)
									 		<%} %>
									 	</p>								 	
									 <svg class="bi bi-book" width="22px" height="22px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style = "margin-left : 10px; margin-top: 4px;">
					  			 	<path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
					 		  		<path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
									 </svg>
									 	
									 	<p>방문 기본 1시간 : 
									 		<% if(price60.equals("NaN") || price60.equals("null") || price60.equals("undefined") || price60.equals("N")) 
									 			{
									 		%>	(미등록)
									 		<%}else { %>
									 			<%=price60%>
									 		<%} %> 
									 	</p>
									 	
									 	<p>추가시간 30분 : 
									 		<% if(price2.equals("NaN") || price2.equals("null") || price2.equals("undefined") || price2.equals("N")) 
									 			{	
									 		%>  (미등록)
									 		<%}else { %>
									 			<%=price2%>원 
									 		<%} %>
									 			
									 		(대형견  
									 			<% if(bigPrice2.equals("NaN") || bigPrice2.equals("null") || bigPrice2.equals("undefined") || bigPrice2.equals("N"))
									 				{	
									 			%> (미등록))
									 			<%}else { %>
									 				<%=bigPrice2%>원)
									 			<%} %>
										</p>										
									 </div>
								 	</div>
								 	
								 	<div class="c3">
								 	</div>
								 	
								</div>
							 </div> 
							</div>
						</div>				
<!--펫시터 이용가능 서비스 요금 정보 종료-->	


<!--펫시터 스케쥴과 펫시터 지역 시작-->	
					<!--펫시터 스케쥴-->	
					<div class = "col-md-5">
						<div class = "row justify-content-center">
							<div class = "col-10 font-size-14 main_grayfont3">
								<div class = "row justify-content-center">
									<div class = "col-12">
										<p class = "font-size-16 main_grayfont3 text-center" style = "font-weight : bold;"><br/><br/><br/>펫시터 스케줄</p>
									</div>
									<div class = "col-11" id = "schedule" style = "height :363px; background : rgba(224, 224, 224, 0.65); overflow : hidden;"></div>
								</div>
							</div>	
						</div>
					</div>
					
					<!--펫시터 지역-->	
					<div class = "col-md-5">
						<div class = "row justify-content-center">
							<div class = "col-12">
									<p class = "font-size-16 main_grayfont3 text-center" style = "font-weight : bold;"><br/><br/><br/>펫시터 주거지역</p>
							</div>				
							<div class = "col-12 font-size-14 main_grayfont3 text-center">
								<p><%=mapaddr2 %></p>
							</div>
							<div class = "col-8" id = "map" style = "height : 326px; background : rgba(224, 224, 224, 0.65); overflow : hidden;"></div>
						</div>
					</div>
<!--펫시터 스케쥴과 펫시터 지역 종료-->								
					
				</div>		
			</div>				
	
					
<!-- 갤러리 시작 -->
			<div class = "container">
				<div class = "row justify-content-center">
					<div class ="col-9">
						<div class ="col-12 font-size-16 main_grayfont3 text-center" style = "font-weight : bold;"><br/><br/><br/>펫시터 갤러리<br/><br/>
						</div>
							<div class ="row">

								<div class ="col-lg-12" style = "margin-top : 10px">
								
									<!-- galleryList 출력 -->
									<div class ="row" id = "galleryList"></div>
									
								</div>
							</div>
					</div>
						<div class = "col-12 text-center">
						<br/>
									<a href="galleryList.bo"type="button" class= "plus_gallery btn btn-sm" style="background:#53dc98; color :white; width : 20%;">더 보기</a>
						</div>
				</div>
			</div>
<!-- 갤러리 종료 -->    

<!-- 후기 상단 시작 -->
			<div class = "container">
				<div class = "row justify-content-center">
					<div class ="col-11">
					<br/><br/>
					<hr class = "my-hr3" />
						<div class = "row">
							<div class = "col-md-8">		
								<div class = "row">
									<div class = "col-5 main_mint main_whitefont font-size-20 postscript">펫시터 후기
									</div>							
									
									<div class = "col-5 text-right" id = "reviewStar" style = "font-size : 0px; margin : 11px 0 0 0; padding : 0;">
									</div>	
									<div class = "col-1 text-right" style = "margin : 4px 0 0 0; padding : 0;">
										<div class ="main_grayfont3" id = "reviewRating" style = "padding-top : 12%; font-size : 72%">평점 : 4.74</div>
									</div>
									
										
									</div>


<!-- 후기 상단 종료-->								
								
								
<!-- 후기작성 하나 시작  (여기서 부터 if 문과 for문으로 반복 5회 적영후 더보기시 전부 생성)-->	
								<hr class ="my-hr3"/>
								
								<div class = "row" id = "reviewList"></div>

								<div class = "col-12 text-center" style ="margin-top : 15px;">
									<a href="reviewList.bo"type="button" class= "plus_review btn btn-sm" style="background:#53dc98; color :white; width : 100px;">더 보기</a>
								</div>
<!-- 후기작성 하나 종료  (여기서 부터 if 문과 for문으로 반복 5회 적영후 더보기시 전부 생성)-->	
														
								
							</div>
<!-- 후기 종료 -->


<!-- Q&A 시작 -->

							<div class ="col-md-4">
							</div>
						</div>
						<div id="getBoardList2"></div>
						<div class="row">
     <div class="col-md-2">
     	      
     <% if(nowpage <= 1) { %>
     <a type="button" style="background:#F8F8F8; color:black;" class="btn btn-sm" id="prev">이전</a>
     <% } else { %>
     <a type="button" style="background:#F8F8F8; color:black;" class="btn btn-sm" id="prev" href="./pqboardlist.me?page=<%=nowpage-1 %>">이전</a>
     <% } %>
           
     <%if(nowpage >= maxpage) { %>
     <a type="button" style="background:#F8F8F8; color:black;" class="btn btn-sm" id="next">다음</a>
     <% } else { %>
     <a type="button" style="background:#F8F8F8; color:black;" class="btn btn-sm" id="next" href="./pqboardlist.me?page=<%=nowpage+1%>">다음</a>
     <% } %>
     
   	</div>
    <div class="col-md-9"></div>
     <div class="col-md-1">
   		<a type="button" style="background:#e67e22; color:white;" class="btn btn-sm" id="write" href="./pqboardwriteform.me">문의</a>
   		
   	</div>
   </div>
   
   <div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3 class="text-center">
				<tr>
					<td>
					<%for(int a=startpage;a<=endpage;a++){
						if(a==nowpage){%>
						<a type="button" style="background:#53DC98; color:white" class="btn btn-sm"><%=a %></a>
						<%}else{ %>
						<a type="button" style="background:#F8F8F8;" class="btn btn-sm" href="./pqboardlist.me?page=<%=a %>"><%=a %></a>
						
						<%} %>
					<%} %>
					</td>
				</tr>				
			</h3>
			<br>
		</div>
					</div>
				</div>
			</div>

    	<!-- Modal 글신고기능 시작-->
		<!-- Modal 창 실행 a테그 -->
		<a href = "#" class = "staticBackdropReport" data-toggle="modal" data-target="#staticBackdropReport"></a>	
		<div id = "reportForm"></div>
		<!-- Modal 글신고기능 종료--> 


<!-- 예약 신청 모달 -->
<!-- 모달창 백그라운드 -->
	<div class="searchModalRe" id="modalRe" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="search-modal-dialog">
		<!-- 모달창 내용물 -->
		<div class="search-modal-content">
		<form name="paycheck" action="./paycheck.br" method="post">
			<input type="hidden" name="PAY_ID" id="PAY_ID" value=${id } >
			<input type="hidden" name="PAY_AMOUNT" id="PAY_AMOUNT" >
			<input type="hidden" name="PETSITTER_ID" id="PETSITTER_ID" value=<%=petsitter_id %> >
			<input type="hidden" name="PAY_TYPE" id="PAY_TYPE" value="위탁" >
			<input type="hidden" name="START_DATE" id="START_DATE" value=<%=start_date %>>
			<input type="hidden" name="START_DATE" id="START_TIME">
			<input type="hidden" name="END_DATE" id="END_DATE" value=<%=start_date %>>
			<input type="hidden" name="END_DATE" id="END_TIME">
			<input type="hidden" name="PAY_POINT" id="PAY_POINT" value=0>
			<div class="container">
				<div class="row">
					<div class="col-2">
						<div class="left">
							<p>KAKAO PAY</p>
						</div>
					</div>
					
					<div class="col-7">
						<div class="center-top1">
							<div class="top1-head1">
								Petstiny
							</div>
							<div class="top1-head2">
								안전하고 편리한 KAKAO PAY 결제입니다<%=start_date %>
							</div>
						</div>
						
						<div class="center-top2">
							<div class="top2-head1">
								이용약관
							</div>	
							<div class="top2-head2">
								<input type="checkbox" id="agree-all" onclick="checkAll()">전체동의
							</div>
						</div>
						
						<div class="center-top3">
							<div class="top3-head1">
								카카오페이 전자금융거래 이용약관
							</div>
						</div>
						
						<div class="center-top4">	
							<div class="top4-head1">
								개인정보의 수집 및 이용안내
							</div>
							<div class="top4-check1">
								<input type="checkbox" name="checkRow" id="agree-1" onclick="checkOne()"/> 
								<p class="dong">&nbsp;동의</p>
							</div>
							<div class="top4-head2">
								개인정보 제공 및 위탁안내
							</div>
							<div class="top4-check2">
								<input type="checkbox" name="checkRow" id="agree-2" onclick="checkOne()"/> 
								<p class="dong">&nbsp;동의</p>
							</div>
						</div>
						
						<div class="center-top5">
							<div class="top5-head1">
								이용약관<i class="fas fa-caret-down"></i>
							</div>
							<div class="terms-div">
								<textarea class="terms" spellcheck="false" readonly>
								&#10;카카오페이 전자금융거래 이용약관
								&#10;&#10;제 1장 총칙
								&#10;제 1조 (목적)
								&#10;본 약관은 주식회사 카카오페이(이하 ‘회사’라 합니다)가 제공하는 전자지급결제대행서비스, 선불전자지급수단의 발행 및 관리서비스, 전자고지결제서비스(이하 통칭하여 ‘전자금융거래서비스’라 합니다)를 회원이 이용함에 있어, 회사와 회원 간 권리, 의무 및 회원의 이용절차 등에 관한 사항을 규정하는 것을 그 목적으로 합니다.
								&#10;
								&#10;제2조 (정의)
								&#10;①본 약관에서 정한 용어의 정의는 아래와 같습니다.
								&#10;1. ‘전자금융거래’라 함은 회사가 전자적 장치를 통하여 전자금융업무를 제공하고,회원이 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
								&#10;2. ‘전자지급수단’이라 함은 선불전자지급수단, 신용카드 등 전자금융거래법 제2조 제11호에서 정하는 전자적 방법에 따른 지급수단을 말합니다.
								&#10;3. ‘전자지급거래’라 함은 자금을 주는 자(이하 ‘지급인’이라 합니다)가 회사로 하여금 전자지급수단을 이용하여 자금을 받는 자(이하 ‘수취인’이라 합니다)에게 자금을 이동하게 하는 전자금융거래를 말합니다.
								&#10;4. ‘전자적 장치’라 함은 전자금융거래정보를 전자적 방법으로 전송하거나 처리하는데 이용되는 장치로서 현금자동지급기, 자동입출금기, 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 정보를 전송하거나 처리하는 장치를 말합니다.
								&#10;5. ‘접근매체’라 함은 전자금융거래에 있어서 거래지시를 하거나 회원 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함합니다), 전자서명법 상의 전자서명생성정보 및 인증서, 금융기관 또는 전자금융업자에 등록된 회원번호, 회원의 생체정보 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
								&#10;6. ‘전자금융거래서비스’라 함은 회사가 회원에게 제공하는 제4조 기재의 서비스를 말합니다.
								&#10;7. ‘회원’이라 함은 본 약관 제2장과 제3장과 제4장 에서 달리 정한 경우를 제외하고는 본 약관에 동의하고 본 약관에 따라 회사가 제공하는 전자금융거래서비스를 이용하는 이용자를 말합니다.
								&#10;8. ‘거래지시’라 함은 회원이 본 약관에 따라 회사에게 전자금융거래의 처리를 지시하는 것을 말합니다.
								&#10;‘오류’라 함은 회원의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 회원의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
								&#10;② 본 조 및 본 약관의 다른 조항에서 정의한 것을 제외하고는 전자금융거래법 등 관련 법령에 정한 바에 따릅니다.
								&#10;
								&#10;제3조 (약관의 명시, 설명 및 변경)
								&#10;① 회사는 회원이 전자금융거래를 하기 전에 본 약관을 개별 서비스에 게시하고 본 약관의 중요한 내용을 확인할 수 있도록 합니다.
								&#10;② 회사는 회원의 요청이 있는 경우 전자문서의 전송(전자우편을 이용한 전송을 포함합니다), 모사전송, 우편 또는 직접교부의 방식에 의하여 본 약관의 사본을 회원에게 교부합니다.
								&#10;③ 회사가 본 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 금융거래정보 입력화면 또는 개별 서비스의 공지사항 게시판 등에 게시함으로써 회원에게 공지합니다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경한 때에는 변경된 약관을 홈페이지에 1개월 이상 게시하고 회원에게 전자우편 등을 통하여 사후 통지합니다.
								&#10;④ 회사는 제3항의 공지나 통지를 할 경우 “회원이 변경에 동의하지 아니한 경우 공지나 통지를 받은 날로부터  30일 이내에 계약을 해지할 수 있으며, 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 본다.” 라는 취지의 내용을 공지하거나 통지합니다.
								&#10;⑤ 회원이 제4항의 공지나 통지를 받은 날로부터 30일 이내에 계약해지의 의사표시를 하지 아니한 경우에는 회원이 제4항의 공지나 통지를 받은 날로부터 30일 이내에 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 봅니다.
								&#10;
								&#10;제4조 (약관의 명시, 설명 및 변경)
								&#10;① 전자금융거래서비스는 다음 각 호의 개별 서비스로 구성됩니다.
								&#10;1. 전자지급결제대행서비스
								&#10;2. 선불전자지급수단 발행 및 관리서비스
								&#10;3. 전자고지결제서비스
								&#10;② 회사는 필요시 회원에게 사전 고지하고 전자금융거래서비스를 추가하거나 변경할 수 있습니다.
								&#10;
								&#10;제5조 (서비스 이용 시간)
								&#10;① 회사는 회원에게 연중무휴 1일 24시간 전자금융거래서비스를 제공함을 원칙으로 합니다. 다만, 금융회사 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
								&#10;② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융회사 기타 결제수단 발행업자의 사정에 의하여 전자금융거래서비스 중단이 불가피한 경우, 전자금융거래서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 전자금융거래서비스 중단 사실을 게시한 후 전자금융거래서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 전자금융거래서비스를 중단할 수 있습니다.
								&#10;
								&#10;제6조 (거래내용의 확인)
								&#10;① 회사는 개별 서비스 내 회원 정보 조회 화면을 통하여 회원의 거래내용(회원의 오류정정 요구사실 및 처리 결과에 관한 사항을 포함합니다)을 확인할 수 있도록 하며, 회원이 거래내용에 대해 서면교부를 요청하는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송, 우편 또는 직접 교부의 방법으로 거래내용에 관한 서면을 교부합니다.
								&#10;② 회사는 제1항에 따른 회원의 거래내용 서면교부 요청을 받은 경우 전자적 장치의 운영장애, 그 밖의 이유로 거래내용을 제공할 수 없는 때에는 즉시 회원에게 전자문서 전송(전자우편을 이용한 전송을 포함한다)의 방법으로 그러한 사유를 알려야 하며, 전자적 장치의 운영장애 등의 사유로 거래내용을 제공할 수 없는 기간은 제1항의 거래내용에 관한 서면의 교부기간에 산입하지 아니합니다.
								&#10;③ 제1항의 대상이되는 거래내용 중 대상기간이 5년인 것은 다음 각호와 같습니다.
								&#10;1. 거래계좌의 명칭 또는 번호
								&#10;2. 전자금융거래의 종류 및 금액
								&#10;3. 전자금융거래상대방을 나타내는 정보
								&#10;4. 전자금융거래일시
								&#10;5. 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보
								&#10;6. 회사가 전자금융거래의 대가로 받은 수수료
								&#10;7. 회원의 출금 동의에 관한 사항
								&#10;8. 해당 전자금융거래와 관련한 전자적 장치의 접속기록
								&#10;9. 전자금융거래의 신청 및 조건의 변경에 관한 사항
								&#10;10. 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록
								&#10;④ 제1항의 대상이 되는 거래내용 중 대상기간이 1년인 것은 다음 각 호와 같습니다.
								&#10;1. 건당 거래금액이 1만원 이하인 전자금융거래에 관한 기록
								&#10;2. 전자지급수단의 이용과 관련된 거래승인에 관한 기록
								&#10;3. 회원의 오류정정 유구사실 및 처리결과에 관한 사항
								&#10;4. 기타 금융위원회가 고시로 정한 사항
								&#10;⑤ 회원이 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
								&#10;- 주소 : 경기도 성남시 분당구 판교역로 152, 알파돔타워12층
								&#10;- 사이트 주소 : http://www.kakao.com/kakaopay
								&#10;- 전화번호 : 1644-7405
								&#10;
								&#10;제7조 (거래지시의 철회)
								&#10;① 회원이 회사의 전자금융거래서비스를 이용하여 전자지급거래를 한 경우, 회원은 지급의 효력이 발생하기 전까지 본 약관에서 정한 바에 따라 제6조 제5항에 기재된 주소, 전화번호, 전자우편주소를 이용한 우편, 전화연락, 전자문서 전송의 방법으로 또는 개별 서비스 내 철회에 의한 방법으로 거래지시를 철회할 수 있습니다. 단, 각 서비스 별 거래지시 철회의 효력 발생시기는 본 약관 제17조, 제27조, 제 31조에서 정한 바에 따릅니다.
								&#10;② 회원은 전자지급의 효력이 발생한 경우에 전자상거래등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법에 따라 결제대금을 반환 받을 수 있습니다.
								&#10;
								&#10;제8조 (오류의 정정 등)
								&#10;① 회원은 전자금융거래서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대해 그 정정을 요구할 수 있습니다.
								&#10;② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안 날부터 2주 이내에 그 결과를 회원에게 알려 드립니다.
								&#10;
								&#10;제9조 (전자금융거래 기록의 생성 및 보존)
								&#10;① 회사는 회원이 이용한 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
								&#10;② 제1항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제6조 제3항 및 제4항에 따릅니다.
								&#10;
								&#10;제10조 (개인정보 보호)
								&#10;① 회사는 전자금융거래서비스를 제공함에 있어서 취득한 회원의 인적사항, 회원의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 금융실명법 등 법령에 의하거나 회원의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무 상 목적 외에 사용하지 아니합니다.
								&#10;② 회사는 회원이 안전하게 전자금융거래서비스를 이용할 수 있도록 회원의 개인정보보호를 위하여 개인정보취급방침을 운용합니다. 회사의 개인정보취급방침은 회사의 홈페이지 또는 개별 서비스에 링크된 화면에서 확인할 수 있습니다.
								&#10;
								&#10;제11조 (회사의 책임)
								&#10;① 회사는 다음 각호의 사고로 인하여 회원에게 손해가 발생한 경우에는 그 손해를 배상할 책임을 부담합니다.
								&#10;1. 접근매체의 위조나 변조로 발생한 사고
								&#10;2. 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고
								&#10;3. 전자금융거래를 위한 전자적 장치 또는 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고
								&#10;② 회사는 제1항에도 불구하고 다음 각호의 경우에는 그 책임의 전부 또는 일부를 회원이 부담하게 할 수 있습니다.
								&#10;1. 회원이 접근매체를제3자에게 대여하거나 그 사용을 위임한 경우 또는 양도나 담보의 목적으로 제공한 경우
								&#10;2. 제3자가 권한 없이 회원의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 쉽게 알 수 있었음에도 불구하고 접근매체를 누설하거나 노출 또는 방치한 경우
								&#10;3. 법인(중소기업기본법제2조 제2항에 의한 소기업을 제외한다)인 회원에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우
								&#10;③ 회사는 회원으로부터 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서 회원에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단발행업자나 통신판업자가 통지한 경우를 포함합니다)에는 회원에 대해 이로 인한 책임을 부담하지 않습니다.
								&#10;
								&#10;제12조 (분쟁처리 절차)
								&#10;① 회원은 회사의 서비스 페이지 하단에 게시된 분쟁처리 담당자 또는 연락처를 통하여 전자금융거래와 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
								&#10;② 회원이 회사에 대하여 분쟁처리를 신청한 경우 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 회원에게 안내 합니다.
								&#10;③ 회원은 회사의 분쟁처리결과에 대하여 이의가 있을 경우 금융위원회의 설치 등에 관한 법률 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 소비자기본법 제60조 제1항의 규정에 따른 한국소비자원의 소비자분쟁조정위원회에 회사의 전자금융거래서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
								&#10;
								&#10;제13조 (회사의 안전성 확보 의무)
								&#10;회사는 전자금융거래가 안전하게 처리될 수 있도록 전자금융거래의 종류 별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
								&#10;
								&#10;제14조 (약관 외 준칙)
								&#10;① 회사와 회원 사이에 개별적으로 합의한 사항이 본 약관에 정한 사항과 다를 때에는 그 합의사항을 본 약관에 우선하여 적용합니다.
								&#10;② 전자금융거래에 관하여 본 약관에 정하지 않은 사항은 개별약관이 정하는 바에 따릅니다.
								&#10;③ 본 약관과 전자금융거래에 관한 개별약관에 정하지 아니한 사항(용어의 정의 포함)에 대하여는 다른 합의사항이 없으면 전자금융거래법, 여신전문금융업법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계 법령에서 정한 바에 따릅니다.
								&#10;
								&#10;제15조 (관할)
								&#10;회사와 회원 간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
								&#10;
								&#10;제2장 전자지급결제대행 서비스
								&#10;
								&#10;제16조 (정의)
								&#10;본 장에서 정하는 용어의 정의는 아래와 같습니다.
								&#10;① ‘전자지급결제대행 서비스’라 함은 전자적 방법으로 재화 또는 용역(이하 '재화 등'이라고 합니다)의 구매에 있어서 지급결제 정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
								&#10;② ‘회원’이라 함은 본 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.
								&#10;
								&#10;제17조 (거래지시의 철회)
								&#10;① 회원이 전자지급결제대행 서비스를 이용한 경우 회원은 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관 또는 회사의 계좌의 원장에의 입금기록 또는 전자적 장치에의 입력이 끝나기 전까지 거래지시를 철회할 수 있습니다.
								&#10;② 회사는 회원의 거래지시의 철회에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 회원에게 반환하여야 합니다.
								&#10;
								&#10;제18조 (이용금액의 한도)
								&#10;회사의 정책 및 결제업체(이동통신사,카드사 등)의 기준에 따라 회원의 결제수단 별 월 누적 결제액 및 결제한도가 제한될 수 있습니다.
								&#10;
								&#10;제19조 (접근매체의 관리)
								&#10;① 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 회원의 신원, 권한 및 거래지시의 내용 등을 확인합니다.
								&#10;② 회원은 접근매체를 사용함에 있어서 다른 법률에 특별한 규정이 없는 한 다음 각 호의 행위를 하여서는 아니 됩니다.
								&#10;1. 접근매체를 양도하거나 양수하는 행위
								&#10;2. 접근매체를 대여하거나 사용을 위임하는 행위
								&#10;3. 접근매체를 질권 기타 담보 목적으로 하는 행위
								&#10;4. 1호부터 3호까지의 행위를 알선하는 행위
								&#10;③ 회원은 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
								&#10;④ 회사는 회원으로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 회원에게 발생한 손해를 배상할 책임이 있습니다.
								&#10;
								&#10;제3장 선불전자지급수단의 발행 및 관리
								&#10;
								&#10;제20조 (정의)
								&#10;본 장에서 사용하는 용어의 정의는 다음과 같습니다.
								&#10;① ‘선불전자지급수단’이라 함은 회사가 운영하는 웹사이트 및 제휴사 서비스 등에서 재화 또는 용역(이하 ‘재화 등’이라고 합니다)을 구매할 수 있는 카카오머니 등과 같이 회사가 발행 당시 미리 회원에게 공지한 전자금융거래법 상 선불전자지급수단을 말합니다.
								&#10;② ‘충전’이라 함은 선불전자지급수단의 일정액을 확보하기 위해 회사가 지정한 지불수단을 통해 선불전자지급수단을 구매하거나, 회사 또는 회사가 지정한 제3자의 서비스 등(이하 ‘서비스 등’이라 합니다)에서의 활동을 통해 선불전자지급수단을 적립 받는 것을 말합니다.
								&#10;③ ‘회원’이라 함은 본 약관에 동의하고 판매자로부터 재화 등을 구매하고 선불전자지급수단을 결제수단으로 하여 그 대가를 지급하는 자를 말합니다.
								&#10;④ ‘판매자’라 함은 선불전자지급수단에 의한 거래에 있어서 회원에게 재화 등을 판매하는 자를 말합니다.
								&#10;
								&#10;제21조 (접근매체의 관리)
								&#10;① 회사는 회원으로부터 접근매체의 분실 또는 도난 등의 통지를 받기 전에 발생하는 선불전자지급수단에 저장된 금액에 대한 손해에 대하여는 책임지지 않습니다.
								&#10;② 제2장 결제대행서비스 제19조 제1항 내지 제4항은 본 장에 준용합니다.
								&#10;
								&#10;제22조 (거래의 정지)
								&#10;① 회사는 회원이 아래 각 호의 사유에 해당하는 경우 해당 회원에게 전자우편 또는 기타 유효한 수단을 통해 통보하고, 회원 자격을 박탈하거나 선불전자지급수단의 사용을 일시적으로 제한할 수 있습니다.
								&#10;1. 회원 가입시 등록한 개인정보의 전부 또는 일부가 허위임이 밝혀지는 경우
								&#10;2. 타인의 명의나 개인정보를 도용하여 회원 가입 후 선불전자지급수단을 이용하는 경우
								&#10;3. 타인의 결제정보 등을 도용하거나 부정한 행위로 거래를 하는 경우
								&#10;4. 회원의 접근매체를 매매하거나 양도하는 경우
								&#10;5. 결제수단을 제공하는 사업자가 지정한 방식으로 이용요금을 납부하지 않고 장기 연체하는 경우
								&#10;6. 다른 회원의 선불전자지급수단 사용을 방해하거나, 회사의 선불전자지급수단 제공에 지장을 초래하는 경우
								&#10;7. 회사가 정한 기간 내에 사용제한 사유를 해소하지 못한 경우
								&#10;8. 기타 선불전자지급수단 관련한 법령을 위반하는 경우
								&#10;② 제1항에 해당하는 회원은 해당 사유를 해소한 이후 회사의 승낙에 따라 선불전자지급수단을 다시 사용할 수 있습니다.
								&#10;
								&#10;제23조 (선불전자지급수단의 충전)
								&#10;① 회원은 계좌출금 , 기타 회사가 정하는 지불수단으로 선불전자지급수단을 구매하거나, 서비스 등에서의 활동으로 회사 또는 회사의 제휴사로부터 적립 받아 선불전자지급수단을 충전할 수 있습니다.
								&#10;② 회사가 지정한 지불 수단을 통한 선불전자지급수단 구매는 제1항에서 규정하는 지불 수단별로 지정된 금액으로 충전을 할 수 있으며, 지불 수단에 따라 자체 제한금액이 있을 수 있습니다.
								&#10;
								&#10;제24조 (선불전자지급수단의 이용)
								&#10;① 회원은 회사가 정한 기한 및 이용방법에 따라 선불전자지급수단을 이용할 수 있으며, 회사는 그 구체적인 사항을 본 약관 또는 선불전자지급수단 관련 서비스 페이지를 통해 공지합니다.
								&#10;② 회원은 서비스 등에서 재화 등을 구매할 때 선불전자지급수단을 지불 수단으로 사용할 수 있습니다.
								&#10;③ 선불전자지급수단은 재화 등의 구매완료 시점에 즉시 차감됩니다.
								&#10;④ 회원이 선불전자지급수단을 사용하는 경우 서비스 등에서 적립 받은 무상의 선불전자지급수단(이하 ‘적립선불’이라고 합니다), 회원이 구매한 선불전자지급수단(이하 ‘구매선불’이라고 합니다)의 순서로 차감합니다.
								&#10;⑤ 회원이 선불전자지급수단을 사용한 재화 등의 구매를 취소하는 경우 회사는 재화 등 구매시 사용한 선불전자지급수단을 재충전하는 것을 원칙으로 합니다.
								&#10;
								&#10;제25조 (선불전자지급수단의 유효기간)
								&#10;① 개별 선불전자지급수단을 마지막으로 이용한 날 로부터 일백이십(120)개월이 경과하는 동안 해당 선불전자지급수단을 한번도 적립하거나 사용하지 않은 경우 회원이 충전한 해당 선불전자지급수단은 자동소멸됩니다.
								&#10;② 회사는 전항에 따른 선불전자지급수단의 자동소멸 전에 회원에게 소멸예정 사실을 전자우편 등의 방법으로 통지합니다.
								&#10;③ 본 약관에 대한 동의를 철회하는 경우 적립선불은 소멸되어 환급이 불가능합니다.
								&#10;
								&#10;제26조 (선불전자지급수단의 환급)
								&#10;① 회원은 보유 중인 선불전자지급수단의 환급을 회사에 요구할 경우 구매선불 전액을 환급 받을 수 있습니다. 다만, 회사로부터 무상 제공받은 적립선불의 경우 환급 대상에서 제외됩니다.
								&#10;② 다음 각 호의 경우에는 구매선불의 잔액 전부를 환급합니다.
								&#10;1. 천재지변 등의 사유로 서비스 등에서 재화 또는 용역을 제공하기 곤란하여 선불전자지급수단을 사용하지 못하게 된 경우
								&#10;2. 선불전자지급수단의 결함으로 서비스 등에서 재화 또는 용역을 제공하지 못하는 경우
								&#10;3. 회원이 구매선불 잔액의 환급을 요청하는 경우
								&#10;4. 본 약관에 대한 동의를 철회하는 경우
								&#10;③ 현금 환급은 회원으로부터 환급 신청이 접수된 후 회원의 입금사실을 확인한 시점에서 제칠(7)영업일 이내에 회원이 지정한 계좌로 현금 입금됩니다.
								&#10;④ 회원은 회사에서 정한 기한 및 이용방법에 따라 선불전자지급수단을 이용할 수 있으며, 회사는 환급 등 구체적인 사항을 개별 선불전자지급수단의 고객센터 페이지를 통해 안내합니다.
								&#10;
								&#10;제27조 (거래지시의 철회)
								&#10;회원이 선불전자지급수단을 이용하여 자금을 지급하는 경우 회원은 거래 지시된 금액의 정보가 수취인이 지정한 전자적 장치에 도달하기 전까지 거래지시를 철회할 수 있습니다.
								&#10;
								&#10;제28조 (금지사항)
								&#10;회원은 선불전자지급수단을 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
								&#10;
								&#10;제29조 (이용금액의 한도)
								&#10;① 회사는 선불전자지급수단에 대해 실지명의 당 최고 200만원을 그 보유 한도로 합니다. 단 보유 한도는 회사의 정책에 따라 감액될 수 있습니다.
								&#10;② 제2장 결제대행서비스 제18조는 본 장에 준용합니다.
								&#10;
								&#10;제4장 전자고지결제서비스
								&#10;
								&#10;제30조 (정의)
								&#10;본 장에서 사용하는 용어의 정의는 다음과 같습니다.
								&#10;① ‘전자고지결제서비스’라 함은 회사의 모바일메신저(이하 ‘카카오톡’이라 합니다)를 근간으로 국세, 지방세, 공공요금, 각종지로요금의 고지, 수납, 정산, 수납대금이체 등을 편리하고 효율적으로 처리하기 위해 제공하는 시스템 및 서비스 일체를 말합니다.
								&#10;② ‘빌러(고지기관)’라 함은 각종 서비스를 이용한 대가에 대해 요금고지서를 ‘회원’에게 발송하는 자를 말한다.
								&#10;③ ‘카톡청구서’라 함은 ‘빌러’의 요금고지서 대신 ‘카카오톡’ 기반에 모바일기기로 전송하는 전자적인 방식의 고지대행서비스를 말한다.
								&#10;④ ‘회원’이라 함은 본 약관에 동의하고 요금고지서를 ‘카톡청구서’로 받는자를 말한다.
								&#10;
								&#10;제31조 (거래지시의 철회)
								&#10;회원이 전자고지결제서비스내 지급수단을 이용하여 자금을 지급하는 경우 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관 또는 전자금융업자의 전자적 장치에 입력이 끝나기 전까지 거래지시를 철회할 수 있습니다.
								&#10;
								&#10;제32조 (접근매체의 관리)
								&#10;① 제2장 결제대행서비스 제19조 제1항 내지 4항은 본 장에 준용합니다.
								&#10;
								&#10;(부칙)
								&#10;본 약관은 2017년 4월 3일부터 적용됩니다.
								&#10;
								</textarea>
							</div>
						</div>
						
						<div class="center-md1">
							<div class="md1-head1">
								결제 방법<i class="fas fa-caret-down"></i>
							</div>
							<div class="md1-head2">
								<input type="radio" class="rd" checked="checked">
								<img src="resources/images/function/kakaopay1.PNG" id="kakaopay">
								<div class="kakaopay-text1">
									온 국민이 다같이 쓰는 카카오페이
								</div>
							</div>
						</div>
						
						<div class="center-md2">
							<div class="md2-head1">
								적립금<i class="fas fa-caret-down"></i>
							</div>
							<div class="md2-head2">
								<p class="point-money">적립금</p>
								<input type="text" class="reserves" name="reserves" id="reserves1" placeholder="10원 이상 사용가능" onkeypress="onlyNumber();"/>
								<div class="md2-button">
									<p class="use-ok">(사용 가능 <%=point%>원)</p>
									<button type="button" class="point-use" onclick="pointBtn()">전액 사용</button>
								</div>	
							</div>
						</div>
							
							
						<div class="center-bt">
							<div class="bt-button">
								<button type="submit" class="gotopay" OnClick="return agreeCheck()">다음</button>
								<p>*카카오 페이 결제창으로 이동합니다.</p>
							</div>
						</div>
					</div>
		
					<div class="col-3">
						<div class="right">
							<div class="close-div">
								<button type="button" class="close-btn" onclick="closeModalRe();">X</button>
							</div>
						
							<div class="right-head">
								<p> PAY INFO</p><br />
							</div>
							<div class="right-text1">
								<p>결제자 이름  </p>
								<p class="p1">${name }</p>
							</div>
							<div class="right-text2">
								<p>예약 유형  </p>
								<p class="p2"><%if(radio_basic.equals("we")){%>위탁
															<%}else if(radio_basic.equals("bang")){%>방문
															<%}%>
								</p>
							</div>
							<div class="right-text3">
								<p>결제 비용 </p>
								<p class="p3" id="p33">&nbsp;&nbsp;&nbsp;&nbsp;</p> <!-- 자바스크립트 함수로 결제비용 추가됨 Default '-' -->
							</div>
							<div class="right-text4">
								<p>적립 할인 </p>
								<p class="p4">&nbsp;&nbsp;&nbsp;&nbsp;</p>
							</div>
							<div class="right-text5">
								<p class="p5">KRW</p>
							</div>
						
						</div>
					</div>
					
				</div>
			</div>
		</form>
		</div>
	</div>
	</div>
	<%@ include file="jsp_bottom.jsp" %>
</body>
<!-- 본 기능 추가 종료 -->

 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24e91ec8fe5a3a10070597915f67d6ba&libraries=services"></script>
    
    
<!-- 모델 열고 닫기 (수정)-->
<script>
	function openModalRe() {
		$("#modalRe").show();
	};

	function closeModalRe() {
		$('.searchModalRe').hide();
	};
</script>

<!--  전체동의 체크해제 -->  
<script>
	function checkAll(){
		if ($("#agree-all").is(":checked"))
		{
			$("input[name=checkRow]").prop("checked", true);
		}
		else
		{
			$("input[name=checkRow]").prop("checked", false);
		}
	};		
	
	/* 체크해제 시 전체동의란 해제 */
	function checkOne(){
		if ($("#agree-1").is(":checked") == false)
		{
			$("#agree-all").prop("checked", false);
		}
		else if ($("#agree-2").is(":checked") == false)
		{
			$("#agree-all").prop("checked", false);
		}
		
	  else if( ($("#agree-1").is(":checked") == true && $("#agree-2").is(":checked") == true) )
	  {
		  $("#agree-all").prop("checked", true);
	  } 
		
	};
	
 <!--체크여부 유효성 검사 -->
 function agreeCheck(){
	 if ($("#agree-all").is(":checked") == false)
	 {
			alert("이용약관에 동의해주세요");
			return false;
	 }

	 else if($("#agree-all").is(":checked") == true)
	 {
			return true; 
	 }		 
  }; 
  
  <!--적립금 전체사용버튼-->
  function pointBtn(){
  var btnPrice = document.getElementById("p33").innerHTML;
			btnPrice = (parseInt)(btnPrice.substr(5));
	var fPrice = btnPrice - (parseInt)(<%=point%>);
		
		if(isNaN(btnPrice) || isNaN(fPrice)) 
    {
			btnPrice = 0;
			fPrice = 0;
		}
		if(<%=point%> > btnPrice)
		{ 
			alert("선택하신 적립금이 결제비용보다 많습니다.");
			$(".reserves").val(btnPrice);
			$(".p4").empty();
		  $(".p4").append(" -KRW "+btnPrice);
		  $(".p5").empty();
		  $(".p5").append("  KRW 0");
		  $("#PAY_POINT").val(btnPrice);
		  $("#PAY_AMOUNT").val(0);
		}
		else
		{
			$(".reserves").val("<%=point%>");
	
		 	$(".p4").empty();
		  $(".p4").append(" -KRW "+<%=point%>);
		  $(".p5").empty();
		  $(".p5").append("  KRW "+fPrice);
		  $("#PAY_POINT").val(<%=point%>);
		  $("#PAY_AMOUNT").val(fPrice);
		}
	};
  
  
  
  
  
  <!--적립금 value값 실시간감지에 따른 뷰 변화 -->
  $(document).ready(function(){
  $("#reserves1").on("propertychange change keyup paste input", function() {
	 	  
	    var currentVal = $(this).val();
	    var oldVal = "";
	    if(currentVal == oldVal) {
	        return;
	    }
	 
	    oldVal = currentVal;
	    var point = (parseInt)(document.getElementById("reserves1").value);
	    var payPrice = document.getElementById("p33").innerHTML;
	    		payPrice = (parseInt)(payPrice.substr(5));
	   	var sumPrice = payPrice - point;
	    
	    if(isNaN(sumPrice) || isNaN(payPrice)) 
	    {
					sumPrice = 0;
					payPrice = 0;
			}
	   	
	    $(".p4").empty();
		  $(".p4").append(" -KRW "+point);
		  $(".p5").empty();
		  $(".p5").append("  KRW "+sumPrice);
		  $("#PAY_POINT").val(point);
		  $("#PAY_AMOUNT").val(sumPrice);
		  
		  if(point < 10)
  		{
			  $(".p4").empty();
			  $(".p5").empty();
			  $(".p5").append("  KRW "+payPrice);
			  $("#PAY_POINT").val(0);
			  $("#PAY_AMOUNT").val(payPrice);
  		}
		  else if(point > <%=point%>)
			{
			  alert("보유 적립금을 초과하였습니다.");
			  $(".reserves").val("<%=point%>");
			  
			  $(".p4").empty();
			  $(".p4").append(" -KRW "+<%=point%>);
			  $(".p5").empty();
			  $(".p5").append("  KRW "+sumPrice);
			  $("#PAY_POINT").val(<%=point%>);
			  $("#PAY_AMOUNT").val(sumPrice);
			}
		  else if(point > payPrice)
			{
				alert("선택하신 적립금이 결제비용보다 많습니다.");
				$(".reserves").val(payPrice);
				$(".p4").empty();
			  $(".p4").append(" -KRW "+payPrice);
			  $(".p5").empty();
			  $(".p5").append("  KRW 0");
			  $("#PAY_POINT").val(payPrice);
			  $("#PAY_AMOUNT").val(0);
			}
	});
  });
  

  
  <!--적립금 유효성검사(숫자만입력가능)-->
  function onlyNumber(){
    if((event.keyCode<48)||(event.keyCode>57))
    event.returnValue=false;
  };
  
  
  
  
 
</script>



  <script>

	var scheduleDate = new Array();
	<%
	if(!startdate.equals("")){
	String[] startdates = startdate.split(",");
	String[] enddates = enddate.split(",");
	String DATE_PATTERN = "yyyy-MM-dd";
	for(int i = 0 ; i < startdates.length; i++){
		String inputStartDate = startdates[i];
		String inputEndDate = enddates[i];
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date startDate = sdf.parse(inputStartDate);
		Date endDate = sdf.parse(inputEndDate);
		
		ArrayList<String> dates = new ArrayList<String>();
		Date currentDate = startDate;
		while(currentDate.compareTo(endDate) <=0){
			dates.add(sdf.format(currentDate));
			Calendar c =Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		for(String date : dates){
			%> scheduleDate.push('<%=date%>');<%
		}
	}
	}
%>
  var geocoder = new kakao.maps.services.Geocoder();
  var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	var coords = new kakao.maps.LatLng(result[0].x, result[0].y);
	    	  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    	  mapOption = { 
	    	      center: new kakao.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표
	    	      level: 3 // 지도의 확대 레벨
	    	  };

	    	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	    	//마커가 표시될 위치입니다 
	    	var markerPosition  = new kakao.maps.LatLng(result[0].y, result[0].x); 

	    	//마커를 생성합니다
	    	var marker = new kakao.maps.Marker({
	    	  position: markerPosition
	    	});

	    	//마커가 지도 위에 표시되도록 설정합니다
	    	marker.setMap(map);
	    }
	};
	
	geocoder.addressSearch('<%=mapaddr1%>', callback);
  /*css 적인 script는 하단인 이위치에 기입*/
 
	/*상단 사진 정보 클릭시 선택 시작*/
    function toggleImg1() 
  	{
    	var photo1 = "<%=home_photo1%>";
    	if( (photo1 == "undefined") || (photo1 == "N"))
    	{
    		document.getElementById("choiceimage").src = "resources/images/noimg.jpg";
    	}
    	else
    	{
    		document.getElementById("choiceimage").src = "/filepath/<%=home_photo1%>";	
    	}
    }
    
    function toggleImg2() 
    {
    	var photo2 = "<%=home_photo2%>";
    	if( (photo2 == "undefined") || (photo2 == "N"))
    	{
    		document.getElementById("choiceimage").src = "resources/images/noimg.jpg";
    	}
    	else
    	{
    		document.getElementById("choiceimage").src = "/filepath/<%=home_photo2%>";	
    	}
    }
    
    function toggleImg3() 
    {
    	var photo3 = "<%=home_photo3%>";
    	if( (photo3 == "undefined") || (photo3 == "N"))
    	{
    		document.getElementById("choiceimage").src = "resources/images/noimg.jpg";
    	}
    	else
    	{
    		document.getElementById("choiceimage").src = "/filepath/<%=home_photo3%>";	
    	}
    }
    
    function toggleImg4() 
    {
    	var photo4 = "<%=cert_photo1%>";
    	if( (photo4 == "undefined") || (photo4 == "N"))
    	{
    		document.getElementById("choiceimage2").src = "resources/images/noimg.jpg";
    	}
    	else
    	{
    		document.getElementById("choiceimage2").src = "/filepath/<%=cert_photo1%>";	
    	}
    }
    
    function toggleImg5() 
    {
    	var photo5 = "<%=cert_photo2%>";
    	if( (photo5 == "undefined") || (photo5 == "N"))
    	{
    		document.getElementById("choiceimage2").src = "resources/images/noimg.jpg";
    	}
    	else
    	{
    		document.getElementById("choiceimage2").src = "/filepath/<%=cert_photo2%>";	
    	}
    }
    
    function toggleImg6() 
    {
    	var photo6 = "<%=cert_photo3%>";
    	if( (photo6 == "undefined") || (photo6 == "N"))
    	{
    		document.getElementById("choiceimage2").src = "resources/images/noimg.jpg";
    	}
    	else
    	{
    		document.getElementById("choiceimage2").src = "/filepath/<%=cert_photo3%>";	
    	}
    }

	/*상단 사진 정보 클릭시 선택 시작*/ 
	
  /*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  시작*/ 
	window.onload = function() {
		  var divs = document.querySelectorAll('.aspect_1_1');
		  for (var i = 0; i < divs.length; ++i) {
		    var div = divs[i];
		    var divAspect = div.offsetHeight / div.offsetWidth;
		    div.style.overflow = 'hidden';
		    
		    var img = div.querySelector('img');
		    var imgAspect = img.height / img.width;
	
		    if (imgAspect <= divAspect) {
		      // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
		      var imgWidthActual = div.offsetHeight / imgAspect;
		      var imgWidthToBe = div.offsetHeight / divAspect;
		      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
		      img.style.cssText = 'width: auto; height: 100%; margin-left: '
		                      + marginLeft + 'px;'
		    } else {
		      // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
		      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
		    }
		  }
		  /*
		  var btn = document.querySelector('#btnToggleOverflow');
		  btn.onclick = function() {
		    var val = divs[0].style.overflow == 'hidden' ? 'visible' : 'hidden';
		    for (var i = 0; i < divs.length; ++i)
		      divs[i].style.overflow = val;
		  };
		  */
		};
		/*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  종료*/ 
    
    
  </script>  
  <script src="<c:url value="/resources/js/UT_JS/foster.js"/>"></script>    

	<!-- 아이콘 -->   
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script> 

	<!-- 데이트피커 ver.2 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- 달력(한국어버젼_) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
	
<!-- 데이트피커 자스코드 -->
<!-- 시작날짜 -->

	<script type="text/javascript">
	console.log(scheduleDate);

	$(document).ready(function(){
		$('#schedule').datepicker({
			format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
			language : "ko", // 언어(<ㅡ js추가필요해서 했음.)
			todayHighlight : false,
			datesDisabled : scheduleDate,
			startDate : '-3d',
			autoclose: false,
			toggleActive : true,
			orientation: "bottom auto"
	});

	});
	
		$('#datePicker_start').datepicker({
			dateFormat: 'yy-mm-dd', 			//달력에서 클릭시 표시할 값 형식
				language : "ko", 						//언어
				orientation: "bottom auto", //아래에 뜨게
				datesDisabled : scheduleDate,
				todayHighlight : true,			//오늘날짜 색상표시
				autoclose : true						//날짜누르면 닫힘.
		});

		
	</script>   
<!-- 종료날짜 -->
	<script type="text/javascript">
		$('#datePicker_end').datepicker({
			dateFormat: 'yy-mm-dd',			//달력에서 클릭시 표시할 값 형식
				language : "ko", 						// 언어
				orientation: "bottom auto", //아래에 뜨게
				datesDisabled : scheduleDate,
				todayHighlight : true,			//오늘날짜 색상표시
				autoclose : true						//날짜누르면 닫힘.
		});
	</script>    

	<!-- 타임피커 ver.1 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

	<!-- 타임피커 자스코드 -->
	<script type="text/javascript">
	
	$('.timepicker').timepicker({
	    timeFormat: 'p h:mm',
	    interval: 60,
	    minTime: '00',
	    maxTime: '11:00pm',
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	</script>
	
	<script type="text/javascript">
	$('.timepicker2').timepicker({
	    timeFormat: 'p h:mm',
	    interval: 60,
	    minTime: '07',
	    maxTime: '11:00pm',
	    startTime: '07:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	</script>	 

	<script>
			var id = '<%=id%>'
				
			
		    
			   if(id == "null"|| id == ""){
				  $(document).on('click', '#petinsert', function(event){
						Swal.fire({
						  title: '로그인을 하시겠습니까?',
						  text: "반려견 등록은 로그인 후 사용 가능합니다.",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: 'rgba(83, 220, 152)',
						  cancelButtonColor: '#de7631',
						  confirmButtonText: '<a href="loginform.me" style = "color : white;">로그인 페이지로</a>'
						}).then((result) => {
							  if (result.value) {
								  window.location = "loginform.me";
								}
						})
					});
				  
				  }else{
					  $(document).on('click','#petinsert',function(event){
						  window.location = "petRegister.me";
					  })
				  }
			
			   if(id == "null"|| id == ""){
					  $(document).on('click', '#paycheck', function(event){
							Swal.fire({
							  title: '로그인을 하시겠습니까?',
							  text: "예약신청은 로그인 후 사용 가능합니다.",
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonColor: 'rgba(83, 220, 152)',
							  cancelButtonColor: '#de7631',
							  confirmButtonText: '<a href="loginform.me" style = "color : white;">로그인 페이지로</a>'
							}).then((result) => {
								  if (result.value) {
									  window.location = "loginform.me";
									}
							})
						});
					  
					  }else{
						  $(document).on('click','#paycheck',function(event){
							  openModalRe();
						  })
					  }
			
		</script>

	<!--갤러리 및 후기 (Start)-->	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script><!-- sweetalert2 -->
	<script type="text/javascript">
	var sessionid = '<%=id%>';
	var sessionid2 = ',<%=id%>';
	//평점 AJAX
	var petsitter_id = '<%=petsitter_id%>';
		function ReviewRating(petsitterid){
			$('#reviewRating').empty();
			$('#reviewStar').empty();
			$.ajax({
        url:'/petsitter/getReviewRating.bo',
        type:'POST',
        data : {petsitterid: petsitterid},
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		if(item.avg_REVIEW_SCORE != null){
	        		var Rating = '';
	        		Rating += '평점 :&nbsp;'+ item.avg_REVIEW_SCORE + '';
	       	  	$('#reviewRating').append(Rating);
	       	  	
	       	  	var reviewStar = '';
	       	  	
	       	  	//후기 평점에 따라 보이는 별 개수
	   	    		if(item.review_SCORE == 5){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    		}
	   	    		if(item.review_SCORE == 4){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		    			}
	   	    		if(item.review_SCORE == 3){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	    				}   
	   	    		if(item.review_SCORE == 2){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE == 1){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px; margin-top: 1px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 4 && item.review_SCORE < 5){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 3 && item.review_SCORE < 4){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 2 && item.review_SCORE < 3){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 1 && item.review_SCORE < 2){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 0 && item.review_SCORE < 1){
	   	    			reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}	
	   	    		$('#reviewStar').html(reviewStar);
        		}
        		
        		
         	});
        },
   	    error:function(){
   	    	alert("ajax통신 실패!!!");
   	    }
    	}); 
    }
		
		
		var startnum = 4;
		var endnum = 8;
		//후기 리스트 및 펫시터 답변 작성
		function selectReview(petsitterid){
			$('#reviewList').empty();
			$.ajax({
        url:'/petsitter/reviewList.bo',
        type:'POST',
        data : {petsitterid: petsitterid},
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		//리스트 개수 지정 출력
        		if(index < startnum) {	
        			//사진 개 수 별 업로드 문자열 추출
	    		   	if(item.review_UP_PHOTO != "N"){
	    		   	var upphoto = item.review_UP_PHOTO;
	    		   	var Pphoto = upphoto.split(',', 3);
	    		   	}
	    		   	
	    		   	
	        		var reviewList = '';
	        		reviewList += '<div class ="col-12">';
	        	  reviewList += '<div class = "row justify-content-center">';
	        		reviewList += '<div class = "col-md-12">';
	        		if(item.member_PHOTO_FILE != "N"){
		        		reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
		        		reviewList += '<img src = "/petsitter/upload/'+item.member_PHOTO_FILE+'" />';
		        		reviewList += '</div></div></div>';
		        		reviewList += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
		    			}
	        		else {
	        			reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
	        			reviewList +=	'<img src = "resources/images/defaultprofile.jpg">';
	        			reviewList += '</div></div></div>';	
		        		reviewList += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
		    			}
	        		
	        		reviewList += '<table>';
	        		reviewList += '<tr>';
	        		reviewList += '<td class = "font-size-18 main_grayfont3 mybold"  align = "center">'+ item.member_NICKNAME + '</td>';
	        		reviewList += '<td style = "padding: 6px 0 0 10px; font-size: 12px;">';
	        		reviewList += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'&boardType='+item.board_TYPE+'" type="button" class="reportFormAjax main_redfont0">신고</a></td>';	
	        		reviewList += '</tr>';
	        		reviewList += '<tr>';
	        		
	        		//별 자리
	        		reviewList += '<td style = "padding: 2px 0 0 0;">';
	   	    		if(item.review_SCORE == 5){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    		}
	   	    		if(item.review_SCORE == 4){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		    			}
	   	    		if(item.review_SCORE == 3){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	    				}   
	   	    		if(item.review_SCORE == 2){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE == 1){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px; margin-top: 1px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 4 && item.review_SCORE < 5){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 3 && item.review_SCORE < 4){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 2 && item.review_SCORE < 3){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 1 && item.review_SCORE < 2){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 0 && item.review_SCORE < 1){
	   	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}	
							reviewList += '</td>';
							
							reviewList += '<td style = "padding: 0 0 0 10px;"> '+item.review_SCORE+'점</td>';
							reviewList += '</tr>';
							reviewList += '</table>';
								
							reviewList += '</div>';
							
							
							reviewList += '<div class = "float-right" style = "margin : 10px 0 0 0;">';
							reviewList += '<table><tr><td class= "rtablecss" id = "reviewlikecount'+item.list_NUM+'"></td></tr>';
							reviewList += '<tr><td class= "rtablecss">기입날짜 : '+item.real_DATE+'</td></tr></table></div>';
							reviewList += '<div class ="float-none"><br/><br/><br/></div>';
							reviewList += '</div>';
							
							

					
					
							reviewList += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
							reviewList += '<p>'+item.review_CONTENT+'</p>';
							reviewList += '</div>';
					
					
							reviewList += '<div class = "col-12">';
	
							//이미지 3장 보이게
				    	if(item.review_UP_PHOTO != "N" && Pphoto[1] == null){
				    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
				    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[0]+'" />';
				    		reviewList += '</div></div></div>';	
					    }
				    	if(item.review_UP_PHOTO != "N" && Pphoto[1] != null){
				    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
				    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[0]+'" />';
					    	reviewList += '</div></div></div>';			    		
					    	reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
					    	reviewList += '<img src = "/petsitter/upload/'+Pphoto[1]+'" />';
					    	reviewList += '</div></div></div>';
					    	if(Pphoto[2] != null){
					    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
					    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[2]+'" />';
					    		reviewList += '</div></div></div>';	
					    	}
				    	}
							reviewList += '</div>';							
							reviewList += '</div>';
	
							
							//후기작성의 펫시터 답 출력  시작  (if 문 이용 펫시터 답 있을 시 출력)
							if(item.review_REFLY != 'N'){
							reviewList += '<div class = "col-12" style = "width : 100%; background :rgba(224, 224, 224, 0.65)!important; padding : 13px 50px 1px 50px; margin : 17px 0 0 0;">';
							reviewList += '<div class = "row">';
							reviewList += '<div class = "col-md-12" style = "height : 100%; margin-bottom : 6px;">';
							
							if(item.petsitter_PHOTO_PROFILE_FILE != "N"){
				        		reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail03"> <div class="centered03">';
				        		reviewList += '<img src = "/petsitter/upload/'+item.petsitter_PHOTO_PROFILE_FILE+'" />';
				        		reviewList += '</div></div></div>';
				    	}
	        		else {
	        			reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
	        			reviewList +=	'<img src = "resources/images/defaultprofile02.png">';
	        			reviewList += '</div></div></div>';	
		    			}						
							
							reviewList += '<div class = "float-left" style= "padding : 17px 0 0 3px; margin-left : 10px; height : 100%;">';
							reviewList += '<table>';
							reviewList += '<tr>';
							reviewList += '<td class = "font-size-16 main_grayfont3 mybold"  align = "center">' + item.petsitter_NICKNAME + ' 펫시터님 답변<td>';
							reviewList += '<tr>';								
							reviewList += '</table>';
							reviewList += '</div>';
			        reviewList += '<div class = "reportPFFcss" >';
			        reviewList += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a></div>';	
							reviewList += '</div>';
	
							reviewList += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
							reviewList += '<p>' + item.review_REFLY + '</p>';
							reviewList += '</div>';
							reviewList += '</div>';			
							reviewList += '</div>';
							}
							//후기작성의 펫시터 답  출력 종료  (if 문 이용 펫시터 답 있을 시 출력)
							
							//후기작성의 펫시터 답  쓰기 시작  (if 문 이용 펫시터 없고 펫시터 일시 출력)
							if(item.review_REFLY == 'N' && sessionid == item.petsitter_ID){
							reviewList += '<div class = "col-12" style = "background :rgba(224, 224, 224, 0.65)!important; height : 100px; margin : 10px 0 0 0; ">';
							reviewList += '<div class = "row  justify-content-center">';
							reviewList += '<div class = "col-11" style = "padding : 11px 0 0 0;">';
							reviewList += '<form method="post" enctype="multipart/form-data" name="replyInsertForm'+item.list_NUM+'" id = "replyInsertForm'+item.list_NUM+'">';
							reviewList += '<table style = "width : 100%">';
							reviewList += '<tr>';
							reviewList += '<td style ="font-size : 1.5%; width : 11%">답변 :</td>';
							reviewList += '<td><textarea class= "ttareacss" name="REVIEW_REFLY"></textarea></td>';
							reviewList += '</tr>';
							reviewList += '</table>';
							reviewList += '<input type="hidden" name="LIST_NUM" value="'+item.list_NUM+'"/>';
							reviewList += '<input type="hidden" name="PETSITTER_ID" value="'+item.petsitter_ID+'"/>';
							reviewList += '</form>';
							reviewList += '</div>';
							reviewList += '</div>';
							reviewList += '</div>';
							reviewList += '<div class = "col-12 text-right" style ="margin-top : 10px;">';
							reviewList += '<a href="javascript:void(0);" onclick="replyInsert('+item.list_NUM+');" type="button" class="replybuttoncss btn btn-sm">펫시터 답글 남기기</a>';
							reviewList += '</div>';
							}
							//후기작성의 펫시터 답  쓰기 종료  (if 문 이용 펫시터 없고 펫시터 일시 출력)
							reviewList += '</div>'; 
							reviewList += '<hr class ="my-hr3"/>';
	        		
	        		
	   	    		$('#reviewList').append(reviewList);
	   	        reviewLikeCountRead(item.list_NUM);
        		}
         	});

        },
   	    error:function(){
   	    	alert("ajax통신 실패!!!");
   	    }
    	}); 
    }		
			
		$('.plus_review').on('click', function(event){ //on이 동적인걸 실행해준다.
			var petsitterid = petsitter_id;
			$.ajax({
	      url:$(this).attr("href"),
	      data : {petsitterid: petsitterid},
	      type:'POST',
	      dataType : 'json',
	      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	      success:function(data){
	      	$.each(data, function(index, item){	
	      		
	      		if(index >= startnum && index < endnum) {
			       	var reviewList = '';	 
			       	  
		  				//사진 개 수 별 업로드 문자열 추출
		  		   	if(item.review_UP_PHOTO != "N"){
		  		   	var upphoto = item.review_UP_PHOTO;
		  		   	var Pphoto = upphoto.split(',', 3);
		  		   	}
		  		   	
		  		   	
		      		var reviewList = '';
		      		reviewList += '<div class ="col-12">';
		      	  reviewList += '<div class = "row justify-content-center">';
		      		reviewList += '<div class = "col-md-12">';
		      		if(item.member_PHOTO_FILE != "N"){
			        		reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
			        		reviewList += '<img src = "/petsitter/upload/'+item.member_PHOTO_FILE+'" />';
			        		reviewList += '</div></div></div>';
			        		reviewList += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
			    			}
		      		else {
		      			reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
		      			reviewList +=	'<img src = "resources/images/defaultprofile.jpg">';
		      			reviewList += '</div></div></div>';	
			        		reviewList += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
			    			}
		      		
		      		reviewList += '<table>';
		      		reviewList += '<tr>';
		      		reviewList += '<td class = "font-size-18 main_grayfont3 mybold"  align = "center">'+ item.member_NICKNAME + '<td>';
			        reviewList += '<td style = "padding: 6px 0 0 10px; font-size: 12px;">';
			        reviewList += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a></td>';	
		      		reviewList += '</tr>';
		      		reviewList += '<tr>';
		      		
		      		//별 자리
		      		reviewList += '<td style = "padding: 2px 0 0 0;">';
		 	    		if(item.review_SCORE == 5){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    		}
		 	    		if(item.review_SCORE == 4){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
			    			}
		 	    		if(item.review_SCORE == 3){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		  				}   
		 	    		if(item.review_SCORE == 2){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE == 1){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px; margin-top: 1px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 4 && item.review_SCORE < 5){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 3 && item.review_SCORE < 4){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
									reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
									reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 2 && item.review_SCORE < 3){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
									reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
									reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 1 && item.review_SCORE < 2){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 0 && item.review_SCORE < 1){
		 	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}	
								reviewList += '<td>';
								
								reviewList += '<td style = "padding: 0 0 0 10px;"> '+item.review_SCORE+'점<td>';
								reviewList += '</tr>';
								reviewList += '</table>';
									
								reviewList += '</div>';
								reviewList += '<div class = "float-right" style = "margin : 10px 0 0 0;">';
								reviewList += '<table><tr><td class= "rtablecss" id = "reviewlikecount'+item.list_NUM+'"></td></tr>';
								reviewList += '<tr><td class= "rtablecss">기입날짜 : '+item.real_DATE+'</td></tr></table></div>';
								reviewList += '<div class ="float-none"><br/><br/><br/></div>';
								reviewList += '</div>';
		
						
						
								reviewList += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
								reviewList += '<p>'+item.review_CONTENT+'</p>';
								reviewList += '</div>';
						
						
								reviewList += '<div class = "col-12">';
		
								//이미지 3장 보이게
					    	if(item.review_UP_PHOTO != "N" && Pphoto[1] == null){
					    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
					    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[0]+'" />';
					    		reviewList += '</div></div></div>';	
						    }
					    	if(item.review_UP_PHOTO != "N" && Pphoto[1] != null){
					    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
					    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[0]+'" />';
						    	reviewList += '</div></div></div>';			    		
						    	reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
						    	reviewList += '<img src = "/petsitter/upload/'+Pphoto[1]+'" />';
						    	reviewList += '</div></div></div>';
						    	if(Pphoto[2] != null){
						    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
						    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[2]+'" />';
						    		reviewList += '</div></div></div>';	
						    	}
					    	}
								reviewList += '</div>';							
								reviewList += '</div>';
		
								
								//후기작성의 펫시터 답 출력  시작  (if 문 이용 펫시터 답 있을 시 출력)
								if(item.review_REFLY != 'N'){
								reviewList += '<div class = "col-12" style = "width : 100%; background :rgba(224, 224, 224, 0.65)!important; padding : 13px 50px 1px 50px; margin : 17px 0 0 0;">';
								reviewList += '<div class = "row">';
								reviewList += '<div class = "col-md-12" style = "height : 100%; margin-bottom : 6px;">';
								
								if(item.petsitter_PHOTO_PROFILE_FILE != "N"){
				        		reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail03"> <div class="centered03">';
				        		reviewList += '<img src = "/petsitter/upload/'+item.petsitter_PHOTO_PROFILE_FILE+'" />';
				        		reviewList += '</div></div></div>';
					    	}
		      			else {
				      			reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
				      			reviewList +=	'<img src = "resources/images/defaultprofile02.png">';
				      			reviewList += '</div></div></div>';	
			    			}						
								
								reviewList += '<div class = "float-left" style= "padding : 17px 0 0 3px; margin-left : 10px; height : 100%">';
								reviewList += '<table>';
								reviewList += '<tr>';
								reviewList += '<td class = "font-size-16 main_grayfont3 mybold"  align = "center">' + item.petsitter_NICKNAME + ' 펫시터님 답변<td>';
								reviewList += '<tr>';								
								reviewList += '</table>';
								reviewList += '</div>';
						    reviewList += '<div class = "reportPFFcss" >';
						    reviewList += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a></div>';	
								reviewList += '</div>';
		
								reviewList += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
								reviewList += '<p>' + item.review_REFLY + '</p>';
								reviewList += '</div>';
								reviewList += '</div>';			
								reviewList += '</div>';
								}
								//후기작성의 펫시터 답  출력 종료  (if 문 이용 펫시터 답 있을 시 출력)
								
								//후기작성의 펫시터 답  쓰기 시작  (if 문 이용 펫시터 없고 펫시터 일시 출력)
								if(item.review_REFLY == 'N' && sessionid == item.petsitter_ID){
								reviewList += '<div class = "col-12" style = "background :rgba(224, 224, 224, 0.65)!important; height : 100px; margin : 10px 0 0 0; ">';
								reviewList += '<div class = "row  justify-content-center">';
								reviewList += '<div class = "col-11" style = "padding : 11px 0 0 0;">';
								reviewList += '<form method="post" enctype="multipart/form-data" name="replyInsertForm'+item.list_NUM+'" id = "replyInsertForm'+item.list_NUM+'">';
								reviewList += '<table style = "width : 100%">';
								reviewList += '<tr>';
								reviewList += '<td style ="font-size : 1.5%; width : 11%">답변 :</td>';
								reviewList += '<td><textarea class= "ttareacss" name="REVIEW_REFLY"></textarea></td>';
								reviewList += '</tr>';
								reviewList += '</table>';
								reviewList += '<input type="hidden" name="LIST_NUM" value="'+item.list_NUM+'"/>';
								reviewList += '<input type="hidden" name="PETSITTER_ID" value="'+item.petsitter_ID+'"/>';
								reviewList += '</form>';
								reviewList += '</div>';
								reviewList += '</div>';
								reviewList += '</div>';
								reviewList += '<div class = "col-12 text-right" style ="margin-top : 10px;">';
								reviewList += '<a href="javascript:void(0);" onclick="replyInsert('+item.list_NUM+');" type="button" class="replybuttoncss btn btn-sm">펫시터 답글 남기기</a>';
								reviewList += '</div>';
								}
								//후기작성의 펫시터 답  쓰기 종료  (if 문 이용 펫시터 없고 펫시터 일시 출력)
								reviewList += '</div>'; 
								reviewList += '<hr class ="my-hr3"/>';	       	  
			       	  
			      		$('#reviewList').append(reviewList);
			   	      reviewLikeCountRead(item.list_NUM);			      		
		      		}	
	     	  	});
		      	startnum += 4; //다음 더보기시 데이터 4개 추가 생성
		      	endnum += 4; //다음 더보기시 데이터 4개 추가 생성
	  			},
			   	error:function(){
			       alert("ajax통신 실패!!!");
			   	}
			  }); 
				//기본 이벤트 제거
			 event.preventDefault();
			});
		
		
		function replyInsert(listNum) {
			var insertData = $('#replyInsertForm'+listNum+'').serialize();
			$.ajax({		
				url : '/petsitter/write_ReviewReply.bo',
				type : 'POST',
				data : insertData,
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : function(data) {
					if(data == 1) {
						// 댓글 작성 후 댓글 목록 reload
						selectReview(petsitter_id);
					}
				},
				error:function() {
					alert("ajax 통신 실패(write)");			
				}
			});
		}		
		
		$(document).ready(function(){ 
			
			//더보기 버튼 누를시 현재 스크롤 을 구해서 그 위치를 유지 시작
		  $(".plus_review").click(function() {
				//현재 스크롤 값 구하기
				var scrollValue = $(document).scrollTop();
				//지정값으로 가기
			  $('html, body').animate({
			  	scrollTop : scrollValue
			  },);
			     return false;
		  });
			//종료
			
			//더보기 버튼 누를시 현재 스크롤 을 구해서 그 위치를 유지 시작
		  $(".plus_gallery").click(function() {
				//현재 스크롤 값 구하기
				var scrollValue = $(document).scrollTop();
				//지정값으로 가기
			  $('html, body').animate({
			  	scrollTop : scrollValue
			  },);
			     return false;
		  });
			//종료	
			
			//페이지 로드시  출력 리스트
			ReviewRating(petsitter_id);
			selectReview(petsitter_id);
			selectGallery(petsitter_id);
			
		});	  
		
		var galleryStart = 12;
		var galleryEnd = 24;
		var gallerylimit = 0;
		
		//후기 리스트 및 펫시터 답변 작성
		function selectGallery(petsitterid){
			$('#reviewList').empty();
			$.ajax({
        url:'/petsitter/galleryList.bo',
        type:'POST',
        data : {petsitterid: petsitterid},
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){

	    		   var galleryList = '';
        			//사진 개 수 별 업로드 문자열 추출
	    		   	if(item.communication_PHOTO_FILE != "N"){
	    		   	var upphoto = item.communication_PHOTO_FILE;
	    		   	var Pphoto = upphoto.split(',');
								for(var i = 0; i < Pphoto.length; i++){
									if(gallerylimit < galleryStart) {
									galleryList += '<div class = "col-2-lg" style ="padding : 7px 7px;">';
									galleryList += '<div class="thumbnail-wrapper"> <div class="thumbnail04"> <div class="centered04">';
									galleryList += '<img src = "/petsitter/upload/'+Pphoto[i]+'">';
									galleryList += '</div></div></div>';
									galleryList += '</div>';
									gallerylimit = gallerylimit + 1;
									}
								}
	    		   	}
        			
		      		$('#galleryList').append(galleryList);        			

         	});
        },
   	    error:function(){
   	    	alert("ajax통신 실패!!!");
   	    }
    	}); 
    }			
		

		$('.plus_gallery').on('click', function(event){ //on이 동적인걸 실행해준다.
			var gallerylimit2 = 0;
			var petsitterid = petsitter_id;
			$.ajax({
	      url:$(this).attr("href"),
	      data : {petsitterid: petsitterid},
	      type:'POST',
	      dataType : 'json',
	      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	      success:function(data){
	      	$.each(data, function(index, item){	
	      		
	    		  var galleryList = '';
       			//사진 개 수 별 업로드 문자열 추출
	    		   	if(item.communication_PHOTO_FILE != "N"){
	    		   	var upphoto = item.communication_PHOTO_FILE;
	    		   	var Pphoto = upphoto.split(',');
								for(var i = 0; i < Pphoto.length; i++){
										gallerylimit2 = gallerylimit2 +1;
										if(gallerylimit2 >= galleryStart && gallerylimit2 < galleryEnd) {
										galleryList += '<div class = "col-2-lg" style ="padding : 7px 7px;">';
										galleryList += '<div class="thumbnail-wrapper"> <div class="thumbnail04"> <div class="centered04">';
										galleryList += '<img src = "/petsitter/upload/'+Pphoto[i]+'">';
										galleryList += '</div></div></div>';
										galleryList += '</div>';
									}
								}
	    		   	}
	    		   
		      		$('#galleryList').append(galleryList);   
      		
 	  			});
	      	galleryStart += 12; //다음 더보기시 데이터 12개 추가 생성
	      	galleryEnd += 12; //다음 더보기시 데이터 12개 추가 생성
				},
	   		error:function(){
	       alert("ajax통신 실패!!!");
	   		}
	    }); 
			//기본 이벤트 제거
			event.preventDefault();
		});	      		
	      		

		//좋아용 기능 시작
		function reviewLikeCountRead(reviewListNum){
			$.ajax({
				url : '/petsitter/readReviewLikeCount.bo',
				data : { reviewListNum : reviewListNum},
				type : 'post',
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : function(data) {
					$('#reviewlikecount'+reviewListNum).empty();
					var a = '';
					var num = 1;
					$.each(data, function(key, value) {						
						
    		   	//좋아요 아이디 추출
    		   	if(value.like_ID != "N"){
    		   	var likeids = value.like_ID;
    		   	var likeid = likeids.split(',');
        		}
						
    		  	//좋아요 유무 확인및 list
    		   	if(sessionid == "null" ){
							a += '<a href ="#" class="likeloginalert">';
							a += '<img src = "resources/images/heart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">'
							a += '</a>&nbsp;&nbsp;'+value.like_COUNT+'';
	    			}							
		    		//idcheck 는  좋아요를 누른 아이디 일시 2로 바뀜
		    		var idcheck = 1;
		    		//첫 split된 인데스 0번째는 'N' 으로 1인덱스부터 시작과 il에 1추가로 필요한 길이 맞춤
		    		if (sessionid != "null" && value.like_ID != "N"){
		    			var lc = value.like_COUNT;
		    			var ln = value.list_NUM;
		    			for(j = 1; j < lc+1; j++){
			    			if(likeid[j] == sessionid) {
			    				a += '<form id = "reviewLikeForm">';
			    				a += '<a href ="./updateLike_count2.bo" class = "downdateLike_count">';
									a += '<img src = "resources/images/fullheart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">'
									a += '</a>&nbsp;&nbsp;'+value.like_COUNT+'';
						    		//input으로 serialize 이용 값을 sql문에 대입 가능하게 전송
					    		a += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
					    		a += '<input type = "hidden" name = "LIKE_COUNT" id = "LIKE_COUNT'+ln+'" value= "'+ (lc-1) +'">';
					    		a += '<input type = "hidden" name = "LIST_NUM" id = "LIST_NUM" value= "'+ ln + '">';
					    		a += '</form>';
					    		idcheck = 2; //아이디확인 값 2로
			    			}
		    			}
		    		}
		    		if(sessionid != "null" && idcheck == 1){
		    			var lc = value.like_COUNT;
		    			var ln = value.list_NUM;
		    			a += '<form id = "reviewLikeForm">';
							a += '<a href ="./updateLike_count.bo" class = "updateLike_count">';
							a += '<img src = "resources/images/heart.png"  width = "15px" height = "15px" style = "margin-bottom : 5px;">'
							a += '</a>&nbsp;&nbsp;'+value.like_COUNT+'';
			    		a += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
			    		a += '<input type = "hidden" name = "LIKE_COUNT" id = "LIKE_COUNT'+ln+'" value= "'+ (lc+1) +'">';
			    		a += '<input type = "hidden" name = "LIST_NUM" id = "LIST_NUM" value= "'+ ln + '">';
			    		a += '</form>';
		    		}
		    		
					$('#reviewlikecount'+reviewListNum).html(a);	
					}); 
				}, 
				error:function(request, status, error){
					console.log("ajax 통신 실패");
					alert("ajax 통신 실패(List)");
				}
			});
		}	
		
		
		$(document).ready(function(){
			//좋아요 수 증가
		 	$(document).on('click', '.updateLike_count', function(event){
		 		var params;
		 		params = $(this).parents('#reviewLikeForm').serialize();
		 		jQuery.ajax({
		 			url : $(this).attr("href"),
					type : 'post',
					data : params,
			    dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						$.each(data, function(index, item){
							// 좋아요 후 좋아요 정보 출력
							reviewLikeCountRead(item.list_NUM);
						});
					},
					error:function() {
						alert("ajax 통신 실패!!");			
					}		
				});
				  //기본 이벤트 제거
				  event.preventDefault();		 		
			});
					
			
				//좋아요 수 감소
			 	$(document).on('click', '.downdateLike_count', function(event){
			 		var params;
			 		params = $(this).parents('#reviewLikeForm').serialize();
			 		
			 		jQuery.ajax({
			 			url : $(this).attr("href"),
						type : 'post',
						data : params,
				    dataType : 'json',
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						success : function(data) {
							$.each(data, function(index, item){
								// 좋아요 취소 후 좋아요 정보 출력
								reviewLikeCountRead(item.list_NUM);
							});
						},
						error:function() {
							alert("ajax 통신 실패!!");			
						}		
					});
					  //기본 이벤트 제거
					  event.preventDefault();		 		
				});
				//좋아용 기능 종료
				
				
				//Modal reportForm 시작	
				$(document).on('click', '.reportFormAjax', function(event){ //on이 동적인걸 실행해준다.
					$('#reportForm').empty();
					$.ajax({
			      url:$(this).attr("href"),
			      type : 'POST',
			      dataType : 'json',
			      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		        success:function(data){
		        	var k = 1;
		        	$.each(data, function(index, item){
									
		        			if(sessionid == 'null'){
		        				Swal.fire({
			     					 	title: '로그인을 하시겠습니까?',
			     					  text: "신고는 로그인 후 사용 가능합니다.",
			     					  icon: 'warning',
			     					  showCancelButton: true,
			     					  confirmButtonColor: 'rgba(83, 220, 152)',
			     					  cancelButtonColor: '#de7631',
			     					  confirmButtonText: '<a href="loginform.me" style = "color : white;">로그인 페이지로</a>'
			     					}).then((result) => {
			     						  if (result.value) {
			     							  window.location = "loginform.me";
			     							}
			     					})	
		        					return false;		
		        			}
		        			
		        			if(item.review_CONTENT == 'NN'){
			    					Swal.fire({
			    						  title: '신고가 접수된 게시글 입니다!',
			    						  text: "고객님의 관심의 감사를 표하며 빠른시일 내에 처리하겠습니다.",
			    						  icon: 'warning',
			    						  confirmButtonColor: 'rgba(83, 220, 152)',
			    						})
		        				return false;
		        			}
		        		
		        			var reportForm = '';
			        		reportForm += '<div class="modal fade" id="staticBackdropReport" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">';
			        		reportForm += '<div class="modal-dialog modal-sm">';
			        		reportForm += '<div class="modal-content">';
			        		reportForm += '<div class="modal-header">';
			        		reportForm += '<h4 class="modal-title main_mintfont font-size-20" id="staticBackdropLabel">신고하기.</h4>';
			        		reportForm += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
			        		reportForm += '<span aria-hidden="true">&times;</span>';
			        		reportForm += '</button>';
			        		reportForm += '</div>';
			        		reportForm += '<div class="modal-body">';
			        		reportForm += '<form action="./reviewreportinsert2.bo" style = "font-size : 0" method="post" name="reportFormSubmit" enctype="multipart/form-data">';
			        		reportForm += '<div class = "row">';
			        		reportForm += '<div class = "col-12 font-size-14 main_grayfont3">';
			        		reportForm += '<input type="hidden" name="MEMBER_ID" value="${id}">';
			        		reportForm += '<input type="hidden" name="LIST_NUM" value="'+item.list_NUM+'">';
			        		reportForm += '<input type="hidden" name="BOARD_TYPE" value="'+item.board_TYPE+'">';
			        		reportForm += '<input type="hidden" name="PETSITTER_ID" value="' + petsitter_id + '">';	
			        		reportForm += '신고 글 번호 : '+item.list_NUM+'<br/>';
			        		reportForm += '<br/><div>신고자</div>';
			        		reportForm += '<div>${id}</div>';		        		
			        		reportForm += '<div>${name}</div>';
			        		reportForm += '</br><div>신고 사유</div>';
			        		reportForm += '<textarea id="REPORT_REASON" name="REPORT_REASON" rows="4" cols="35" placeholder="신고 사유를 적어주세요."></textarea>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</form>';
			        		reportForm += '<div class="modal-footer">';
			        		reportForm += '<div class = "row">';
			        		reportForm += '<div class = "col-12 font-size-14">';
			        		reportForm += '<a type="button" class="btn btn-sm pbtn02 reportInsert" id="btnReportClose" href="javascript:addreportboard()">신고하기</a>';
			        		reportForm += '<button type="button" class="btn btn-sm pbtn03" data-dismiss="modal" id="btnList">닫기</button>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
		   	       		$('#reportForm').append(reportForm);
		   	       		
		   	       		
		    			});
			      	if( true ) { $('.staticBackdropReport').get(0).click(); }        	
		    		},
		    		error:function(request,status,error){
		    	        alert("list ajax통신 실패!!!");
		    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        	}
					}); 
					//기본 이벤트 제거
					event.preventDefault();				
				});		
				//Modal reportForm 종료							
				
				
		});			
		
		
		  //글 신고 INSERT 버튼 시작
		function addreportboard(){
			var rpr = document.reportFormSubmit.REPORT_REASON.value;
			if (rpr.length < 2)
			{
				alert("신고 이유를 2자 이상 입력하세요.");
				document.reportForm.reportFormSubmit.focus();
				return false;
			}
			reportFormSubmit.submit();
		}
		//글 신고 INSERT 버튼 종료			
	</script> 
	<script>
	function getBoardList2() {
		$.ajax({
			url : '/petsitter/pqboardlist2.bo',
      type : 'POST',
      dataType : 'JSON',
      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) { // 성공시
				
				console.log("통신 성공");
				
				var id = '<%=id%>';
				var rank = '<%=rank%>';
		
				var pqForm = '';
							
				pqForm += '<div class="row">';
				pqForm += '<div class="col-md-12">';
				pqForm += '<br><br>';
				pqForm += '<h5 style="color:#5e5e5e!important;">펫시터에게 질문하기</h6>';
				pqForm += '<table class="table table-sm table-hover table-striped">';
				pqForm += '<thead>';
				pqForm += '<tr>';
				pqForm += '<th width="150px">닉네임</th>';
				pqForm += '<th>제목</th>';
				pqForm += '<th width="100px">작성일자</th>';
				pqForm += '</tr>';
				pqForm += '</thead>';
				pqForm += '<tbody>';			
				
				$.each(data, function(index, item) {		
					
					var nickname = '${nickname}';
					
					if(nickname == item.petsitter_NICKNAME) {
						pqForm += '<tr>'; 
						pqForm +=	'<td>' + item.member_NICKNAME + '</td>';						
						pqForm += '<td style="text-align:left;"><b><a style="color:#53dc99!important;" href="./pqboarddetail.me?bno=' + item.petsitter_QNA_BNO + '">' + item.petsitter_QNA_SUBJECT + '</a></b></td>';
						pqForm += '<td>' +item.real_DATE+ '</td>'; 
						pqForm += '</tr>';
					}
					});
				
				pqForm += '</tbody>';
				pqForm += '</table>';
				pqForm += '</div>';
				pqForm += '</div>';
			
				$('#getBoardList2').append(pqForm);
			},
	   	error:function(request,status,error){
 	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
     		}
		});
			
	}

	$(document).ready(function() {
		getBoardList2();
 	});
</script> 
</body>
</html>