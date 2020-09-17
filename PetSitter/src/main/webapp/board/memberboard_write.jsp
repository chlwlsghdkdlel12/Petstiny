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
String nickname = (String)session.getAttribute("nickname");
String rank = (String)session.getAttribute("rank");
String btype = "mboard";

System.out.println(nickname);
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
</style>
<head>
	<title>이용자 상담/문의 | PetSitter</title>
  <form action="./mboardwrite.me" method="post" name="boardform" enctype="multipart/form-data">
  <input type="hidden" name="MEMBER_ID" value="${id}">
  <input type="hidden" name="MEMBER_NAME" value="${name}">
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
    ${id}  로그인 중 <br>
    닉네임 : ${nickname} 
    <!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-3"></div>
    </div>
    
    <div class="row">
   		<div class="col-md-12">
   			<span class="glyphicon glyphicon-pencil"></span>
  			<div class="input-group">  		
 					<input name="MEMBER_SUBJECT" type="text" class="form-control" aria-describedby="sizing-addon1">
				</div>
   		</div>
    </div>
    
	   <form>
	    <div class="row">
	     	<div class="col-md-12">
	    		<div class="checkbox">
	    			<label>
	      			<input type="checkbox" name="MEMBER_SECRET">비밀글
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
    		<textarea name = "MEMBER_CONTENT"></textarea>
					<script>CKEDITOR.replace('MEMBER_CONTENT');</script>
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
	    				<div class="inputArea">
	    					<label for="exampleImg">이미지</label>
	    					<input name="MEMBER_FILE" id="exampleImg" type="file"/>
	    					<div class="select_img"><img src="" /></div>
	    						<script>
				  				$("#exampleImg").change(function(){
				   					if(this.files && this.files[0]) {
				    					var reader = new FileReader;
				    						reader.onload = function(data) {
				     							$(".select_img img").attr("src", data.target.result).width(500);        
				    						}
				    					reader.readAsDataURL(this.files[0]);
				   					}
				  				});
				 				</script>
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
</body>
</html>
