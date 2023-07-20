<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
/*
$(function(){
	
	function findone(idx){
		//alert(idx);
		
	$.ajax({
		url: "/findone",
		contentType: "application/x-www-form-urlencoded",
		data: { 'idx': idx },
		success: function(result) {
			console.log(result);
			var obj = JSON.parse(result);
			var content = `번호: ${obj.idx}<br>이름: ${obj.name}<br>전화번호: ${obj.hp}<br>메모: ${obj.memo}`;
			$('#findone').html(content);
		}
	});
	}
})
*/

function findone(idx) {
		//alert(idx);
		$.ajax({
			url: "/findone",
			contentType: "application/x-www-form-urlencoded",
			data: { 'idx': idx },
			success: function(result) {
				console.log(result);
				//var obj = JSON.parse(result); 	
				var content = `번호: \${result.idx}<br>이름: \${result.name}<br>전화번호: \${result.hp}<br>메모: \${result.memo}`;
				$('#findOne').html(content);
			}
		});
	}
</script>
</head>
<body>
	<form action="insert">
		<input type="text" id="name" name="name" placeholder="이름입력"><br>
		<input type="text" id="hp" name="hp" placeholder="전화번호입력"><br>
		<input type="text" id="memo" name="memo" placeholder="메모입력"><br>
		<input type="submit" value="전화번호 입력">
	</form>
	<div id="list">
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>메모</th>
			</tr>
			<!-- <tr><td>1</td><td>홍길동</td><td>010-1111-1111</td><td>친구</td></tr> -->
			<c:forEach var="pb" items="${list}">
				<tr>
					<td onclick="findone(${pb.idx});">${pb.idx}</td>
					<td>${pb.name}</td>
					<td>${pb.hp}</td>
					<td>${pb.memo}</td>
				</tr>
			</c:forEach>

		</table>
	</div>

	<div id="findOne">
	
	</div>
</body>
</html>