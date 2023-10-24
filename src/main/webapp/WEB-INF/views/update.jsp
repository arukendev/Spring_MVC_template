<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>${member.test_name}'s update</title>
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

      #preview {
        max-height: 500px;
      }
    </style>
  </head>
  <body>
    <div class="update_container">
      <form
        action="${member.test_id}"
        method="post"
        enctype="multipart/form-data"
      >
        <div class="update_form">
          <c:if test="${empty member.test_img}">
            <div>
              <span>사진을 넣어주세요!!</span>
            </div>
          </c:if>
          <div>
            <img id="preview" src="/app/resources/upload/${member.test_img}" />
            <input
              type="hidden"
              value="${member.test_img}"
              id="previous"
              name="test_img"
            />
          </div>
          <div>
            <label for="img">Img</label>
            <input name="file_img" id="img" type="file" accept="image/*" />
          </div>
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
      const file = document.querySelector("#img");
      const name = document.querySelector("#name");
      const age = document.querySelector("#age");

      const preview = document.querySelector("#preview");
      const previous = document.querySelector("#previous");
      const submit = document.querySelector("#submit");

      function errorHandler(file, name, age) {
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
        if (!file.value)
          preview.src = "/app/resources/upload/" + previous.value;
        if (file.files[0]["type"].split("/")[0] !== "image") {
          alert("이미지로 업로드 해줘");
          file.value = "";
          preview.src = "/app/resources/upload/" + previous.value;
        } else {
          const reader = new FileReader();
          reader.onload = (event) => (preview.src = event.target.result);
          reader.readAsDataURL(file.files[0]);
        }
      });
    </script>
  </body>
</html>
