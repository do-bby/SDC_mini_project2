<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
<c:if test="${ !empty list }" >
	<h1 onclick="location.href='/bootcampmoa/reviews'">리뷰 리스트</h1>
	<hr>
	<table>
		<c:forEach var="vo"  items="${list}">
			<tr>
			<td class="${vo.rnum}">${ vo.rnum }</td>
			<td class="${vo.rnum}">${ vo.good }</td>
			<td class="${vo.rnum}">${ vo.bad }</td>
			<td class="${vo.rnum}">${ vo.total }</td>
			<td class="${vo.rnum}">${ vo.teachsat }</td>
			<td class="${vo.rnum}">${ vo.edusat }</td>
			<td class="${vo.rnum}">${ vo.learnsat }</td>
			<td class="${vo.rnum}">${ vo.rdate }</td>
			<td class="${vo.rnum}">${ vo.mnum }</td>
			<td class="${vo.rnum}">${ vo.bnum }</td>
			
			
			<td><button type="button" onclick="location.href='/bootcampmoa/review/delete?id=${vo.rnum}'">삭제</button></td>
			<td><button type="button" onclick="location.href='/bootcampmoa/review?id=${vo.rnum}'">수정</button></td>
	</c:forEach>
	</table>
</c:if>
<c:if test="${ !empty msg }" >
	<script>
		alert('${ msg }');
	</script>
</c:if>
<form method = "post" action = "/bootcampmoa/review/insert">
 <input type="hidden" name="rnum" value="0">
 굿  :<input id="good" type="text"  name="good">
 <br>
배드  :<input id="bad" type="text"  name="bad">
 <br>
총점 :<input id="total" type="text"  name="total">
 <br>
강사진  :<input id="teachsat" type="text"  name="teachsat">
 <br>
교육환경 :<input id="edusat" type="text"  name="edusat">
 <br>
학습 :<input id="learnsat" type="text"  name="learnsat">
 <br>
날짜 :<input id="rdate" type="text"  name="rdate">
 <br>
<input type="hidden" name="mnum" value="0">
<input type="hidden" name="bnum" value="0">
 <input type = "submit" value = "등록">
 </form>


</body>
</html>