<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%
	ArrayList<CommunicationBoardVO> boardList = (ArrayList<CommunicationBoardVO>)request.getAttribute("board_list");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	int usinglist_num = ((Integer)request.getAttribute("usinglist_num")).intValue();
	String petsitter_id = (String)request.getAttribute("petsitter_id");
	// 세션 종료시 홈으로
	if(session.getAttribute("id") == null) {
		out.println("<script>");
		out.println("location.href = 'home.me'");
		out.println("</script>");
	}
%>
<%@ include file="../jsp_top.jsp" %>
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
	
	/*테이블 css 시작*/
	th, td {
			color : #5e5e5e!important;
			font-size : 15px;
		}
		
		/*nth-child(1) 칼럼 순서 불러서 css 입혀준다.*/
		th:nth-child(1), th:nth-child(2), th:nth-child(3), th:nth-child(4), th:nth-child(5) {
			text-align: center;
  	}
	
   td:nth-child(1), td:nth-child(2), td:nth-child(4), td:nth-child(5) {
			text-align: center;
  	}
  	.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
   	background-color: #F8F8F8;
		}
		/*테이블 css 종료*/
</style>
<head>
	<title>펫시터와의 소통 게시판</title>   
	<!-- 언택CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/UT_CSS/communication.css">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- 본 기능 추가 시작 -->
<section class="top_box">
	<div class="container">
		<div class="row">
			<div class="col-6">
				<div class="top_box_title1">
					<h1 class="top_box_text1">고객과의 소통</h1>
					<p class="top_box_text2">상호간 소통을 통해 가까워지는 시간을 가지세요!</p>
				</div>
			</div>
			<div class="col-6">
				<div class="top_box_title2">	
					<img class="top_box_img" src="resources/images/pet/Bs_Dog1.PNG">
				</div>
			</div>
		</div>
	</div>
</section>

<section class="middle_box">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="middle_box_right">
					<%
						if(((String)session.getAttribute("id")).contains("@")) {
					%>
					<a href="communicationWrite_member.bo?usinglist_num=<%=usinglist_num %>" id="question" class="right_btn">질문남기기</a>
					<%
						}
					%>
				</div>
			
				<div class="middle_table">
					<table class="table table-sm table-hover table-striped" style="text-align: center;">
						<thead>
							<tr>
								<th width="50px">번호</th>
								<th width="100px">답변여부</th>
								<th width="20px">구분</th>
								<th width="180px">제목</th>
								<th width="100px">작성자</th>
								<th width="100px">등록일자</th>
							</tr>
						</thead>
						<tbody id="getContent">
						<%
							int num = listcount - ((nowpage - 1) * 5);
							if(boardList != null) {
								for(int i = 0; i < boardList.size(); i++) {
									CommunicationBoardVO board = (CommunicationBoardVO)boardList.get(i);
						%>
							<tr id="clickText_<%=num %>" style="cursor:pointer;" >
								<td width="50px">
									<input type="hidden" id="textValue" value="<%=board.getBOARD_NUM() %>">
									<%=num %>
								</td>
								<td width="100px"><%=board.getBOARD_CONDITION() %></td>
								<td width="50px"><%=board.getBOARD_TYPE() %></td>
								<td width="180px"><%=board.getBOARD_SUBJECT() %></td>
								<td width="100px"><%=board.getBOARD_WRITER() %></td>
								<td width="100px"><%=board.getBOARD_REALDATE() %></td>
							</tr>
							<tr class="viewText" id="viewText_<%=num %>" style="display: none;">
								<td colspan="3"></td>
								<td width="180px"><%=board.getBOARD_CONTENT() %></td>
								<td colspan="2"></td>
							</tr>
						<%
									num--;
								}
							}
						%>
						</tbody>
						</table>
					</div>
					<table class="col-md-12 text-center">
						<tr align=center height = 20>
							<td colspan=7 style="font-family:Tahoma;font-size:10pt;">
								<%if(nowpage <= 1) { %>
								<
								<%}else { %>
								<a href="./communication_member.bo?usinglist_num=<%=usinglist_num %>&page=<%=nowpage - 1 %>"> &#60; </a>
								<%} %>
								
								<%
									for(int a = startpage; a <= endpage; a++) {
										if(a == nowpage) {
								%>
									<%=a %>
								<%} else { %>
									<a href = "./communication_member.bo?usinglist_num=<%=usinglist_num %>&page=<%=a %>"><%=a %></a>
									<%} %>
								<%} %>
								
								<%if(nowpage >= maxpage) { %>
								>
								<%}else { %>
								<a href = "./communication_member.bo?usinglist_num=<%=usinglist_num %>&page=<%=nowpage + 1 %>"> &#62; </a>
								<%} %> 
							</td>
						</tr>
					</table>
					<br/><br/><!-- br은 제거가능 -->

			</div>
		</div>
	</div>
</section>

<section class="bottom_box">
	<%
		if(!((String)session.getAttribute("id")).contains("@")) {
	%>
	<div class="row justify-content-center">
		<div class="col">
			<form>
				<div class="petsitter_picture_upload">
					<button type="button" class="photo_upload" data-toggle="modal" data-target="#staticBackdrop">사진 올리기</button>
				</div>
			</form>
		</div>
	</div>
	<%
		}
	%>
	<div class="container">
		<div class="row"  id="photo_list_input" style="margin: 10px auto;">
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col">
			<form>
				<div class="bottom_button">
					<button type="button" class="photo_more" id="photo_more" onclick="plus_photo()" style="width: 150px;">사진 더보기</button>
				</div>
			</form>
		</div>
	</div>
</section>      


<form name="uploadPicture" action="./communicationUploadPhoto.bo" method="post" enctype="multipart/form-data">
<input type="hidden" name="USINGLIST_NUM" id="usinglist_id" value=<%=usinglist_num %>> 
<div class="modal fade" id="staticBackdrop" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header" style="display: inline; text-align: center;">
        <h5 class="modal-title main_mintfont" id="staticBackdropLabel" style="display: inline;">사진 올리기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-12">
      			<table class="table table-sm table-hover table-striped" style="font-size: 15px;">
      				<input type="hidden" name="PETSITTER_ID" value="<%=petsitter_id %>">
      				<tr>
      					<th height="70px">돌봄 사진 1</th>
      					<td class = "tleft">
	      					<div class="filebox">
		      					<div class="img_wrap" style="margin-bottom: 10px;">
													<img id="dolbom_img1" class="dolbom_img1" style="display: none; width: 130px;"/>
										</div> 
		      					<input class="upload-name01" value="파일선택" disabled="disabled"> 
		      					<label for="ex_filename01">업로드</label><input type="file" name="COMMUNICATION_PHOTO_LIST" id="ex_filename01" class="upload-hidden">
		      					<img src="resources/images/deleteimage.jpg" id="deleteimg1" onclick="deleteImage1()" 
		      							style="position: absolute; width: 20px; margin-top: 16px; opacity: 0.5;" onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0.5'"/>
	      					</div>
      					</td>
      				</tr>
      				<tr>
      					<th height="70px">돌봄 사진 2</th>
      					<td class = "tleft">
	      					<div class="filebox">
		      					<div class="img_wrap" style="margin-bottom: 10px;">
													<img id="dolbom_img2" class="dolbom_img2" style="display: none; width: 130px;"/>
										</div> 
		      					<input class="upload-name02" value="파일선택" disabled="disabled"> 
		      					<label for="ex_filename02">업로드</label><input type="file" name="COMMUNICATION_PHOTO_LIST" id="ex_filename02" class="upload-hidden">
		      					<img src="resources/images/deleteimage.jpg" id="deleteimg2" onclick="deleteImage2()" 
		      							style="position: absolute; width: 20px; margin-top: 16px; opacity: 0.5;" onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0.5'"/>
	      					</div>
      					</td>
      				</tr>
      				<tr>
      					<th height="70px">돌봄 사진 3</th>
      					<td class = "tleft">
	      					<div class="filebox">
		      					<div class="img_wrap" style="margin-bottom: 10px;">
													<img id="dolbom_img3" class="dolbom_img3" style="display: none; width: 130px;"/>
										</div> 
		      					<input class="upload-name03" value="파일선택" disabled="disabled"> 
		      					<label for="ex_filename03">업로드</label><input type="file" name="COMMUNICATION_PHOTO_LIST" id="ex_filename03" class="upload-hidden">
		      					<img src="resources/images/deleteimage.jpg" id="deleteimg3" onclick="deleteImage3()" 
		      							style="position: absolute; width: 20px; margin-top: 16px; opacity: 0.5;" onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0.5'"/>
	      					</div>
      					</td>
      				</tr>
       			</table>
      		</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn modalbt01" data-dismiss="modal" style="padding: 2.5px;">닫기</button>
        <button type="submit" class="btn modalbt02" id="updatebutton" style="padding: 2.5px;">확인</button>
      </div>
    </div>
  </div>
</div>
</form>
<!-- 본 기능 추가 종료 -->
<%@ include file="../jsp_bottom.jsp" %>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
    
	<!-- 아이콘 -->   
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		
		<script>
			let num = 6;
			let num2 = 12;
			function listDate() {
				$.ajax({
					url: '/petsitter/getPhotoListJSON.bo',
					type: 'post',
					data: {
						id: <%=usinglist_num %>
					},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						var i = 1;
						$.each(data, function(index, item) {
							var output = '';
							if(index < 6) {
								output += '<div class="col-md-4">';
								output += '<div class="row justify-content-center">';
								output += '<div class="col">';
								output += '<div class="bottom_body'+(index+1)+'">';
								output += '<div class="bottom_img'+(index+1)+'" style="text-align: center;">';
								if(item == "N") {
									output += '<img src="resources/images/dog03.jpg" class="bottom_imgs" id="botom_imgs'+i+'" alt="...">';
								} else {
									output += '<img src="/filepath/' + item + '" class="bottom_imgs" id="botom_imgs'+i+'" alt="...">';
								}
								output += '</div>';
								output += '</div>';
								output += '</div>';
								output += '</div>';
								output += '</div>';
							}
							
							i++;
							$('#photo_list_input').append(output);
						});
					},
					error: function() {
						alert("ajax 실패");
					}
				});
			}
			
			$(function() {
				listDate();
				
			});
			
			function plus_photo() {
				$.ajax({
					url: '/petsitter/getPhotoListJSON.bo',
					type: 'post',
					data: {
						id: <%=usinglist_num %>
					},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						var i = 7;
						$.each(data, function(index, item) {
							var output = '';
							if(index >= num && index < num2) {
								output += '<div class="row justify-content-center">';
								output += '<div class="col">';
								output += '<div class="bottom_body'+(index+1)+'">';
								output += '<div class="bottom_img'+(index+1)+'">';
								if(item == "N") {
									output += '<img src="resources/images/dog03.jpg" class="bottom_imgs" id="botom_imgs'+i+'" alt="...">';
								} else {
									output += '<img src="/filepath/' + item + '" class="bottom_imgs" id="botom_imgs'+i+'" alt="...">';
								}
								output += '</div>';
								output += '</div>';
								output += '</div>';
								output += '</div>';
							}
							
							i++;
							$('#photo_list_input').append(output);
						});
						num2 += 6; //다음 더보기시 사진 6개 추가 생성
				    num += 6; //다음 더보기시 사진 6개 추가 생성
					},
					error: function() {
						alert('더보기 실패');
					}
				});
				//기본 이벤트 제거
				event.preventDefault();
			}
			
			$("#photo_more").click(function() {
				   //현재 스크롤 값 구하기
				   var scrollValue = $(document).scrollTop();
				   //지정값으로 가기
				   $('html, body').animate({
				         scrollTop : scrollValue
				     }, );
				     return false;
			});
		</script>
		
		<script>
			/* 글 눌렀을 때 내용 보이기 함수 */
			$(function() {
				$(".viewText").hide();
				let num = '<%=listcount-((nowpage - 1)*10)%>';
				
				for(let i = 1; i <= num; i++) {
					$("#clickText_" + i).on("click", function() {
						if($("#viewText_" + i).css("display") == "none") {
							$("#viewText_" + i).show();
							$("#clickText_" + i).css("font-weight", "bold");
						} else {
							$("#viewText_" + i).hide();
							$("#clickText_" + i).css("font-weight", "normal");
						}
					});
				}
				
			});
		</script>

		<script>
			$(document).ready(function() {
				let sel_file01;
				let sel_file02;
				let sel_file03;
				
				$("#ex_filename01").on("change", handleImgFileSelect);
				$("#ex_filename02").on("change", handleImgFileSelect02);
				$("#ex_filename03").on("change", handleImgFileSelect03);
			});	
		
		
			function deleteImage1() {
				$("#dolbom_img1").attr("src", "");
				$("#ex_filename01").val($("#ex_filename01").prop("defaultValue"));
				$(".upload-name01").val($(".upload-name01").prop("defaultValue"));
			}
			
			function deleteImage2() {
				$("#dolbom_img2").attr("src", "");
				$("#ex_filename02").val($("#ex_filename02").prop("defaultValue"));
				$(".upload-name02").val($(".upload-name02").prop("defaultValue"));
			}
			
			function deleteImage3() {
				$("#dolbom_img3").attr("src", "");
				$("#ex_filename03").val($("#ex_filename03").prop("defaultValue"));
				$(".upload-name03").val($(".upload-name03").prop("defaultValue"));
			}
		
		
			function handleImgFileSelect(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f) {
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					
					var reader = new FileReader();
					
					reader.onload = function(e){
						$(".dolbom_img1").attr("src",e.target.result);
						$("#dolbom_img1").show();
					}
					reader.readAsDataURL(f);
				});
			}
			
			function handleImgFileSelect02(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f) {
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					
					var reader = new FileReader();
					
					reader.onload = function(e){
						$(".dolbom_img2").attr("src",e.target.result);
						$("#dolbom_img2").show();
					}
					reader.readAsDataURL(f);
				});
			}
			
			function handleImgFileSelect03(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f) {
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					
					var reader = new FileReader();
					
					reader.onload = function(e){
						$(".dolbom_img3").attr("src",e.target.result);
						$("#dolbom_img3").show();
					}
					reader.readAsDataURL(f);
				});
			}
		</script>
</body>
</html>