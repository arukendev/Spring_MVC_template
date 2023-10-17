<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member.test_name}'s detail</title>
</head>
<body>
	<div style="width: inherit; height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center; gap: 30px;">
		<div style="display: flex; flex-direction: column; gap: 20px;">
			<div style="display: flex; gap: 20px;">
				<label>Name</label>
				<span>${member.test_name}</span>
			</div>
			<div style="display: flex; gap: 20px;">
				<label>Age</label>
				<span>${member.test_age}</span>
			</div>
			<c:if test="${not empty alert}">
				<span>${alert}</span>
			</c:if>
		</div>
		<div style="display:flex; flex-direction: column; align-items: center; gap: 20px;">
			<form action="update/${member.test_id}">			
				<button>go to update</button>
			</form>
			<form action="delete/${member.test_id}" method="post">
				<input type="hidden" name="_method" value="delete" />
				<button id="deleteBtn">delete this member</button>
			</form>
			<form action="/app">			
				<button>go back</button>
			</form>
		</div>
	</div>
<script>
const deleteBtn = document.querySelector("#deleteBtn");

deleteBtn.addEventListener("click", (event) => {
	if (!confirm("are you sure?")) event.preventDefault();
});
</script>
</body>
</html>