<html>
<head>
    <title>CyberPunkQuest</title>
    <%@ page contentType="text/html;charset=UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="../css/styles.css">
</head>

<body>
    <div class="field neon_static">
        <!-- окно статистики -->
        <jsp:include page="statistic.jsp"/>

        <!-- в зависимости от типа текущего события вплетаем нужную страницу -->
        <c:choose>
            <c:when test="${currentEvent.getType() eq 'TITLE'}">
                <jsp:include page="title.jsp"/>
            </c:when>
            <c:when test="${currentEvent.getType() eq 'NORMAL'}">
                <jsp:include page="event.jsp"/>
            </c:when>
            <c:when test="${currentEvent.getType() eq 'WIN'}">
                <jsp:include page="endgame.jsp"/>
            </c:when>
            <c:when test="${currentEvent.getType() eq 'LOSE'}">
                <jsp:include page="endgame.jsp"/>
            </c:when>
        </c:choose>
    </div>
</body>

<script>
    let selectedAction;

    //функция подсветки для радио-кнопок при нажатии/отжатии
    function handleClick(radio) {
        if(radio!==selectedAction){
            radio.querySelector('input[type="radio"]').checked = true;
            radio.classList.add('neon_selected');
            radio.classList.remove('neon');
            let temp = selectedAction;
            selectedAction = radio;
            temp.classList.add('neon');
            temp.classList.remove('neon_selected');
        }
        else{
            radio.querySelector('input[type="radio"]').checked = false;
            radio.classList.add('neon');
            radio.classList.remove('neon_selected');
            selectedAction = null;
        }
    }
</script>
</html>