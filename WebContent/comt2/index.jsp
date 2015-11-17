<%@page import="net.entity.CommendBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	String id=null;

	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
	List comtlist = (List)request.getAttribute("comtlist");
	int b_num = ((Integer)request.getAttribute("b_num")).intValue();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/comt2/css/style.css">

</head>
<body>
	<div class="wrapper">
		<div class="commentBoxfloat">
			<form id="cmnt" action="ComdAddAction.bo" method="post">
				<input type="hidden" name="comt_id" value="<%=id%>">
				<input type="hidden" name="b_num" value="<%=b_num%>">
				
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
				<div style="text-align: right;">작성일 : <%=cl.getToday() %> </div>
				<p>
				글쓴이 : <%=cl.getId() %> [  <%=cl.getComments() %> ] 
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