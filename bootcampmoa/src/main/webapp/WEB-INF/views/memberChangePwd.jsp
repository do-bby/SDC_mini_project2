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
function checkPwd() {
	  var pwd = document.getElementById("pwd").value;
	  var chkPwd = document.getElementById("chkPwd").value;
	  var id = document.getElementById("id").value;
	  alert(pwd);
	  if (pwd !== chkPwd) {
	    alert("비밀번호가 일치하지 않습니다.");
	    return false;
	  }
	  let form = document.createElement("form");
	  form.setAttribute("method", "post");
	  form.setAttribute("action", "memberChangePwd");
	  
	  let pwdInput = document.createElement("input");
	  pwdInput.setAttribute("type", "hidden");
	  pwdInput.setAttribute("name", "pwd");
	  pwdInput.setAttribute("value", pwd);
	  form.appendChild(pwdInput);
	  
	  let idInput = document.createElement("input");
	  idInput.setAttribute("type", "hidden");
	  idInput.setAttribute("name", "id");
	  idInput.setAttribute("value", id);
	  form.appendChild(idInput);
	  
	  document.body.appendChild(form);
	  form.submit();
	}
var input = document.getElementById(id);
input.value = null;
</script>
<div class="wrap">
	<table>
		<tr>
		<td>새 비밀번호</td>
		<td><input type="password" name="pwd" id="pwd" placeholder="새 비밀번호 입력" required/></td>
		</tr>
		<tr>
		<td>새 비밀번호 확인</td>
		<td><input type="password" name="chkPwd" id="chkPwd" placeholder="새 비밀번호 확인" required/></td>
		<td><input type="button" class="infobutton" name="chkPwdButton" id="chkPwdButton" value="확인" onClick="javascript:checkPwd()"/></td>
		</tr>
	</table>
	<input type="text" name="id" id="id" value="${id}"/>

	<c:if test="${ !empty msg }" >
		<script>
			alert('${ msg }');
		</script>
	</c:if>

	<button type="button" class="infobutton" onclick="location.href='bootmoaMain'">메인화면으로</button>

</div>
</body>
</html>