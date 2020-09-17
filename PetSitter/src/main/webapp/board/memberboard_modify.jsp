<!-- 관리자 메인 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.mboard.*" %>

<%@ page import="javax.servlet.*,java.text.*" %>
<%
String id = (String)session.getAttribute("id");
MemberBoardVO mboard = (MemberBoardVO)request.getAttribute("vo");

String name = (String)session.getAttribute("name");
String rank = (String)session.getAttribute("rank");
String btype = "mboard";

/* 글쓴이가 다르고 회원 등급이 manager도 admin도 아닐 경우 메인페이지로 리다이렉트 */
if(!(mboard.getMEMBER_ID().equals(id)) && !(rank.equals("manager")) && !(rank.equals("admin"))) {
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
</style>
<head>
	<title>이용자 상담/문의 | PetSitter</title>
	<form action="./mboardmodify.me" method="post" name="modifyform">
	<input type="hidden" name="MEMBER_NUM" value="<%=mboard.getMEMBER_NUM() %>">
	<input type="hidden" name="MEMBER_ID" value="${id}">
	<script>
		function modifyboard(){
			modifyform.submit();
		}
	</script>
	
	<!-- CKEDITOR 사용 위한 스크립트 -->
	<script src = "${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('MEMBER_CONTENT', {
				filebrowserUploadUrl : '${pageContext.request.contextPath}/board/imageupload.do'
			});
				
			window.parent.CKEDITOR.tools.callFunction(1, "${url}", "전송완료");
		});					
	</script>
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
    <!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-3"></div>
    </div>
    
    <div class="row">
   		<div class="col-md-12">
   			<span class="glyphicon glyphicon-pencil"></span>
  			<div class="input-group">  		
 					<input name="MEMBER_SUBJECT" type="text" class="form-control" value="<%=mboard.getMEMBER_SUBJECT() %>" aria-describedby="sizing-addon1" >
				</div>
   		</div>
    </div>
    
	   <form>
	    <div class="row">
	     	<div class="col-md-12">
	    		<div class="checkbox">
	    			<label>
	      			<input type="checkbox"> 필수사항
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
    		<textarea name = "MEMBER_CONTENT"><%=mboard.getMEMBER_CONTENT() %></textarea>
					<script>CKEDITOR.replace('MEMBER_CONTENT');</script>
    		</div>
    </div>

		<!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-1"></div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
				<a type="button" style="background:#53dc98;" class="btn btn-sm" id="btnSave" href="javascript:modifyboard()">등록</a>
  			<a type="button" style="background:#e67e22;" class="btn btn-sm" id="btnList" href="javascript:history.go(-1)">취소</a>
    	</div>
    </div>
   </div>
	  
		<!-- 하단 넉넉하게 여백 주기 -->
		<div class="row">
    	<div class="col-md-12 p-5"></div>
    </div>
	</div>
<%@ include file="../jsp_bottom.jsp" %>
</body>
</html>
