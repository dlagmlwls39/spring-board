<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href='../css/common.css' type="text/css" rel="stylesheet" />
</head>
<style>
.fail{
	padding: 0 35px;
}
.login{
    width: 80%;
    border: none;
    margin-left: 100px;
}
.login td{
	border: none;
	text-align: left;
	font-size: 14px;
}
.joinBottom{
	margin: 10px 0 15px 200px;
}
#btnLogin{
	margin-left: 100px;
}
</style>
<body>
<div class="content">
	<a href="/web/index.htm" class="main">메인 페이지로 돌아가기</a>

	<form action='<c:url value="/j_spring_security_check" />' method="post">
		<h2>로그인</h2>
		<table class="login">
			<tbody>
				<tr>
					<td class="first">이메일(ID)</td>
					<td class="second"><input type="text" name="j_username" class="text"></td>
				</tr>
				<tr>
					<td class="first">비밀번호</td>
					<td class="second"><input type="password" name="j_password" class="text"></td>
				</tr>
				<tr>
					<td colspan="2" class="first fail">
						<c:if test="${ param.error != null }">
        					<span>아이디 또는 패스워드가 틀렸습니다.</span>
    					</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="btnLogin" class="button" value="로그인">
					</td>
				</tr>
			</tbody>
		</table>
     
        <div class="btnBottom">
            	<span>아이디가 없으신 분은 회원가입을 해주세요.</span>
            	<a href="/web/user/join.htm" class="button">회원가입</a>
        </div> 
	</form>
</div>

</body>
</html>