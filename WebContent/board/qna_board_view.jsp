<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="net.entity.*" %>
<%
	BoardBean board = (BoardBean)request.getAttribute("boardlist");
%>

<html>
<head>
	<title>MVC �Խ���</title>
</head>

<body>
<!-- �Խ��� ���� -->
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">�Խ��� ��</td>
	</tr>
	
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�� ��&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:����; font-size:12">
		<%=board.getTitle()%>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="3" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		
		<td style="font-family:����; font-size:12">
			<table border=0 width=200 height=100 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:����; font-size:12">
					<%=board.getContent() %>
					</td>
				</tr>
			</table>
		</td>
<%-- 		
		<td>
			<table border=0 width=200 height=100>
				<tr>
					<td>
					<embed height="100%" width="100%" src="http://www.gagalive.kr/livechat1.swf?chatroom=~~~<%=board.getBOARD_CHAT()%>"></embed>
					</td>
				</tr>
			</table>
		</td>	 --%>	
	</tr>
<%-- 	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">÷������</div>
		</td>
		
		<td style="font-family:����; font-size:12">
		<%if(!(board.getBOARD_FILE()==null)){ %>
		<a href="c:\\upload\\<%=board.getBOARD_FILE()%>">
			<%=board.getBOARD_FILE() %>
		</a>
		<%} %>
		</td>
	</tr> --%>
	<tr bgcolor="cccccc">
		<td colspan="3" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="./BoardReplyAction.bo?num=<%=board.getNum() %>">
			[�亯]
			</a>&nbsp;&nbsp;
			<a href="./BoardModify.bo?num=<%=board.getNum() %>">
			[����]
			</a>&nbsp;&nbsp;
			<a href="./BoardDeleteAction.bo?num=<%=board.getNum() %>"
			>
			[����]
			</a>&nbsp;&nbsp;
			<a href="./BoardList.bo">[���]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
<!-- �Խ��� ���� -->
</body>
</html>