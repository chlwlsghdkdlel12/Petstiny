<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%@ page import="com.spring.petsitter.board.mboard.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<% 
	String id = null;
	String name = null;
	String rank = null;
	
	id = (String)session.getAttribute("id");
	name = (String)session.getAttribute("name");
	rank = (String)session.getAttribute("rank");
	
	List<MemberBoardVO> mboardlist = (List<MemberBoardVO>)request.getAttribute("mboard_list");
	List<ReportArticleVO> ralist = (List<ReportArticleVO>)request.getAttribute("ra_list");
	List<ReportReplyVO> rrlist = (List<ReportReplyVO>)request.getAttribute("rr_list");
	List<UsinglistVO> uvolist = (List<UsinglistVO>)request.getAttribute("uvoList");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<style>
#reasonReply,#idReply,#reasonArticle,#idArticle,#reasonReply2,#reasonArticle2 {
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
}
</style>
    <head>
        <meta charset="utf-8" />	
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>대시보드 - Petsitter</title>
        <link href="./admin/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
    </head>
	
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="admin.me">관리자 페이지</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <!-- <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div> 
                </div> -->
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
<!--                         <a class="dropdown-item" href="#">기능1</a>
                        <a class="dropdown-item" href="#">기능2</a> -->
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.me">로그아웃</a>
                    </div>
                </li>
            </ul>
        </nav>
        
        
        <div id="layoutSidenav">
        		<!-- 사이드바 시작 -->
        <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="admin.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                대시보드
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesReport" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        신고 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesReport" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="admin_reportArticle.me">글 신고</a>
                                            <a class="nav-link" href="admin_reportReply.me">리플 신고</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesMember" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                    회원 정보 관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                     <div class="collapse" id="pagesMember" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="admin_memberManage.me">회원 관리</a>
                                            <a class="nav-link" href="admin_petsitterManage.me">펫시터 관리</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                계약 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        거래 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="admin_orderReserved.me">예약된 거래</a>
                                            <a class="nav-link" href="admin_orderProgress.me">진행중인 거래</a>
                                            <a class="nav-link" href="admin_orderClosed.me">완료된 거래</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        펫시터 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="admin_petsitterApply.me">펫시터 신청 관리</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="admin_chart.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                차트
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${id}
                    </div>
                </nav>
            </div>
						<!--사이드바 끝 -->
			
			
			
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">대시보드</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">대시보드</li>
                        </ol>
                          <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        글 신고 목록
                                    </div>
                                    <div class="card-body">
                                    	<table class="table table-sm table-hover table-striped" height="40">
                                    		<thead>
                                    		<thead>
                                    		<th width="15%">글번호</th>
                                    		<th width="55%">신고이유</th>
                                    		<th width="15%">신고자</th>
                                    		<th width="15%">게시판</th>
                                    		</thead>
																				<tbody>
																			<% int size_ra = ( ralist.size() < 12 ) ? ralist.size() : 12;
																			int size_rr = ( rrlist.size() < 12 ) ? rrlist.size() : 12;
																				
																			%>
																			
																				<%for(int i = 0 ; i < size_ra ; i++) {
																					ReportArticleVO ra=(ReportArticleVO)ralist.get(i);
																					%>
																					<tr>
																						<td><%=ra.getMEMBER_NUM() %> </td>
																						<td id="reasonArticle"><%=ra.getREPORT_REASON() %></td>
																						<td id="idArticle"><%=ra.getMEMBER_ID() %></td>
																						<td>
																																												<% 
																							if(ra.getBTYPE().equals("mboard")) {
																								out.println("이용자");
																							} else if (ra.getBTYPE().equals("pqboard")) {
																								out.println("펫시터");
																							} else if (ra.getBTYPE().equals("PRO_BOARD")) {
																								out.println("전문가");
																							} else if (ra.getBTYPE().equals("review_board")) {
																								out.println("후기");
																							}
																						%>
																						</td>
																					</tr>
																					<%} %>
																					<tr>
																						<td colspan="4" style="text-align:center;"><a href="./admin_reportArticle.me">더 보기</a></td>
																					</tr>
																				</tbody>
																			</table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                      <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        리플 신고 목록
                                    </div>
                                    <div class="card-body">
                                    	<table class="table table-sm table-hover table-striped" style="table-layout: fixed" height="40">
                                    		<thead>
                                    		<th width="12%">글번호</th>
                                    		<th width="15%">리플번호</th>
                                    		<th width="43%">신고이유</th>
                                    		<th width="15%">신고자</th>
                                    		<th width="15%">게시판</th>
                                    		</thead>
																				<tbody>
																				<%for(int i = 0 ; i < size_rr ; i++) {
																					ReportReplyVO rr=(ReportReplyVO)rrlist.get(i);
																					%>
																					<tr>
																						<td><%=rr.getBNO() %></td>
																						<td><%=rr.getRNO() %></td>
																						<td id="reasonReply"><%=rr.getREPORT_REASON() %></td>
																						<td id="idReply"><%=rr.getMEMBER_ID() %></td>
																						<td>
																						<% 
																						if(rr.getBTYPE().equals("mboard")) {
																							out.println("이용자");
																						} else if (rr.getBTYPE().equals("pqboard")) {
																							out.println("펫시터");
																						} else if (rr.getBTYPE().equals("PRO_BOARD")) {
																							out.println("전문가");
																						} else if (rr.getBTYPE().equals("review_board")) {
																							out.println("후기");
																						}
																						%>
																						</td>
																					</tr>
																					<%} %>
																					<tr>
																						<td colspan="5" style="text-align:center;"><a href="./admin_reportReply.me">더 보기</a></td>
																					</tr>
																				</tbody>
																			</table> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                거래중인 내역
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
																<table class="table table-bordered"  id="dataTable" width="100%">
                                <thead>
                                <th>의뢰인</th>
                                <th>펫시터</th>
																<th>거래고유번호</th>
																<th>시작일</th>
																<th>종료일</th>
																<th>돌봄종류</th>
																<th>가격</th>																
                                </thead>
                                	<tbody>
																			<%for(int i = 0 ; i < uvolist.size(); i++) { 
																			UsinglistVO uvo = (UsinglistVO)uvolist.get(i); %>
																			
																			<%
																				Date startDate = uvo.getLIST_START_DATE(); // 시작날짜
																				Date endDate = uvo.getLIST_END_DATE(); // 종료날짜
																				Date day = new Date(); // 현재 서버시간
																				
																				String toStartDate = sdf.format(startDate);
																				String toEndDate = sdf.format(endDate);
																				String today = sdf.format(day);
																				
																				if((toEndDate.compareTo(today) > 0) && (toStartDate.compareTo(today) < 0)) { // 시작날짜 < 서버시간 < 종료날짜
																				%>  
																			<tr>
																				<td><%=uvo.getMEMBER_ID() %></td>
																				<td><%=uvo.getPETSITTER_ID() %></td>
																				<td><%=uvo.getMERCHANT_UID() %></td>
																				<td><%=sdf.format(uvo.getLIST_START_DATE()) %></td>
																				<td><%=sdf.format(uvo.getLIST_END_DATE()) %></td>
																				<td><%=uvo.getLIST_TYPE() %></td>
																				<td><%=String.format("%,d", uvo.getLIST_PRICE()) %> 원</td>
																			</tr>
																			<%}}%>
																	</tbody>
																	</table>  
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Petstiny 2020</div>
                            <div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/assets/demo/chart-area-demo.js"></script>
        <script src="./admin/dist/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/assets/demo/datatables-demo.js"></script>
    </body>
</html>
