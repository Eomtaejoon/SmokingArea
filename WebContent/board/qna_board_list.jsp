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
    
    <input type="checkbox" id="read_more" role="button">
    <label for="read_more" onclick=""><span>Read More</span><span>Hide This Shit!</span></label>     
      
    <figure>
        <img src="http://cssdeck.com/uploads/media/items/8/8rDcElm.jpg" alt="I'm an owl" />
    </figure>

    <section>
    <p>Owls are a group of birds that belong to the order Strigiformes, constituting 200 extant bird of prey species. Most are solitary and nocturnal, with some exceptions (e.g. the Northern Hawk Owl). </p>
    </section>    
	<section>
    <p>Owls hunt mostly small mammals, insects, and other birds, although a few species specialize in hunting fish. They are found in all regions of the Earth except Antarctica, most of Greenland and some remote islands. Though owls are typically solitary, the literary collective noun for a group of owls is a parliament. Owls are characterized by their small beaks and wide faces, and are divided into two families: the typical owls, Strigidae; and the barn-owls, Tytonidae.</p>
    <p>Owls have large forward-facing eyes and ear-holes; a hawk-like beak; a flat face; and usually a conspicuous circle of feathers, a facial disc, around each eye. The feathers making up this disc can be adjusted in order to sharply focus sounds that come from varying distances onto the owls' asymmetrically placed ear cavities. Most birds of prey sport eyes on the sides of their heads, but the stereoscopic nature of the owl's forward-facing eyes permits the greater sense of depth perception necessary for low-light hunting. Although owls have binocular vision, their large eyes are fixed in their sockets — as are those of other birds — so they must turn their entire head to change views. Owls can rotate their heads and necks as much as 270 degrees in either direction. As owls are farsighted, they are unable to see clearly anything within a few centimeters of their eyes. Caught prey can be felt by owls with the use of filoplumes — like feathers on the beak and feet that act as "feelers". Their far vision, particularly in low light, is exceptionally good.</p>
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