<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<link rel="stylesheet" type="text/css" href="css/boardStyle.css"></link>
	<script type="text/javascript" src="js/boardScript.js"></script>
</head>
<body>
<jsp:useBean id="article" class="model.dto.BoardDTO" />
<jsp:setProperty property="*" name="article" />
	<form method="post" action="jboard?bctr=wrAct" name="upForm">
		<table border="1" style="margin:0 auto; align:center; width: 720px">
			<thead><tr><th colspan="2" style="height: 70px">글쓰기</th></tr></thead>
			<tbody>
				<c:if test="${article.num != 0 and article.ref != 0}">
					<tr>
						<th style="width: 30%">글제목</th>
						<td>
						    <input required="required" name="subject" placeholder="제목을 입력하세요" size="50" value="[답글]">
							<input type="hidden" name="num" value="${article.num}">
							<input type="hidden" name="ref" value="${article.ref}">
						</td>
					</tr>
				</c:if> 
				<c:if test="${article.num == 0}">
					<tr>
						<th align="center">글제목</th>
						<td align="center"><input type="text" required="required" name="subject" placeholder="제목을 입력하세요" style="height: 40px; width: 600px"></td>
					</tr>
				</c:if>
			<tr>
				<th align="center" width="120">글쓴이</th>
				<td align="center"><input type="text" required="required" name="writer" placeholder="이름을 입력하세요" style="height: 40px; width: 600px"></td>
			</tr>
			<tr>
				<th align="center">글내용</th>
				<td align="center"><textarea required="required" name="content" placeholder="내용을 입력하세요. 욕설금지!!!" style="height: 250px; width: 600px"></textarea></td>
			</tr>
			<tr>
				<th align="center">이메일</th>
				<td align="center"><input type="text" required="required" name="email" placeholder="이메일을 입력하세요" style="height: 40px; width: 600px"></td>
			</tr>
			<tr>
				<th align="center">비밀번호</th>
				<td align="center"><input type="password" required="required" name="passwd" placeholder="비밀번호를 입력하세요" style="height: 40px; width: 600px"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="button" value="글등록" onclick="checkForm()">
					<input type="button" value="글목록" onclick="location.href='jboard?bctr=list'">
				</td>
			</tr>
			</tbody>
		</table>
	</form>
</body>
</html>