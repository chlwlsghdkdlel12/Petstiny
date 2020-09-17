<!-- 관리자 메인 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<% 
	String id = null;
	String name = null;
	String rank = null;
	String btype = "noticeboard";
	
	id = (String)session.getAttribute("id");
	name = (String)session.getAttribute("name");
	rank = (String)session.getAttribute("rank");
	
	if(rank == null) {
		rank = "guest";
	}
	
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>)request.getAttribute("member_list");
	List<NoticeBoardVO> nboardlist = (List<NoticeBoardVO>)request.getAttribute("nboard_list");
	
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>
<%
	SimpleDateFormat format1;
	format1 = new SimpleDateFormat("yyyy-MM-dd");
%>
<jsp:include page="../jsp_top_sidebar.jsp">
	<jsp:param value="noticeboardlist" name="sidevarcheck"/>
</jsp:include>
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
	<style>
		th, td {
			color : #5e5e5e!important;
		}
		
		th {
			text-align:center;
		}
		
		td:nth-child(1), td:nth-child(2), td:nth-child(4), td:nth-child(5) {
			text-align: center;
		}
		
		.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
			background-color: #F8F8F8;
		}
	</style>
<head>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<title>공지사항 | PetSitter</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<div class="site-wrap" id="home-section">
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
					<a href="#"><h3 class="text-left" id="qna">공지사항</h3></a>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">  
					<!-- notice 보드 -->
					<table class="table table-sm table-hover table-striped">
						<thead>
							<tr>
								<th width="100px">번호</th>
								<th width="150px">닉네임</th>
								<th>제목</th>
								<th width="100px">작성일자</th>
								<th width="150px">조회수</th>
							</tr>
						</thead>
						<tbody>
							<%int num = listcount - ((nowpage - 1) * 10); %>
							<%for(int i = 0 ; i < nboardlist.size(); i++) {
								NoticeBoardVO nv = (NoticeBoardVO)nboardlist.get(i);
							%>
							<tr>
								<td>
								<%
								if(nv.getNOTI().equals("Y")) {%>
								<div style="font-size: 14px">주요공지</div>
								<%} else {
								out.println(num);
								}
								%>
								</td>
								<td><%=nv.getNOTICE_NICKNAME() %></td>
								<td>
								<%
								if(nv.getNOTI().equals("Y")) {%>
								<b><a style="color:#26bd72;" href="./noticeboarddetail.me?num=<%=nv.getNOTICE_NUM()%>"><%=nv.getNOTICE_SUBJECT()%></a></b>
								<%} else { %> 
								<a style="color:#26bd72;" href="./noticeboarddetail.me?num=<%=nv.getNOTICE_NUM()%>"><%=nv.getNOTICE_SUBJECT()%></a>
								<%} %>
								</td>
								<td><%=format1.format(nv.getNOTICE_DATE()) %></td>
								<td><%=nv.getNOTICE_READCOUNT()%></td>
								<% num--; %>
							<%} %>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="row">
	    	<div class="col-md-2">
		      <% if(nowpage <= 1) { %>
		      <a type="button" style="background:#F8F8F8; color:black;" class="btn btn-sm" id="prev">이전</a>
	  	    	<% } else { %>
	    		  <a type="button" style="background:#F8F8F8; color:black;" class="btn btn-sm" id="prev" href="./noticeboardlist.me?page=<%=nowpage-1 %>">이전</a>
	      		<% } %>
			      <%if(nowpage >= maxpage) { %>
			      <a type="button" style="background:#F8F8F8; color:black;" class="btn btn-sm" id="next">다음</a>
			      <% } else { %>
			      <a type="button" style="background:#F8F8F8; color:black;" class="btn btn-sm" id="next" href="./noticeboardlist.me?page=<%=nowpage+1%>">다음</a>
			      <% } %>
	    	</div>
	    <div class="col-md-9"></div>
	    <div class="col-md-1">
	    
	    <%if(rank.equals("admin") || rank.equals("manager")) {%>
		 		<a type="button" style="background:#e67e22; color:white;" class="btn btn-sm" id="write" href="./noticeboardwriteform.me">글쓰기</a>
		 	<%} %>
		 	
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
								<a type="button" style="background:#F8F8F8;" class="btn btn-sm" href="./noticeboardlist.me?page=<%=a %>"><%=a %></a>
								
								<%} %>
							<%} %>
							</td>
						</tr>				
					</h3>
				</div>
				<div class="col-md-2"></div>
			</div>
			
			<!-- 여백용 row -->
			<div class="row">
	    	<div class="col-md-12 p-3"></div>
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
</body>
</html>
