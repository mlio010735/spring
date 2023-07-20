<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
function send(){
	$('div').load("/form.html");
}
$(function(){
	$('#btn').click(function(){
		$('div').load("/text.txt");
	})
});
</script>
</head>
<body>
<input type="button" onclick="send()" value="ajax실헹">
<input type="button" id="btn" value="juery ajax실헹">
<form action="insert">
<input type="text" id="name" name="name" placeholder="이름입력"><br>
<input type="text" id="hp" name="hp" placeholder="전화번호입력"><br>
<input type="text" id="memo" name="memo" placeholder="메모입력"><br>
<input type="submit" value="전화번호 입력">
</form>
<div id="list">

</div>
<script>
$('#list').load('/findAll');
/*
$.ajax({
	url : "/findAll",
	success:function(result){
		$('#list').val(result);
	}
});
*/
</script>
</body>
</html>