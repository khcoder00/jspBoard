<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.dto.*, model.dao.*" %>
<%--
<jsp:useBean id="article" class="model.dto.BoardDTO" />
<jsp:setProperty property="*" name="article" />
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
//  데이터베이스에서 값을 받아오는 작업
	BoardDAO dao = BoardDAO.getDAO();
//	BoardDTO article1 = dao.getArticles(article.getNum()).get(0);
	dao.updateReadCount(num);
	BoardDTO article = dao.getArticles(num).get(0);
//  session 해당 값을 저장하고
    session.setAttribute("article", article);
//  redirect
    response.sendRedirect("jboard?bctr=content");
%>