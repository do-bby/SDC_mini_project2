<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	
	

</style>

<script type="text/javascript">
/* 	function checkvalue() {
		var form = document.userInfo;

		if (form.id.value == "") {
			alert("아이디를 입력하세요");
			return false;
		}

		if (form.pwd.value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}

		if (form.name.value == "") {
			alert("이름을 입력하세요");
			return false;
		}

		if (form.email.value == "") {
			alert("이메일을 입력하세요");
			return false;
		}

		if (form.phone.value == "") {
			alert("전화번호를 입력하세요");
			return false;
		}

		if (form.nickname.value == "") {
			alert("닉네임을 입력하세요");
			return false;
		}
		if (form.profile.value == "") {
			alert("프로필을 입력하세요");
			return false;
		}

		if (form.question.value == "") {
			alert("보안 질문을 입력하세요");
			return false;
		}

		if (form.answer.value == "") {
			alert("답변을 입력하세요");
			return false;
		}

		if (form.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요");
			return false;
		}

		if (form.nickDuplication.value != "nickCheck") {
			alert("닉네임 중복체크를 해주세요");
			return false;
		}

	}

	function openIdCheck() {
		window.name = "parentForm";
		window.open("IdCheckForm.jsp", "idchkForm", "width=700,height=300");
	}

	function opennickCheck() {
		window.name = "parentForm";
		window.open("NickCheckForm.jsp", "nickchkForm", "width=700,height=300");
	}
	console.log("submit clicked"); */
</script>
</head>
<body>
	<div class="wrap">
		<form  method="post" action="/bootcampmoa/insertNewmember">
		<input type="hidden" value="memberRegister"> 
		<input type="hidden" name ="mlevel" value=0>
		<input type="text" name="id" autocomplete="off" placeholder="아이디를 입력하세요" style="width: 75%;" required> 
	<!-- 	<input type="button" value="중복확인" style="width: 130px ;height:50px; margin:0 0 0 0;" onclick="openIdCheck()"> -->
		<!-- <input type="hidden" name="idDuplication" value="idUncheck"> -->
		<input type="password" name="pwd" autocomplete="off"placeholder="패스워드를 입력하세요" required><br> 
		<input type="text" name="name" autocomplete="off" placeholder="이름을 입력하세요" required><br> 
		<input type="text" name="email" autocomplete="off" placeholder="이메일을 입력하세요(예시_myemail@naver.com)" required><br> 
		<input type="text" name="phone" autocomplete="off" placeholder="전화번호를 입력하세요('-'없이 입력해주세요)" maxlength ="11" required><br> 
		<input type="text" id = "nickname" name="nickname" autocomplete="off" style="width: 75%;"placeholder="닉네임을 입력하세요" required>
	<!-- 	<input type="button" value="중복확인" style="width: 130px;height:50px;  margin:0 0 0 0;" onclick="opennickCheck()"> -->
		<input type="hidden" name="nickDuplication" value="nickUncheck">
		<input type="text" name="profile" placeholder ="프로필 문구를 작성해주세요" >
		<select name="question">
		<option value="none">== 보안질문 1개 선택 ==</option>
		<option value="1">어머니의 성함은?</option>
		<option value="2">아버지의 성함은?</option>
		<option value="3">나의 보물1호는?</option>
		<option value="4">기억에 남는 추억의 장소는?</option>
		<option value="5">기억에 남는 추억의 선물은?</option>
		<option value="6">인상 깊게 읽은 책 이름은?</option>
		<option value="7">다시 태어나면 되고 싶은 것은?</option>
		<option value="8">내가 좋아하는 책 이름은?</option>
		</select>
		<br>
								
		<input placeholder="답변을 입력하세요." name="answer" required><br>
		<input type="submit" class="button" value="회원가입 완료하기"> <!-- checkvalue일단 생략 -->
							
	</form>
	<script>
	
	</script>
	<!-- 	<script>
		alert('${ msg }');
		</script> -->
	<%-- <a href="${header.referer}">메인페이지로 돌아가기</a> --%>

</div>
</body>
</html>