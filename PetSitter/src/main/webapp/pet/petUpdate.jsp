<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.petsitter.MemberController.*" %>
<%
	PetVO vo = (PetVO)request.getAttribute("vo");
	String PETCATEGORY = vo.getPET_CATEGORY();
%>
<%@ include file="../jsp_top.jsp" %>
<!-- 반려동물 등록 -->
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
	<title>반려동물 등록 페이지</title>   
	<!-- 언택 추가 CSS -->
	<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/petUpdate.css?after">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- 본 기능 추가 시작 -->
<section class="top_box">
  <div class="container">
    <div class="row justify-content-start">     
	  	<div class="col-8">
	    	<div class="top_box_title">
	      	<h1 class="top_box_text1">My Pet 수정</h1>
		  		<p class="top_box_text2">정보를 최신화해주세요</p>
	    	</div>
	  	</div>
	  	
	 	  <div class="col-3">
	  	</div>
	  	
		</div>
  </div>
</section>

<section class="middle_box">
  <div class="container">
    <div class="row">
      <div class="col">
	    	<div class="inner">
		  		<form name="petUpdate" action="petUpdate.me" enctype="multipart/form-data" method="post">
		    		<div class="row">
			 	 			<div class="col">
			  				<div class="div_txt">
			  					<input type="text" name="MEMBER_ID" id="MEMBER_ID" class="input_txt" value=${id } readonly>
			  					<span class="span_txt" id="input_id">ID</span>
			  				</div>
			  			</div>
			  			<div class="col">
			  				<div class="div_txt">
			  					<input type="text" name="PET_CATEGORY" id="PET_CATEGORY" class="input_txt" 
			  						data-toggle="tooltip" data-placement="top" title="예 : 강아지" value=<%=vo.getPET_CATEGORY()%>>
			    				<span class="span_txt" id="input">종류</span>	
			  				</div>
			  			</div>
			  		</div>
						
						<div class="row">
							<div class="col">
								<div class="div_txt">
									<input type="text" name="PET_KIND" id="PET_KIND" class="input_txt"
										data-toggle="tooltip" data-placement="top" title="예 : 푸들" value=<%=vo.getPET_KIND()%>>
									<span class="span_txt" id="input">품종</span>
								</div>
							</div>
							<div class="col">
								<div class="div_txt">
									<input type="text" name="PET_NAME" id="PET_NAME" class="input_txt"
										data-toggle="tooltip" data-placement="top" title="예 : 밍키" value=<%=vo.getPET_NAME()%>>
									<span class="span_txt" id="input">이름 </span>
								</div>	
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<div class="div_txt">
									<input type="number" name="PET_WEIGHT" id="PET_WEIGHT" class="input_txt"
										data-toggle="tooltip" data-placement="top" title="예: 9 (단위 :KG)" value=<%=vo.getPET_WEIGHT()%>>
									
									<span class="span_txt" id="input">체중</span>
								</div>
								<div class="div_txt">
									<input type="text" name="PET_SIZE" id="PET_SIZE" class="input_txt"
										data-toggle="tooltip" data-placement="top" title="예 : (대형 / 중형  / 소형)" value=<%=vo.getPET_SIZE()%>>
									<span class="span_txt" id="input">크기</span>
								</div>
								
							</div>	
							<div class="col">
								<div class="div_txt">
									<input type="text" name="PET_BIRTH" id="PET_BIRTH" class="input_txt"
										data-toggle="tooltip" data-placement="top" title="예 : 2020-06-16" value=<%=vo.getPET_BIRTH()%>>
									<span class="span_txt" id="input">생년월일</span>			
								</div>
							</div>			
						</div>
						
						<br><br><br>
						
						<div class="row">
							<div class="col">
								<div class="div_txt2">
									<span class="span_txt2" id="checkbox1">성별</span>
									<input type="text" name="pet_sex" id="pet_sex" class="input_txt" disabled/>
										<div class="div_rd" id="div_rd1">
										<%if(vo.getPET_GENDER().equals("수컷"))
											{
										%>	<input type="radio" name="PET_GENDER" id="PET_GENDER1" class="input_rd" value="수컷"
												checked = "checked"/>
												<span>수컷</span>
												
												<input type="radio" name="PET_GENDER" id="PET_GENDER2" class="input_rd" value="암컷">
												<span>암컷</span>
										<%}else
											{
										%>  
												<input type="radio" name="PET_GENDER" id="PET_GENDER1" class="input_rd" value="수컷">
												<span>수컷</span>
												<input type="radio" name="PET_GENDER" id="PET_GENDER2" class="input_rd" value="암컷"
												checked = "checked"/>
												<span>암컷</span>
										<%} %>
										</div>
								</div>
							</div>

							<div class="col">
								<div class="div_txt2">
									<span class="span_txt2" id="checkbox2">중성화 수술 여부</span>
									<input type="text" name="pet_operation" id="pet_operation" class="input_txt" disabled/>
										<div class="div_rd">
										<%if(vo.getPET_NEUTERED().equals("Y"))
											{
										%>
												<input type="radio" name="PET_NEUTERED" id="PET_NEUTERED1" class="input_rd" value="Y"
												checked = "checked"/>
												<span>했음</span>
												<input type="radio" name="PET_NEUTERED" id="PET_NEUTERED2" class="input_rd" value="N">
												<span>안했음</span>
										<%}else
											{
										%>
											<input type="radio" name="PET_NEUTERED" id="PET_NEUTERED1" class="input_rd" value="Y">
											<span>했음</span>		
											<input type="radio" name="PET_NEUTERED" id="PET_NEUTERED2" class="input_rd" value="N"
											checked = "checked"/>
											<span>안했음</span>
										<%} %>
										</div>
								</div>
							</div>
							
							<div class="col">
								<div class="div_txt2">
									<span class="span_txt2">배변훈련 여부</span>
									<input type="text" name="pet_shit" id="pet_shit" class="input_txt" disabled/>
										<div class="div_rd">
										<%if(vo.getPET_POTTYTRAN().equals("Y"))
											{
										%>
											<input type="radio" name="PET_POTTYTRAN" id="PET_POTTYTRAN1" class="input_rd" value="Y"
											checked = "checked"/>
											<span>했음</span>
											<input type="radio" name="PET_POTTYTRAN" id="PET_POTTYTRAN2" class="input_rd" value="N">
											<span>안했음</span>
										<%}else
											{
										%>
											<input type="radio" name="PET_POTTYTRAN" id="PET_POTTYTRAN1" class="input_rd" value="Y">
											<span>했음</span>
											<input type="radio" name="PET_POTTYTRAN" id="PET_POTTYTRAN2" class="input_rd" value="N"
											checked = "checked"/>
											<span>안했음</span>
										<%} %>
										</div>
								</div>
							</div>
					
							<div class="col">
								<div class="div_txt2">
									<span class="span_txt2">예방접종 여부</span>
									<input type="text" name="pet_prevent" id="pet_prevent" class="input_txt" disabled/>
										<div class="div_rd">
										<%if(vo.getPET_VAOONE().equals("Y")) 
											{
										%>
											<input type="radio" name="PET_VAOONE" id="PET_VAOONE1" class="input_rd" value="Y"
											checked = "checked"/>
											<span>했음</span>
											<input type="radio" name="PET_VAOONE" id="PET_VAOONE2" class="input_rd" value="N">
											<span>안했음</span>
										<%}else
											{
										%>
											<input type="radio" name="PET_VAOONE" id="PET_VAOONE1" class="input_rd" value="Y">
											<span>했음</span>
											<input type="radio" name="PET_VAOONE" id="PET_VAOONE2" class="input_rd" value="N"
											checked = "checked"/>
											<span>안했음</span>
										<%} %>
										</div>	
								</div>
							</div>
						</div>	
					
						<br><br><br>
						
						<div class="row">
							<div class="col">
								<div class="div_txt3">
									<span class="span_txt3" id="file">사진 업로드</span>
								</div>
								<div class="div_txt3">
									<img class="noimg" id="noimg" src="/filepath/<%=vo.getPET_PHOTO()%>">
									<button type="submit" class="btn_next" onclick="javascript:register">
										<i class="fas fa-arrow-right" id="icon1"></i>펫 수정
									</button>
								</div>
								<div class="div_file">
									<div class="filebox">
										<label for="input-file" class="upload">업로드</label>
											<input type="file" name="PET_PHOTO_PROFILE" id="input-file" class="upload-hidden">																										
									</div>
								</div>
							</div>
						</div><br><br>				
		  		</form>
				</div>
	  	</div>
    </div>
  </div>
</section>
<!-- 본 기능 추가 종료 -->    
<%@ include file="../jsp_bottom.jsp" %>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
    <script>
    	function register()
    	{
    		petUpdate.submit();
    	}
    </script>
    
    <script>
    	var sel_file;
    	
    	$(document).ready(function() {
/*     		$("#input_img").on("change", handleImgFileSelect); */
    		 	$("#input-file").on("change", handleImgFileSelect);
    	});
    	
    	function handleImgFileSelect(e) {
    		var files = e.target.files;
    		var filesArr = Array.prototype.slice.call(files);
    		
    		filesArr.forEach(function(f) {
    			if(!f.type.match("image.*")) {
    				alert("확장자는 이미지 확장자만 가능합니다.");
    				return;
    			}
    			
    			sel_file = f;
    			
    			var reader = new FileReader();
    			reader.onload = function(e) {
    				$("#noimg").attr("src", e.target.result);
    			}
    			reader.readAsDataURL(f);
    		});
    	}
    </script>
    
    <!-- 아이콘 -->   
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    
	<script>
	  $(function () {
			$('[data-toggle="tooltip"]').tooltip()
		});
	</script> 
</body>
</html>