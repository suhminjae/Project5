<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: seominjae
  Date: 2022/12/02
  Time: 1:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    h1{
        color: #6E0929FF;

    }
</style>
<body>
<h1>FIFA WORLD CUP</h1>
<form:form modelAttribute="u" method="post" action="../editok">
    <form:hidden path="seq"/>
    <table id="edit">
        <tr><td>경기</td><td><form:select onchange="categoryChange(this)" path="title" >
        <form:option value="">예선</form:option>
        <form:option value="a조">a조</form:option>
        <form:option value="b조">b조</form:option>
        <form:option value="c조">c조</form:option>
        <form:option value="d조">d조</form:option>
        <form:option value="e조">e조</form:option>
        <form:option value="f조">f조</form:option>
        <form:option value="g조">g조</form:option>
        <form:option value="h조">h조</form:option>
        <form:option value="16강">16강</form:option>
        <form:option value="8강">8강</form:option>
        <form:option value="4강">4강</form:option>
        <form:option value="결승">결승</form:option>
        <form:option value="4위전">3*4위전</form:option>
        </form:select>
        </td></tr>
        <tr><td>홈팀</td><td><form:select id="good" path="home" >

        </form:select>
        </td></tr>
        <tr><td>원정팀</td><td><form:select id="good1" path="away" >

        </form:select>
        </td></tr>
        <tr><td>승리팀(점수)</td><td><form:input path="winner" /></td></tr>
        <script>
            function categoryChange(e) {
                var good_a = ["네덜란드", "세네갈", "에콰도르", "카타르"];
                var good_b = ["잉글랜드", "미국", "이란", "웨일스"];
                var good_c = ["아르헨티나", "폴란드", "멕시코", "사우디아라비아"];
                var good_d = ["프랑스", "호주", "튀니지", "덴마크"];
                var good_e = ["일본", "스페인", "독일", "코스타리카"];
                var good_f = ["모로코", "크로아티아", "벨기에", "캐나다"];
                var good_g = ["브라질", "스위스", "카메룬", "세르비아"];
                var good_h = ["포르투갈", "대한민국", "우루과이", "가나"];
                var good_16 = ["네덜란드", "미국", "아르헨티나", "호주", "일본", "크로아티아", "브라질", "대한민국", "잉글랜드","세네갈", "프랑스","폴란드", "모로코", "스페인", "포르투갈","스위스"];
                var good_8 = ["네덜란드", "아르헨티나", "크로아티아", "브라질", "잉글랜드", "프랑스", "모로코", "포르투갈"];
                var good_4 = ["아르헨티나", "크로아티아", "프랑스", "모로코"];
                var good_2 = ["아르헨티나", "프랑스"];
                var good_34 = [ "크로아티아", "모로코"];
                var target = document.getElementById("good");
                var target2=document.getElementById("good1");

                if(e.value == "a조") var d = good_a;
                else if(e.value == "b조") var d = good_b;
                else if(e.value == "c조") var d = good_c;
                else if(e.value=="d조") var d=good_d;
                else if(e.value=="e조") var d=good_e;
                else if(e.value=="f조") var d=good_f;
                else if(e.value=="g조") var d=good_g;
                else if(e.value=="h조") var d=good_h;
                else if(e.value=="16강") var d=good_16;
                else if(e.value=="8강") var d=good_8;
                else if(e.value=="4강") var d=good_4;
                else if(e.value=="3*4위전") var d=good_2;
                else if(e.value=="결승전") var d=good_34;




                target.options.length = 0;

                for (x in d) {
                    var opt = document.createElement("option");
                    opt.value = d[x];
                    opt.innerHTML = d[x];
                    target.appendChild(opt);
                }

                target2.options.length=0;

                for (x in d) {
                    var opt = document.createElement("option");
                    opt.value = d[x];
                    opt.innerHTML = d[x];
                    target2.appendChild(opt);
                }
            }
        </script>
        <tr><td>mvp가 속한 팀</td><td>
            <form:radiobutton path="content" value="홈팀" label="홈팀"/>
            <form:radiobutton path="content" value="원정팀" label="원정팀"/>
        </td></tr>
    </table>
        <input type="submit" value="수정하기"/>
        <input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</form:form>
</body>
</html>
