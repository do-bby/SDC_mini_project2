<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.ArrayList, vo.MemberVO"%>
<%@ page import ="dao.MemberMyBatisDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
	
	.infobutton{
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
	
	.q, input[type=text]{
	height:100%;
	width:100%;
	border-radius: 10px;
	border-color:  #DCD6D0;
	border-width: .1px;
	}
	
	.q:focus, input[type=text]:focus{
	outline:none;
	color: #111;
    background: #ffff;
    box-shadow: 0 0 5px #04BEBD;
	}

</style>


<script type="text/javascript">
function checkvalue() {
	var form = document.userInfo;

	if (form.id.value == "") {
		alert("아이디를 입력하세요");
		form.id.focus();
		return false;
	}

	if (form.pwd.value == "") {
		alert("비밀번호를 입력하세요");
		form.pwd.focus();
		return false;
	}

	if (form.name.value == "") {
		alert("이름을 입력하세요");
		form.name.focus();
		return false;
	}

	if (form.email.value == "") {
		alert("이메일을 입력하세요");
		form.email.focus();
		return false;
	}

	if (form.phone.value == "") {
		alert("전화번호를 입력하세요");
		form.phone.focus();
		return false;
	}

	if (form.nickname.value == "") {
		alert("닉네임을 입력하세요");
		form.nickname.focus();
		return false;
	}
	if (form.profile.value == "") {
		alert("프로필을 입력하세요");
		form.profile.focus();
		return false;
	}

	if (form.question.value == "") {
		alert("보안 질문을 입력하세요");
		form.question.focus();
		return false;
	}

	if (form.answer.value == "") {
		alert("답변을 입력하세요");
		form.answer.focus();
		return false;
	}

	if (form.idDuplication.value != "idCheck") {
		alert("아이디 중복체크를 해주세요");
		form.id.focus();
		return false;
	}

	if (form.nickDuplication.value != "nickCheck") {
		alert("닉네임 중복체크를 해주세요");
		form.nickname.focus();
		return false;
	}
	
	form.submit();

	if ("${ !empty msg }")
		alert('${ msg }');
	

}

function opennickCheck() {
    var inputValue = document.getElementById("nickname").value;
    if(inputValue==""){
    	alert("닉네임을 입력하세요");
    }else{
    var xhr = new XMLHttpRequest();
	xhr.onload = function () {
		if(xhr.status == 200) {				
			let jsondom = JSON.parse(xhr.responseText);
			if (jsondom.isDuplicate == true)
				alert("이미 존재하는 닉네임입니다");
			else
				alert("사용가능한 닉네임입니다");
				document.userInfo.nickDuplication.value ="nickCheck";
		}
	};
	xhr.open("GET", "/bootcampmoa/duplicateCheck?input="+inputValue+"&type=nick", true);
	xhr.send();		
	}
}

function openIdCheck() {
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
	xhr.send();		
	}
}
</script>
</head>
<body>
<div class="wrap">
	<h2>회원정보 수정</h2>
	<form method="GET" name="userInfo" action="/bootcampmoa/updateMemberInfo" >
	<table class="userinfo">
			<tr>
			<td>아이디</td>
			<td><input type="text" name="id" id ="id" value="${val.id}" style="width:85%;">
			<input type="button" value="중복확인" onclick="openIdCheck()">
			<input type="hidden" name="idDuplication" value="idUncheck"></td>
			</tr>
			
			<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pwd" value="${val.pwd}"></td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="${val.name}"></td>
			</tr>
			
			<tr>
			<td>프로필</td>
			<td><input type="text" name="profile" value="${val.profile}"></td>
			</tr>
			
			<tr>
			<td>이메일</td>
			<td><input type="text" name="email" value="${val.email}"></td>
			</tr>
			
			<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone" value="${val.phone}"></td>
			</tr>
			
			<tr>
			<td>닉네임</td>
			<td><input type="text" name="nickname" id ="nickname" value="${val.nickname}" style="width:85%;">
			<input type="button" value="중복확인" onclick="opennickCheck()">
			<input type="hidden" name="nickDuplication" value="nickUncheck"></td>
			</tr>
			
			<tr>
			<td>보안 질문</td>
			<td>
			<c:if test="${val.question == 1}">
           		<c:set var="now" value="어머니의 성함은?" />
        	</c:if>
        	<c:if test="${val.question == 2}">
            	<c:set var="now" value="아버지의 성함은?" /></c:if>
            <c:if test="${val.question == 3}">
            	<c:set var="now" value="나의 보물1호는?" /></c:if>
            <c:if test="${val.question == 4}">
            	<c:set var="now" value="기억에 남는 추억의 장소는?" /></c:if>
            <c:if test="${val.question == 5}">
            	<c:set var="now" value="기억에 남는 추억의 선물은?" /></c:if>
            <c:if test="${val.question == 6}">
            	<c:set var="now" value="인상 깊게 읽은 책 이름은?" /></c:if>
            <c:if test="${val.question == 7}">
            	<c:set var="now" value="다시 태어나면 되고 싶은 것은?" /></c:if>
            <c:if test="${val.question == 8}">
            	<c:set var="now" value="내가 좋아하는 책 이름은?" /></c:if>	
			<select name="question" class="q">
								<option value="${val.question}">${now}</option>
								<option value="1">어머니의 성함은?</option>
								<option value="2">아버지의 성함은?</option>
								<option value="3">나의 보물1호는?</option>
								<option value="4">기억에 남는 추억의 장소는?</option>
								<option value="5">기억에 남는 추억의 선물은?</option>
								<option value="6">인상 깊게 읽은 책 이름은?</option>
								<option value="7">다시 태어나면 되고 싶은 것은?</option>
								<option value="8">내가 좋아하는 책 이름은?</option>
								</select>
								</td>	
			</tr>
			<tr><td>
			<input type="hidden" name="mnum" value="${val.mnum}">
			</td></tr>
			<tr>
			<td>답변</td>
			<td><input type="text" name="answer" value="${val.answer}"></td>
			</tr>

	</table>

	<input type="submit" class="infobutton" value="수정 완료" onclick="return checkvalue()">
	<button type="button" class="infobutton" onclick="location.href='viewMemberInfo'">뒤로가기</button>
</form>
	
</div>
</body>
