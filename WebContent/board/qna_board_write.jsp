<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String id = (String) session.getAttribute("id");
%>

<html>
<head>
<title>MVC 게시판</title>
<script language="javascript">
	function addboard() {
		boardform.submit();
	}
</script>
</head>
<body>
	<!-- 게시판 등록 -->
	<form action="BoardAddAction.bo" method="post"
		enctype="multipart/form-data" name="boardform">
		<input type="hidden" name="BOARD_ID" value="<%=id%>">
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">게시판</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">글쓴이</div>
				</td>
				<td><%=id%></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제 목</div>
				</td>
				<td><input name="title" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="content" cols="67" rows="15"></textarea>
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">이미지 첨부</div>
				</td>
				<td><input name="BOARD_FILE" type="file" /></td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5"><a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a></td>
			</tr>
		</table>
	</form>
	<!-- 게시판 등록 -->
</body>
</html>