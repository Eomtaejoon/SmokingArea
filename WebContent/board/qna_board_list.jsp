<%@page import="net.entity.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
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
<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/board/css/view_action.css">
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
	<article>
	    <input type="checkbox" id="read_more<%=i+1 %>" role="button">
	    <label for="read_more<%=i+1 %>" onclick=""><span>Read More</span><span>Hide This Shit!</span></label>     
	      
	    <figure>
	        <img src="http://cssdeck.com/uploads/media/items/8/8rDcElm.jpg" alt="I'm an owl" />
	    </figure>
	
	    <section>
	    <p>제목 : <%=bl.getTitle() %></p>
	    </section>    
		<section>
	    <p><%=bl.getContent() %></p>
		</section>
	</article>
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