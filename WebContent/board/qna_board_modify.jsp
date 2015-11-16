<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="net.entity.*" %>
<%
	String id=(String)session.getAttribute("id");
	BoardBean board = (BoardBean)request.getAttribute("boardlist");
%>

<html>
<head>
<script type="text/javascript">
function modifyboard(){
	modifyform.submit();
}
</script>

<!-- write CSS -->
<link rel='stylesheet' href='<%= request.getContextPath() %>/board/css/strap.css'>
<link rel="stylesheet" media="screen and (min-width: 501px)" href="<%=request.getContextPath()%>/board/css/style.css">
<link rel="stylesheet" media="screen and (max-width: 500px)" href="<%=request.getContextPath()%>/board/css/style_mob.css">

</head>

<body>
<!-- 게시판 수정 -->
<form action="BoardModifyAction.bo" method="post" name="modifyform">
<input type="hidden" name="BOARD_NUM" value="<%=board.getNum() %>">
<input type="hidden" name="BOARD_ID" value="<%=id %>">

	<div class="writeform">
		<div class="head">
			<input type="text" class="title" name="title" value="<%=board.getTitle()%>">
		</div>
		<textarea name="content" placeholder="<%=board.getContent() %>" style="float: left;"></textarea>
	</div>
	<div class="writeform">	
		<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)"><button class="btn btn-success" type="button" >뒤로</button></a>
	</div>
</form>
<!-- 게시판 수정 -->
</body>
</html>