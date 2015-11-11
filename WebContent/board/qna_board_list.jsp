<%@page import="net.entity.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>
$(document).ready(function(){
    $("#write").click(function(){
        $.ajax({url: "/last_project/BoardWrite.bo", success: function(result){
            $("#write_box").html(result);
        }});
    });
});

</script>

</head>

<body>

<!-- 게시판 리스트 -->
<div class="row">
<div class="large-6 columns">
<div id="write_box"></div>
</div>
<div class="large-6 columns">
<table class="contents_head">
	<tr>
		<td>
			<font size=2>글 개수 : ${listcount }</font>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<%if(id!=null && id.equals("admin")){%>
				<a href="MemberListAction.me">[회원관리]</a>
			<%}%>
	   		<a id="write" onclick="change()">[글쓰기]</a>
		</td>
	</tr>
</table>
<table class="contents_body">	
	<%
		for(int i=0;i<boardList.size();i++){
			BoardBean bl=(BoardBean)boardList.get(i);
	%>
	<!-- 게시판 -->
	<div class="contents">
<%-- 	<%if(id!=null && id.equals("admin")){%> --%>
	<div><a href="./BoardModify.bo?num=<%=bl.getNum() %>">수정</a> 
		 <a href="./BoardDeleteAction.bo?num=<%=bl.getNum()%>">삭제</a> </div>
	<%-- <%}%> --%>
	<article>
	    <input type="checkbox" id="read_more<%=i+1 %>" role="button">
	    <label for="read_more<%=i+1 %>" onclick=""><span>Read More</span><span>Hide This Shit!</span></label>     
	      
	    <figure>
	        <img src="<%=request.getContextPath()%>/boardupload/<%=bl.getImg()%>" alt="I'm an owl" />
	        <p><%=bl.getImg()%></p>
	    </figure>
	
	    <section>
	    <p>제목 : <%=bl.getTitle() %></p>
	    </section>    
		<section>
	    <p><%=bl.getContent() %></p>
		</section>
	</article>
	</div>
	<!-- 게시판 -->
	
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
</div>
<div class="large-6 columns"></div>
</div>
</body>
</html>