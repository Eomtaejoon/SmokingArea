<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/login-form/css/signform.css">
</head>
<body>
<div id='container'>
	<div id='signBox'>
	<div id='signHd'>
	<h4>sign</h4>
	</div>
		<form id='signForm'>
		    <input id='signUsr' type='text' name='username' placeholder='Username' tabindex='1' />
		    <input id='signPw' type='password' name='password' placeholder='Password' tabindex='2' />
		    <input id='signBtn' type='submit' value='sign' class='button' tabindex='4' />
		    <br />
		    <a id='signup' href='#'>Sign up!</a>
		    <br />
		</form>
	</div>
    </div>
</body>
</html>