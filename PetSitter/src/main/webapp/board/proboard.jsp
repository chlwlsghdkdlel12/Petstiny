<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.*,java.text.*" %>


<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String rank = (String)session.getAttribute("rank");

	List<ProBoardVO> boardlist=(List<ProBoardVO>)request.getAttribute("boardlist");

	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>
<jsp:include page="../jsp_top_sidebar.jsp">
	<jsp:param value="proboard" name="sidevarcheck"/>
</jsp:include>
<!-- 전문가 상담 게시판 -->
<!doctype html>
<html lang="ko">
<style>
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
	
	#main_grayfont1{
	color : #707070!important;
	}
	
	#main_grayfont2{
	color : #949494!important;
	}
	/*펫시터 메인 폰트컬러 끝*/
</style>
<head>
	<title>전문가 상담 게시판</title>

    <!-- 언택 추가 CSS -->
		<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/proBoard.css?after">
		<link rel="stylesheet" type="text/css" href="resources/css/JH_CSS/proBoard2.css?after">
    
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
		var id = '<%=id%>';
		var rank = '<%=rank%>';
		var j = 1; //좋아요 아이디 체크 for문용
		var sessionid = "<%=id %>";
		var sessionid2 = ",<%=id %>";		
		
		$(document).ready(function(){ 		
			
			//전문가 게시판 목차 페이징 처리 시작
			$(document).on('click', '.updateform_data', function(event){ //on이 동적인걸 실행해준다.
			$('#proForm').empty(); 
      $('#proForm2').empty(); 
      $('#reportForm').empty(); 
      
      
			var urlSearch = $(this).attr("href");
			urlSearch = urlSearch + "&searchType=" + $('#searchType').val();
			urlSearch = urlSearch + "&keyword=" + $('#keyword').val();

				$.ajax({
		      url:urlSearch,
		      type : 'POST',
		      dataType : 'JSON',
		      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		      success:function(data){
		      	$.each(data, function(index, item){
		      		
		      		var proForm = "";
							proForm += '<div class="col-lg-6" style = "margin-top : 20px">';
							proForm += '<div class="bottom_table">';
							proForm += '<table class="PRO_TABLE main_grayfont3 fixtable">';
							proForm += '<thead>';
							proForm += '<tr>';
							proForm += '<!-- PRO_NUM -->';
							proForm += '<td scope="col"><div class = "font-size-12 float-left" style = "padding : 5px 0 0 0;">NO :&nbsp; </div> '+item.pro_NUM+'</td>';
							proForm += '<!-- MEMBER_ID -->';
							proForm += '<td scope="col" class = "font-size-14">'+item.member_NICKNAME+'</td>';
							proForm += '<!--PRO_DATE -->'
							proForm += '<td scope="col" class = "font-size-14">'+item.real_DATE+'</td>'; 
							proForm += '<!--PRO_READCOUNT  -->';
							proForm += '<td scope="col" class = "font-size-14" id = "readcountajax'+item.pro_NUM+'">조회 수 : '+item.pro_READCOUNT+'</td>';
							proForm += '<!-- PRO_LIKECOUNT -->';
							proForm += '<td scope="col" class = "font-size-14" id = "prolikecount'+item.pro_NUM+'"></td>';
							proForm += '</tr>';
							proForm += '</thead>';
							proForm += '<tbody>';
						
							var bls2 = item.secret_CHECK;
							var blid2 = item.member_ID;
							
							//비밀게시물이 아닌 경우						
							if(bls2 == 'N'){
								proForm += '<tr class="PRO_SUBJECT">';
								proForm += '<th colspan = "5" class = "detailView01"><a href = "./proboarddetail.bo?num='+item.pro_NUM+'" class = "lista detailView">'+item.pro_SUBJECT+'</a></th>';
								proForm += '</tr>';
								proForm += '<tr class="PRO_CONTENT main_grayfont3">';
								proForm += '<td colspan ="5" class = "detailView02"><a href = "./proboarddetail.bo?num='+item.pro_NUM+'" class = "lista2 detailView">'+item.pro_CONTENT+'</a></td>';
								proForm += '</tr>';
								proForm += '<tr class="PRO_READMORE">';
								proForm += '<td colspan ="4" style = "padding-left : 15px"><a href = "./proboarddetail.bo?num='+item.pro_NUM+'" class = "read detailView">read more</a></td>';
								proForm += '<td colspan ="1" class = "replycountcss01">댓글 : <span class = "replycountcss02" id = "replycount'+item.pro_NUM+'">0</span></td>';
								proForm += '</tr>';
							}

							//로그인시 비밀게시물 접근 불가능자
							if(rank != 'null'){
								if((bls2 == 'Y') && (rank != 'admin') && (rank != 'manager') && (id != blid2)) {								
									proForm += '<tr class="PRO_SUBJECT">';
									proForm += '<th colspan = "5" class = "tdpaddign01">secret board.</th>';
									proForm += '</tr>';
									proForm += '<tr class="PRO_CONTENT main_grayfont3">';
									proForm += '<td colspan ="5" class = "tdpaddign01">비밀 게시글입니다.</td>';
									proForm += '</tr>';
									proForm += '<tr class="PRO_READMORE">';
									proForm += '<td colspan ="4" style = "padding-left : 15px"><a class="read">read more <span class="oi oi-lock-locked"></span></a></td>';
									proForm += '<td colspan ="1" class = "replycountcss01">댓글 : <span class = "replycountcss02" id = "replycount'+item.pro_NUM+'">0</span></td>';
									proForm += '</tr>';						
								}
							}

							//비로그인시 비밀게시물 접근 불가능자			
							if(rank == 'null') {		
								if(bls2 == 'Y'){	
									proForm += '<tr class="PRO_SUBJECT">';
									proForm += '<th colspan = "5" class = "tdpaddign01">secret board.</th>';
									proForm += '</tr>';
									proForm += '<tr class="PRO_CONTENT main_grayfont3">';
									proForm += '<td colspan ="5" class = "tdpaddign01">비밀 게시글입니다.</td>';
									proForm += '</tr>';
									proForm += '<tr class="PRO_READMORE">';
									proForm += '<td colspan ="4" style = "padding-left : 15px"><a class="read">read more <span class="oi oi-lock-locked"></span></a></td>';
									proForm += '<td colspan ="1" class = "replycountcss01">댓글 : <span class = "replycountcss02" id = "replycount'+item.pro_NUM+'">0</span></td>';
									proForm += '</tr>';								
								}
							}								

							//로그인시 비밀게시물 접근 가능자
							if(bls2 == 'Y') {
								if(rank != 'null'){					
									if(rank == 'admin' || rank == 'manager' || id == blid2){									
										proForm += '<tr class="PRO_SUBJECT">';
										proForm += '<th colspan = "5" class = "detailView01"><a href = "./proboarddetail.bo?num='+item.pro_NUM+'" class = "lista detailView">'+item.pro_SUBJECT+'</a></th>';
										proForm += '</tr>';
										proForm += '<tr class="PRO_CONTENT main_grayfont3">';
										proForm += '<td colspan ="5" class = "detailView02"><a href = "./proboarddetail.bo?num='+item.pro_NUM+'" class = "lista2 detailView">'+item.pro_CONTENT+'</a></td>';
										proForm += '</tr>';
										proForm += '<tr class="PRO_READMORE">';
										proForm += '<td colspan ="4" style = "padding-left : 15px"><a href = "./proboarddetail.bo?num='+item.pro_NUM+'" class = "read detailView">read more <span class="oi oi-lock-unlocked"></span></a></td>';
										proForm += '<td colspan ="1" class = "replycountcss01">댓글 : <span class = "replycountcss02" id = "replycount'+item.pro_NUM+'">0</span></td>';
										proForm += '</tr>';
										
									}
								}
							}						
							
							proForm += '</tbody>';
							proForm += '</table>';
							proForm += '</div>';
							proForm += '</div>';
		      		
		     	    $('#proForm').append(proForm);
							
							replyCount(item.pro_NUM);
							proLikeCountRead(item.pro_NUM);
		     	    //리스트 목록 순차 정의 시작
							if(item.listcount2 != 0){
								var listcount2 = item.listcount2;
								var nowpage2 = item.page2;
								var maxpage2 = item.maxpage2;
								var startpage2 = item.startpage2;
								var endpage2 = item.endpage2;
		
				      	var proForm2 = "";	
					      	      	
				      	
				      	proForm2 += '<div class = "col-12" style = "padding : 10px 0 0 0">';
				      	if(id == 'null') {
				      	proForm2 += '<a href="#pick"  class = "writebtn float-right loginalert">글쓰기</a>';
								}
		     	    	if(id != 'null' && rank != 'pro' && rank != 'goldpro'){
		     	    		proForm2 += '<a href="./proboardwriteform.bo" class = "writebtn float-right">글쓰기</a>';	
		     	    	}
				      	proForm2 += '</div>';			      	
						    proForm2 += '<div class = "col-12">';
						    proForm2 += '<center>';
						    proForm2 += '<table>';
						    proForm2 += '<tr align=center height=20>';
						    proForm2 += '<td colspan=7 style="font-family:Tahoma;font-size:10pt;" width = "400px">';
						    
								if(nowpage2<=1){
									proForm2 += '<a type="button" style="background:#D3D3D3;" class="btn btn-sm">이전</a> ';
				     		 }
								if(nowpage2 >= 2){
									var nowpage3 = nowpage2 - 1;
									proForm2 += '<a href="./proboard2.bo?page='+ nowpage3 +'" type="button" class="updateform_data btn btn-sm blcss" id="prev">이전</a> ';
								}
								
								var a2 = 0;
								for(a2 = startpage2; a2 <= endpage2; a2++){
									if(a2==nowpage2){
										proForm2 += '<a type="button" class="btn btn-sm blcss"">'+ a2 +'</a> ';		
									}else{
										proForm2 += '<a href="./proboard2.bo?page='+ a2 +'" type="button" style="background:white;" class="updateform_data btn btn-sm">'+ a2 +'</a> ';	
									}
								}
		
								if(nowpage2>=maxpage2){
									proForm2 += '<a type="button" style="background:#D3D3D3;" class="btn btn-sm">다음</a> ';	
								}else{
									nowpage4 = nowpage2 + 1;
									proForm2 += '<a href="./proboard2.bo?page='+ nowpage4 +'" type="button" class="updateform_data btn btn-sm blcss"" id="next">다음</a> ';
								}	
								proForm2 += '</td>';
								proForm2 += '</tr>';
								proForm2 += '</table>';
								proForm2 += '</center>';
								proForm2 += '</div>';
			      				      	
								$('#proForm2').append(proForm2);
								
							}	
				      //리스트 목록 순차 정의 종료		
	    			});
		      },
			   	error:function(){
			       alert("ajax통신 실패!!!");
			   	}
				}); 
							//기본 이벤트 제거
						 event.preventDefault();
			});
			//전문가 게시판 목차 페이징 처리 종료		

			//Modal proboard_view 시작		
			$(document).on('click', '.detailView', function(event){ //on이 동적인걸 실행해준다.
			  $('#detailForm').empty();
				
				$.ajax({
		      url:$(this).attr("href"),
		      type : 'POST',
		      dataType : 'json',
		      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		      success:function(data){
		      	$.each(data, function(index, item){			
							
		      		var detailForm = '';
							//Modal proboard_view시작
							detailForm += '<div class="modal fade" id="staticBackdropDetail" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">';
							detailForm += '<div class="modal-dialog modal-lg modal-dialog-scrollable">';
							detailForm += '<div class="modal-content">';
							detailForm += '<div class="modal-header">';
							detailForm += '<h5 class="modal-title main_mintfont" id="staticBackdropLabel">전문가상담 게시글</h5>';
							detailForm += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
							detailForm += '<span aria-hidden="true">&times;</span>';
							detailForm += '</button>';
							detailForm += '</div>';
							detailForm += '<div class="modal-body">';
							      
							detailForm += '<div class="row justify-content-center">';
							
							detailForm += '<div class="col-md-10 font-size-14" id = "prolikecount2'+item.pro_NUM+'">';
							detailForm += '</div>';
							
							detailForm += '<div class="col-md-10">';
							detailForm += '<table class="table table-sm main_grayfont3 font-size-14">';
							detailForm += '<tr>';
							detailForm += '<th>제목</th>';
							detailForm += '<td><div>'+item.pro_SUBJECT+'</div></td>';
							detailForm += '</tr> ';
							detailForm += '<tr>';
							detailForm += '<th>작성일</th>';
							detailForm += '<td>'+item.real_DATE+'</td>';
							detailForm += '</tr>';					
							detailForm += '<tr>'; 
							detailForm += '<th>작성자</th>';
							detailForm += '<td>'+item.member_NICKNAME+'</td>';
							detailForm += '</tr>';
							detailForm += '<tr>';
							detailForm += '<th>조회 수</th>';
							detailForm += '<td>'+item.pro_READCOUNT+'</td>';
							detailForm += '</tr>';		
		
							if(item.pro_UP_FILE != 'N'){
								var pof = item.pro_ORG_FILE;
								var proOrgFile = pof.split(",");
								
								var puf = item.pro_UP_FILE;
								var proUpFile = puf.split(",");	
							
								detailForm += '<tr>';
								detailForm += '<th>첨부파일 1</th>';
								detailForm += '<td>';
								detailForm += '<a href="./filedownload.bo?num='+proOrgFile[0]+'&of='+proUpFile[0]+'&of2='+proOrgFile[0]+'">';
								detailForm += ''+ proOrgFile[0] +'';
								detailForm += '</a>';
								detailForm += '</td>';
								detailForm += '</tr>	';
								if(proUpFile.length == 2){
									detailForm += '<tr>	';
									detailForm += '<th>첨부파일 2</th>';			
									detailForm += '<td>';
									detailForm += '<a href="./filedownload.bo?num='+proOrgFile[1]+'&of='+proUpFile[1]+'&of2='+proOrgFile[1]+'">';
									detailForm += ''+proOrgFile[1]+'';
									detailForm += '</a>';
									detailForm += '</td>';
									detailForm += '</tr>';	
								}
							}		
							detailForm += '</table>';
							detailForm += '</div>';
							detailForm += '<div class="col-md-10">';
								if(id != 'null' && item.member_ID != id){
									detailForm += '<a href = "./proreportform.bo?num='+item.pro_NUM+'&sessionid='+id+'&boardType='+item.board_TYPE+'" type="button" class="reportFormAjax reportcss">신고</a>';
								}
							detailForm += '</div>';
							detailForm += '<div class="col-md-10">';
							detailForm += '<div class = "viewcontentcss">'+item.pro_CONTENT+'</div>';
							detailForm += ' </div>';		
							detailForm += '<div class="col-md-10">';
							detailForm += '<table class="table table-borderless">';
							detailForm += '<tr>';
							detailForm += '<td>';
		
							if(item.pro_UP_FILE != 'N'){
								var puf = item.pro_UP_FILE;
								var proUpFile = puf.split(",");									
						
								detailForm += '<img src="./upload/'+proUpFile[0]+'" class = "detailimg">';
								if(proUpFile.length == 2){
									detailForm += '<img src="./upload/'+proUpFile[1]+'" class = "detailimg">';
								}
							}
							detailForm += '</td>';
							detailForm += '</tr>';
							detailForm += '</table>';
							detailForm += ' </div>';
							detailForm += ' <hr>';
							
							detailForm += '</div>';
							
							//댓글  시작
							detailForm += '<div class="row justify-content-center" id = "replyProList"></div>';	
							detailForm += '<div class="row justify-content-center">';	
							detailForm += '<div class="col-9">';	
							detailForm += '<form method="post" enctype="multipart/form-data" name="replyInsertForm" id = "replyInsertForm">';
							detailForm += '<input type="hidden" name="bno" value="'+item.pro_NUM+'"/>';
							detailForm += '<input type="hidden" name="writer_id" value="'+id+'"/>';
							detailForm += '<textarea class="pb-cmnt-textarea contententer" name="content" placeholder="댓글 입력란"></textarea>';
							detailForm += '</form>';
							detailForm += '</div>';
							detailForm += '<div class="col-1 padd00">';
							detailForm += '<button class="btn btn-sm pbtn01" type="button" name="replyInsertBtn" id = "replyInsertBtn">등록</button>';
							detailForm += '</div>';
							detailForm += '</div>';
							//댓글  종료
							
							detailForm += '</div>';
							
							detailForm += '<div class="modal-footer">';
							detailForm += '<div class = "row">';
							detailForm += '<div class = "col-12">';
							if(id != null){
								if(item.member_ID == id || rank == 'admin' || rank == 'manager') {
									detailForm += '<a type="button" class="btn btn-sm pbtn01" id="btnModify" href="./promodifyform.bo?num='+item.pro_NUM+'">수정</a>';
									detailForm += '<a type="button" class="btn btn-sm pbtn02" id="btnDelete" href="./proboarddelete.bo?num='+item.pro_NUM+'">삭제</a>';
									detailForm += '<button type="button" class="btn btn-sm pbtn03" data-dismiss="modal" id="btnList">닫기</button>';
								}
								if(item.member_ID != id) {
									detailForm += '<button type="button" class="btn btn-sm pbtn03" data-dismiss="modal" id="btnList">닫기</button>';
								}
							}else{
								detailForm += '<button type="button" class="btn btn-sm pbtn03" data-dismiss="modal" id="btnList">닫기</button>';
		      		}
										  		
							detailForm += '</div>';
							detailForm += '</div>';		  
							detailForm += '</div>';					  
							    
							detailForm += '</div>';
							detailForm += '</div>';
							detailForm += '</div>';
							
							$('#detailForm').append(detailForm);	
							//Modal proboard_view 종료	
							
							//조회수 카운트 표시 시작
							$('#readcountajax'+item.pro_NUM+'').empty();
							var readcountajax = '';
			   	    readcountajax += '조회 수 : '+item.pro_READCOUNT+''							
							
			   	 		$('#readcountajax'+item.pro_NUM+'').append(readcountajax);
			   			//조회수 카운트 표시 종료
			     	  replyList(item.pro_NUM);
			     	 	proLikeCountRead2(item.pro_NUM);
	    			});
			      	if( true ) { $('.staticBackdropDetail').get(0).click(); }
		      },
			   	error:function(){
			       alert("ajax통신 실패!!!");
			   	}
				});
					//기본 이벤트 제거
					event.preventDefault();
			});				
			//Modal proboard_view 종료
		

			//댓글 기능 시작
			
			//댓글 등록 버튼
			$(document).on('click', '#replyInsertBtn', function(event){
				
				var reflycon = document.replyInsertForm.content.value
				
				if (id == 'null') {
					Swal.fire({
						  title: '로그인을 하시겠습니까?',
						  text: "댓글은 로그인 후 입력이 가능합니다.",
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
				
				if (id != 'null' && reflycon.length < 2)
				{
					alert("내용을 2자 이상 입력하세요.");
					document.proboardform.PRO_SUBJECT.focus();
					return false;
				}
				
				var insertData = $('[name=replyInsertForm]').serialize();
				replyInsert(insertData); // Insert 함수호출(아럐)

			});
			
		//$(document).ready(function(){ 종료
		});				
			
			function replyList(bno){
				$.ajax({
					url : '/petsitter/read_ProReply.bo',
					type : 'post',
					data : {bno : bno},
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						$('#replyProList').empty();
						var a = '';
						var num = 1;
						$.each(data, function(key, value) {
							
					    a += '<div class="col-10">';	
							a += '<div class = "replyboldfloat" >댓글 번호 :&nbsp; </div><div class = "replyfontfloat"> ' + num + '&nbsp;&nbsp;&nbsp;&nbsp;</div>';
							a += '<div class = "replyboldfloat" >작성자 :&nbsp; </div><div class = "replyfontfloat"> '+value.writer_nickname +'&nbsp&nbsp;</div>';
							var wid = value.writer_id;
							if(id != 'null' && wid != id){
								a += '<a href = "./proreportreplyform.bo?bno='+bno+'&rno='+value.rno+'&sessionid='+id+'&boardType='+value.b_type+'" type="button" class="reportReplyFormAjax reportcss float-right">신고</a>';
							}
							
							num = num + 1;
							
							if(rank != null){
								if(rank == 'admin' || rank == 'manager' || wid == id){
									a += '<a href="#" class="oi oi-x replyfontfloat03" onclick="proReplyDelete('+value.rno+','+bno+');">삭제</a>';
									a += '<a href="#" class="oi oi-pencil replyfontfloat02" onclick="proReplyUpdateForm('+value.rno+',\''+value.content+'\','+bno+');">수정</a>';
								}
							}
							a += '</div>';
							a += '<div class="col-10">';	
							a += '<div class="replyArea">';
							a += '<div style="color:#5e5e5e;" class="replyContent'+value.rno+' float-none replyfont"><p>내용 : ' + value.content + '</p>';
							a += '</div></div>'; 
							a += '</div>';
							
							$('#replyProList').html(a);	
						}); 
					}, 
					error:function(request, status, error){
						console.log("ajax 통신 실패");
						alert("ajax 통신 실패(List)");
					}
				});
				 event.preventDefault();
			}
			
			// 댓글 등록
			function replyInsert(insertData) {
				//insertData 는  $('[name=replyInsertForm]').serialize() 를 파라미터로 전해 받음
				var bno2 = $('input[name=bno]').val(); 
				$.ajax({		
					url : '/petsitter/write_ProReply.bo',
					type : 'POST',
					data : insertData,
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						if(data == 1) {
							replyList(bno2); // 댓글 작성 후 댓글 목록 reload
							$('[name=content]').val('');
							replyCount(bno2);
						}
					},
					error:function() {
						alert("ajax 통신 실패(write)");			
					}
				});
			}
				
		
			// 댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
			function proReplyUpdateForm(rno, content, bno) {
				var a = '';
				a += '<div>';
				a += '<textarea class = "tacss" name="content_'+rno+'" rows = "2"/>'+content+'</textarea>';
				a += '<span ><button class="btn btn-sm pbtn04" type="button" type="button" onclick="proReplyUpdate('+rno+','+bno+');">수정</button></span>';
				a += '</div>';
				
				$('.replyContent' + rno).html(a);
			}			
				
			function proReplyUpdate(rno, bno) {
				var updateContent = $('[name=content_'+rno+']').val();
				if (updateContent < 2)
				{
					alert("내용을 2자 이상 입력하세요.");
					document.proboardform.PRO_SUBJECT.focus();
					return false;
				}
				$.ajax({
					url : '/petsitter/update_ProReply.bo',
					type : 'post',
					dataType : 'json',
					data : {'content' : updateContent, 'bno' : 	bno, 'rno' : 	rno,},
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						if(data == 1) replyList(bno); // 댓글 수정 후 목록 출력
					},
					 error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					       }
				});
			}
				
			function proReplyDelete(rno, bno) {
				$.ajax({
					url : '/petsitter/delete_ProReply.bo',
					type : 'post',
				  data : {'rno': rno, 'bno' : bno,},
			    dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						if(data == 1) replyList(bno); // 댓글 삭제 후 목록 출력
					},
					error:function() {
						alert("ajax 통신 실패(delete)");			
					}		
				});
			}
			
			//댓글 count
			function replyCount(bno){
				$.ajax({
					url : '/petsitter/proreplycount.bo',
					type : 'post',
					data : {'bno': bno},
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						$('#replycount'+bno).empty();
						var a = '';
						var num = 1;
						$.each(data, function(key, value) {						
							a = ''+ value.reply_count +'';
							
						$('#replycount'+bno).html(a);	
						}); 
					}, 
					error:function(request, status, error){
						console.log("ajax 통신 실패");
						alert("ajax 통신 실패(List)");
					}
				});
			
			}			
			
			//댓글 기능 종료
		
			//좋아용 기능 시작
			function proLikeCountRead(bno){
				$.ajax({
					url : '/petsitter/readprolikecount.bo',
					type : 'post',
					data : {'bno': bno},
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						$('#prolikecount'+bno).empty();
						var a = '';
						var num = 1;
						$.each(data, function(key, value) {						
							
	    		   	//좋아요 아이디 추출
	    		   	if(value.like_ID != "N"){
        		   	var likeids = value.like_ID;
        		   	var likeid = likeids.split(',');
	        		}
					
	    		   	if(sessionid == "null" ){
								a += '<a href ="#" class="likeloginalert">';
								a += '<img src = "resources/images/heart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">'
								a += '</a>&nbsp;&nbsp;'+value.pro_LIKECOUNT+'';
		    			}							
			    		//idcheck 는  좋아요를 누른 아이디 일시 2로 바뀜
			    		var idcheck = 1;
			    		//첫 split된 인데스 0번째는 'N' 으로 1인덱스부터 시작과 il에 1추가로 필요한 길이 맞춤
			    		if (sessionid != "null" && likeids != "N"){
			    			var plc = value.pro_LIKECOUNT;
			    			var pn = value.pro_NUM;
			    			for(j = 1; j < plc+1; j++){
				    			if(likeid[j] == sessionid) {
				    				a += '<form id = "proLikeForm">';
				    				a += '<a href ="./downdateprolikecount.bo" class = "downdateLike_count">';
										a += '<img src = "resources/images/fullheart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">'
										a += '</a>&nbsp;&nbsp;'+value.pro_LIKECOUNT+'';
							    		//input으로 serialize 이용 값을 sql문에 대입 가능하게 전송
						    		a += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
						    		a += '<input type = "hidden" name = "PRO_LIKECOUNT" id = "PRO_LIKECOUNT'+pn+'" value= "'+ (plc-1) +'">';
						    		a += '<input type = "hidden" name = "PRO_NUM" id = "LIST_NUM" value= "'+ pn + '">';
						    		a += '</form>';
						    		idcheck = 2; //아이디확인 값 2로
				    			}
			    			}
			    		}
			    		if(sessionid != "null" && idcheck == 1){
			    			var plc = value.pro_LIKECOUNT;
			    			var pn = value.pro_NUM;
			    			a += '<form id = "proLikeForm">';
								a += '<a href ="./updateprolikecount.bo" class = "updateLike_count">';
								a += '<img src = "resources/images/heart.png"  width = "15px" height = "15px" style = "margin-bottom : 5px;">'
								a += '</a>&nbsp;&nbsp;'+value.pro_LIKECOUNT+'';
				    		a += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
				    		a += '<input type = "hidden" name = "PRO_LIKECOUNT" id = "PRO_LIKECOUNT'+pn+'" value= "'+ (plc+1) +'">';
				    		a += '<input type = "hidden" name = "PRO_NUM" id = "PRO_NUM" value= "'+ pn + '">';
				    		a += '</form>';
			    		}
			    		
						$('#prolikecount'+bno).html(a);	
						}); 
					}, 
					error:function(request, status, error){
						console.log("ajax 통신 실패");
						alert("ajax 통신 실패(List)");
					}
				});
			}			
	

			function proLikeCountRead2(bno){
				$.ajax({
					url : '/petsitter/readprolikecount.bo',
					type : 'post',
					data : {'bno': bno},
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						$('#prolikecount2'+bno).empty();
						var a = '';
						var num = 1;
						$.each(data, function(key, value) {						
							
	    		   	//좋아요 아이디 추출
	    		   	if(value.like_ID != "N"){
        		   	var likeids = value.like_ID;
        		   	var likeid = likeids.split(',');
	        		}
					
	    		   	if(sessionid == "null" ){
								a += '<a href ="#" class="likeloginalert">';
								a += '<img src = "resources/images/heart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">'
								a += '</a>&nbsp;&nbsp;'+value.pro_LIKECOUNT+'';
		    			}							
			    		//idcheck 는  좋아요를 누른 아이디 일시 2로 바뀜
			    		var idcheck = 1;
			    		//첫 split된 인데스 0번째는 'N' 으로 1인덱스부터 시작과 il에 1추가로 필요한 길이 맞춤
			    		if (sessionid != "null" && likeids != "N"){
			    			var plc = value.pro_LIKECOUNT;
			    			var pn = value.pro_NUM;
			    			for(j = 1; j < plc+1; j++){
				    			if(likeid[j] == sessionid) {
				    				a += '<form id = "proLikeForm">';
				    				a += '<div class = "float-right">'
				    				a += '<a href ="./downdateprolikecount.bo" class = "downdateLike_count">';
										a += '<img src = "resources/images/fullheart.png" width = "20px" height = "20px" style = "margin-bottom : 5px;">'
										a += '</a>&nbsp;&nbsp;'+value.pro_LIKECOUNT+'';
							    		//input으로 serialize 이용 값을 sql문에 대입 가능하게 전송
						    		a += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
						    		a += '<input type = "hidden" name = "PRO_LIKECOUNT" id = "PRO_LIKECOUNT'+pn+'" value= "'+ (plc-1) +'">';
						    		a += '<input type = "hidden" name = "PRO_NUM" id = "LIST_NUM" value= "'+ pn + '">';
						    		a += '</div>'
						    		a += '</form>';
						    		idcheck = 2; //아이디확인 값 2로
				    			}
			    			}
			    		}
			    		if(sessionid != "null" && idcheck == 1){
			    			var plc = value.pro_LIKECOUNT;
			    			var pn = value.pro_NUM;
			    			a += '<form id = "proLikeForm">';
			    			a += '<div class = "float-right">'
								a += '<a href ="./updateprolikecount.bo" class = "updateLike_count">';
								a += '<img src = "resources/images/heart.png"  width = "20px" height = "20px" style = "margin-bottom : 5px;">'
								a += '</a>&nbsp;&nbsp;'+value.pro_LIKECOUNT+'';
				    		a += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
				    		a += '<input type = "hidden" name = "PRO_LIKECOUNT" id = "PRO_LIKECOUNT'+pn+'" value= "'+ (plc+1) +'">';
				    		a += '<input type = "hidden" name = "PRO_NUM" id = "PRO_NUM" value= "'+ pn + '">';
				    		a += '</div>'
				    		a += '</form>';
			    		}
			    		
						$('#prolikecount2'+bno).html(a);	
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
		 		params = $(this).parents('#proLikeForm').serialize();
		 		
		 		jQuery.ajax({
		 			url : $(this).attr("href"),
					type : 'post',
					data : params,
			    dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						$.each(data, function(index, item){
						proLikeCountRead(item.pro_NUM); // 댓글 삭제 후 목록 출력
						proLikeCountRead2(item.pro_NUM);
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
			 		params = $(this).parents('#proLikeForm').serialize();
			 		
			 		jQuery.ajax({
			 			url : $(this).attr("href"),
						type : 'post',
						data : params,
				    dataType : 'json',
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						success : function(data) {
							$.each(data, function(index, item){
							proLikeCountRead(item.pro_NUM); // 댓글 삭제 후 목록 출력
							proLikeCountRead2(item.pro_NUM); // 댓글 삭제 후 목록 출력
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
								
	        			if(item.secret_CHECK == 'NN'){
		    					Swal.fire({
		    						  title: '신고가 접수된 게시글 입니다!',
		    						  text: "고객님의 관심의 감사를 표하며 빠른시일 내에 처리하겠습니다.",
		    						  icon: 'warning',
		    						  confirmButtonColor: 'rgba(83, 220, 152)',
		    						})
	        				return false;
	        			}
	        		
	        			var reportForm = '';
		        		reportForm += '<div class="modal fade" id="staticBackdropReport" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">';
		        		reportForm += '<div class="modal-dialog modal-sm">';
		        		reportForm += '<div class="modal-content">';
		        		reportForm += '<div class="modal-header">';
		        		reportForm += '<h4 class="modal-title main_mintfont font-size-20" id="staticBackdropLabel">신고하기.</h4>';
		        		reportForm += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
		        		reportForm += '<span aria-hidden="true">&times;</span>';
		        		reportForm += '</button>';
		        		reportForm += '</div>';
		        		reportForm += '<div class="modal-body">';
		        		reportForm += '<form action="./proreportinsert.bo" style = "font-size : 0" method="post" name="reportFormSubmit" enctype="multipart/form-data">';
		        		reportForm += '<div class = "row">';
		        		reportForm += '<div class = "col-12 font-size-14 main_grayfont3">';
		        		reportForm += '<input type="hidden" name="MEMBER_ID" value="${id}">';
		        		reportForm += '<input type="hidden" name="PRO_NUM" value="'+item.pro_NUM+'">';
		        		reportForm += '<input type="hidden" name="BOARD_TYPE" value="'+item.board_TYPE+'">';
		        		reportForm += '신고 글 번호 : '+item.pro_NUM+'<br/>';
		        		reportForm += '<br/><div>신고자</div>';
		        		reportForm += '<div>${id}</div>';		        		
		        		reportForm += '<div>${name}</div>';
		        		reportForm += '</br><div>신고 사유</div>';
		        		reportForm += '<textarea id="REPORT_REASON" name="REPORT_REASON" rows="4" cols="40" placeholder="신고 사유를 적어주세요."></textarea>';
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
		    	error:function(){
		        alert("ajax통신 실패!!!");
		    	}
				}); 
				//기본 이벤트 제거
				event.preventDefault();				
			});		
			//Modal reportForm 종료			
			

			//Modal reportReplyForm 시작	
			$(document).on('click', '.reportReplyFormAjax', function(event){ //on이 동적인걸 실행해준다.
				$('#reportReplyForm').empty();
				$.ajax({
		      url:$(this).attr("href"),
		      type : 'POST',
		      dataType : 'json',
		      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	        success:function(data){
	        	var k = 1;
	        	$.each(data, function(index, item){
        			
	        		if(item.report_reason == 'NN'){
    						Swal.fire({
    						  title: '신고가 접수된 댓글 입니다!',
    						  text: "고객님의 관심의 감사를 표하며 빠른시일 내에 처리하겠습니다.",
    						  icon: 'warning',
    						  confirmButtonColor: 'rgba(83, 220, 152)',
    						})
    						return false;
    					}
	        	
							var reportForm = '';
	        		reportForm += '<div class="modal fade" id="modalReplyReport" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">';
	        		reportForm += '<div class="modal-dialog modal-sm">';
	        		reportForm += '<div class="modal-content">';
	        		reportForm += '<div class="modal-header">';
	        		reportForm += '<h4 class="modal-title main_mintfont font-size-20" id="staticBackdropLabel">신고하기.</h4>';
	        		reportForm += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
	        		reportForm += '<span aria-hidden="true">&times;</span>';
	        		reportForm += '</button>';
	        		reportForm += '</div>';
	        		reportForm += '<div class="modal-body">';
	        		reportForm += '<form action="./proreportreplyinsert.bo" style = "font-size : 0" method="post" name="reportReplyFormSubmit" enctype="multipart/form-data">';
	        		reportForm += '<div class = "row">';
	        		reportForm += '<div class = "col-12 font-size-14 main_grayfont3">';
	        		reportForm += '<input type="hidden" name="writer_id" value="${id}">';
	        		reportForm += '<input type="hidden" name="bno" value="'+item.bno+'">';
	        		reportForm += '<input type="hidden" name="rno" value="'+item.rno+'">';
	        		reportForm += '<input type="hidden" name="b_type" value="'+item.b_type+'">';
	        		reportForm += '신고 댓글 번호 : '+item.rno+'<br/>';
	        		reportForm += '<br/><div>신고자</div>';
	        		reportForm += '<div>${id}</div>';		        		
	        		reportForm += '<div>${name}</div>';
	        		reportForm += '</br><div>신고 사유</div>';
	        		reportForm += '<textarea id="report_reason" name="report_reason" rows="4" cols="40" placeholder="신고 사유를 적어주세요."></textarea>';
	        		reportForm += '</div>';
	        		reportForm += '</div>';
	        		reportForm += '</div>';
	        		reportForm += '</form>';
	        		reportForm += '<div class="modal-footer">';
	        		reportForm += '<div class = "row">';
	        		reportForm += '<div class = "col-12 font-size-14">';
	        		reportForm += '<a type="button" class="btn btn-sm pbtn02 reportInsert" id="btnReportClose" href="javascript:addreportreplyboard()">신고하기</a>';
	        		reportForm += '<button type="button" class="btn btn-sm pbtn03" data-dismiss="modal" id="btnList">닫기</button>';
	        		reportForm += '</div>';
	        		reportForm += '</div>';
	        		reportForm += '</div>';
	        		reportForm += '</div>';
	        		reportForm += '</div>';
	        		reportForm += '</div>';
   	       		$('#reportReplyForm').append(reportForm);
	   	       		
	   	       		
	    			});
		      	if( true ) { $('.modalReplyReport').get(0).click(); }        	
	    		},
		    	error:function(){
		        alert("ajax통신 실패!!!");
		    	}
				}); 
				//기본 이벤트 제거
				event.preventDefault();				
			});		
			//Modal reportReplyForm 시작				

			
		});		
		</script>
</head>
<!-- 본 기능 추가 시작 -->
<!-- top_box 시작-->
<section class="top_box">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="top_box_title">
					<h1 class="top_box_text1">질문을 등록하면 해당 분야의	<br>전문가가 상담해드립니다.</h1>
					<p class="top_box_text2">바쁜 일상에 대면 상담이 부담스러우신가요?<br>
																	 반려동물 뷰티, 심리상담, 행동교정 등 전문가 상담 게시판을 통해<br>
																	 1:1 질의응답으로 다양한 펫 전문가들과 상담을 나눌 수 있습니다.</p>
					<a class ="register" href ="#" id = "pickgo">질문 등록하러가기
						<!-- 화살표 아이콘 -->
						<svg class="bi bi-arrow-right" width="2em" height="2em" viewBox="0 0 16 16" color="#53DC98" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  					<path fill-rule="evenodd" d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
  					<path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8z"/>
						</svg>
					</a>
				

				
				</div>
			</div>
			<div class="col-md-6 float-right">
					<img src="resources/images/pro_1.jpg" alt="#" class="img01">
			</div>
		</div>
	</div>
</section> <hr>
<!-- top_box 종료 -->

<!-- middle_box 시작 -->
<!-- 전문가 소개 시작 -->
<section class="middle_box">
	<div class="container">
		
		<div class="row">
			<div class="col">
				<div class="bottom_title">
				<h3 class="bottom_text1">전문가 소개</h3>
				<br/>
				</div>
			</div>
		</div>
		
		<div class="row ">
			<div class="col-md">
				<div class="middle_body" >
					<div class="aspect_1_1 proimg">
						<img src="resources/images/Gang_1.jpg" alt="..." >
					</div>
					<div class="middle_text">
						<div class="middle_body_text1">강형욱 애견훈련사</div>
						<span class="middle_body_text2">TV동물농장 110회 출연</span><br>
						<span class="middle_body_text2">훈련사 자격증 1급</span><br>
						<br/>						
					</div>
				</div>
			</div>
			<div class="col-md">
				<div class="middle_body">
					<div class="aspect_1_1 proimg">
						<img src="resources/images/pro_2.jpg" alt="...">
					</div>
					<div class="middle_text">
						<div class="middle_body_text1">이경규 애견훈련사</div>
						<span class="middle_body_text2">KBS 개는 훌륭하다 출연</span><br>
						<span class="middle_body_text2">훈련사 자격증 1급</span><br>
						<br/>						
					</div>
				</div>
			</div>
			<div class="col-md">
				<div class="middle_body">
					<div class="aspect_1_1 proimg">
						<img src="resources/images/pro_3.jpg" alt="...">
					</div>
					<div class="middle_text">
						<div class="middle_body_text1">강수의 수의사</div>
						<span class="middle_body_text2">서울대학교 수의사학과</span><br>
						<span class="middle_body_text2">PST 수의사 협회 회원</span><br>
						<br/>						
					</div>
				</div>
			</div>
			<div class="col-md">
				<div class="middle_body">
					<div class="aspect_1_1 proimg">
						<img src="resources/images/pro_4.jpg" alt="...">
					</div>
					<div class="middle_text">
						<div class="middle_body_text1">최수의 수의사</div>
						<span class="middle_body_text2">연세대학교 수의사학과</span><br>
						<span class="middle_body_text2">PST 수의사 협회 회원</span><br>
						<br/>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> <hr id = "pickme">
<!-- 전문가 소개 종료 -->
<!-- middle_box 종료 -->     
 
<!-- bottom_box 시작 -->
<!-- 전문가 게시판 미리보기 시작 (테이블)-->
<section class="bottom_box">

	<div class="container">
	
		<div class="row justify-content-center">
			<div class="col-7">
				<div class="bottom_title">
				<h3 class="bottom_text2">전문가 Q&A</h3>
				</div>
			</div>
			<div class="col-4 offset-1 padding0">
				<!-- search{s} -->
				<div class = "row">
					<div class="col-4 float-right padding0" style="padding-right:10px">
						<select class="form-control form-control-sm float-right" name="searchType" id="searchType">
							<option value="title">제목</option>
							<option value="Content">본문</option>
							<option value="reg_id">아이디</option>
						</select>
					</div>	
									
					<div class="col-6 float-right padding0" style="padding-right:10px">
						<input type="text" class="form-control form-control-sm float-right" name="keyword" id="keyword">
					</div>
					
					<div class = "col-2 float-right padding0">
						<a href = "./proboard2.bo?page=1" class="updateform_data btn btn-sm btn frmargin pbtn01"  
						 id="btnSearch">검색
						</a>
					</div>
				</div>
				<!-- search{e} -->



			</div>
		</div>
	</div>
	
	<div class="container">
	<div id ="update_form" method="post">	
		<div class="row" id = "proForm" style = "width : 1140px; height : 100%">	
		<!-- 게시판 반복 -->
			
		<%	
			int num = listcount - ((nowpage - 1) * 6);
			for(int i=0;i<boardlist.size();i++){
				ProBoardVO bl=(ProBoardVO)boardlist.get(i);
				String blid = bl.getMEMBER_ID();
				String bls = bl.getSECRET_CHECK();
		%>
		
	
				<div class="col-lg-6" style = "margin-top : 20px">
					<div class="bottom_table">
						<table class="PRO_TABLE main_grayfont3 fixtable">
						<thead>
							<tr>
								<!-- PRO_NUM -->
								<td scope="col"><div class = "font-size-12 float-left" style = "padding : 5px 0 0 0;">NO :&nbsp; </div> <%=bl.getPRO_NUM() %></td>
								<!-- MEMBER_ID -->
								<td scope="col" class = "font-size-14"><%=bl.getMEMBER_NICKNAME() %></td>
								<!--PRO_DATE -->
								<td scope="col" class = "font-size-14"><%=bl.getREAL_DATE() %></td>
								<!--PRO_READCOUNT  -->
								<td scope="col" class = "font-size-14" id = "readcountajax<%=bl.getPRO_NUM() %>">조회 수 : <%=bl.getPRO_READCOUNT() %></td>
								<!-- PRO_LIKECOUNT READ AJAX -->
								<td scope="col" class = "font-size-14" id = "prolikecount<%=bl.getPRO_NUM() %>"></td>
							</tr>
						</thead>
						<tbody>
		<%
				//비밀게시물이 아닌 경우 코드
				if(bls.equals("N")) {
		%>		
							<tr class="PRO_SUBJECT">
				     		<th colspan = "5"  class = "detailView01"><a href = "./proboarddetail.bo?num=<%=bl.getPRO_NUM() %>" class = "lista detailView"><%=bl.getPRO_SUBJECT() %></a></th>
				   		</tr>
				    	<tr class="PRO_CONTENT main_grayfont3">
				      	<td colspan ="5"  class = "detailView02"><a href = "./proboarddetail.bo?num=<%=bl.getPRO_NUM() %>" class = "lista2 detailView"><%=bl.getPRO_CONTENT() %></a></td>
				    	</tr>
				    	<tr class="PRO_READMORE">
				      	<td colspan ="4" style = "padding-left : 15px"><a href="./proboarddetail.bo?num=<%=bl.getPRO_NUM() %>" class="read">read more</a></td>
								<td colspan ="1" class = "replycountcss01">댓글 : <span class = "replycountcss02 detailView" id = "replycount<%=bl.getPRO_NUM() %>">0</span></td>
							</tr>
		<%	}%>
		
		<%	
				//로그인시 비밀게시물  접근 불가능자
				if(rank != null){
					if(bls.equals("Y") && !(rank.equals("admin")) && !(rank.equals("manager")) && !(id.equals(blid))) {
		%>				
							<tr class="PRO_SUBJECT">
				     		<th colspan = "5" class = "tdpaddign01">secret board.</th>
				   		</tr>
				    	<tr class="PRO_CONTENT main_grayfont3">
				      	<td colspan ="5" class = "tdpaddign01">비밀 게시글입니다.</td>
				    	</tr>
				    	<tr class="PRO_READMORE">
				      	<td colspan ="4" style = "padding-left : 15px"><a class="read">read more <span class="oi oi-lock-locked"></span></a></td>
				      	<td colspan ="1" class = "replycountcss01">댓글 : <span class = "replycountcss02" id = "replycount<%=bl.getPRO_NUM() %>">0</span></td>
							</tr>		
		<%		}%>	
		<%	}%>	
	
		<%		
				//비로그인시 비밀게시물 접근 불가
				if(bls.equals("Y")) {		
					if(rank == null){	
		%>		
							<tr class="PRO_SUBJECT">
				     		<th colspan = "5" class = "tdpaddign01">secret board.</th>
				   		</tr>
				    	<tr class="PRO_CONTENT main_grayfont3">
				      	<td colspan ="5" class = "tdpaddign01" >비밀 게시글입니다.</td>
				    	</tr>
				    	<tr class="PRO_READMORE">
				      	<td colspan ="4" style = "padding-left : 15px"><a class="read">read more <span class="oi oi-lock-locked"></span></a></td>
								<td colspan ="1" class = "replycountcss01">댓글 : <span class = "replycountcss02" id = "replycount<%=bl.getPRO_NUM() %>">0</span></td>
							</tr>				
		<%		}%>			
		<%	}%>			
		
		<%	
				//비밀게시판 일 때 접근 가능자
				if(bls.equals("Y")) {
					if(rank != null){					
						if((rank.equals("admin")) || (rank.equals("manager")) || (id.equals(blid))){
		%>		
							<tr class="PRO_SUBJECT">
				     		<th colspan = "5" class = "detailView01"><a href = "./proboarddetail.bo?num=<%=bl.getPRO_NUM() %>" class = "lista detailView"><%=bl.getPRO_SUBJECT() %></a></th>
				   		</tr>
				    	<tr class="PRO_CONTENT main_grayfont3">
				      	<td colspan ="5" class ="detailView02"><a href = "./proboarddetail.bo?num=<%=bl.getPRO_NUM() %>" class = "lista2 detailView"><%=bl.getPRO_CONTENT() %></a></td>
				    	</tr>
				    	<tr class="PRO_READMORE">
				      	<td colspan ="4" style = "padding-left : 15px"><a href = "./proboarddetail.bo?num=<%=bl.getPRO_NUM() %>" class = "read detailView">read more <span class="oi oi-lock-unlocked"></span></a></td>
								<td colspan ="1" class = "replycountcss01">댓글 : <span class = "replycountcss02" id = "replycount<%=bl.getPRO_NUM() %>">0</span></td>
							</tr>		
		<%			}%>		
		<%		}%>		
		<%	}%>				
							
				  	</tbody>
						</table>
					</div>
				</div>
				<script>
					replyCount(<%=bl.getPRO_NUM() %>);
					proLikeCountRead(<%=bl.getPRO_NUM()%>);
				</script>
		<%	num--;
			} %>			
			</div>
				</div>		
		
					
			
			
			
		<form id ="update_form2" method="post">
		<div class="row" id = "proForm2">
			<div class = "col-12" style = "padding : 10px 0 0 0">
			<%if(id == null) { %>
			<a href="#pick"  class = "writebtn float-right loginalert">글쓰기</a>
			<%} %>
			
			<%if(id != null) {
					if(!(rank.equals("Pro")) && !(rank.equals("GoldPro"))){
			%>
			
			<a href="./proboardwriteform.bo" class = "writebtn float-right">글쓰기</a>
			<%	} %>
			<%} %>
			</div>
			
			<div class = "col-12">
				<center>
				<table>	
					<tr align=center height=20>
						<td colspan=7 style="font-family:Tahoma;font-size:10pt;" width = "400px">
							<%if(nowpage<=1){ %>
							<a type="button" class="btn btn-sm bd3">이전</a> 
							<%}else{ %>
							<a href="./proboard2.bo?page=<%=nowpage-1 %>" type="button" class="updateform_data btn btn-sm blcss" id="prev">이전</a> 
							<%} %>
							
							<%for(int a=startpage;a<=endpage;a++){
								if(a==nowpage){%>
								<a type="button" class="btn btn-sm blcss"><%=a %></a> 
								<%}else{ %>
								<a href="./proboard2.bo?page=<%=a %>" type="button" style="background:white;" class="updateform_data btn btn-sm bw"><%=a %></a> 
								<%} %>
							<%} %>
							
							<%if(nowpage>=maxpage){ %>
							<a type="button"  class="btn btn-sm bd3">다음</a> 
							<%}else{ %>
							<a href="./proboard2.bo?page=<%=nowpage+1 %>" type="button" class="updateform_data btn btn-sm blcss" id="next">다음</a> 
							<%} %>
						</td>
					</tr>
				</table>	
				<center>	
			</div>

		</div>
</form>
		

		<!-- Modal view 시작 -->
		<!-- Modal 창 실행 a테그 -->
		<a href = "#" class = "staticBackdropDetail" data-toggle="modal" data-target="#staticBackdropDetail"></a>		
		<div id = "detailForm"></div>
		<!-- Modal view 종료 -->		
		
		
		<!-- Modal 글신고기능 시작-->
		<!-- Modal 창 실행 a테그 -->
		<a href = "#" class = "staticBackdropReport" data-toggle="modal" data-target="#staticBackdropReport"></a>	

		<div id = "reportForm"></div>
		<!-- Modal 글신고기능 종료--> 	

		<!-- Modal 리플신고기능 시작-->
		<!-- Modal 창 실행 a테그 -->
		<a href = "#" class = "modalReplyReport" data-toggle="modal" data-target="#modalReplyReport"></a>	

		<div id = "reportReplyForm"></div>
		<!-- Modal 글신고기능 종료--> 
		
	</div>


	
</section>
<!-- 전문가 게시판 미리보기 종료 (테이블) -->
<!-- bottom-box 종료 -->   
<!-- 본 기능 추가 종료 -->
<%@ include file="../jsp_bottom.jsp" %>
      
      

 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script><!-- sweetalert2 -->
    
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/open-iconic/1.1.1/font/css/open-iconic-bootstrap.min.css"><!--아이콘 (자물쇠)-->

		<script> 
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
			  
			  var btn = document.querySelector('#btnToggleOverflow');
			  btn.onclick = function() {
			    var val = divs[0].style.overflow == 'hidden' ? 'visible' : 'hidden';
			    for (var i = 0; i < divs.length; ++i)
			      divs[i].style.overflow = val;
			  };
			};
			/*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  종료*/

			$(document).ready(function(){				
				/*스크롤 위로올라가기 버튼 시작 script*/


				$(document).on('click', '.loginalert', function(event){
					Swal.fire({
					  title: '로그인을 하시겠습니까?',
					  text: "글쓰기는 로그인 후 사용 가능합니다.",
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
				
				$(document).on('click', '.likeloginalert', function(event){
					Swal.fire({
					  title: '로그인을 하시겠습니까?',
					  text: "좋아요는 로그인 후 사용 가능합니다.",
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
				
				
			});
			 
			 
			//모달 구현 제이쿼리(부트스트랩용) 시작
		  $('#myModal').on('shown.bs.modal', function () {
		  	$('#myInput').trigger('focus')
		  })
		  //모달 구현 제이쿼리(부트스트랩용) 종료
		  
			//Bootstrap multiple modal 이중 모달 창 순서 시작
		  var count = 0; // 모달이 열릴 때 마다 count 해서  z-index값을 높여줌

		  $(document).on('show.bs.modal', '.modal', function () {
	      var zIndex = 1040 + (10 * count);
	      $(this).css('z-index', zIndex);
	      setTimeout(function() {
	          $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
	      }, 0);
	      count = count + 1
		  });

		  // multiple modal Scrollbar fix
		  $(document).on('hidden.bs.modal', '.modal', function () {
	      $('.modal:visible').length && $(document.body).addClass('modal-open');
		  });
			//Bootstrap multiple modal 이중 모달 창 순서 종료
	
			
		  //글 신고 INSERT 버튼 시작
			function addreportboard(){
				var rpr = document.reportFormSubmit.REPORT_REASON.value
				if (rpr.length < 2)
				{
					alert("신고 이유를 2자 이상 입력하세요.");
					document.reportForm.reportFormSubmit.focus();
					return false;
				}
				
				reportFormSubmit.submit();
			}
			//글 신고 INSERT 버튼 종료		  

			  //댓글 신고 INSERT 버튼 시작
			function addreportreplyboard(){
				var rpr = document.reportReplyFormSubmit.report_reason.value
				if (rpr.length < 2)
				{
					alert("신고 이유를 2자 이상 입력하세요.");
					document.reportForm.reportReplyFormSubmit.focus();
					return false;
				}
				
				reportReplyFormSubmit.submit();
			}
			//댓글 신고 INSERT 버튼 종료				
			
			
			//전문가 상담 게시판 리스트 바로가기 시작
      $("#pickgo").click(function() {
	      var offset = $("#pickme").offset();
	      $('html, body').animate({scrollTop : offset.top}, 300);
      });
		//전문가 상담 게시판 리스트 바로가기 종료
			
	</script>     
    
    <script>
			$(function() {
				$(".btn-secondary").on("click mousedown", function() {
					$(this).css("background-color", "rgb(83, 220, 153)");
					$(this).css("border-color", "rgb(83, 220, 153)");
					$(this).css("box-shadow", "0 0 0 0 rgb(83, 220, 153)");
				});
			});
			
		</script>
</body>
</html>