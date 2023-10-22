<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Home</title>
    <style>
      .home_container {
        width: inherit;
        display: flex;
        flex-direction: column;
        gap: 20px;
        align-items: center;
      }

      .home_info_container {
        display: flex;
        gap: 50px;
      }
    </style>
  </head>
  <body>
    <div class="home_container">
      <c:if test="${empty members}">
        <div>
          <span>데이터가 없습니다!!!</span>
        </div>
      </c:if>
      <c:forEach items="${members}" var="members">
        <div
          onclick="location.href = 'detail/${members.test_id}'"
          class="home_info_container"
        >
          <span>${members.test_name}</span>
          <span>${members.test_age}</span>
        </div>
      </c:forEach>
      <div>
        <c:if test="${alert}">
          <span>${alert}</span>
        </c:if>
        <button onclick="location.href = 'insert'">go to insert data</button>
      </div>
    </div>
  </body>
</html>
