<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Upload</title>
<link type="text/css" rel="stylesheet" href="/images/photoApp.css"/>
</head>
<body>

	
		<div id="upload">
			<h2>제목 : ${board.title}</h2>
			내용 : ${board.contents}<br/>
			<c:if test = "${not empty board.fileName}">
			이미지 : ${board.fileName}<br/>
			<img src = "/images/${board.fileName}" width ="400" />
			<br />
			</c:if>
			
		</div>
		
		<div class="comments">
                        <c:forEach var="comment" items="${board.comments}">
                        ${comment.contents}<br />
                        </c:forEach>
        </div>
        <div class="comment-reply">
        <form action="/board/${id}/comment_ok" method="post">
                        <span><textarea name="contents" cols="50" rows="3"
                                        placeholder="글쓰세요."></textarea>
                                <button>작성</button></span>
</form>
      
        </div>
			
			<br/>
			<a href = "/board/list/">확인</a>
			
		<br/>
<button onclick="location.href='/board/revise/${board.id}'">수정</button>
</body>
</html>