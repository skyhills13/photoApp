<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New Post</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newPost.css" />
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/button.css" />
</head>
<body>
<div id = "wrap">
<header>
<h1>New Post</h1>
</header>
<div id = "formArea">
<form action = "/board/selected" method ="POST" enctype="multipart/form-data">
  <label for="attachment">photo :</label>
  <input type="file" name="attachment" id="attachment" accept="image/gif, image/jpeg, image/png" size = "40"> <br>
  <div id = "titleArea">
  <label for = "title">Title : </label>
		<input type = "text" name = "title" size = 40>
		</div>
		<br>
		<br>
		<!--
		<label for = "contents">Contents</label><br> -->
		<textarea rows = "10" cols = "50" name = "contents" placeholder = "내용을 입력하세요"></textarea> <br><br>
  <input type="submit" value = "올리기">
  <input type = "reset" value = "초기화하기">
</form>
</div>
</div>
</body>
</html>