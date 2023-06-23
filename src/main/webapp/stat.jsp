<%--
  Created by IntelliJ IDEA.
  User: StormMaster
  Date: 17.06.2023
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
<div class="sticky-window neon_static">
    <label>Статистика:</label><br>
    <label>IP адрес: <%= request.getRemoteAddr() %></label><br>
    <label>Имя: <%= session.getAttribute("name") %></label><br>
    <label>Имя события <%= session.getAttribute("eventName") %></label><br>
    <label>Количество выборов: <%= session.getAttribute("count") %></label>
</div>

</body>
</html>
