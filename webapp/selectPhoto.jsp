<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Photo</title>
</head>
<body>
<h1>Select photo</h1>
<form action = "/board/selected" method ="POST" enctype="multipart/form-data">
  <label for="attachment">photo :</label>
  <input type="file" name="attachment" id="attachment" accept="image/gif, image/jpeg, image/png" size = "40"> <br>
  <label for = "title">Title : </label>
		<input type = "text" name = "title" size = 40> <br><br>
		<label for = "contents">Contents</label><br>
		<textarea rows = "4" cols = "50" name = "contents">
		내용을 입력하세요 
 		</textarea> <br><br>
  <input type="submit">
</form>

</body>
</html>