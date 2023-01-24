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
<form  method="post" action="/bootcampmoa/selectLoginMember">
	<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" required/><br>
	<input type="password" name="pwd" id="pwd" placeholder="패스워드를 입력하세요" required/>
	<input type="submit" name="login" id="login" value="로그인"/>
</form>
<c:if test="${ !empty msg }" >
	<script>
		alert('${ msg }');
	</script>
</c:if>
<div>
</div>
</body>
</html>