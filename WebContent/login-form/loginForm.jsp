<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/login-form/css/loginform.css">
</head>
<body>
<div id='container'>
	<div id='loginBox'>
	<div id='loginHd'>
	<h4>Login</h4>
	</div>
		<form id='loginForm'>
		    <input id='loginUsr' type='text' name='username' placeholder='Username' tabindex='1' />
		    <input id='loginPw' type='password' name='password' placeholder='Password' tabindex='2' />
		    <input id='loginBtn' type='submit' value='Login' class='button' tabindex='4' />
		    <br />
		    <a id='signup' href='<%= request.getContextPath() %>/login-form/signForm.jsp'>Sign up!</a>
		    <br />
		    <a id='forgotPw' href='#'>Forgot your password?</a>
		</form>
	</div>
    </div>
</body>
</html>