<html>
<head>
    <title>RPG</title>
    <meta charset="utf-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
</head>
    <body onload="test()">

    <div id = "event">
    </div>

    <button class = "saveButton" id = "butt" >
        <label>choose</label>
    </button>
    <br>

    </body>




<script>

    function test() {
        $.ajax({
            url: '/event',
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                fillText(response);
            }
        });
    }

    function fillText(response){
        let event = document.getElementById("event");
        event.innerText="";

        let event_text = document.createElement("label");
        event_text.innerText = response.textContent;
        event.appendChild(event_text);
        event.appendChild(document.createElement("br"));

        let actions = response.actions;
        for (let i = 0; i < actions.length; i++) {
            let action = actions[i];

            let radioInput = document.createElement("input");
            radioInput.type = "radio";
            radioInput.name = "radio-btn";
            radioInput.value = action.nextEvent;

            let radioLabel = document.createElement("label");
            radioLabel.innerHTML = action.textContent;

            // Добавляем радио кнопку и описание в родительский элемент
            event.appendChild(radioInput);
            event.appendChild(radioLabel);
            event.appendChild(document.createElement("br"));
        }
    }

    $("#butt").click(function() {
        let selectedAnswer = $("input[name='radio-btn']:checked").val();
        $.ajax({
            url: '/event?p1='+selectedAnswer,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                console.log(response)
                fillText(response);
            }
        });
    });


    /*function answer(){

        let test = $("test_radio").html("Next event -> " + selectedValue)
        let selectedAnswer = $("input[name='radio-btn']:checked").val();
        //let radioButtons = document.getElementsByName("radio-btn");
        test.innerHTML = "Next event -> " + selectedValue;
        /*radioButtons.forEach(function(radioButton) {
            if (radioButton.checked) {
                test.innerHTML = "Следующий эвент -> " + radioButton.value;
            }
        });*/

</script>
</html>