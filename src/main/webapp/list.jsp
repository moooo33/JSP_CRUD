<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.myapp.dao.MemberDAO, java.util.*"%>
<%@ page import="com.myapp.member.MemberVO"%>
<%@ page import="com.myapp.file.FileUpload"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>free board</title>
    <style>
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
            background-color: #006bb3;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='delete_ok.jsp?id=' + id;
        }
    </script>
</head>
<body>
<h1>자유게시판</h1>
<%
    MemberDAO memberDAO = new MemberDAO();
    List<MemberVO> list = memberDAO.getList();
    request.setAttribute("list", list);
%>
<table id="list" width="90%">
    <tr>
        <th>No.</th>
        <th>Id</th>
        <th>Category</th>
        <th>Title</th>
        <th>Writer</th>
        <th>Content</th>
        <th>Photo</th>
        <th>Regdate</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="u" varStatus="status">
        <tr>
            <td>${fn:length(list)-status.index}</td>
            <td>${u.getSeq()}</td>
            <td>${u.getCategory()}</td>
            <td><a href="view.jsp?id=${u.getSeq()}">${u.getTitle()}</a></td>
            <td>${u.getWriter()}</td>
            <td>${u.getContent()}</td>
            <td>${u.getPhoto()}</td>
            <td>${u.getRegdate()}</td>
            <td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="addform.jsp">Add New Post</a>
</body>
</html>