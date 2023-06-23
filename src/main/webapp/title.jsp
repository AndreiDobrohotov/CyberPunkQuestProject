<%--
  Created by IntelliJ IDEA.
  User: StormMaster
  Date: 17.06.2023
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="field neon_static">
    <div class="block neon_static">
        <p>${title.getTextContent()}</p>
    </div>
    <div>
        <div class="half-width neon_static">
            <p>${title.getFemaleCharName()}</p>
            <img class="neon_static" src="images/char.png" style="width: 100%; height: auto;">
            <p class="small_text">
                ${title.getFemaleCharBio()}
            </p>
        </div>

        <div class="half-width neon_static">
            <p>${title.getMaleCharName()}</p>
            <img class="neon_static" src="images/char.png" style="width: 100%; height: auto;">
            <p class="small_text">
                ${title.getMaleCharBio()}
            </p>
        </div>
    </div>
</div>


</body>
</html>
