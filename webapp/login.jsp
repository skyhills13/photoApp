<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
	<div class = "container">
<div class = "title"> LOGIN</div>

<form action = "/login_check" method = "post">
	<label for="id">ID :</label>
	<input class = "id" type = "text" name = "userId" placeholder= "username" size = 40 />
	<label for = "password">Password : </label>
	<input class = "password" type = "password" name = "password" placeholder = "password" size = 40 /> <br><br>
	<input type = "submit" value= "로그인하기">
</form>
</div>


</body>
</html>