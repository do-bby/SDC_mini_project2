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
/* var input = document.getElementById(id);
input.value = null;

var nickname = '<c:out value="${nickname}" />';
if(form.nickname.value != nickname){
	if (form.idDuplication.value != "idCheck") {
		alert("아이디 중복체크를 해주세요");
		form.id.focus();
		return false;
	}
} */
/* var nickname = '<c:out value="${nickname}" />';
세션에 저장된 닉네임을 nickname 변수에 저장합니다.
if(form.nickname.value != nickname){
폼에 입력된 닉네임과 세션에 저장된 닉네임이 다를 경우
if (form.idDuplication.value != "idCheck") {
idDuplication 필드의 값이 "idCheck"가 아니면,
alert("아이디 중복체크를 해주세요");
"아이디 중복체크를 해주세요" 메세지를 출력하고,
form.id.focus();
아이디 필드에 포커스를 줍니다.
return false;
폼 전송을 취소합니다. */

/* function openIdCheck() {
    var inputValue = document.getElementById("id").value;
    if(inputValue==""){
    	alert("아이디를 입력하세요");
    }else{
    var xhr = new XMLHttpRequest();
	xhr.onload = function () {
		if(xhr.status == 200) {				
			let jsondom = JSON.parse(xhr.responseText);
			if (jsondom.isDuplicate == true)
				alert("이미 존재하는 아이디입니다");
			else
				alert("사용가능한 아이디입니다");
				document.userInfo.idDuplication.value ="idCheck";
		}
	};
	xhr.open("GET", "/bootcampmoa/duplicateCheck?input="+inputValue+"&type=id", true);
//	xhr.open("POST", "/bootcampmoa/duplicateCheck", true);
//	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//	xhr.send("input="+inputValue+"&type=id");
	xhr.send();
	}
} */

</script>
<div class="wrap">
	<h2>비밀번호 찾기 질문</h2>
	<form method="POST" action="/bootcampmoa/memberAnswer">
	<table class="userinfo">
		<tr>
		<td>질문</td>
		<td><input type="text" name="question" id="question" value="${question}"disabled/></td>
		</tr>
		<tr>
		<td>답변</td>
		<td><input type="text" name="answer" id="answer" placeholder="답변을 입력하세요" required/></td>
		<td><input type="submit" class="infobutton" name="updatePwd" id="updatePwd" value="확인"/></td>
		</tr>
	</table>
	<input type="hidden" name="id" id="id" value="${id}"/>
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