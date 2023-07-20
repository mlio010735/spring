<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phonebook</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
#insert {
	width: 100%;
	height: 200px;
	border: 1px solid black;
}

#list {
	width: 30%;
	height: 500px;
	border: 1px solid red;
	display: inline-block;
	float: left;
	overflow: scroll;
}

#findOne {
	width: 67%;
	height: 500px;
	border: 1px solid yellow;
	display: inline-block;
	float: right;
}
</style>
<body>
	<div id="insert">
		<h1>전화번호 입력</h1>
		<form action="/phone/insert" method="post">
			<input type="text" name="name" id="name" placeholder="이름 입력"><br>
			<input type="text" name="hp" id="hp" placeholder="전화번호 입력"><br>
			<input type="text" name="memo" id="memo" placeholder="메모 입력"><br>
			<input type="submit" value="전화번호부 저장">
		</form>
	</div>

	<div id="main">
		<div id="list">
			<h1>전화번호부</h1>
			<div>
				<input type="text" id="searchInput"> <input type="button"
					value="검색" onclick="searchPhonebook()">
			</div>
			<c:forEach var="pb" items="${list}">
				<div
					onclick="check('${pb.idx}', '${pb.name}', '${pb.hp}', '${pb.memo}')">
					${pb.idx}&nbsp;&nbsp; ${pb.name}&nbsp;&nbsp; ${pb.hp}&nbsp;&nbsp;
					${pb.memo}</div>
				<hr>
			</c:forEach>
		</div>
	</div>

	<div id="findOne">
		<form id="updateForm" action="/phone/update" method="post">
			<br> <br>
			<h2>전화번호부 정보</h2>
			<input type="hidden" name="idx" id="pbIdx">
			<p>
				<input type="text" name="name" id="pbName" placeholder="이름">
			</p>
			<p>
				<input type="text" name="hp" id="pbHp" placeholder="전화번호">
			</p>
			<p>
				<input type="text" name="memo" id="pbMemo" placeholder="메모">
			</p>
			<div>
				<input type="submit" value="수정">
				<button onclick="deletePhonebook()">삭제</button>
			</div>
		</form>
	</div>




	<script>
		function check(pbIdx, name, hp, memo) {
			document.getElementById("pbIdx").value = pbIdx;
			document.getElementById("pbName").value = name;
			document.getElementById("pbHp").value = hp;
			document.getElementById("pbMemo").value = memo;
		}

		function editPhonebook() {
			var pbIdx = document.getElementById("pbIdx").value;
			var pbName = document.getElementById("pbName").value;
			var pbHp = document.getElementById("pbHp").value;
			var pbMemo = document.getElementById("pbMemo").value;

			document.getElementById("updateIdx").value = pbIdx;
			document.getElementById("updateName").value = pbName;
			document.getElementById("updateHp").value = pbHp;
			document.getElementById("updateMemo").value = pbMemo;

			document.getElementById("updateForm").style.display = "block";
		}

		function deletePhonebook() {
			var pbIdx = document.getElementById("pbIdx").value;
			$.ajax({
				url : "/phone/delete",
				type : "POST",
				data : {
					idx : pbIdx
				},
				success : function(response) {
					location.reload();
				},
			});
		}
		// 이전 코드는 생략하고 검색 기능만 추가합니다.
		function searchPhonebook() {
			var keyword = document.getElementById("searchInput").value;
			$.ajax({
				url : "/phone/search",
				type : "GET",
				data : {
					keyword : keyword
				},
				success : function(response) {
					// 서버에서 받은 검색 결과를 처리하는 로직
					if (response && response.length > 0) {
						// 검색 결과를 list에 추가
						var listDiv = document.getElementById("list");
						listDiv.innerHTML = ""; // 기존 목록 초기화
						for (var i = 0; i < response.length; i++) {
							var pb = response[i];
							var div = document.createElement("div");
							div.onclick = function() {
								check(pb.idx, pb.name, pb.hp, pb.memo);
							};
							div.textContent = pb.idx + " " + pb.name + " "
									+ pb.hp + " " + pb.memo;
							listDiv.appendChild(div);
							listDiv.appendChild(document.createElement("hr"));
						}
					} else {
						alert("검색 결과가 없습니다.");
					}
				},
				error : function() {
					alert("검색 중 오류가 발생했습니다.");
				}
			});
		}
	</script>
</body>
</html>
