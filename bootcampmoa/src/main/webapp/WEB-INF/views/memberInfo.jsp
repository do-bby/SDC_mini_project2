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
	margin-left:20px;
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
	<c:set var="mnum" value="${mnum}" scope="session" />
	<h2 onload="location.href='/bootcampmoa/viewMemberInfo ? mnum='+${mnum}">회원정보 조회</h2>
	<table class="userinfo">
		<c:forEach var="vo" items="${list}">
			<tr>
			<td>아이디</td>
			<td>${vo.id}</td>
			</tr>
			
			<tr>
			<td>비밀번호</td>
			<td>${vo.pwd}</td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td>${vo.name}</td>
			</tr>
			
			<tr>
			<td>프로필</td>
			<td>${vo.profile}</td>
			</tr>
			
			<tr>
			<td>이메일</td>
			<td>${vo.email}</td>
			</tr>
			
			<tr>
			<td>전화번호</td>
			<td>${vo.phone}</td>
			</tr>
			
			<tr>
			<td>닉네임</td>
			<td>${vo.nickname}</td>
			</tr>
			
			<tr>
			<td>보안 질문</td>
			<td>${vo.question}</td>
			</tr>
			
			<tr>
			<td>답변</td>
			<td>${vo.answer}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
<c:if test="${ sessionScope.vo ==null }" >
<script>
		alert('로그인이 필요합니다' ,function(){
			   location.href = "memberLogin";}
			   );
	</script>
</c:if>
<c:if test="${ !empty msg }" >
	<script>
		alert('${ msg }');
	</script>
</c:if>

	
	<a href="${header.referer}">메인페이지로 돌아가기</a>
	<button type="button" onclick="location.href='updateMemberInfo.jsp'">회원정보 수정</button>

</div>
</body>
</html>