<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.pay.*" %>
<%
	MemberVO member = (MemberVO)request.getAttribute("member");
	PayVO payvo = (PayVO)request.getAttribute("payvo");
%>
<!doctype html>
<html>
<head>
	<title>결제 요청 페이지</title>
    <script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
    	function randomString() {
	    	const chars = "ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz0123456789";
	    	const string_length = 6;
	    	let randomstring = '';
	    	for (var i = 0; i < string_length; i++) {
		    	var rnum = Math.floor(Math.random() * chars.length);
		    	randomstring += chars.substring(rnum,rnum+1);
	    	}
	    	return randomstring;
   		}
    	let merchant_123 = '';
    	merchant_123 = randomString();
    </script>
    <script>
			$(function() {
				const IMP = window.IMP;
				const code = "imp95927947"; // 가맹점 식별코드
				IMP.init(code);
	
				// 결제요청
				IMP.request_pay({
					// name과 amount만 있어도 결제 진행가능
					pg : 'kakao', // pg 사 선택(kakao, kakaopay 둘다 가능)
					pay_method : 'card',
					merchant_uid : merchant_123,
					name : '결제테스트', // 상품명
					amount : <%=payvo.getPAY_AMOUNT() %>,
					buyer_name : "<%=member.getMEMBER_NAME() %>",
					buyer_email : "<%=member.getMEMBER_ID() %>",
					buyer_tel : "<%=member.getMEMBER_TEL() %>"
				}, function(rsp) {
					if ( rsp.success ) { // 결제 성공시 
						var msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid;
						msg += '\n결제 금액 : ' + rsp.paid_amount;
						
						var payvo = {
								PAY_ID: "<%=member.getMEMBER_ID().split("@")[0] %>",
								PAY_AMOUNT: <%=payvo.getPAY_AMOUNT() %>,
								PETSITTER_ID: "<%=payvo.getPETSITTER_ID() %>",
								MERCHANT_UID: rsp.merchant_uid,
								PAY_TYPE: "<%=payvo.getPAY_TYPE() %>",
								START_DATE: "<%=payvo.getSTART_DATE() %>",
								END_DATE: "<%=payvo.getEND_DATE() %>",
								PAY_POINT: <%=payvo.getPAY_POINT() %>
						};
						
						$.ajax({
							url: '/petsitter/payinsert.br',
							type: 'post',
							data: payvo,
							dataType: 'json',
							contentType: 'application/x-www-form-urlencoded; charset=utf-8',
							success: function() {
								alert('결제 성공');
							},
							error: function() {
								alert('결제 실패');
							}
						});
					}
					else { // 결제 실패시
						var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg
					}
					alert(msg);
					location.href='payConfirm.br?mid=' + rsp.merchant_uid;
				});
			});
    </script>

</head>
<body>
</body>
</html>