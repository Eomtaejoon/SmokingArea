<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/slider/css/slider.css" />
</head>
<body style="background-color:#eeeeee; margin: auto; text-align: center;">
<!-- Start cssSlider.com -->
	<div class='csslider1 autoplay '>
		<input name="cs_anchor1" id='cs_slide1_0' type="radio" class='cs_anchor slide' >
		<input name="cs_anchor1" id='cs_slide1_1' type="radio" class='cs_anchor slide' >
		<input name="cs_anchor1" id='cs_slide1_2' type="radio" class='cs_anchor slide' >
		<input name="cs_anchor1" id='cs_play1' type="radio" class='cs_anchor' checked>
		<input name="cs_anchor1" id='cs_pause1' type="radio" class='cs_anchor' >
		<ul>
			<div style="width: 100%; visibility: hidden; font-size: 0px; line-height: 0;">
				<img src="<%= request.getContextPath() %>/slider/img/1.jpg" style="width: 100%;">
			</div>
			<li class='num0 img'>
				<img src='<%= request.getContextPath() %>/slider/img/1.jpg' />
			</li>
			<li class='num1 img'>
				<img src='<%= request.getContextPath() %>/slider/img/2.jpg' alt='2' title='2' /> 
			</li>
			<li class='num2 img'>
				<img src='<%= request.getContextPath() %>/slider/img/3.jpg' alt='3' title='3' /> 
			</li>
		
		</ul>
		<div class='cs_description'>
			<label class='num0'>
				<span class="cs_title"><span class="cs_wrapper">베스트1</span></span>
			</label>
			<label class='num1'>
				<span class="cs_title"><span class="cs_wrapper">베스트2</span></span>
			</label>
			<label class='num2'>
				<span class="cs_title"><span class="cs_wrapper">베스트3</span></span>
			</label>
		</div>
		
		<div class='cs_arrowprev'>
			<label class='num0' for='cs_slide1_0'></label>
			<label class='num1' for='cs_slide1_1'></label>
			<label class='num2' for='cs_slide1_2'></label>
		</div>
		<div class='cs_arrownext'>
			<label class='num0' for='cs_slide1_0'></label>
			<label class='num1' for='cs_slide1_1'></label>
			<label class='num2' for='cs_slide1_2'></label>
		</div>
	</div>
		<!-- End cssSlider.com -->
  </body>
</html>