<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Photo</title>
<link type="text/css" rel="stylesheet" href="/stylesheets/confirm.css"/>
<link type="text/css" rel="stylesheet" href="/stylesheets/button.css"/>
</head>
<body>
<div id = "wrap">
<header>
	<a href = "/board/list">목록보기</a>
	<a href = "/main">메인</a>
</header>
<div id = "formArea">
<form action = "/board/selected" method ="POST" enctype="multipart/form-data">
  <div id = "makeTitleArea">
  <label for = "title">Title : </label>
		<input type = "text" name = "title" size = 40>
		</div>
	<div id = "attachmentArea">
  <label for="attachment">photo :</label>
  <input type="file" name="attachment" id="attachment" accept="image/gif, image/jpeg, image/png" size = "40">
	</div>
		<textarea rows = "10" cols = "50" name = "contents" placeholder = "내용을 입력하세요"></textarea>
  <div id = "saveArea">
  <input type="submit" value = "올리기">
  <input type = "reset" value = "초기화하기">
  </div>
</form>
</div>


<section>
<c:forEach var="data" items="${boardAllData}">
	<div id="confirm">
	<div class = "titleArea">
		<h1>${data.title}</h1>
		</div>
		<div id = "imageArea">
		<img src = "/images/${board.fileName}" width ="400" />
		<br />
		
		</div>
		<div id = "contentsArea">
		${data.contents}<br/>
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
		
		<br/>
		<button onclick="location.href='/board/revise/${data.id}'">수정</button>
		<button onclick="location.href='/board/delete/${data.id}'">삭제</button>
	
	<br/><br /><br /><br /><br />
</c:forEach>
</section>
</div>
</body>
</html>