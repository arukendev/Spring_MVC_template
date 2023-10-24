<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert</title>
    <style>
      .insert_container {
        width: inherit;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .insert_form {
        display: flex;
        flex-direction: column;
        gap: 10px;
      }

      #preview {
        max-height: 500px;
      }
    </style>
  </head>
  <body>
    <div class="insert_container">
      <form action="insert/set" method="post" enctype="multipart/form-data">
        <div class="insert_from">
          <div>
            <img id="preview" />
          </div>
          <div>
            <label for="img">Img</label>
            <input name="file_img" id="img" type="file" accept="image/*" />
          </div>
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
      const file = document.querySelector("#img");
      const name = document.querySelector("#name");
      const age = document.querySelector("#age");

      const preview = document.querySelector("#preview");
      const submit = document.querySelector("#submit");

      function errorHandler(file, name, age) {
        if (!file) return "파일 업로드 해줘";
        if (name === "") return "이름 입력 해줘";
        if (age === "") return "나이 입력 해줘";
        if (name.length > 100) return "이름 100자 이내 해줘";
        if (!/^[1-9]\d{0,2}$/g.test(age)) return "나이 제대로 입력 해줘";
        return "good";
      }

      submit.addEventListener("click", (event) => {
        if (errorHandler(file.value, name.value, age.value) !== "good") {
          alert(errorHandler(file.value, name.value, age.value));
          event.preventDefault();
        }
      });

      file.addEventListener("change", () => {
        if (file.files[0]["type"].split("/")[0] !== "image") {
          alert("이미지로 업로드 해줘");
          file.value = "";
          preview.src = "";
        } else {
          const reader = new FileReader();
          reader.onload = (event) => (preview.src = event.target.result);
          reader.readAsDataURL(file.files[0]);
        }
      });
    </script>
  </body>
</html>
