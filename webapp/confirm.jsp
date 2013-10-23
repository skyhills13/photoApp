<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>confirm and reply</title>
<link media = "screen" type="text/css" rel="stylesheet" href="/stylesheets/confirm.css"/>
<link media = "screen" type="text/css" rel="stylesheet" href="/stylesheets/button.css"/>
</head>
<body>
		<div id = "wrap">
		<header>
		<a href = "/board/list">목록보기</a>
		<a href = "/main">메인</a>
		</header>
	<section>
		<div id="confirm">
		<div id = "titleArea">
			<h1>${board.title}</h1>
		</div>
		<div id = "imageArea">
		<c:if test = "${not empty board.fileName}">
		<img src = "/images/${board.fileName}" />
		
		</c:if>
		</div>
		<div id = "contentsArea">
		${board.contents}<br/>
		</div>
	</div>
		<div class="commentsList">
        	<c:forEach var="comment" items="${board.comments}">
        	${comment.contents}<br />
      		</c:forEach>
        </div>
        <div class="comment-reply">
        <form action="/board/${id}/comment_ok" method="post">
                        <span><textarea name="contents" cols="50" rows="3"
                                        placeholder="댓글을 쓰세요"></textarea>
                                <button>댓글쓰기</button></span>
		</form>
        </div>
        <footer>
		<br/>
		<button onclick ="location.href='/board/list'">올리기</button>
		<button onclick="location.href='/board/revise/${board.id}'">수정하기</button>
		</footer>
		</section>
		
	</div>
</body>
</html>