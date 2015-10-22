<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
  <head>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/login-form/css/normalize.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/login-form/css/style.css">
  </head>
<body>
<button id="btnpopup">Login</button>
<div id="mypopup" class="popup-ui">
  <div class="popup-ui-wrapper">
    <div class="popup-ui-content">

      <!-- Your content -->
      <div class="my-content">
        <jsp:include page="loginForm.jsp" flush="false"></jsp:include>
      </div>
      <!-- // Your content -->
      
    </div>
  </div>
</div>
<script src="<%= request.getContextPath() %>/login-form/js/index.js"></script>
</body>
</html>