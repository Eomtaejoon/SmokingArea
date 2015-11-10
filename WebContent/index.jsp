<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%
	/* 세션  연결 */
	String id = (String)session.getAttribute("id");

	String ch = (String)session.getAttribute("ch");
	
	boolean login = id == null ? false : true;
	System.out.print(ch);
%>	

<html>

<head>

<meta charset="utf-8" />
<title>Smoking Area</title>
<link rel="stylesheet" media="screen and (min-width: 501px)" href="<%=request.getContextPath()%>/css/style_main.css">
<link rel="stylesheet" media="screen and (max-width: 500px)" href="<%=request.getContextPath()%>/css/style_mob.css">

<link rel="stylesheet" media="screen and (min-width: 501px)" href="<%= request.getContextPath() %>/menu/css/style.css">
<link rel="stylesheet" media="screen and (max-width: 500px)" href="<%= request.getContextPath() %>/menu/css/style_mob.css">

<!-- icon CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/icon/font-awesome.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<script>
function go(){
	if(<%=ch%>=="1"){
        $.ajax({url: "/last_project/BoardList.bo", success: function(result){
            $("#contents").html(result);
        }});
	} 
}
$(document).ready(function(){
    $("#board").click(function(){
        $.ajax({url: "/last_project/BoardList.bo", success: function(result){
            $("#contents").html(result);
        }});
    });
});

</script>

</head>

<body style="text-align: left;"; onload="go()">



	<div class="menu">
		<div id="sidebar">
			<a href="<%= request.getContextPath() %>/index.me"><div class="nav-title"><img src="img/logo_sub.png" /></div></a>
			<nav id="menu" class="left show">
				<ul>
					<a href="#home"><li>HOME <i class="fa fa-home fa-fw"></i></li></a>
					<a href="#best"><li>BEST <i class="fa fa-thumbs-up fa-fw"></i></li></a>
					<a href="#map"><li>MAP <i class="fa fa-map-marker fa-fw"></i></li></a>
					<a href="#event"><li>EVENT <i class="fa fa-gift fa-fw"></i></li></a>
					<a id="board"><li>BOARD <i class="fa fa-pencil-square-o fa-fw"></i></li></a>
					<a href="#etc"><li class='sub-menu'>ETC <i class="fa fa-question-circle fa-fw"></i></a>
					<ul>
					<li><a href="http://www.nosmokeguide.or.kr/mbs/nosmokeguide/">금연도우미</a></li>
					<li><a href="http://www.nosmokeguide.or.kr/mbs/nosmokeguide/subview.jsp?id=nosmokeguide_020301000000">흡연지침서</a></li>
					<li><a href="http://www.nosmokeguide.or.kr/user/webzine/mail.jsp">금연매거진</a></li>
					</ul></li>
				</ul>
			</nav>
		</div>
	</div>

	<div class="wrap">

		<div class="row" id="home">
			<div class="large-3 columns" id="logo">
				<a href="<%= request.getContextPath() %>/index.me"><img src="img/logo_main.png" /></a>
			</div>
			<%=id %> 님 접속
		</div>

	<div id="contents">
		<div class="row">
			<div class="large-12 columns">
				<div class="slider">
					<jsp:include page="slider/slider.jsp" flush="false"></jsp:include>
				</div>
			</div>
		</div>
		<hr />

		<div class="row">
			<div class="large-4 columns" id="best">
				<img src="img/1.jpg" />
				<h4>Best content section.</h4>
				<p>db 좋아요 누계 1순위</p>
			</div>
			<div class="large-4 columns">
				<img src="img/2.jpg" />
				<h4>Best content section.</h4>
				<p>db 좋아요 누계 2순위</p>
			</div>
			<div class="large-4 columns">
				<img src="img/3.jpg" />
				<h4>Best content section.</h4>
				<p>db 좋아요 누계 3순위</p>
			</div>
		</div>
	</div>

		<div class="row">
			<div id="map">
				<jsp:include page="map/daummap.jsp" flush="false"></jsp:include>
			</div>
		</div>
		<hr />

		<div class="row">
			<div id="event">
				<a href="http://www.nosmokeguide.or.kr/mbs/nosmokeguide/jsp/board/view.jsp?spage=1&boardId=468&boardSeq=6122383&id=nosmokeguide_060100000000&regColumn=&categoryId=0&categoryDepth=&gisuColumn="><img src="img/campaign1.jpg"></a>
				<a href="http://www.nosmokeguide.or.kr/mbs/nosmokeguide/subview.jsp?id=nosmokeguide_040501050000"><img src="img/campaign2.jpg"></a>
				<a><img src="img/campaign3.jpg"></a>
				<a href="http://hi.nhis.or.kr/ggph010m01_l01.do?mn_idx=MN00000218"><img src="img/campaign4.jpg"></a>
			</div>
		</div>
		<hr />

		<footer class="row">
			<div class="large-12 columns">
				<hr />
				<div class="row">
					<div class="large-6 columns">
						<p>&copy; Copyright no one at all. Go to town.</p>
					</div>
					<div class="large-6 columns">
						<ul class="inline-list right">
							<li><a href="#">Link 1</a></li>
							<li><a href="#">Link 2</a></li>
							<li><a href="#">Link 3</a></li>
							<li><a href="#">Link 4</a></li>
						</ul>
					</div>
				</div>
			</div>

		</footer>
	</div>
	

<!-- java script(menu) -->
	<script	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="<%= request.getContextPath() %>/menu/js/index.js"></script>
</body>
</html>