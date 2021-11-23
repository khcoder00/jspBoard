<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<link rel="stylesheet" type="text/css" href="css/boardStyle.css"></link>
	<script type="text/javascript" src="js/boardScript.js"></script>
</head>
<body>
	<form action="jboard?bctr=upAct" name="upForm" method='post'>
		<input type="hidden" name="num" value="${article.num}">
	<table border="1" style="margin:0 auto; align:center; width: 720px">
		<tr>
			<th colspan="2" style="height: 70px">글수정</th>
		</tr>
		<tr>
			<th align="center">글제목</th>
			<td align="center"><input type="text" name="subject" style="height: 40px; width: 600px" value="${article.subject}"></td>
		</tr>
		<tr>
			<th align="center" width="120">글쓴이</th>
			<td align="center"><input type="text" name="writer" style="height: 40px; width: 600px" value="${article.writer}"></td>
		</tr>
		<tr>
			<th align="center">글내용</th>
			<td align="center"><textarea  name="content" style="height: 250px; width: 600px">${article.content}</textarea></td>
		</tr>
		<tr>
			<th align="center">이메일</th>
			<td align="center"><input type="text" name="email" style="height: 40px; width: 600px" value="${article.email}"></td>
		</tr>
		<tr>
			<th align="center">비밀번호</th>
			<td align="center"><input type="password" name="passwd" style="height: 40px; width: 600px" value="${article.passwd}"></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="button" value="수정완료" onclick="checkForm()">
				<input type="button" value="글목록" onclick="location.href='jboard?bctr=list'">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>