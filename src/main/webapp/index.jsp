<html>
<head>
    <title>RPG</title>
    <%@ page import="com.cyberpunk.Event" %>
    <%@ page import="com.cyberpunk.Action" %>
    <%@ page contentType="text/html;charset=UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="field neon_static">

        <c:choose>
            <c:when test="${currentEvent.getType() eq 'NORMAL'}">
                <h1>normal</h1>
            </c:when>
            <c:when test="${currentEvent.getType() eq 'WIN'}">
               <h1>победка</h1>
            </c:when>
            <c:when test="${currentEvent.getType() eq 'LOSE'}">
                <h1>оп лузерок</h1>
            </c:when>
            <c:otherwise>
                <h1>титульник</h1>
            </c:otherwise>
        </c:choose>
        <jsp:include page="title.jsp"/>
        <form action="/start" method="POST">
            <% Event currentEvent = (Event) session.getAttribute("currentEvent");%>
            <div class = "block neon_static">
                <p>${currentEvent.getTextContent()}</p>
            </div>
            <% for(Action action: currentEvent.getActions()) { %>
            <div class="block neon" onclick="handleClick(this)">
                <input type="radio"
                       name="selectedAction"
                       value="<%= action.getNextEvent() %>">
                <label><%= action.getTextContent() %></label>
            </div>
            <% } %>
            <input type="submit" class="button_class neon" value="Выбрать">
        </form>



        <jsp:include page="stat.jsp"/>

    </div>


</body>

<script>
    let selectedAction;

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