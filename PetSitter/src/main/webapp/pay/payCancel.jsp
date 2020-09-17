<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.pay.*" %>
<%
	PayVO payvo = (PayVO)request.getAttribute("payvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 취소 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<script>
		$(function() {
			$.ajax({
				url: "/petsitter/payCancel.br",
				type: "post",
				//datatype: "json",
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				data: {
					"merchant_uid": "<%=payvo.getMERCHANT_UID() %>"
				}
				}).done(function(result) {
					alert("환불 성공 : " + result);
					
					$.ajax({
						url: "/petsitter/payUpdate.br",
						type: "post",
						contentType : 'application/x-www-form-urlencoded; charset=utf-8',
						data: {
							merchant_uid: "<%=payvo.getMERCHANT_UID() %>",
							amount: <%=payvo.getPAY_AMOUNT() %>,
							m_id: "<%=payvo.getPAY_ID() %>",
							p_id: "<%=payvo.getPETSITTER_ID() %>"
						},
						success: function() {
							alert("결제 취소 성공");
							location.href='memberinfo.me?id=' + "<%=payvo.getPAY_ID() %>";
						},
						error: function() {
							alert("결제 취소 실패");
						}
					});
				}).fail(function(fail) {
					console.log(fail);
					alert("환불 실패 : " + fail);
				});
			});
		</script>
	
	
	
	
</body>
</html>