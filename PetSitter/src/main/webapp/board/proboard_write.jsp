<!-- 관리자 메인 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.*" %>

<%@ page import="javax.servlet.*,java.text.*" %>
<%
if(session.getAttribute("id") == null) {
    out.println("<script>");
    out.println("location.href = 'home.me'");
    out.println("</script>");
 }
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<%@ include file="../jsp_top.jsp" %>
<!doctype html>
<html lang="en">


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

	
/* 제이쿼리 로인해 색 폰트 사이즈 수정을 위해 jsp파일안에 스타일 오버라이트 
resource/css/style.css 부분에서 찾은 부분(최종은 jsp에있는 style로 적용 됨) */
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
	  transition: .3s all ease-in-out; }
	/* 기본 상단바 끝*/
	.site-mobile-menu .site-mobile-menu-body {
	background: #d3d3d3!important;
	overflow-y: scroll;
	-webkit-overflow-scrolling: touch;
	position: relative;
	padding: 0 20px 20px 20px;
	height: calc(100vh - 52px);
	padding-bottom: 150px; }
	  /* 기본 상단바 끝*/
	
	/*최하단바 시작*/
	.site-footer {
	  padding: 4em 0;
	  background: #e9e9e9!important; 
	}
	/*최하단바 종료*/
	
	 
	
</style>
<head>
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <title>전문가 상담 게시판</title>
		<link rel="stylesheet" type="text/css" href="resources/css/JH_CSS/proBoard2.css?after">	
  </head>
<form action="./proboardwrite.bo" method="post" name="proboardform" enctype="multipart/form-data">
<input type="hidden" name="MEMBER_ID" value="<%=id %>">
   	<div class="container">      
			<div class="row">
    		<div class="col-md-12 p-3"></div>
     </div>
    
    <!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-3"></div>
    </div>
    
    <div class="row">
	     	<div class="col-md-12">
	    		<div class="checkbox font-size-14 main_grayfont3">
	    			<label>
	      			비밀 게시판&nbsp; 
	    			</label>
	    			<input type="checkbox" name = "SECRET_CHECK" value = "Y">
	  			</div>
	  		</div>    
   		<div class="col-md-12">
   			<span class="glyphicon glyphicon-pencil"></span>
  			<div class="input-group">  		
 					<input type="text" class="form-control" placeholder="제목" aria-describedby="sizing-addon1" id ="PRO_SUBJECT" name = "PRO_SUBJECT">
				</div>
   		</div>
    </div>
    
	    <div class="row">

	    </div>
    
    <!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-1"></div>
    </div>
    
    <!-- 본문 textarea를 ckeditor로 교체 -->
    <div class="row">
    	<div class="col-md-12">
				<textarea  name="PRO_CONTENT" cols="155" rows="10" onKeyUp="javascript:fnChkByte(this,'3000')"></textarea>
				<span id="byteInfo">0</span>/3000Byte
    	</div>
    </div>
    
    <div class = "col-12 filebox padd0 filebox preview-image">
			<label for="input-file">업로드</label> 
			<input class="upload-name" value="파일선택" disabled="disabled" style = "text-align : right" id = "filecheck01"> 
			<input type="file" id="input-file" class="upload-hidden" name = "PRO_FILE"> 
    </div>
    
    <div class = "col-12 filebox padd0 filebox preview-image">
			<label for="input-file02" class = "filecheck">업로드</label> 
			<input class="upload-name" value="파일선택" disabled="disabled" style = "text-align : right"> 
			<input type="file" id="input-file02" class="upload-hidden" name = "PRO_FILE02"> 
    </div>    
     
		<!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-1"></div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
				<button type="button" class="btn btn-sm pbtn02 float-right" id = "btn-cls" onclick = "location.href = 'javascript:history.go(-1)' ">취소</button>
				<button type="button" class="btn btn-sm pbtn01 float-right" onclick = "location.href = 'javascript:addboard()' ">등록</button>
    	</div>
    </div>
   </div>
	  
		<!-- 하단 넉넉하게 여백 주기 -->
		<div class="row">
    	<div class="col-md-12 p-5"></div>
    </div>
</form>      
	   
<%@ include file="../jsp_bottom.jsp" %>

    <script type="text/javascript">
    //제목, 최소 글자수 제한
		function addboard(){
			var sub = document.proboardform.PRO_SUBJECT.value
			var con = document.proboardform.PRO_CONTENT.value
			if (sub.length < 2)
			{
				alert("제목을 2자 이상 입력하세요.");
				document.proboardform.PRO_SUBJECT.focus();
				return false;
			}
			if (sub.length > 40)
			{
				alert("제목을 40자 이하로 입력하세요.");
				document.proboardform.PRO_SUBJECT.focus();
				return false;
			}			
			if(con.length < 10){
				alert("내용을 10자 이상 입력하세요.");
				document.proboardform.PRO_CONTENT.focus();
				return false;
			}
			proboardform.submit();
		}
	</script> 
    
		<script type="text/javascript">
		//내용 byte 글자수 제한 시작
		function fnChkByte(obj, maxByte){
		var str = obj.value;
		var str_len = str.length;

		var rbyte = 0;
		var rlen = 0;
		var one_char = "";
		var str2 = "";

		for(var i=0; i<str_len; i++){
		one_char = str.charAt(i);
		if(escape(one_char).length > 4){
		    rbyte += 2; //한글2Byte
		}else{
		    rbyte++; //영문 등 나머지 1Byte
		}

		if(rbyte <= maxByte){
		    rlen = i+1; //return할 문자열 갯수
		}
		}

		if(rbyte > maxByte){
		    alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
		    str2 = str.substr(0,rlen); //문자열 자르기
		    obj.value = str2;
		    fnChkByte(obj, maxByte);
		}else{
		    document.getElementById('byteInfo').innerText = rbyte;
		}
		}
		//내용 byte 글자수 제한 종료
		
		//input type file js(css) 시작
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
		//input type file js(css) 종료
		
		//preview image 파일선택시 이미지 보이게 시작
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
		//preview image 파일선택시 이미지 보이게 종료		
		
		//두번째 이미지 파일 넣을때 시작
		$(document).on('click', '.filecheck', function(event){
			var fc01 = document.proboardform.filecheck01.value;
			if (fc01 == '파일선택')
			{
				alert("상단 파일 업로드를 먼저해주세요!");
				return false;
			}		
		});		
		//두번째 이미지 파일 넣을때 종료

	</script>
</body>
</html>
