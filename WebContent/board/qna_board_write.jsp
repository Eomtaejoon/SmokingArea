<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String id = (String) session.getAttribute("id");
%>

<html>
<head>
<script language="javascript">
	function addboard() {
		boardform.submit();
	}
</script>
<link rel='stylesheet' href='<%= request.getContextPath() %>/board/css/strap.css'>
<link rel="stylesheet" href="<%= request.getContextPath() %>/icon/font-awesome.css">
<link rel="stylesheet" media="screen and (min-width: 501px)" href="<%=request.getContextPath()%>/board/css/style.css">
<link rel="stylesheet" media="screen and (max-width: 500px)" href="<%=request.getContextPath()%>/board/css/style_mob.css">
</head>
<body>
	<!-- �Խ��� ��� -->
	<form action="BoardAddAction.bo" method="post"
		enctype="multipart/form-data" name="boardform">
		<input type="hidden" name="BOARD_ID" value="<%=id%>">
		<div class="writeform">
		<div class="head">
			<input type="text" class="title" name="title" placeholder=" ������ �Է����ּ���">
			<button class="btn btn-default"><i class="fa fa-picture-o" style="font-size: 18px" title='�̹��� ÷��'></i></button>
			<button class="btn btn-default"><i class="fa fa-map" style="font-size: 18px" title='��ġ����'></i></button>
			<!-- �̹��� ���� ��� -->
		</div>
		<textarea name="content" placeholder=" �Ǽ�&���༺ �Խñ� �� ������ ������� ������ �� �ֽ��ϴ�."></textarea>
		<button class="btn btn-success" type="submit">������</button>
	</div>
	</form>
	<!-- �Խ��� ��� -->
</body>
</html>