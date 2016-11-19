<%@page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="pack.Result"%>
<%@ page import="java.io.IOException" %><%--
Comments
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="ru" xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="utf-8">
    <title>Лабораторная работа №7</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">


    <script type="text/javascript">
        function CheckY(el){
            el.value = el.value.replace( /(-?\d*\.?\d*)[^\d]*/ , '$1' );
            if(el.value > 5 || el.value < -5){
                el.value = "";
            }
        }
        function CheckR(el) {
            el.value = el.value.replace(/(\d*\.?\d*)[^\d]*/, '$1');
            if (el.value > 5 || el.value < 2) {
                el.value = "";
            }
        }

    </script>


    <script type="text/javascript">
        function myFunc (e)
        {
            var R = document.getElementById("R");
            var r = R.options[R.selectedIndex].text;
            var evt = e ? e : window.event, src = evt.target ? evt.target : evt.srcElement,
                    abX = evt.pageX ? evt.pageX : evt.clientX, abY = evt.pageY ? evt.pageY : evt.clientY,
                    abL = abT = 0; while (src.offsetParent) {abL += src.offsetLeft; abT += src.offsetTop; src = src.offsetParent}
            var rzX = (abX - abL - 100) * (r/80),
                rzY = - (abY - abT - 99) * (r/80);

            var x = rzX.toFixed(2);
            var y = rzY.toFixed(2);


            alert ('X=' + x + '\nY=' + y + '\nR=' + r);
            sendParams(x,y,r);
        }

        function sendParams(x, y, r) {
            var xhr = new XMLHttpRequest();
            var params  = 'X=' + x + '&Y=' + y + '&R=' + r;
            xhr.open('POST', 'ControllerServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send(params);
            window.location = "ControllerServlet"
        }

        function postReqDel() {

            var xhr = new XMLHttpRequest();
            var params  = 'delete=' + true;
            xhr.open('POST', 'ControllerServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send(params);
            window.location = "ControllerServlet"
        }
    </script>


</head>



<body>
<div id="header">Лабораторная работа №8,
    Вариант: 232,
    Карапетян А.Р.,
    Группа: P3202.
</div>
<div>
    <form name="Form" action="ControllerServlet" method="post">
        <table  border="0" colspan="2" cellspacing="1">
            <tr>
                <td>
                </td>
                <td><img src="img/area.png" onclick="myFunc(event)"></td>
            </tr>

            <tr>
                <td>X:</td>
                <td>
                    -4<input name="X" style="margin-left: -45pt" type="radio" value="-4"/><Br>
                    -3<input name="X"  style="margin-left: -45pt" type="radio" value="-3"/><Br>
                    -2<input name="X"  style="margin-left: -45pt" type="radio" value="-2"/><Br>
                    -1<input name="X"  style="margin-left: -45pt" type="radio" value="-1"/><Br>
                    0<input name="X"  style="margin-left: -40pt" type="radio" value="0"/><Br>
                    1<input name="X"  style="margin-left: -40pt" type="radio" value="1"/><Br>
                    2<input name="X"  style="margin-left: -40pt" type="radio" value="2"/><Br>
                    3<input name="X"  style="margin-left: -40pt" type="radio" value="3"/><Br>
                    4<input name="X"  style="margin-left: -40pt" type="radio" value="4"/><Br>


                </td>
            </tr>
            <tr>
                <td>Y:</td>
                <td><input name="Y" oninput="CheckY(this)" width="150px" value="1" required></td>
            </tr>
            <tr>
                <td>R:</td>
                <td><select id="R" name="R" style="width: 150px">
                    <option>1</option>
                    <option>1.5</option>
                    <option>2</option>
                    <option>2.5</option>
                    <option>3</option>
                </select></td>
            </tr>
            <tr>
                <td colspan="2"><input id="button" type="submit"></td>
            </tr>

        </table>
    </form>

    <table  border="0" colspan="2" cellspacing="1">
        <tr><td>x</td><td>y</td><td>r</td><td>result</td></tr>
        <%

            String res = "ResultList";
            ArrayList<Result> arrayList = (ArrayList<Result>) application.getAttribute(res);

            if (arrayList != null) {
                for (Result item: arrayList) {
                    out.print("<tr>  <td>" + item.x + "</td>" +
                            "<td>" + item.y + "</td>" +
                            "<td>" + item.r + "</td>" +
                            "<td>" + item.s + "</td></tr>");
                }
            }  %>
        <tr>
            <td colspan="4"><button id="button2" onclick="postReqDel()">Очистить таблицу</button></td>
        </tr>
    </table>
</div>
</body>
</html>
