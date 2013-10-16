<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새글 작성하기</title>
</head>
<body>
	<form action="/board" method="post" enctype="multipart/form-data">
		<label for="title">
			Title
		</label>
		<input type="text" name="title" id="title"size="30" /> <br />
		<textarea name="contents" rows="4" cols="30"></textarea> <br />
		<input type="file" name="file"  id="file">		<br />
		 <input type="submit" value="보내기" />
	</form>
</body>
</html>