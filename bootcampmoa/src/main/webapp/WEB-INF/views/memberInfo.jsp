<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, vo.MemberVO"%>
<%@ page import ="dao.MemberMyBatisDao" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
<style>

	
	body{
	height:100vh;
	background: #f5f5f5;
	}
	
	.wrap{
	overflow:auto;
	margin-left: auto;
	margin-right:auto;
	position: relative;
    z-index: 0;
    float: none;
    padding-top: 40px;
    width: 60%;
    height:100%;
    background: #252934;
	}
	
	h2{
	margin-left:40px;
	color:#ffff;
	padding: 10px;
	text-align: center;
	position: relative;
	display: inline-block;
	}
	
	h2:after{
	content:'';
	background:#04BEBD;
	width:100%;
	height:2px;
	display:block;
	}
	
	button{
	float: right;
	border:0;
	font-size:14px;
	margin-right: 30px;
	background:#04BEBD;
	color:#ffff;
	height: 30px;
	}
	
	table{
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 30px;
	padding:10px;
	width:90%;
	background-color:#FFFFFF;
	}

	td{
		border-bottom : 1px solid #ddd;;
		padding : 8px;
		text-align:left;
		font-size:14px;
	}
	
	td:first-child{
	font-weight: bold;
	}
	


</style>

					
</head>
<body>
<div class="wrap">

<c:if test="${ !empty list }" > 
	<h2 onload="location.href='/bootcampmoa/viewMemberInfo">회원정보 조회</h2>
	<table class="userinfo">
		<c:forEach var="e" items="${list}">
		<tr>
			<td>프로필 사진</td>	
			<td><img src="resources/profiles/${e.profile}" width="100" height="100"></td>
			
		</tr>
		
			<tr>
			<td>아이디</td>
			<td>${e.id}</td>
			</tr>
			
			<tr>
			<td>비밀번호</td>
			<td>**********</td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td>${e.name}</td>
			</tr>
			
			<tr>
			<td>이메일</td>
			<td>${e.email}</td>
			</tr>
			
			<tr>
			<td>전화번호</td>
			<td>${e.phone}</td>
			</tr>
			
			<tr>
			<td>닉네임</td>
			<td>${e.nickname}</td>
			</tr>
			
			<tr>
			<td>보안 질문</td>
			<td>${e.question}</td>
			</tr>
			
			<tr>
			<td>답변</td>
			<td>${e.answer}</td>
			</tr>
			<c:set var="mnum" value="${e.mnum}"/>
		</c:forEach>
	</table>
</c:if>

<c:if test="${ !empty msg }" >
	<script>
		alert('${ msg }');
	</script>
</c:if>

	
	<button type="button" onclick= "location.href='bootmoaMain'">메인페이지로 돌아가기</button>
	<form action="/bootcampmoa/memberinfo" method="post">
  <input type="hidden" name="mnum" value="${mnum}">
  <button type="submit">회원정보 수정</button>
</form>
	

</div>
</body>
</html>