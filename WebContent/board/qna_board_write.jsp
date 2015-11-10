<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
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
<script>
function aaa(){
            $("#write_box").empty(); 
}
</script>

<script>
function bbb(){
            $("#write_box").empty(); 
}
</script>

<body>
	<!-- 게시판 등록 -->
	<form method="post" action="BoardAddAction.bo"
		enctype="multipart/form-data" name="boardform" >
		<input type="hidden" name="BOARD_ID" value="<%=id%>">
		<div class="writeform">
		<div class="head">
			<input type="text" class="title" name="title" placeholder=" 제목을 입력해주세요">
			<button class="btn btn-default"><i class="fa fa-picture-o" style="font-size: 18px" title='이미지 첨부'></i></button>
			<button class="btn btn-default"><i class="fa fa-map" style="font-size: 18px" title='위치저장'></i></button>
			<!-- 이미지 점부 기능 -->
		</div>
		<textarea name="content" placeholder=" 악성&사행성 게시글 및 덧글은 예고없이 삭제될 수 있습니다."></textarea>
		<button class="btn btn-success" type="submit" onclick="aaa()">글저장</button>
		<button class="btn btn-success" type="button" onclick="bbb()">취소</button>
	</div>
	</form>
	<!-- 게시판 등록 -->
</body>
</html>