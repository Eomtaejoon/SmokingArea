<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='http://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/normalize.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/style.css">
</head>
<body>

	<div id="back">
		<div class="backRight"></div>
		<div class="backLeft"></div>
	</div>
	
	<div id="slideBox">
		<div class="topLayer">
			
			<!-- 회원 가입  -->
			<div class="left">
				<div class="content">
					<h2>Sign Up</h2>
					<form name="joinform" action="<%=request.getContextPath()%>/MemberJoinAction.me" method="post" >
						<div class="form-group">
							<input type="text" placeholder="id" name="MEMBER_ID" maxlength="10"/>
						</div>
						<div class="form-group">
							<input type="password" placeholder="password" name="MEMBER_PW" maxlength="14"/>
						</div>
						<div class="form-group">
							<input type="text" placeholder="phone" name="MEMBER_PHONE" maxlength="11" />
						</div>
						<div class="form-group">
							<input type="text" placeholder="e-mail" name="MEMBER_EMAIL" maxlength="20" />
						</div> 
						<button id="goLeft" type="button" class="off">Login</button>
						<button id="signUp" type="submit">Sign up</button>
					</form>
				</div>
			</div>
			
			<!-- 로그인  -->
			<div class="right">
				<div class="content">
					<h2>Login</h2>
					<form method="post" action="<%=request.getContextPath()%>/MemberLoginAction.me">
						<div class="form-group">
							<label for="userid" class="form-label" > userid : </label> 
							<input type="text" name="MEMBER_ID" maxlength="10"/>
						</div>
						<div class="form-group">
							<label for="password" class="form-label" > password : </label> 
							<input type="password" name="MEMBER_PW" maxlength="14"/>
						</div>
						
						<button id="goRight" type="button" class="off"> Sign Up </button>
						<button id="login" type="submit">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--Inspiration from: http://ertekinn.com/loginsignup/-->
	<script	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/login/index.js"></script>
</body>
</html>
