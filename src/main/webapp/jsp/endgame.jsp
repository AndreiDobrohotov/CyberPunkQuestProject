<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <c:if test = "${currentEvent.getType() eq 'WIN'}">
        <div class="block green_neon good_end">
            <label>~ Хорошая концовка ~</label>
        </div>
        </c:if>
    <c:if test = "${currentEvent.getType() eq 'LOSE'}">
        <div class="block neon_selected bad_end">
            <label>~ Плохая концовка ~</label>
        </div>
    </c:if>
    <div class="block neon_static">
        <p>${currentEvent.getTextContent()}</p>
    </div>

    <form action="/game" method="POST">
        <input type="hidden" name="selectedAction" value="title">
        <input type="submit" class="block neon" value="Начать заного">
    </form>
</body>
</html>
