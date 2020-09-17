<!-- 관리자 메인 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%
	NoticeBoardVO nboard = (NoticeBoardVO)request.getAttribute("vo");
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String rank = (String)session.getAttribute("rank");
	String btype = "noticeboard";
	
	if(rank == null) {
		rank = "guest";
	}

	SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String StringDate = new_Format.format(nboard.getNOTICE_DATE());
	String date = StringDate.split(" ")[0]; // 연, 월, 일
	String time = StringDate.split(" ")[1]; // 시, 분
	
	String[] realDate = date.split("-");
	String[] realTime = time.split(":");
%>
<%
	SimpleDateFormat format1;
	format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
	
	.main_redfont0{
	color : rgba(211,84,0)!important;
	}
	/*펫시터 메인 폰트컬러 끝*/
</style>
	<style>
    td {
			color: #5e5e5e!important;
		}
	 	.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
   		background-color: #F8F8F8;
		}    					
	</style> 
<head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    
	<title>공지사항 | PetSitter</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<div class="site-wrap" id="home-section">
		<div class="row">
			<div class="col-md-12 p-3"></div>
		</div>
		
    <div class="container">      
			<div class="row justify-content-center">
				<div class="col-md-10">
					<table class="table table-sm">
						<tr>
							<td>제목</td>
							<td><%=nboard.getNOTICE_SUBJECT() %></td>
							</tr> 
						<tr>
							<td>작성일</td>
							<td><%=realDate[0] %>년 <%=realDate[1] %>월 <%=realDate[2] %>일&nbsp;<%=realTime[0] %>시 <%=realTime[1] %>분</td>
						</tr>
						<tr> 
							<td>작성자</td>
							<td><%=nboard.getNOTICE_NICKNAME() %></td>
						</tr>
						<tr>
							<td>조회수</td>
							<td><%=nboard.getNOTICE_READCOUNT() %></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
									<%if(!(nboard.getNOTICE_ORG_FILE() == null)) { %>
									<a href="./filedownload2.bo?num=<%=nboard.getNOTICE_ORG_FILE()%>&of=<%=nboard.getNOTICE_UP_FILE()%>&of2=<%=nboard.getNOTICE_ORG_FILE()%>">
										<%=nboard.getNOTICE_ORG_FILE() %>
									</a>
									<%} %>
							</td>
						</tr>
						</table>
					</div>
					<div class="col-md-10">
						<table class="table table-borderless">
							<tr>
								<td><%=nboard.getNOTICE_CONTENT() %></td>
							</tr>
							<tr>
								<td>
								<%if(!(nboard.getNOTICE_ORG_FILE() == null)) { %>
									<img src="./upload/<%=nboard.getNOTICE_UP_FILE() %>" width="300px">
									<%} %>
								</td> 
							</tr>
					</table>
					
			<%if(rank.equals("admin") || rank.equals("manager")) {%>
				<a type="button" style="background:#53dc98;" class="btn btn-sm" id="btnModify" href="./noticeboardmodifyform.me?num=<%=nboard.getNOTICE_NUM() %>">수정</a>
	  		<a type="button" style="background:#53dc98;" class="btn btn-sm" id="btnDelete" href="./noticeboardDelete.me?num=<%=nboard.getNOTICE_NUM() %>">삭제</a>
	  		<a type="button" style="background:#e67e22;" class="btn btn-sm" id="btnList" href="./noticeboardlist.me">목록</a>
			<% } else { %>
  			<a type="button" style="background:#e67e22;" class="btn btn-sm" id="btnList" href="./noticeboardlist.me">목록</a>
  		<% } %>
	 		 		</form>
	 		 		
	 		 		
	 	<script language="javascript">
			function addreport(){
				reportform.submit();
			}		
		</script>
    
				</div>
			</div>
			
			<div class="row">
			<div class="col-md-12 p-3"></div>
		</div>
	</div>	  
		
		<!-- 하단 넉넉하게 여백 주기 -->
		<div class="row">
			<div class="col-md-12 p-5"></div>
		</div>
	</div>
<%@ include file="../jsp_bottom.jsp" %>
		<script>
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  formObj.attr("action", "/replyWrite.me");
				  formObj.submit();
				});
		</script>
</body>
</html>
