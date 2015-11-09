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
<link rel="stylesheet" href="<%= request.getContextPath() %>/board/css/view_action.css">

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
<div id="write_box" style="float: right;"></div>

<!-- 게시판 리스트 -->
<div style="padding: 15px;">
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
	        <img src="http://cssdeck.com/uploads/media/items/8/8rDcElm.jpg" alt="I'm an owl" />
	    </figure>
	
	    <section>
	    <p>제목 : <%=bl.getTitle() %></p>
	    </section>    
		<section>
	    <p><%=bl.getContent() %></p>
		</section>
	</article>
	<table id="commentTable" class="table table-condensed"></table>
                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                            <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">확인</button>
                                        </div>
                                    </p>
                                        <textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
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

<div id="write_box"></div>
</div>
</body>
</html>