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
<!-- 게시판 리스트 -->
<table width=570 border="0" cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td align="left">
			<font size=2>글 개수 : ${listcount }</font>
		</td>
	</tr>
	<tr align="left">
		<td colspan="5">
			<%if(id!=null && id.equals("admin")){%>
				<a href="MemberListAction.me">[회원관리]</a>
			<%}%>
	   		<a href="BoardWrite.bo">[글쓰기]</a>
		</td>
	</tr>
</table>
<table width=570 border="0" cellpadding="0" cellspacing="0">	
	<%
		for(int i=0;i<boardList.size();i++){
			BoardBean bl=(BoardBean)boardList.get(i);
	%>
	<!-- 게시판 수정 -->
	<div class="container">
		<div class="box">
			<div class="header">
				제목 : <%=bl.getTitle()%>&nbsp;&nbsp;
				글쓴이 : <%=bl.getB_id()%> 
				<div class="date"><%=bl.getToday()%></div>
			</div>
			<div class="body"><%=bl.getContent()%></div>
			<div class="links">
				<a href="#">Link</a>
			</div>
			<div class="footer">
			<font size=2>
				<a href="./BoardReplyAction.bo?num=<%=bl.getNum()%>">[답변] </a>&nbsp;&nbsp;
				<a href="./BoardModify.bo?num=<%=bl.getNum()%>">[수정] </a>&nbsp;&nbsp;
				<a href="./BoardDeleteAction.bo?num=<%=bl.getNum()%>">[삭제] </a>
			</font>
			</div>
		</div>
	</div>
	<!-- 게시판 수정 -->
	
	<%} %>
	<tr align="left" height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="BoardList.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
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
			[다음]
			<%}else{ %>
			<a href="BoardList.bo?page=<%=nowpage+1 %>">[다음]</a>
			<%} %>
		</td>
	</tr>
</table>
</body>
</html>