<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
</head>
<body>
<form action="/game" method="POST">
    <div class = "block neon_static">
        <p>${currentEvent.getTextContent()}</p>
    </div>
    <c:forEach var="action" items="${currentEvent.getActions()}">
        <div class="block neon" onclick="handleClick(this)">
            <input type="radio"
                   name="selectedAction"
                   value="${action.getNextEvent()}">
            <label>${action.getTextContent()}</label>
        </div>
    </c:forEach>
    <input type="submit" class="button_class neon" value="Выбрать">
</form>
</body>
</html>
