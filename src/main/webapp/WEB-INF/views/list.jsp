<%--
  Created by IntelliJ IDEA.
  User: seominjae
  Date: 2022/11/25
  Time: 5:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1{
            color: #6E0929FF;
            text-align: center;
        }
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #6E0929FF;
            color: white;
        }
    </style>

    <script>
        function delete_ok(id){
            var a=confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deleteok/'+id;
        }
    </script>
</head>
<body>
<h1>FIFA WORLD CUP</h1>
<table id="list" width="90%">
    <tr>
        <th>id</th>
        <th>경기</th>
        <th>홈팀</th>
        <th>원정팀</th>
        <th>승리팀</th>
        <th>mvp가 속한 팀</th>
        <th>등록일자</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>

<c:forEach items="${list}" var="u" varStatus="status">
    <tr>
        <td>${fn:length(list)-status.index}</td>
        <td>${u.title}</td>
        <td>${u.home}</td>
        <td>${u.away}</td>
        <td>${u.winner}</td>
        <td>${u.content}</td>
        <td>${u.regdate}</td>
        <td><a href="editform/${u.seq}">글수정</a></td>
        <td><a href="javascript:delete_ok('${u.seq}')">글삭제</a></td>
    </tr>
    </c:forEach>
</table>
<br/><button type="button" onclick="location.href='add'">경기 결과 작성</button>
</body>
</html>
