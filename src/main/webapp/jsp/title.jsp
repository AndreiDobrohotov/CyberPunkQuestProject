<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <div class="block neon_static">
        <p>${currentEvent.getTextContent()}</p>
    </div>
    <div>
        <div class="half-width neon_static">
            <p>${currentEvent.getFemaleCharName()}</p>
            <img class="img_class neon_static" src="../images/mira.png">
            <p>${currentEvent.getFemaleCharBio()}</p>
        </div>

        <div class="half-width neon_static">
            <p>${currentEvent.getMaleCharName()}</p>
            <img class="img_class neon_static" src="../images/isaac.png">
            <p>${currentEvent.getMaleCharBio()}</p>
        </div>
    </div>
    <form action="/game" method="POST">
        <input type="hidden" name="selectedAction" value="begin">
        <input type="submit" class="block neon" value="Начать игру">
    </form>
</body>
</html>
