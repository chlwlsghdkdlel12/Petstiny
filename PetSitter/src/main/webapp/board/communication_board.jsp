<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = (String)request.getAttribute("writer");
	int usinglist_num = ((Integer)request.getAttribute("usinglist_num")).intValue();
	String petsitter_id = (String)request.getAttribute("petsitter_id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>소통 게시판 글쓰기</title>
	<style>
		a {
			text-decoration: none;
		}
	</style>
	<script>
		function check() {
			// 제목 체크
			if(document.boardform.BOARD_SUBJECT.value == "") {
				alert("제목을 입력하세요");
				document.boardform.BOARD_SUBJECT.focus();
				return;
			}
			
			if(document.boardform.BOARD_CONTENT.value == "") {
				alert("내용을 입력하세요");
				document.boardform.BOARD_CONTENT.focus();
				return;
			}
			
			boardform.submit();
		}
	</script>
</head>
<body>
	<!-- 게시판 등록 -->
	<form action="./communicationWriteProcess_member.bo" method="post" name="boardform" >
		<input type="hidden" name="BOARD_WRITER" value="<%=writer %>">
		<input type="hidden" name="MEMBER_ID" value="${id }">
		<input type="hidden" name="USINGLIST_NUM" value="<%=usinglist_num %>">
		<input type="hidden" name="PETSITTER_ID" value="<%=petsitter_id %>">
		<table cellpadding=0 cellspacing=0>
			<tr align="center" valign="middle">
				<td colspan="5">소통 게시판 글 쓰기</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="50px">
					<div align="center">작성자&nbsp;&nbsp;</div>
				</td>
				<td>
					<%=writer %>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="50px">
					<div align="center">구 분&nbsp;&nbsp;</div>
				</td>
				<td>
					<select name="BOARD_TYPE">
						<option>스케줄
						<option>기타
					</select>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="50px">
					<div align="center">제   목&nbsp;&nbsp;</div>
				</td>
				<td>
					<input name="BOARD_SUBJECT" type="text" size="50"
						maxlength="100" value="" />
				</td>
			</tr>
			<tr>
				<td height="25px"></td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" >
					<div align="center">내   용&nbsp;&nbsp;</div>
				</td>
				<td>
					<textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:check()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>
		</table>
	</form>
	<!-- 게시판 등록 -->
</body>
</html>