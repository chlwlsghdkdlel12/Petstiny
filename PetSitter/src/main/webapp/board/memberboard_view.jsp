<!-- 관리자 메인 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.mboard.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%
	MemberBoardVO mboard = (MemberBoardVO)request.getAttribute("vo");
	ReportArticleVO report = (ReportArticleVO)request.getAttribute("report");	
	
	List<ReportArticleVO> ralist = (List<ReportArticleVO>)request.getAttribute("ra_list");
	List<ReportReplyVO> rrlist = (List<ReportReplyVO>)request.getAttribute("rr_list");

	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String rank = (String)session.getAttribute("rank");
	String btype = "mboard";
	
	if(rank == null) {
		rank = "guest";
	}
	
	if(mboard.getMEMBER_SECRET().equals("on")) {
		
		if((mboard.getMEMBER_ID().equals(id)) || rank.equals("manager") || rank.equals("admin")) {
			System.out.println("허가");
		} else {
			out.println("<script>");
			out.println("alert('권한이 없습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		
	}
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
		color : #5e5e5e!important;
	}
	.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
		background-color: #F8F8F8;
	}    					
</style>  
<head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<title>이용자 상담/문의 | PetSitter</title>
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
							<td><%=mboard.getMEMBER_SUBJECT()%></td>
							</tr> 
						<tr>
							<td>작성일</td>
							<td><%=format1.format(mboard.getMEMBER_DATE()) %></td>
						</tr>
						<tr> 
							<td>작성자</td>
							<td><%=mboard.getMEMBER_NICKNAME() %></td>
						</tr>
						<tr>
							<td>조회수</td>
							<td><%=mboard.getMEMBER_READCOUNT() %></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
									<%if(!(mboard.getMEMBER_ORG_FILE() == null)) { %>
									<a href="./filedownload.bo?num=<%=mboard.getMEMBER_ORG_FILE()%>&of=<%=mboard.getMEMBER_UP_FILE()%>&of2=<%=mboard.getMEMBER_ORG_FILE()%>">
										<%=mboard.getMEMBER_ORG_FILE() %>
									</a>
									<%} %>
							</td>
						</tr>
						</table>
					</div>
					<div class="col-md-10">
						<table class="table table-borderless">
							<tr>
								<td><%=mboard.getMEMBER_CONTENT() %></td>
							</tr>
							<tr>
								<td>
								<%if(!(mboard.getMEMBER_ORG_FILE() == null)) { %>
									<img src="./upload/<%=mboard.getMEMBER_UP_FILE() %>" width="500px">
								<% } %>	
								</td> 
							</tr>
					</table>
					
			<%if((mboard.getMEMBER_ID().equals(id)) || rank.equals("admin") || rank.equals("manager")) {%>
				<a type="button" style="background:#53dc98;" class="btn btn-sm" id="btnModify" href="./mboardmodifyform.me?num=<%=mboard.getMEMBER_NUM() %>">수정</a>
	  		<a type="button" style="background:#53dc98;" class="btn btn-sm" id="btnDelete" href="./mboardDelete.me?num=<%=mboard.getMEMBER_NUM() %>">삭제</a>
	  		<a type="button" style="background:#e67e22;" class="btn btn-sm" id="btnList" href="./mboardlist.me">목록</a>
			<% } else { %>
  			<a type="button" style="background:#e67e22;" class="btn btn-sm" id="btnList" href="./mboardlist.me">목록</a>
  		<% } %>
	  		<%
					if(!rank.equals("guest")) {
				%>
  	 		<button type="button" class="btn btn-danger btn-sm float-right" name="main_redfont0" data-toggle="modal" data-target="#articleModal">신고</button>
  	 		<%
					}
				%>
  	 		
  	 			<!-- 신고 창 시작 -->
  	 		 <form action="./reportArticle.me" method="post" name="reportform">
  	 		 	<input type="hidden" name="MEMBER_ID" value="${id}">
					<input type="hidden" name="MEMBER_NUM" value="<%=mboard.getMEMBER_NUM()%>">
					<input type="hidden" name="BTYPE" value="mboard">
					
					<div class="modal fade" id="articleModal" tabindex="-1" role="dialog" aria-labelledby="articleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id ="articleModalLabel">글 신고하기</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<textarea id="REPORT_REASON" name="REPORT_REASON" rows="4" cols="63" placeholder="신고 사유를 적어주세요"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기 </button>
									<a type="button" class="btn btn-primary" href="javascript:addreport()">신고</a>
								</div>
							</div>
						</div>
					</div>
	 		 	<!-- 신고 창 끝 -->	
	 		 		</form>
	 		 		
	 		 		
	<script>
		function addreport(){
			reportform.submit();
		}		
		function addreport2() {
			$("#reportreplyform").submit();
		}
	</script>
    
				</div>
			</div>
			
			<div class="row">
			<div class="col-md-12 p-3"></div>
		</div>
	</div>	  
	
	<jsp:include page="./memberboard_comments.jsp">
		<jsp:param name="bno" value="<%=mboard.getMEMBER_NUM() %>"/>
	</jsp:include>
	
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
