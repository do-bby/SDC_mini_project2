<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = "post" action = "/bootcampmoa/review/update">
 <input type="hidden" name="rnum" value="${vo.rnum}">
 굿  :<input id="good" type="text"  name="good" value="${ vo.good }">
 <br>
배드  :<input id="bad" type="text"  name="bad" value="${ vo.bad }">
 <br>
총점 :<input id="total" type="text"  name="total" value="${ vo.total }">
 <br>
강사진  :<input id="teachsat" type="text"  name="teachsat" value="${ vo.teachsat }">
 <br>
교육환경 :<input id="edusat" type="text"  name="edusat" value="${ vo.edusat }">
 <br>
학습 :<input id="learnsat" type="text"  name="learnsat" value="${ vo.learnsat }">
 <br>
날짜 :<input id="rdate" type="text"  name="rdate" value="${ vo.rdate }">
 <br>
<input type="hidden" name="mnum" value="0">
<input type="hidden" name="bnum" value="0">
<input type = "submit" value = "수정">
 </form>
</body>
</html>