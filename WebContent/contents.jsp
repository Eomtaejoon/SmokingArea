<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%
	/* 세션  연결 */
	String id = (String)session.getAttribute("id");
	boolean login = id == null ? false : true;
%>	
<html>
<head>
<meta charset="utf-8" />
<title>Smoking Area</title>
<link rel="stylesheet" media="screen and (min-width: 501px)" href="<%=request.getContextPath()%>/css/foundation.css">
<link rel="stylesheet" media="screen and (max-width: 500px)" href="<%=request.getContextPath()%>/css/foundation_mob.css">
</head>

<body>

	<div class="menu">
		<jsp:include page="menu/menu.jsp" flush="false"></jsp:include>
	</div>

	<div class="wrap">

		<div class="row" id="home">
			<div class="large-3 columns">
				<h1>
					<img src="http://placehold.it/400x100&text=Logo" />
					<%=id %> 님 접속
				</h1>
			</div>
		</div>
		
		<iframe src="/last_project/BoardList.bo"></iframe>
		
		<div class="row">
			<div id="best">
				<img src="img/best1.jpg" />
				<h4>Best content section.</h4>
				<p>db 좋아요 누계 1순위</p>
			</div>
		</div>

		<div class="row">
			<div id="map">
				<jsp:include page="map/daummap.jsp" flush="false"></jsp:include>
			</div>
		</div>

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
</body>
</html>