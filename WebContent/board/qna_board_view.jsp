<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="net.entity.*"%>
<%
	BoardBean board = (BoardBean) request.getAttribute("boardlist");
%>

<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/board/css/view_style.css">
</head>

<body>
	<!-- �Խ��� ���� -->
		<div class="container">
			<div class="box">
				<div class="header">
					<a href="#">Heiko Klingele</a> kommentiert
					<div class="date">21. Januar 2015</div>
				</div>
				<div class="body">Lorem ipsum dolor sit amet, consetetur
					sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
					et dolore magna aliquyam erat, sed diam voluptua.</div>
				<div class="links">
					<a href="#">Link</a>
				</div>
				<div class="footer">
				<font size=2>
					<a href="./BoardReplyAction.bo?num=<%=board.getNum()%>">[�亯] </a>&nbsp;&nbsp;
					<a href="./BoardModify.bo?num=<%=board.getNum()%>">[����] </a>&nbsp;&nbsp;
					<a href="./BoardDeleteAction.bo?num=<%=board.getNum()%>">[����] </a>
				</font>
				</div>
			</div>
		</div>
	<!-- �Խ��� ���� -->
</body>
</html>