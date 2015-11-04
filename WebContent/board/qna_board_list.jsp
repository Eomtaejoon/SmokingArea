<%@page import="net.entity.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
	List boardList=(List)request.getAttribute("boardlist");
	
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>

<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/board/css/view_style.css">
</head>

<body>
<!-- �Խ��� ����Ʈ -->
<table width=570 border="0" cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td align="left">
			<font size=2>�� ���� : ${listcount }</font>
		</td>
	</tr>
	<tr align="left">
		<td colspan="5">
			<%if(id!=null && id.equals("admin")){%>
				<a href="MemberListAction.me">[ȸ������]</a>
			<%}%>
	   		<a href="BoardWrite.bo">[�۾���]</a>
		</td>
	</tr>
</table>
<table width=570 border="0" cellpadding="0" cellspacing="0">	
	<%
		for(int i=0;i<boardList.size();i++){
			BoardBean bl=(BoardBean)boardList.get(i);
	%>
	<!-- �Խ��� ���� -->
	<div class="container">
		<div class="box">
			<div class="header">
				���� : <%=bl.getTitle()%>&nbsp;&nbsp;
				�۾��� : <%=bl.getB_id()%> 
				<div class="date"><%=bl.getToday()%></div>
			</div>
			<div class="body"><%=bl.getContent()%></div>
			<div class="links">
				<a href="#">Link</a>
			</div>
			<div class="footer">
			<font size=2>
				<a href="./BoardReplyAction.bo?num=<%=bl.getNum()%>">[�亯] </a>&nbsp;&nbsp;
				<a href="./BoardModify.bo?num=<%=bl.getNum()%>">[����] </a>&nbsp;&nbsp;
				<a href="./BoardDeleteAction.bo?num=<%=bl.getNum()%>">[����] </a>
			</font>
			</div>
		</div>
	</div>
	<!-- �Խ��� ���� -->
	
	<%} %>
	<tr align="left" height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<%if(nowpage<=1){ %>
			[����]&nbsp;
			<%}else{ %>
			<a href="BoardList.bo?page=<%=nowpage-1 %>">[����]</a>&nbsp;
			<%} %>
			
			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="BoardList.bo?page=<%=a %>">[<%=a %>]</a>
				&nbsp;
				<%} %>
			<%} %>
			
			<%if(nowpage>=maxpage){ %>
			[����]
			<%}else{ %>
			<a href="BoardList.bo?page=<%=nowpage+1 %>">[����]</a>
			<%} %>
		</td>
	</tr>
</table>
</body>
</html>