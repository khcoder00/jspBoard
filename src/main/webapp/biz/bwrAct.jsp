<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.dto.*, model.dao.*, java.util.*" %>
<jsp:useBean id="article" class="model.dto.BoardDTO" />
<jsp:setProperty property="*" name="article" />

<%
	// 데이터베이스 통해서 저장하는 메소드(DAO에 있는 것 호출)
	BoardDAO dao = BoardDAO.getDAO();
	String url = "jboard?bctr=listAct";
	String ip = request.getRemoteAddr();
	article.setIp(ip);
	boolean r = dao.writeArticle(article);
	if( !r ) {
		%>
		<script type="text/javascript">
			alert("게시글 저장 성공");
		</script>
		<%
		response.sendRedirect(url);
	} else {
		%>
		<script type="text/javascript">
			alert("게시글 저장 실패");
		</script>
		<%
	}
%>