<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 리스트</title>
	<link rel="stylesheet" type="text/css" href="css/boardStyle.css"></link>
</head>
<body>
	<h4 style="text-align: center;">게시목록</h4>
	<table style="margin:0 auto; width: 900px;">
	<tr>
		<td style="text-align: right">
			<input type="button" value="글쓰기" onclick="location.href='jboard?bctr=write'">
		</td>
	</tr>
	</table>
	<c:choose>
	<c:when test = "${ fn:length(articles) == 0 }">
		<table style="margin:0 auto; width:900px;" border="1">
			<tr>
				<th style="text-align: center" colspan="5">게시글이 없습니다.</th>
			</tr>
		</table>
	</c:when>
	<c:when test = "${ fn:length(articles) > 0 }" >
	<table style = "margin:0 auto; width: 900;" border="1">
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>접속아이피</th>
		</tr>
		<c:forEach var="article" items="${articles}">
		<tr>
			<td align="center"><a href="jboard?bctr=contentAct&num=${article.num}">${article.subject}</a></td>
			<td align="center"><a href="mailto:${article.email}">${article.writer}</a></td>
			<td align="center">${article.reg_date}</td>
			<td align="center">${article.readcount}</td>
			<td align="center">${article.ip}</td>
		</tr>
		</c:forEach>
	</table>
	</c:when>
	</c:choose>
</body>
</html>