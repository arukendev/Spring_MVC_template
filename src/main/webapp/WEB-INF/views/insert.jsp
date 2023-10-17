<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<div style="width: inherit; height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center">
		<form action="insert/set" method="post">
			<div style="display:flex; flex-direction: column; gap: 10px;">
				<div>
					<label for="name">Name</label>
					<input name="test_name" id="name" />
				</div>
				<div>
					<label for="age">Age</label>
					<input name="test_age" id="age" />
				</div>
				<c:if test="${not empty alert}">
					<span>${alert}</span>
				</c:if>
				<button id="submit">submit</button>
				<button type="button" onclick="location.href = '/app'">cancel</button>
			</div>
		</form>
	</div>
<script>
const name = document.querySelector("#name");
const age = document.querySelector("#age");

const submit = document.querySelector("#submit");

function errorHandler(name, age) {
	if (name === "" || age === "") return false;
	if (!(/^[1-9]\d{0,2}$/g.test(age))) return false;
	if (name.length > 100) return false;
	return true;
}

submit.addEventListener("click", (event) => {
	if (!errorHandler(name.value, age.value)) {
		alert("Error Occurrence!");
		event.preventDefault();
	}
});
</script>
</body>
</html>