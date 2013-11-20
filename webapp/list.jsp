<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Photo List</title>
<link type="text/css" rel="stylesheet" href="/stylesheets/confirm.css" />
<link type="text/css" rel="stylesheet" href="/stylesheets/button.css" />
<script>
	function initPage() {
		console.log('로딩이 되었느니라');
		countComments();
		registerEvents();
		showXHRorAttachment();
		/* XMLForsubmit(); */
	}

	function countComments() {
		var commnetList = document.querySelectorAll('.commentsList');
		for (var i = 0; i < commnetList.length; i++) {
			var currentNode = commnetList[i];
			var nPListCount = currentNode.querySelectorAll('p').length;
			var showCommentsNum = currentNode.parentNode.parentNode
					.querySelector('.commentsNum');
			showCommentsNum.innerText = nPListCount;

			console.log(nPListCount);
		}
	}

	function registerEvents() {
		var hideButtonList = document.getElementsByClassName('hideComments');
		for (var i = 0; i < hideButtonList.length; i++) {
			hideButtonList[i].addEventListener('click', toggleComments, false);
		}
		
		var cmtDelBtns = document.querySelectorAll('.cmtDelBtn');
		for (var i = 0; i < cmtDelBtns.length; i++) {
			cmtDelBtns[i].addEventListener('click', deleteComment, false);
		}
		
	}

	function deleteComment(e) {
		e.preventDefault();
	
		var formData = new FormData();
		
		var targetNode = e.currentTarget;
		
		var id = targetNode.parentNode.children[0].value;
		var url = "/board/delete_comment/"+id+".json"; //이  url에서 처리중 controller로 전달 
		
		var request = new XMLHttpRequest(); //xHR통신 하는 부분  
		//form에 입력되어있는 id comment등의 데이터를 xml형태로 바꿔준다. 
		request.open("POST", url, true);
		request.onreadystatechange = function(){
		//controller에서 responsebody부분이 서버에서 응답하는 부분
		// 이함수에서 그 응답을 받아서 기다리고 있다가 처리한다 
			if(request.readyState == 4 && request.status == 200) {
				targetNode.parentNode.style.display="none";
				//정상적인 응답의 형태가 4랑 200인것 
				
				var cmtNumNode = document.querySelector('.commentsNum');
				cmtNumNode.innerHTML = parseInt(cmtNumNode.innerHTML)-1;
				
			}	
		}
		
		request.send(formData);//server로 xml화 데이터 전송 
	}
	
	function toggleComments(e) {
		e.preventDefault();
		var commentsBodyNode = e.target.parentNode.parentNode.parentNode
				.querySelector('.commentsBody');
		commentsBodyNode.style.display = (commentsBodyNode.style.display != 'block' ? 'block'
				: 'none');
	}

	/* function toggleComments(e){
	 var commentsBodyNode = e.target.parentNode.parentNode.parentNode.querySelector('.commentsBody');
	 commentsBodyNode.style.display = "block";
	 e.preventDefault();	
	 } */

	//window.onload = initPage;
	function showXHRorAttachment() {
		var formList = document.querySelectorAll('.cmtSubmit');
		for (var j = 0; j < formList.length; j++) {
			formList[j].addEventListener('click', writeComments, false);
		}
	}

	function writeComments(e) {
		e.preventDefault(); //자동으로 동작하는 것을 막음

		var ele = e.currentTarget;
		var eleForm = ele.form;
		var oFormData = new FormData(eleForm);

		console.log(ele);
		var sID = parseInt(ele.parentNode.children[0].value);
		console.log(sID);

		console.log("sID : " + sID);

		var url = "/board/" + sID + "/comment_ok.json";

		var request = new XMLHttpRequest();
		request.open("POST", url, true);
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				console.log("응답하여따 헿")
				var obj = JSON.parse(request.responseText);
				//json형태로 온 응답을 파싱해서 object형태로 저장
				//object는 key value 형태로 되어있으니까, 우리도 그렇게 받는거. 
				var targetNode = ele.parentNode.parentNode.previousElementSibling;
				
				console.log(targetNode);
				
				
				
				var htmlString = "<div><input type='hidden' value='${comment.id}'/><p>"
				+ obj.contents+ "</p><button class='cmtDelBtn'>삭제</button></div>";
					
					
					/* '<p>'+obj.contents+'</p>'; */
				targetNode.insertAdjacentHTML('beforeend', htmlString);
				//여기는 필요한 데이터 추출
				
				var cmtNumNode = document.querySelector(".commentsNum");
				var cmtTotalNum = parseInt(cmtNumNode.innerHTML);
				cmtNumNode.innerHTML = cmtTotalNum+1;
				
			}
		}

		request.send(oFormData);
	}

	window.onload = initPage;
</script>
</head>
<body>
	<div id="wrap">
		<header>
			<a href="/board/list">목록보기</a> <a href="/">메인</a> <a>${sessionScope.userId}</a>
		</header>
		<div id="formArea">
			<form action="/board/selected" method="POST"
				enctype="multipart/form-data">
				<div id="makeTitleArea">
					<label for="title">Title : </label> <input type="text" name="title"
						size=40>
				</div>
				<div id="attachmentArea">
					<label for="attachment">photo :</label> <input type="file"
						name="attachment" id="attachment"
						accept="image/gif, image/jpeg, image/png" size="40">
				</div>
				<textarea rows="10" cols="50" name="contents"
					placeholder="내용을 입력하세요"></textarea>
				<div id="saveArea">
					<input type="submit" value="올리기"> <input type="reset"
						value="초기화하기">
				</div>
			</form>
		</div>


		<section>
			<c:forEach var="data" items="${boardAllData}">
				<div id="confirm">
					<div class="titleArea">
						<h1>${data.title}</h1>
					</div>
					<div id="imageArea">

						<c:if test="${not empty data.fileName}">
							<img src="/images/${data.fileName}" width="400" />
						</c:if>
						<br />

					</div>
					<div id="contentsArea">
						${data.contents}<br />
					</div>
				</div>
				<div class="commentsArea">
					<div class="commentsHeader">
						<div class="commentNumArea">
							<p class="commentsNum"></p>
							<p>개의 댓글</p>
						</div>
						<div class="hideComments">
							<a href="#"> 댓글 펼치기 </a>
						</div>
					</div>
					<div class="commentsBody">
						<div class="commentsList">
							<c:forEach var="comment" items="${data.comments}">
								<div>
									<input type="hidden" value="${comment.id}"/>
									<p>${comment.contents}</p>
									<button class="cmtDelBtn">삭제</button>
								</div>
							</c:forEach>
						</div>
						<div class="comment-reply">
							<form action="#" name="commentWrite" method="post">
								<input type="hidden" name="id" value="${data.id}" />
								<!-- <input type = "text" placeholder= "댓글을 쓰세요" name = "comment">
                        -->
								<textarea name="contents" cols="50" rows="3"
									placeholder="댓글을 쓰세요"></textarea>
								<button class="cmtSubmit">댓글쓰기</button>
							</form>
						</div>
					</div>
				</div>
				<br />
				<button onclick="location.href='/board/revise/${data.id}'">수정</button>
				<button onclick="location.href='/board/delete/${data.id}'">삭제</button>

				<br />
				<br />
				<br />
				<br />
				<br />
			</c:forEach>
		</section>
	</div>
</body>
</html>