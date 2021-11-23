<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.dto.*, model.dao.*, java.util.*" %>
<jsp:useBean id="article" class="model.dto.BoardDTO" />
<jsp:setProperty property="*" name="article" />

<%
	// 데이터베이스 수정저장하는 메소드 호출 -- dao에 수정하는 쿼리
	BoardDAO dao = BoardDAO.getDAO();
	String url = "jboard?bctr=listAct";
	String ip = request.getRemoteAddr();
	article.setIp(ip);
	boolean r = dao.updateArticle(article);
	if( !r ) {
		%>
		<script type="text/javascript">
		alert("수정 성공");
		</script>
		<%
		// list로 리다이렉트 해주기이렉트 해주기
		response.sendRedirect(url);
	} else {
		// 수정완료 실패
		%>
		<script type="text/javascript">
			alert("수정 실패");
		</script>
		<%
	}
%>