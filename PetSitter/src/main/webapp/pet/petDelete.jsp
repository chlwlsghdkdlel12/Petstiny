<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/petRegister.css?after">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- 본 기능 추가 시작 -->
<section class="top_box">
  <div class="container">
    
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
    		petRegister2.submit();
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