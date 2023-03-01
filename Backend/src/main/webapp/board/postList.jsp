<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href='../css/common.css' type="text/css" rel="stylesheet" />
<link href='../css/postList.css' type="text/css" rel="stylesheet" />
</head>
<body>
<div class="content">
	<h2>게시물 목록</h2>
		
	<p class="postTop">
		<span>게시판명 <input type="text" value="${ boardName }" disabled="disabled"></span>
		<button id="postAdd" class="button">게시물 추가</button>
	</p>
	
	<table class="postList">
		<thead>
			<tr>
				<th class="title">제목</th>
				<th class="details">설명</th>
				<th class="writeDate">작성일</th>
				<th class="editDate">수정일</th>
				<th class="writer">작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ not empty list }">
					<c:forEach items="${ list }" var="vo">
						<tr>
							<td class="title"><a href="#" data-postid="${ vo.postId }" class="postDetail" onclick="showPostDetail(this);">${ vo.postTitle }</a></td>
							<td class="details">${ vo.postTitle }에 대한 설명</td>
							<td class="writeDate">${ vo.postWriteDate }</td>
							<td class="editDate">${ vo.postEditDate }</td>
							<td class="writer"><input type="hidden" value="${ vo.userId }">${ vo.nickname }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">게시물이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<p class="btnBox"><a href="/web/board/boardList.htm" class="button back">게시판 목록으로 돌아가기</a></p>
	
	<!-- 게시물 추가 모달창 -->
	<div class="modal" id="modalAddPost">
		<div class="inner">
			<div class="inputBox">
				<form name="postForm" id="postForm" method="post">
					<input type="hidden" id="boardId" name="boardId" value="${ boardId }">
					<input type="hidden" id="userId" name="userId" value="${ userId }">
					<div class="titleBox">
						<p>게시물 제목</p>
						<input type="text" id="postTitle" name="postTitle" value="">
						<button class="button delete cancel">X</button>
					</div>
					<div class="contentBox">
						<p>내용</p>
						<textarea id="postContent" name="postContent" value=""></textarea>
					</div>
				</form>
			</div>
			<div class="btnBox">
				<button id="postAdd2" class="button">추가</button>
			</div>
		</div>
	</div>
	
	<!-- 게시물 수정 모달창 -->
	<div class="modal" id="modalEditPost">
		<div class="inner">
			<div class="inputBox">
				<form name="EditForm" id="EditForm" method="post">
					<input type="hidden" id="editBoardId" name="boardId" value="${ boardId }">
					<input type="hidden" id="editUserId" name="userId" value="${ userId }">
					<input type="hidden" id="editPostId" name="postId" value="">
					<div class="titleBox">
						<p>게시물 제목</p>
						<input type="text" id="editPostTitle" name="postTitle" value="">
						<button class="button delete cancel">X</button>
					</div>
					<div class="contentBox">
						<p>내용</p>
						<textarea id="editPostContent" name="postContent" value=""></textarea>
					</div>
				</form>
			</div>
			<div class="btnBox">
				<button id="postDel2" class="button delete" data-postid="" onclick="postDel(this);">삭제</button>
				<button id="postEdit2" class="button">수정</button>
			</div>
		</div>
	</div>
	
	<!-- 게시물 상세보기 모달창 -->
	<div class="modal" id="modalPostDetail">
		<div class="inner">
			<div class="inputBox">
					<div class="titleBox">
						<p><b>게시물 제목</b></p>
						<input type="text" id="detailTitle" value="" disabled="disabled">
						<button class="button delete cancel">X</button>
					</div>
					<div class="contentBox">
						<p><b>내용</b></p>
						<p id="detailCon"></p>
					</div>
					<div class="commentBox">
						<p><b>댓글</b></p>
						<table id="detailComm">
							<tbody>
							</tbody>
						</table>
					</div>
			</div>
			<div class="commentBox">
				<input type="text" id="comContent" name="comContent" value="">
				<button id="commentAdd" class="button" data-postid="">댓글 등록</button>
			</div>
			<div class="btnBox" style="display: none;">
				<button id="postDel" class="button delete" data-postid="" onclick="postDel(this);">삭제</button>
				<button id="postEdit" class="button" data-postid="">수정</button>
			</div>
		</div>
	</div>
	
</div>

<script>
	
	$(function(){
		// 게시물 추가 모달창 열기
		$("#postAdd").on("click", function(){
		    $("#modalAddPost").css("display", "block");
		});
	
		// 모달창 닫기
		$(".cancel").on("click", function(event){
		    $(".modal").css("display", "none");
		    event.preventDefault();
		});
		
		
		// 게시물 추가
		$("#postAdd2").on("click", function(){
			if($("#postTitle").val() == ""){
				alert("게시물 제목을 입력해주세요.");
			}else if($("#postContent").val() == ""){
				alert("내용을 입력해주세요.");
			}else{
				$.ajax({
					url : '/web/board/postAdd.json',
					type : 'POST',   
					dataType : 'text',
					cache : false,
					data : $("#postForm").serialize(),
					success : function(data){
						if(data == "success"){
							$("#modalAddPost").css("display", "none");
							location.replace("/web/board/postList.htm?boardId=${ boardId }");
						}else{
							alert("게시물 추가 실패");
						}
					},
					error: function(data){
						alert("게시물 추가 에러");
					}
				});
			}
		});

		
		// 댓글 등록
		$("#commentAdd").on("click", function() {
			var formdata = {
					postId : $(this).data("postid"),
					userId : '${ userId }',
					comContent : $("#comContent").val()
			}
			if ($("#comContent").val() == "") {
				alert("댓글 내용을 입력해주세요.");
			} else {
				$.ajax({
					url : '/web/board/commentAdd.json',
					type : 'POST',
					dataType : 'text',
					cache : false,
					data : formdata,
					success : function(data) {
						if (data == "success") {
							alert("댓글이 등록되었습니다.");
							location.replace("/web/board/postList.htm?boardId=${ boardId }");
						}else{
							alert("댓글 등록 실패");
						}
					},
					error : function(data) {
						alert("댓글 등록 에러");
					}
				});
			}
		});
		
		
		// 게시물 수정 모달창 열기
		$("#postEdit").on("click", function(){
			var postId = $(this).data("postid");
			$.ajax({
				url : '/web/board/' + $(this).data("postid") + '/postEdit.json',
				type : 'GET',   
				dataType : 'json',
				cache : false,
				data : { postId : postId },
				success : function(data) {
					$("#editPostTitle").val(data.postTitle);
					$("#editPostContent").val(data.postContent);
					$("#editPostId").val(postId);
					$("#modalPostDetail").css("display", "none");
					$("#modalEditPost").css("display", "block");
				},
				error : function(data) {
					alert("게시물 수정 에러");
				}
			});
		});
		
		// 게시물 수정
		$("#postEdit2").on("click", function(){
			if($("#editPostTitle").val() == ""){
				alert("게시물 제목을 입력해주세요.");
			}else if($("#editPostContent").val() == ""){
				alert("내용을 입력해주세요.");
			}else{
				$.ajax({
					url : '/web/board/postEdit.json',
					type : 'POST',   
					dataType : 'text',
					cache : false,
					data : $("#EditForm").serialize(),
					success : function(data){
						if(data == "success"){
							alert("게시물이 수정되었습니다.");
							$("#modalEditPost").css("display", "none");
							location.replace("/web/board/postList.htm?boardId=${ boardId }");
						}else{
							alert("게시물 수정 실패");
						}
					},
					error: function(data){
						alert("게시물 수정 에러");
					}
				});
			}
		});

		
	});

	// 댓글 가져오기
	function getComment(postId) {
		$("#detailComm").children("tbody").html(""); // 초기화
		$.ajax({
			url : '/web/board/getComment.json',
			type : 'POST',
			dataType : 'json',
			cache : false,
			data : {
				postId : postId
			},
			success : function(data) {
				$(data).each(
						function(i, element) {
							$("#detailComm").children("tbody").append(
									"<tr><td class='comment'>"
											+ element.comContent
											+ "</td><td class='writer'>"
											+ element.nickname + "</td></tr>");
						});
			},
			error : function(data) {
				alert("댓글 가져오기 에러");
			}
		});
	};

	// 게시물 제목 클릭 -> 상세보기
	function showPostDetail(self) {
		var postId = $(self).data("postid");
		$.ajax({
			url : '/web/board/' + $(self).data("postid") + '/postDetail.json',
			type : 'POST',
			dataType : 'json',
			cache : false,
			data : {
				postId : postId
			},
			success : function(data) {
				$("#detailTitle").val(data.postTitle);
				$("#detailCon").html(data.postContent);
				$("#commentAdd").attr("data-postid", postId);
				$("#postDel").attr("data-postid", postId);
				$("#postEdit").attr("data-postid", postId);
				$("#postDel2").attr("data-postid", postId);
				$("#modalPostDetail").css("display", "block");
				getComment(postId);
				if (data.userId == "${ userId }") {
					$("#modalPostDetail .btnBox").css("display", "block");
				}
			},
			error : function(data) {
				alert("게시물 상세보기 에러");
			}
		});
	};
	
	// 게시물 삭제
	function postDel(self) {
		if(confirm("게시물을 삭제하시겠습니까?")){
			$.ajax({
				url : '/web/board/postDel.json',
				type : 'POST',   
				dataType : 'text',
				cache : false,
				data : { postId : $(self).data("postid") },
				success : function(data){
					if(data == "success"){
						alert("게시물이 삭제되었습니다.");
						$("#modalEditPost").css("display", "none");
						$("#modalPostDetail").css("display", "none");
						location.replace("/web/board/postList.htm?boardId=${ boardId }");
					}else{
						alert("게시물 삭제 실패");
					}
				},
				error: function(data){
					alert("게시물 삭제 에러");
				}
			});
		}
	};
</script>
</body>
</html>