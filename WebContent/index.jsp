<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	/* ����  ���� */
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
				<img src="http://placehold.it/400x100&text=Logo" />
			</div>
			<%=id %> �� ����
		</div>

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
				<img src="img/best1.jpg" />
				<h4>Best content section.</h4>
				<p>db ���ƿ� ���� 1����</p>
			</div>
			<div class="large-4 columns">
				<img src="img/best1.jpg" />
				<h4>Best content section.</h4>
				<p>db ���ƿ� ���� 2����</p>
			</div>
			<div class="large-4 columns">
				<img src="img/best1.jpg" />
				<h4>Best content section.</h4>
				<p>db ���ƿ� ���� 3����</p>
			</div>
		</div>

		<div class="row">
			<div class="large-12 columns">
				<div class="panel">
					<h4>Get in touch!</h4>
					<div class="row">
						<div class="large-9 columns">
							<p>�Խ������� �̵��մϴ�.</p>
						</div>
						<div class="large-3 columns">
							<a href="#" class="radius button right">�Խ������� ����</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div id="map">
				<jsp:include page="map/googlemap.jsp" flush="false"></jsp:include>
			</div>
		</div>
		<hr />

		<div class="row">
			<div id="event">
				<img src="img/event.jpg">
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
</body>
</html>