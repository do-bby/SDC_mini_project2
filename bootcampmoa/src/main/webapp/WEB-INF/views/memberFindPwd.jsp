<%@ page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
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

	.infobutton{
	float: right;
	border:0;
	font-size:14px;
	margin-right: 30px;
	background:#04BEBD;
	color:#ffff;
	height: 30px;
	}
</style>
</head>
<body>
<script>
var input = document.getElementById(id);
input.value = null;
</script>
<div class="wrap">
	<h2>비밀번호 찾기</h2>
	<form method="POST" action="/bootcampmoa/memberFindPwd">
	<table>
		<tr>
		<td>아이디</td>
		<td><input type="text" name="id" id="id" placeholder="아이디를 입력하세요" required/></td>
		<td><input type="submit" class="infobutton" name="findPwd" id="findPwd" value="확인"/></td>
		</tr>
	</table>
	</form>
	<c:if test="${ !empty msg }" >
		<script>
			alert('${ msg }');
		</script>
	</c:if>

	<button type="button" class="infobutton" onclick="location.href='bootmoaMain'">메인화면으로</button>

</div>
</body>
</html>