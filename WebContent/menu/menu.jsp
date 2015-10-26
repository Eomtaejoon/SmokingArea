<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%= request.getContextPath() %>/menu/css/normalize.css">
<link rel="stylesheet" media="screen and (min-width: 501px)" href="<%= request.getContextPath() %>/menu/css/style.css">
<link rel="stylesheet" media="screen and (max-width: 500px)" href="<%= request.getContextPath() %>/menu/css/style_mob.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/icon/font-awesome.css"">

</head>
<body>
	<div class="wrap">
		<div id="sidebar">
			<div class="nav-title">Smoking Area</div>
			<nav id="menu" class="left show">
				<ul>
					<a href="#home"><li>홈 <i class="fa fa-home fa-fw"></i></li></a>
					<a href="#best"><li>베스트존 <i class="fa fa-thumbs-up fa-fw"></i></li></a>
					<a href="#map"><li>맵 <i class="fa fa-map-marker fa-fw"></i></li></a>
					<a href="#event"><li>이벤트 <i class="fa fa-gift fa-fw"></i></li></a>
					<a href="<%= request.getContextPath() %>/BoardList.bo"><li>게시판 <i class="fa fa-pencil-square-o fa-fw"></i></li></a>
					<a href="#etc"><li class='sub-menu' style="padding-left: 0.9em">기타 <i class="fa fa-question-circle fa-fw"></i></a>
					<ul>
					<li><a>금연도우미</a></li>
					<li><a>흡연지침서</a></li>
					</ul></li>
				</ul>
			</nav>
		</div>

	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="<%= request.getContextPath() %>/menu/js/index.js"></script>
</body>
</html>
