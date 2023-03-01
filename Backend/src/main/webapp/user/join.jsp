<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href='../css/common.css' type="text/css" rel="stylesheet" />
</head>
<style>
.join{
    width: 80%;
    border: none;
    margin-left: 50px;
}
.join td{
	border: none;
	text-align: left;
	font-size: 14px;
}
.joinBottom{
	margin-left: 150px;
}
</style>
<body>
<div class="content">
	<a href="/web/index.htm" class="main">메인 페이지로 돌아가기</a>
	
	<form action="" id="joinForm" method="post">
		<h2>회원가입</h2>
		<table class="join">
			<tbody>
				<tr>
					<td class="first"><b>*</b>이메일(ID)</td>
					<td class="second">
						<input type="text" id="uesrId" name="userId"> 
						<input type="button" id="btnCheckId" class="button" value="중복 확인">
						<input type="hidden" id="idValid" value=-1>
						<span class="empty" style="display: none;">아이디를 입력해주세요.</span>
						<span class="success" style="display: none;">사용 가능한 아이디입니다.</span>
						<span class="fail" style="display: none;">아이디가 이미 존재합니다.</span>
					</td>
				</tr>
				<tr>
					<td class="first"><b>*</b>비밀번호</td>
					<td class="second"><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td class="first"><b>*</b>별명</td>
					<td class="second"><input type="text" id="nickname" name="nickname"></td>
				</tr>
				<tr>
					<td class="first"><b>*</b>생년월일</td>
					<td class="birthInput second">
						<input type="number" id="year" name="year">년 
						<input type="number" id="month" name="month">월 
						<input type="number" id="date" name="date">일 
						<input type="hidden" id="birth" name="birth">
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" id="btnJoin" class="button joinBottom" value="회원가입"></td>
				</tr>
			</tbody>
		</table>
		
	</form>
	<div class="btnBottom">
    	<span>아이디가 있으신 분은 로그인을 해주세요.</span>
        <a href="/web/user/login.htm" class="button">로그인</a>
    </div> 
</div>

<script>
	$(function(){
		// 아이디 중복 확인
		$("#btnCheckId").on("click", function(){
			if($("#uesrId").val() == ""){
				$(".empty").css("display", "inline");
				$(".success").css("display", "none");
	        	$(".fail").css("display", "none");
	        	$("#idValid").val(-1);
			}else{
				$.ajax({
				     url: "/web/user/checkId.json", 
				     dataType: "text",
			 	     type: "POST",
			         data: { userId : $("#uesrId").val() },
				     success: function(result){
				         if(result == "ok"){
				        	 $(".success").css("display", "inline");
				        	 $(".fail").css("display", "none");
				        	 $(".empty").css("display", "none");
				        	 $("#idValid").val(1);
				         }else{
				        	 $(".fail").css("display", "inline");
				        	 $(".success").css("display", "none");
				        	 $(".empty").css("display", "none");
				        	 $("#idValid").val(0);
				         }
					},
				    error: function(){
				         alert("아이디 중복 확인 에러");
				    }  
				});
			}
		});
		
		// 회원가입
		$("#btnJoin").on("click", function(){
			var year = $("#year").val();
			var month = $("#month").val();
			var date = $("#date").val();
			var birth = year + "-" + month + "-" + date;
			$("#birth").val(birth);
		 	 
			if($("#idValid").val() == -1){
				alert("아이디 중복 확인을 해주세요.");
			}else if($("#idValid").val() == 0){
				alert("유효한 아이디를 입력해주세요.");
			}else if($("#password").val() == "" || $("#nickname").val() == "" || 
					$("#year").val() == "" || $("#month").val() == "" || $("#date").val() == ""){
				alert("필수 입력 사항을 모두 입력해주세요.");
			}else{
				alert("회원가입이 완료되었습니다.");
				$("#joinForm").submit();
			} 
		});
		
	});
</script>
</body>
</html>