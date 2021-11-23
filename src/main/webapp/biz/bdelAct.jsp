<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.dto.*, model.dao.*, java.util.*" %>
<jsp:useBean id="article" class="model.dto.BoardDTO" />
<jsp:setProperty property="*" name="article" />

<%
	// 데이터베이스 저장하는 메소드 호출 -- dao에 수정하는 쿼리
	BoardDAO dao = BoardDAO.getDAO();
	String url = "jboard?bctr=listAct";
	boolean r = dao.delArticle(article);
	if( !r ) {
		%>
		<script type="text/javascript">
			alert("삭제 성공");
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("삭제 실패");
		</script>
		<%
	}
%>
<script type="text/javascript">
	document.location.href='<%= url %>';
</script>