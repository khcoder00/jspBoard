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
	<table border="1" style="margin:0 auto; align:center; width: 720px">
		<tr>
			<th colspan="2" style="height: 70px">글내용</th>
		</tr>
		<tr>
			<th align="center">글제목</th>
			<td align="center"><input type="text" name="subject" style="height: 40px; width: 600px" value="${article.subject}" readonly="readonly"></td>
		</tr>
		<tr>
			<th align="center" width="120">글쓴이</th>
			<td align="center"><input type="text" name="writer" style="height: 40px; width: 600px" value="${article.writer}" readonly="readonly"></td>
		</tr>
		<tr>
			<th align="center">글내용</th>
			<td align="center"><textarea  name="content" style="height: 250px; width: 600px" readonly="readonly">${article.content}</textarea></td>
		</tr>
		<tr>
			<th align="center">이메일</th>
			<td align="center"><input type="text" name="email" style="height: 40px; width: 600px" value="${article.email}" readonly="readonly"></td>
		</tr>
		<tr>
			<th align="center">비밀번호</th>
			<td align="center"><input type="password" name="passwd" style="height: 40px; width: 600px" value="${article.passwd}" readonly="readonly"></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="button" value="글수정" onclick="checkPass('${article.passwd}', 'U')">
				<input type="button" value="글삭제" onclick="checkPass('${article.passwd}', 'D')">
				<input type="button" value="글쓰기" onclick="location.href='jboard?bctr=write'">
				<input type="button" value="답글" onclick="javascript:reply()">
				<input type="button" value="글목록" onclick="javascript:location.href='jboard?bctr=list'">
			</td>
		</tr>
	</table>
	<form action="" name="updateForm" method='post'>
		<input type="hidden" name="num" value="${article.num}">
		<input type="hidden" name="ref" value="${article.ref}">
		<input type="hidden" name="step" value="${article.step}">
		<input type="hidden" name="lev" value="${article.lev}">
	</form>
</body>
</html>