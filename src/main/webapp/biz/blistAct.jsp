<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.dao.*, model.dto.*, java.util.* " %>
<!-- num을 받아서 게시글 하나의 내용을 확인할 때 List를 활용 -->
<jsp:useBean id="article" class="model.dto.BoardDTO" />
<jsp:setProperty property="*" name="article" />

<%
	// Database Acess Object를 통해서 원하는 결과를 얻어오기
	BoardDAO dao = BoardDAO.getDAO();
	List<BoardDTO> articles = dao.getArticles(article.getNum());
	// 기타 업무처리를 위한 로직을 작성하기도 함
	// 얻어온 결과를 저장하고 컨트롤러로 보내기
	session.setAttribute("articles", articles);
	response.sendRedirect("jboard?bctr=list");
%>