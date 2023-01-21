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


<script>
function openIdCheck(){
	window.name = "parentForm";
	window.open("IdCheckForm.jsp","idchkForm","width=500,height=300");
}	

function opennickCheck(){
	window.name = "parentForm";
	window.open("NickCheckForm.jsp","nickchkForm","width=500,height=300");
}
</script>
</head>
<body>
<div class="wrap">

<c:if test="${ !empty list }" >
	<h2 onclick="location.href='/bootcampmoa/updateMemberInfo">회원정보 수정</h2>
	<!-- MemberController에서 로그인 후 저장된 addMember된 member을 가져와서 mnum을 넣어줘야 함. 현재는 임의로 getMnum으로 값을 넣은 상태 -->
	<table class="userinfo">
		<c:forEach var="vo" items="${list}">	
			<tr>
			<td>아이디</td>
			<td><input type="text" name="mid" id ="id" value=${vo.id} style="width:85%;">
			<input type="button" value="중복확인" onclick="openIdCheck()">
			<input type="hidden" name="idDuplication" value="idUncheck"></td>
			</tr>
			
			<tr>
			<td>비밀번호</td>
			<td><input type="text" name="mpwd" value=${vo.pwd}></td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td><input type="text" name="mname" value=${vo.name}></td>
			</tr>
			
			<tr>
			<td>프로필</td>
			<td><input type="text" name="profile" value=${vo.profile}></td>
			</tr>
			
			<tr>
			<td>이메일</td>
			<td><input type="text" name="memail" value=${vo.email}></td>
			</tr>
			
			<tr>
			<td>전화번호</td>
			<td><input type="text" name="mpnum" value=${vo.phone}></td>
			</tr>
			
			<tr>
			<td>닉네임</td>
			<td><input type="text" name="mnname" id ="nick" value=${vo.nickname} style="width:85%;">
			<input type="button" value="중복확인" onclick="opennickCheck()">
			<input type="hidden" name="nickDuplication" value="nickUncheck"></td>
			</tr>
			
			<tr>
			<td>보안 질문</td>
			<td>
			<select name="mquestion" class="q">
								<option value=${vo.question}>${vo.question}</option>
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
			<input type="hidden" name="mnum" value=${vo.mnum}>
			</td></tr>
			<tr>
			<td>답변</td>
			<td><input type="text" name="manswer" value=${vo.answer}></td>
			</tr>
</c:forEach>
	</table>
</c:if>

<c:if test="${ !empty msg }" >
	<script>
		alert('${ msg }');
	</script>
</c:if>

	<input type="submit" class="infobutton" value="수정 완료">
	<button type="button" class="infobutton" onclick="location.href='MemberInfo.jsp'">뒤로가기</button>

	
</div>
</body>
