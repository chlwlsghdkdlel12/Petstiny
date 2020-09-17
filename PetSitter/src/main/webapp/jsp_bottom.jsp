<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style>
		.site-footer {
		  padding-top: 4em;
		  background: #e9e9e9!important; 
		}
	</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 하단 바 시작 -->
<footer class="site-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-7">
						<h2 class="footer-heading mb-4" id="main_grayfont1">
							About Us
						</h2>
						<p id="main_grayfont2" style="font-size: 14px;">
							반려동물들을 위해 고객과 펫시터와를 연결시켜주는 매칭 플렛폼입니다. 신뢰와 안전을 위해 최선을 다하겠습니다.
						</p>
					</div>
					<div class="col-md-4 ml-auto">
						<h2 class="footer-heading mb-4" id="main_grayfont1">
							CONTANTS
						</h2>
						<ul class="list-unstyled">
							<li>
								<a href="#" id="main_grayfont2" style="font-size: 14px;">
									방문 돌봄
								</a>
							</li>
							<li>
								<a href="#" id="main_grayfont2" style="font-size: 14px;">
									위탁 돌봄
								</a>
							</li>
							<li>
								<a href="#" id="main_grayfont2" style="font-size: 14px;">
									반려동물 전문가 상담
								</a>
							</li>
							<li>
								<a href="/review_board.bo" id="main_grayfont2" style="font-size: 14px;">
									후기 게시판
								</a>
							</li>
							<li>
								<a href="#" id="main_grayfont2" style="font-size: 14px;">
									공지사항
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 ml-auto">
				<h2 class="footer-heading mb-4" id="main_grayfont1" >
					Follow Us
				</h2>
				<a href="https://www.facebook.com/" class="smoothscroll pl-0 pr-3" target="_blank">
					<span class="icon-facebook" id="main_grayfont2"></span>
				</a>
				<a href="https://twitter.com/" class="pl-3 pr-3" target="_blank">
					<span class="icon-twitter" id="main_grayfont2"></span>
				</a>
				<a href="https://www.instagram.com/" class="pl-3 pr-3" target="_blank">
					<span class="icon-instagram" id="main_grayfont2" ></span>
				</a>
				<a href="https://www.linkedin.com/" class="pl-3 pr-3" target="_blank">
					<span class="icon-linkedin" id="main_grayfont2" ></span>
				</a>
			</div>
		</div>
		<div class="row pt-5 mt-5 text-center">
			<div class="col-md-12">
				<div class="border-top pt-5">
					<p id="main_grayfont2">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true" id="main_grayfont2"></i> <a href="https://colorlib.com" target="_blank" id="main_grayfont2">by Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- 하단 바 종료 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.fancybox.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script src="<c:url value="./resources/js/aos.js"/>"></script>
	
	<script src="<c:url value="/resources/js/main.js"/>"></script>
	<script>
		/*스크롤 위로올라가기 버튼 시작 script*/
		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 500) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
				}
			});
			
			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
		
		/*
		scroll(function(): scroll 함수를 이용
		첫 if문  : 스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼을 나타내고, 사라지도록 설정
		click(function() : 버튼 클릭 이벤트
		animate({ });: animation 을 걸어서 화면 맨위로 이동하도록 설정
		 
		스크롤 위로올라가기 버튼 종료 script*/
		
		/*sidebar 버튼 시작 script*/
		$(function() {
			$('#MOVE_SIDEBAR_BTN01').fadeIn();
				
			$("#MOVE_SIDEBAR_BTN01").click(function() {
				$('#MOVE_SIDEBAR').fadeIn();  
				$('#MOVE_SIDEBAR_BTN01').fadeOut();
				$('#MOVE_SIDEBAR_BTN02').fadeIn();
			
			//클릭시 sidebar는 fadeIn으로 보이며 버튼은 바뀐다
			
			//현재 스크롤 값 구하기
			var scrollValue = $(document).scrollTop();
			//지정값으로 가기
			$('html, body').animate({
				scrollTop : scrollValue
			}, );
			return false;
			//클릭시 스크롤 버튼 위치 유지 end	
				
			});
			$("#MOVE_SIDEBAR_BTN02").click(function() {
				$('#MOVE_SIDEBAR').fadeOut();  
				$('#MOVE_SIDEBAR_BTN02').fadeOut();
				$('#MOVE_SIDEBAR_BTN01').fadeIn();		
				
				//현재 스크롤 값 구하기
				var scrollValue = $(document).scrollTop();
				//지정값으로 가기
				$('html, body').animate({
					scrollTop : scrollValue
				}, );
				return false;
				//sidebar 버튼  end	
				
	
			});
		});


		
		
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