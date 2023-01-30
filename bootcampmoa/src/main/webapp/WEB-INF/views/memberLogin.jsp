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
<!-- <script>  
    // 'login'라는 id를 가진 버튼 클릭 시 실행.
    $("#login").click(function(){
    	alert("통신중");
            // json 형식으로 데이터 set
            var params = {
                      id      : $("#id").val()
                    , pwd     : $("#pwd").val()
            }
            // ajax 통신
            $.ajax({
                type : "POST",            // HTTP method type(GET, POST) 형식이다.
                url : "/selectLoginMember",      // 컨트롤러에서 대기중인 URL 주소이다.
                data : params,            // Json 형식의 데이터이다.
                success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    // 응답코드 > 0000
                    alert(res.code);
                },
                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    alert("통신 실패.");
                }
            });
        });  
</script> -->
<script>
var input = document.getElementById(id);
input.value = null;
</script>
<div class="wrap">
	<h2>로그인</h2>
	<form method="POST" name="userInfo" action="/bootcampmoa/selectLoginMember">
	<table class="userinfo">
		<tr>
		<td>아이디</td>
		<td><input type="text" name="id" id="id" placeholder="아이디를 입력하세요" required/></td>
		<td><input type="submit" class="infobutton" name="login" id="login" value="로그인"/></td>
		</tr>
		
		<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd" id="pwd" placeholder="패스워드를 입력하세요" required/></td>
		<td><button type="button" class="infobutton" onclick="location.href='findIdPage'">아이디찾기</button></td>
		<td><button type="button" class="infobutton" onclick="location.href='findPwdPage'">비밀번호찾기</button></td>
		</tr>
	</table>
	</form>
	<c:if test="${ !empty msg }" >
		<script>
			alert('${ msg }');
		</script>
	</c:if>

<%-- 	<a href="${header.referer}">메인페이지로 돌아가기</a> --%>
	<button type="button" class="infobutton" onclick="location.href='bootmoaMain'">메인화면으로</button>

</div>
</body>
</html>