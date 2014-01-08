<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
<link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>
<body>
<div id = "wrap">
<div id = "login_status">
	<c:choose>
		<c:when test="${not empty sessionScope.userId}">
			<a href="/logout">로그아웃 하기</a>
		</c:when>
		<c:otherwise>
			<a href="login">로그인하기</a>
		</c:otherwise>
	</c:choose>
	</div>
	<div id = "enter_contents">
	<a href="/board/list">photo application</a></div>
	<div id = "register_service">
	<a href="/register">가입하기</a></div>
</div>
</body>
</html>