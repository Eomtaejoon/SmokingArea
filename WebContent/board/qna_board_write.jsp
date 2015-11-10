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

</head>
<script>
function save(){
            $("#write_box").empty(); 
}
</script>

<script>
function cancle(){
            $("#write_box").empty(); 
}
</script>



<body>
	<!-- 게시판 등록 -->
	<form name="boardform" action="BoardAddAction.bo" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="BOARD_ID" value="<%=id%>">
		<div class="writeform">
			<div class="head">
				<input type="text" class="title" name="title"
					placeholder=" 제목을 입력해주세요">
			</div>
			<div class="head">
				<input type="file" name="uploadFile" id="uploadFile" class="btn btn-default">
				<button class="btn btn-default" style="float: left;">
					<i class="fa fa-map" style="font-size: 18px" title='위치저장'></i>
				</button>
				<!-- 이미지 점부 기능 -->
			</div>
			<textarea name="content"
				placeholder=" 악성&사행성 게시글 및 덧글은 예고없이 삭제될 수 있습니다." style="float: left;">
			</textarea>
		</div>
		<div class="writeform">	
			<button class="btn btn-success" type="submit" onclick="aaa()">글저장</button>
			<button class="btn btn-success" type="button" onclick="bbb()">취소</button>
		</div>
	</form>
	<!-- 게시판 등록 -->
</body>
</html>