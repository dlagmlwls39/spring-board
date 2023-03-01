<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href='../css/common.css' type="text/css" rel="stylesheet" />
<link href='../css/boardList.css' type="text/css" rel="stylesheet" />
</head>
<body>
<div class="content">
	<h2>게시판 목록</h2>
	
	<p class="boardTop">
		<a href="" id="boardDel" class="button delete">게시판 삭제</a>
		<button id="boardAdd" class="button">게시판 추가</button>
	</p>
	
	<table class="boardList">
		<thead>
			<tr>
				<th class="checkbox"></th>
				<th class="title">제목</th>
				<th class="editDate">수정일</th>
				<th class="writer">작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ not empty list }">
					<c:forEach items="${ list }" var="vo">
						<tr>
							<td class="checkbox"><input type="checkbox" value="${ vo.boardId }"></td>
							<td class="title"><a href="postList.htm?boardId=${ vo.boardId }">${ vo.boardName }</a></td>
							<td class="editDate">${ vo.boardEditDate }</td>
							<td class="writer"><input type="hidden" value="${ vo.userId }">${ vo.nickname }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">게시판이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<div class="boardBottom">
		<a href='<c:url value="/j_spring_security_logout" />' id="logout" class="button delete">로그아웃</a>
		<a href="/web/user/userInfo.htm" id="userInfo" class="button">회원정보수정</a>
	</div>
	
	<!-- 게시판 추가 모달창 -->
	<div class="modal" id="modalAddBoard">
		<div class="inner">
			<div class="inputBox">게시판명 <input type="text" id="boardName" value=""></div>
			<div class="btnBox">
				<button id="cancel" class="button delete">취소</button>
				<button id="boardAdd2" class="button">게시판 추가</button>
			</div>
		</div>
	</div>
	
</div>

<script>
	$(function(){
		// "게시판 추가" 클릭 -> 모달창 열기
		$("#boardAdd").on("click", function(){
		    $("#modalAddBoard").css("display", "block");
		});
	
		// "취소" 클릭 -> 모달창 닫기
		$("#cancel").on("click", function(){
		    $("#modalAddBoard").css("display", "none");
		});
		
		
		// 게시판 추가
		$("#boardAdd2").on("click", function(){
			if($("#boardName").val() == ""){
				alert("게시판명을 입력해주세요.");
			}else{
				var form = {
						userId : "${ userId }",
						boardName : $("#boardName").val()
				};
				$.ajax({
					url : '/web/board/boardAdd.json',
					type : 'POST',   
					dataType : 'text',
					cache : false,
					data : form, 
					success : function(data){
						if(data == "success"){
							$("#modalAddBoard").css("display", "none");
							location.replace("/web/board/boardList.htm");
						}
						if(data == "fail"){
							alert("게시판 추가 실패");
						}
					},
					error: function(data){
						alert("에러");
					}
				});
			}
		});
		
		
		// 게시판 삭제
		$("#boardDel").on("click", function(event){
			var content = "boardDel.htm?boardId=";
			var flag = false;
			var idCorrect = true;
			
			$("input:checkbox").each(function(i, element){
				if($(element).is(":checked")){
					flag = true;
					if($(this).parent("td").siblings(".writer").children("input").val() != "${ userId }"){  // 게시판 작성자와 현재 로그인한 유저 아이디가 일치하지 않는 경우
						idCorrect = false;
						return false;
					}else{
						content += $(this).val() + ",";
					}
				}	
			});
			
			if(!flag){  // 아무것도 체크하지 않은 경우
				alert("삭제할 게시판을 선택해주세요.");
			}else if(!idCorrect){  // 아이디가 일치하지 않는 경우
				alert("해당 게시판은 삭제할 수 없습니다.");
			}else{
				if(window.confirm("게시판을 삭제하시겠습니까?")){
					alert("게시판이 삭제되었습니다.")
					$("#boardDel").attr("href", content);
				}else{
					event.preventDefault();
				}
			}
		});
	
	});
</script>
</body>
</html>