<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>${member.test_name}'s update</title>
  </head>
  <style>
    .update_container {
      width: inherit;
      height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    .update_form {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .update_input_div {
      display: flex;
      gap: 20px;
    }
  </style>
  <body>
    <div class="update_container">
      <form action="${member.test_id}" method="post">
        <input type="hidden" name="_method" value="put" />
        <div class="update_form">
          <div class="update_input_div">
            <label for="name">Name</label>
            <input name="test_name" id="name" value="${member.test_name}" />
          </div>
          <div class="update_input_div">
            <label for="age">Age</label>
            <input name="test_age" id="age" value="${member.test_age}" />
          </div>
          <button id="submit">update this member</button>
          <button
            type="button"
            onclick="location.href = '/app/detail/${member.test_id}'"
          >
            go back
          </button>
        </div>
      </form>
    </div>
    <script>
      const name = document.querySelector("#name");
      const age = document.querySelector("#age");

      const submit = document.querySelector("#submit");

      function errorHandler(name, age) {
        if (name === "" || age === "") return false;
        if (!/^[1-9]\d{0,2}$/g.test(age)) return false;
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
