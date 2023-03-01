<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href='../css/common.css' type="text/css" rel="stylesheet" />
</head>
<style>
.userInfo{
	width: 40%;
    margin: 0 100px;
    border: none;
}
.userInfo td{
	border: none;
	text-align: left;
	font-size: 14px;
}
.userInfoBottom{
	text-align: center;
	margin: 15px 0;
	width: 60%;
}
.userInfoBottom .button{
	margin-left: 5px;
}
.first {
    padding-left: 4px;
}
</style>
<body>
<div class="content">
	<form action="" id="userInfoForm" method="post">
		<h2>회원정보수정</h2>
		<table class="userInfo">
			<tbody>
				<tr>
					<td>이메일(ID)</td>
					<td>${ user.userId }</td>
				</tr>
				<tr>
					<td class="first"><b>*</b>비밀번호</td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td class="first"><b>*</b>별명</td>
					<td><input type="text" id="nickname" name="nickname" value="${ user.nickname }"></td>
				</tr>
				<tr>
					<td class="first"><b>*</b>생년월일</td>
					<td class="birthInput">
						<input type="text" id="year" name="year" value="${ fn:substring(user.birth, 0, 4) }">년 
						<input type="text" id="month" name="month" value="${ fn:substring(user.birth, 5, 7) }">월 
						<input type="text" id="date" name="date" value="${ fn:substring(user.birth, 8, 10) }">일 
						<input type="hidden" id="birth" name="birth" value="">
					</td>
				</tr>
			</tbody>
		</table>
		<div class="userInfoBottom">
			<a href="/web/user/userDel.htm" id="userDel" class="button delete">탈퇴</a>
			<button id="userEdit" class="button">회원정보수정</button>
			<br><br>
			<a href="/web/board/boardList.htm" class="button back">게시판 목록으로 돌아가기</a>
		</div>
	</form>
</div>

<script>
	$(function(){
		$("#userEdit").on("click", function(event){
			var year = $("#year").val();
			var month = $("#month").val();
			var date = $("#date").val();
			var birth = year + "-" + month + "-" + date;
			$("#birth").val(birth);
		 	 
			if($("#password").val() == "" || $("#nickname").val() == "" || 
				$("#year").val() == "" || $("#month").val() == "" || $("#date").val() == ""){
				alert("필수 입력 사항을 모두 입력해주세요.");
				event.preventDefault();
			}else{
				alert("회원정보가 수정되었습니다.");
				$("#joinForm").submit();
			} 
		});
		
		$("#userDel").on("click", function(event){
			if(confirm("정말 탈퇴하시겠습니까?")){
				alert("탈퇴되었습니다.");
			}else{
				event.preventDefault();
			}
		});
	});
</script>
</body>
</html>