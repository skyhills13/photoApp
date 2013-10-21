<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
</head>
<body>
<c:choose>
<c:when test = "${not empty sessionScope.userId}">
	<a href = "/logout">로그아웃 하기</a>
	</c:when>
	<c:otherwise>
	<a href = "login">로그인하기</a>
	</c:otherwise>
	</c:choose>
	<br>
	<br>
 <a href = "/board/select_photo">photo application</a>
 <a href = "/register">가입하기</a>
 
</body>
</html>