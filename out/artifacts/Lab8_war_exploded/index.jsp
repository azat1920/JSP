<%--
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
            if(el.value > 3 || el.value < -5){
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
                <td><select name="R" style="width: 150px">
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
</div>
</body>
</html>
