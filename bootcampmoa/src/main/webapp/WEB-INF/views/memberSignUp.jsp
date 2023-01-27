<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	*{
	margin:0;
	padding:0;
	}
	
	body{
	height:100vh;
	background: #f5f5f5;
	}
	
	
	select,input{
	text-align:left;
	margin-left: 120px;
	margin-right: auto;
	padding: 10px;
	background-color:#FFFFFF;
	margin: 10px;
	width: 70%;
	}
	
	select{
	width: 72%;
	}
	
	h1{
	margin-top: 10%;
	margin-left: 120px;
	color:#ffff;
	padding: 10px;
	text-align: center;
	position: relative;
	display: inline-block;
	}
	
	h1:after{
	content:'';
	background:#04BEBD;
	width:100%;
	height:2px;
	display:block;
	}
	
	div.wrap{
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
	
	.button{
	text-align: center;
	width: 200px;
	border:0;
	font-size:14px;
	background: #4aa8d8 ;
	color:#ffff;
	}
	
	
	input[type=button]{
	text-align: center;
	height: auto;
	width: 100px;
	border:0;
	font-size:14px;
	background:#04BEBD;
	color:#ffff;
	}
	
	form{
	padding-left: 120px;
	padding-top: 20px;
	margin-left: auto;
	margin-right:auto;
	height: auto;
	text-align: left;
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
	<h1 onload="location.href='/bootcampmoa/memberSignup'">BootMoA 회원가입</h1>
		<form method="POST" action="/bootcampmoa/insertNewmember" name="userInfo" >
			<input type="hidden" name="mlevel" value=0> <input
				type="text" name="id" id = "id" autocomplete="off" placeholder="아이디를 입력하세요"  required>
			<input type="button" value="중복확인"  onclick="openIdCheck()">
			<input type="hidden" name="idDuplication" value="idUncheck">
			<input type="password" name="pwd" autocomplete="off"
				placeholder="패스워드를 입력하세요" required><br> <input
				type="text" name="name" autocomplete="off" placeholder="이름을 입력하세요"
				required><br> <input type="text" name="email"
				autocomplete="off" placeholder="이메일을 입력하세요(예시_myemail@naver.com)"
				required><br> <input type="text" name="phone"
				autocomplete="off" placeholder="전화번호를 입력하세요('-'없이 입력해주세요)"
				maxlength="11" required><br> 
				<input type="text" name="nickname" id="nickname" autocomplete="off" placeholder="닉네임을 입력하세요" required>
			<input type="button" value="중복확인" onclick="opennickCheck()"> 
			<input type="hidden" name="nickDuplication" value="nickUncheck">
			<select name="question">
				<option value="none">== 보안질문 1개 선택 ==</option>
				<option value="어머니의 성함은?">어머니의 성함은?</option>
				<option value="아버지의 성함은?">아버지의 성함은?</option>
				<option value="나의 보물1호는?">나의 보물1호는?</option>
				<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
				<option value="기억에 남는 추억의 선물은?">기억에 남는 추억의 선물은?</option>
				<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
				<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
				<option value="내가 좋아하는 책 이름은?">내가 좋아하는 책 이름은?</option>
			</select> <br> 
			<input placeholder="답변을 입력하세요." name="answer" required><br>
			<input type="submit" class="button" value="회원가입 완료하기" onclick="return checkvalue()">


		</form>
	

	</div>
</body>
</html>