<%@page import="net.entity.CommendBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	List comtlist = (List)request.getAttribute("comtlist");
	System.out.print("comtlist"+comtlist.size());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Comment Box Control</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/comt2/css/style.css">

</head>
<body>
	<div class="wrapper">
		<div class="commentBoxfloat">
			<form id="cmnt" action="ComdAddAction.bo" method="post">
				<fieldset>
					<div class="form_grp">
						<label>comment</label>
						<textarea id="userCmnt" name="comment"
							placeholder="욕설 악플 금지"></textarea>
					</div>
					<div class="form_grp">
						<input type="submit" id="submit" value="Submit" />
					</div>
				</fieldset>
			</form>
		</div>
		<%
			for(int i=0; i<comtlist.size(); i++){
				CommendBean cl=(CommendBean)comtlist.get(i);
		%> 
		<div id="cmntContr">
			<div class='viewCmnt'>
				<p>
				<%=cl.getId() %> :  <%=cl.getComments() %>
				</p>
				<span class='edit'></span><span class='delete'></span>
			</div>
		</div>
		<%} %>
	</div>
	
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script type="text/javascript">

$(function() {
	var inDexValue;

	// Delete 
	$('#cmntContr').on('click', '.delete', function() {
		confirm("Delete Coformation");
		$(this).parent().remove();
	});

	// Edit
	$('#cmntContr').on('click', '.edit', function() {

		var toEdit = $(this).prev('p').html();
		//alert(toEdit);
		$('#userCmnt').val(toEdit);
		$('button').addClass('editNow');
		inDexValue = $(this).parent('div.viewCmnt').index();
	});
});

</script>
</body>
</html>