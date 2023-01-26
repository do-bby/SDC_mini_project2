<%@page import="vo.MemberVO"%>
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

${sessionScope.vo == null}
${sessionScope.vo != null}
<% 
	MemberVO vo = (MemberVO)session.getAttribute("vo");
%>
<%= vo.getId() %> 님 안녕하세요.
<input type="button" name="logout" id="logout" value="로그아웃" onClick="javascript:logout()"/>
<input type="button" name="deleteMember" id="deleteMember" value="회원탈퇴" onClick="javascript:withdrawal()"/>
<script>
	function logout(){
	    let form = document.createElement('form');//여기서 폼태그 만듬
	    form.setAttribute('method', 'post'); //메서드는 포스트로
	    form.setAttribute('action', 'memberlogout');//PostMapping 괄호안 값을 넣으면됨
	    document.body.appendChild(form);
	    form.submit();
	}
	
	function withdrawal(){
		let form = document.createElement('form');//여기서 폼태그 만듬
	    form.setAttribute('method', 'post'); //메서드는 포스트로
	    form.setAttribute('action', 'deleteMember');//PostMapping 괄호안 값을 넣으면됨
	    document.body.appendChild(form);
	    form.submit();
	}
</script>
</body>
</html>