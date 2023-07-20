<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- div가 아래쪽에 있으므로 인식을 하지 못함 
<script>
$("div").load("/form.html");
</script> 
-->

<script>
<!-- $(document).ready(); or $(); -->
//$(document).ready() 문서를 미리 로드하고 처리되므로 div아래에 있어도 동작이 정상적으로 가능
$(document).ready(
function(){
	$("div").load("/form.html");
}
);
</script>
</head>
<body>
<div></div>
<!-- div태그를 인식하고 처리하므로 아래코드는 인식이 됨 -->
<!-- <script>
$("div").load("/form.html");
</script> -->
</body>
</html>