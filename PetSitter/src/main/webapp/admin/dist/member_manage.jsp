<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.mboard.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<% 
	String id = null;
	String name = null;
	String rank = null;
	
	id = (String)session.getAttribute("id");
	name = (String)session.getAttribute("name");
	rank = (String)session.getAttribute("rank");
	
	
	List<ReportArticleVO> ralist = (List<ReportArticleVO>)request.getAttribute("ra_list");
	List<PetsitterVO> petsitterlist = (List<PetsitterVO>)request.getAttribute("petsitter_list");
	List<MemberVO> memberlist = (List<MemberVO>)request.getAttribute("member_list"); 
%>
<%
	SimpleDateFormat format1;
	format1 = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<style>
#reasonReply,#reasonArticle {
	text-overflow:ellipsis;
	white-space:nowrap;
	word-wrap:normal;
	overflow:hidden;
}
/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

p {
	margin:0px;
	display:inline-block;
	font-size:15px;
	font-weight:bold;
}

</style>
<html lang="en">
    <head>
        <meta charset="utf-8" />	
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원 정보 관리 페이지 - Petsitter</title>
        <link href="./admin/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    </head>
	
    <body class="sb-nav-fixed">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/assets/demo/chart-area-demo.js"></script>
        <script src="./admin/dist/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/assets/demo/datatables-demo.js"></script>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    	    <a class="navbar-brand" href="admin.me">관리자 페이지</a>
    	      <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
      	      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
	            </form>
            <!-- Navbar-->
  		         <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
     		          <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
        	          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
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
                                     <div class="collapse show" id="pagesMember" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
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
                            <div class="sb-sidenav-menu-heading">부가기능</div>
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
                        <h1 class="mt-4">회원 정보 관리</h1>
                        <!-- 글 신고 -->
													<div class="card mb-4">
														<div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                회원 목록
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                <table class="table table-bordered"  style="table-layout: fixed" id="dataTable" width="100%">
                                <thead>
                                	<th>아이디</th>
                                	<th width="10%">닉네임</th>
                                	<th width="5%">성별</th>
                                	<th width="10%">이름</th>
                                	<th width="10%">전화번호</th>
                                	<th width="5%">등급</th>
                                	<th width="12%">가입일</th>
                                	<th width="10%">누적금액</th>
                                	<th>기능</th>
                                </thead>
                               	<tbody>
																		<%for(int i = 0 ; i < memberlist.size(); i++) { 
																		MemberVO ml = (MemberVO)memberlist.get(i); %>															
																			<tr>
																				<td><%=ml.getMEMBER_ID() %></td>
																				<td><%=ml.getMEMBER_NICKNAME() %></td>
																				<td><%=ml.getMEMBER_GENDER() %></td>
																				<td><%=ml.getMEMBER_NAME() %></td>
																				<td><%=ml.getMEMBER_TEL() %></td>
																				<td><%=ml.getMEMBER_RANK() %></td>
																				<td><%=ml.getMEMBER_DATE() %></td>
																				<td style="text-align: right;"><%=String.format("%, d", ml.getMEMBER_AMOUNT()) %> 원</td>
																				<td style="margin:auto; text-align:center;">
																				
																				<input type="hidden" id="member_id" value="<%=ml.getMEMBER_ID()%>">
																				<input type="hidden" id="member_rank" value="<%=ml.getMEMBER_RANK() %>">
																				
																				<!-- 기능 칸 -->
																				<form action="./changemember.me" name="memberFrm<%=i%>" value="<%=ml.getMEMBER_ID() %>">
																					<a type="button" id="memberOut<%=i%>" style="color:white;" class="btn btn-sm btn-danger" href="./outmember.me?id=<%=ml.getMEMBER_ID() %>">탈퇴</a>&nbsp;
																					<%if(ml.getMEMBER_RANK().equals("suspended")) { %>
																					<a type="button" id="memberSuspended<%=i%>" style="color:black;" class="btn btn-sm btn-success" href="./rollbackmember.me?id=<%=ml.getMEMBER_ID() %>">해제</a>&nbsp;
																					<%} else { %>
																					<a type="button" id="memberSuspended<%=i%>" style="color:black;" class="btn btn-sm btn-warning" href="./suspendedmember.me?id=<%=ml.getMEMBER_ID() %>">정지</a>&nbsp;
																					<%} %>
																					
																				<button type="button" class="btn btn-primary btn-sm" name="memberChange" data-toggle="modal" data-target="#memberChange" 
																				data-id="<%=ml.getMEMBER_ID() %>" data-rank="<%=ml.getMEMBER_RANK()%>">등급변경</button>
													
																				</form>
																				
																				</td>
																			</tr>
																		<%} %>

																					<div class="modal fade" id="memberChange" tabindex="-1" role="dialog" aria-labelledby="articleModalLabel" aria-hidden="true">
																						<div class="modal-dialog" role="document">
																							<div class="modal-content">
																								<div class="modal-header">
																									<h5 class="modal-title" id ="memberChangeLabel">등급 변경하기</h5>
																									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																										<span aria-hidden="true">&times;</span>
																									</button>
																								</div>
																								<div class="modal-body">
																								<input type="hidden" id="member_id"/>
																								<input type="hidden" id="member_rank"/>
																								<script>
																									
																								</script>
																									바꿀 등급 : 
																						      <select id="selectRank" onchange="alert_select_value(this);">
																				            <option value="Green">Green</option>
																				            <option value="Gold">Gold</option>
																				            <option value="VIP">VIP</option>
																					        </select>
																					        
																					        <script>
																						        var alert_select_value = function (select_obj) {
																										var selected_index = select_obj.selectedIndex;
																						        var selected_value = select_obj.options[selected_index].value;
																						        
																						        alert(selected_value);
																						        };
																						        
																										function addchange(){
																											// document.forms[].submit();
																										}		
																						      </script>
																					        
																								</div>
																								<div class="modal-footer">
																									<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기 </button>
																									<a type="button" class="btn btn-primary" href="javascript:addchange()">변경</a>
																								</div>
																			
																							</div>
																						</div>
																					</div> 
																		
																	</tbody>
																</table>
                               </div>
                             </div>
	                        </div>
											</div>
   	            </main>
                
								<script>
								$(document).ready(function() {
									$('#memberChange').on('show.bs.modal', function (e) {
									    var id2 = $(e.relatedTarget).data('id');
									    var rank2 = $(e.relatedTarget).data('rank');
									    
									    $(".modal-body #member_id").val($(this).data('id'));
									    $(".modal-body #member_rank").val($(this).data('rank'));
									    
									    console.log(id2);
									    console.log(rank2);
									})
								});
								</script>
                
                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Petstiny 2020 </div>
                            <div>

                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

    </body>
</html>
