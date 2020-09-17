<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%
/* 세션 id값이 null일 경우 로그인 요구 */
if(session.getAttribute("id") == null) {
   out.println("<script>");
   out.println("location.href = 'loginform.me'");
   out.println("</script>");
}

String id = (String)session.getAttribute("id");
String name = (String)session.getAttribute("name");
String rank = (String)session.getAttribute("rank");
String btype = "noticeboard";

/* 회원 등급이 manager도 admin도 아닐 경우 메인페이지로 리다이렉트 */
if(!(rank.equals("manager")) && !(rank.equals("admin"))) {
	out.println("<script>");
  out.println("location.href = 'home.me'");
  out.println("</script>");
}
%>
<%@ include file="../jsp_top.jsp" %>
<!doctype html>
<html lang="ko">

<style>
	button#prev, button#list, button#next, button#write {
		color : white!important;
	}
	button#write {
		background-color:#53DC98!important;
	}
	h3#qna {
		color : #5e5e5e!important;		
	}
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
	
	/*파일 선택 css 시작*/
	.filebox input[type="file"] { 
	position: absolute;
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); border: 0; 
	} 
	
	.filebox label { 
	display: inline-block; 
	padding: .3em .75em; 
	margin : 0;
	color: #ffffff; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: rgb(83,220,152); 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
	} 
	/*파일 선택 css 종료*/
	
	/* named upload */ 
	.filebox .upload-name { 
	display: inline-block; 
	padding: .3em .75em; 
	/* label의 패딩값과 일치 */ 
	font-size: inherit; 
  line-height: normal; 
  vertical-align: middle; 
  background-color: #f5f5f5; 
  border: 1px solid #ebebeb; 
  border-bottom-color: #e2e2e2; 
  border-radius: .25em; 
  -webkit-appearance: none; 
  /* 네이티브 외형 감추기 */ 
  -moz-appearance: none; 
  appearance: none; 
  }
	/*파일 선택 css 종료*/
		/*파일 선택 css 시작*/
		
/* imaged preview */ 
.filebox .upload-display { 
/* 이미지가 표시될 지역 */ 
margin-bottom: 5px; 
} 
	@media(min-width: 768px) { 
		.filebox .upload-display { 
			display: inline-block; 
			margin-right: 5px; 
			margin-bottom: 0; 
		} 
	} 
	.filebox .upload-thumb-wrap { 
	/* 추가될 이미지를 감싸는 요소 */ 
	display: inline-block; 
	width: 70px; 
	padding: 2px; 
	vertical-align: middle; 
	border: 1px solid #ddd; 
	border-radius: 5px; 
	background-color: #fff; 
	} 
	.filebox .upload-display img { 
	/* 추가될 이미지 */ 
	display: block; 
	max-width: 100%; 
	width: 100%; 
	height: auto; 
	}
	/*파일 선택 css 종료*/	
	.padd0 {
	padding : 0 0 0 0;
	margin : 4px 0 0 0;
	}
	 
</style>
<head>
	<title>공지사항 작성 | PetSitter</title>
  <form action="./noticeboardwrite.me" method="post" name="boardform" enctype="multipart/form-data">
  <input type="hidden" name="NOTICE_ID" value="${id}">
  <input type="hidden" name="NOTICE_NICKNAME" value="${name}">
	<!-- CKEDITOR 사용 위한 스크립트 -->
	<script src = "${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<div class="site-wrap" id="home-section">
		<div class="container">      
			<div class="row">
    		<div class="col-md-12 p-3"></div>
     </div>

    <div class="row">
  	  <div class="col-md-2">
    		<button type="button" style="background:#e67e22;" class="btn btn-sm">관리자 페이지</button>
    	</div>
	    <div class="col-md-7"></div>
      <div class="col-md-3">
    		<button type="button" style="background:#53dc98;" class="btn btn-sm">회원 관리</button>
    		<button type="button" style="background:#53dc98;" class="btn btn-sm">신고 관리</button>
    		<button type="button" style="background:#53dc98;" class="btn btn-sm">회계 관리</button>
    	</div>
    </div>  
    ${id}  로그인 중
    닉네임 : ${name} 
    <!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-3"></div>
    </div>
    
    <div class="row">
   		<div class="col-md-12">
   			<span class="glyphicon glyphicon-pencil"></span>
  			<div class="input-group">  		
 					<input name="NOTICE_SUBJECT" type="text" class="form-control" aria-describedby="sizing-addon1">
				</div>
   		</div>
    </div>
    
	   <form>
	    <div class="row">
	     	<div class="col-md-12">
	    		<div class="checkbox">
	    			<label>
	      			<input type="checkbox" name="NOTI">상단 고정
	    			</label>
	  			</div>
	  		</div>
	  	</div>
    </form>
    
    <!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-1"></div>
    </div>
    
    <!-- 본문 textarea를 ckeditor로 교체 -->
    <div class="row">
    	<div class="col-md-12">
    		<textarea name = "NOTICE_CONTENT"></textarea>
					<script>CKEDITOR.replace('NOTICE_CONTENT');</script>
    		</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<table>
    			<tr>
    				<td>
    					<div align="center">미리 보기	</div>
    				</td>
    				<td>
							<div class = "col-12 filebox padd0 filebox preview-image">
				         <label for="input-file">업로드</label> 
				         <input class="upload-name" value="파일선택" disabled="disabled" style = "text-align : right" > 
				         <input type="file" id="input-file" class="upload-hidden" name = "NOTICE_FILE"> 
					    </div>
    				</td>
    			</tr>
  
    		</table>
    	</div>
    </div>

		<!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-1"></div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="text-right">
					<a type="button" style="background:#53dc98; color:white;" class="btn btn-sm" id="btnSave" href="javascript:addboard()">등록</a>
	  			<a type="button" style="background:#e67e22; color:white;" class="btn btn-sm" id="btnList" href="javascript:history.go(-1)">취소</a>
	  		</div>
    	</div>
    </div>
   </div>
	  
		<!-- 하단 넉넉하게 여백 주기 -->
		<div class="row">
    	<div class="col-md-12 p-5"></div>
    </div>
	</div>
<%@ include file="../jsp_bottom.jsp" %>
  	<script>
			function addboard(){
				boardform.submit();
			}		
		</script>

		<script>
		$(document).ready(function() { 
			var fileTarget = $('.filebox .upload-hidden'); 
			fileTarget.on('change', function() { // 값이 변경되면
				if(window.FileReader) { // modern browser 
				var filename = $(this)[0].files[0].name; 
				} else { 
				// old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			  } 
			
				// 추출한 파일명 삽입
				$(this).siblings('.upload-name').val(filename); 
		  }); 
		});

		//preview image 
		var imgTarget = $('.preview-image .upload-hidden'); 
		imgTarget.on('change', function(){ 
			var parent = $(this).parent(); 
			parent.children('.upload-display').remove(); 
			if(window.FileReader){ //image 파일만 
				if (!$(this)[0].files[0].type.match(/image\//)) return;
			var reader = new FileReader(); 
			reader.onload = function(e){ 
				var src = e.target.result; 
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
				} 
			reader.readAsDataURL($(this)[0].files[0]); 
			} 
			else { 
				$(this)[0].select(); 
				$(this)[0].blur(); 
				var imgSrc = document.selection.createRange().text; 
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
				var img = $(this).siblings('.upload-display').find('img'); 
				img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
				} 
			});
		</script>
</body>
</html>
