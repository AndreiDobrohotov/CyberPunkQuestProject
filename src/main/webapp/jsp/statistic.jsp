<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" href="../css/styles.css">
</head>

<body>
    <div class="stat-win neon_static">
        <label>Статистика:</label><br>
        <label>IP адрес: <%= request.getRemoteAddr() %></label><br>
        <label>Количество игр: <%= session.getAttribute("gamesCount") %></label><br>
        <label>Хороших концовок: <%= session.getAttribute("winsCount") %></label><br>
        <label>Плохих концовок: <%= session.getAttribute("losesCount") %></label>
    </div>
</body>
</html>
