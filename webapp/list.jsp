<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Photo</title>
<link type="text/css" rel="stylesheet" href="/images/photoApp.css"/>
</head>
<body>

<c:forEach var="data" items="${boardAllData}">
	<div id="upload">
		<h2>제목 : ${data.title}</h2>
		내용 : ${data.contents}<br/>
		이미지 : ${data.fileName}<br/>

		<br/>
		<img width="400px" src="/images/${data.fileName}"/>
		<button onclick="location.href='/board/revise/${data.id}'">수정</button>
		<button onclick="location.href='/board/delete/${data.id}'">삭제</button>
	</div>
	<br/>
</c:forEach>
<button onclick ="location.href='/'">메인으로</button>
</body>
</html>