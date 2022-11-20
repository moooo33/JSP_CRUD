<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.myapp.dao.MemberDAO, com.myapp.member.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
</head>
    <meta charset="UTF-8">
    <title>Detail Page</title>
<body>
    <h1>Detail Page</h1>
    <%
        MemberDAO memberDAO = new MemberDAO();
        String id = request.getParameter("id");
        MemberVO u = memberDAO.getOne(Integer.parseInt(id));
        request.setAttribute("vo",u);
    %>
    <table id="edit">
        <tr><td>Category</td><td>${vo.getCategory()}</td></tr>
        <tr><td>Title</td><td>${vo.getTitle()}</td></tr>
        <tr><td>Writer</td><td>${vo.getWriter()}</td></tr>
        <tr><td>Content</td><td>${vo.getContent()}</td></tr>
        <tr>
            ${vo.getPhoto()}
            ${pageContext.request.contextPath}
            <td>Photo</td><td><c:if test="${vo.getPhoto() ne ''}"><br />
            <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"></c:if></td>
        </tr>
        <tr><td>RegDate</td><td>${vo.getRegdate()}</td></tr>
    </table>
    <button type="button" onclick="history.back()">Back</button>
    <button type="button" onclick="location.href='editform.jsp?id=${vo.getSeq()}'">Edit</button>
</body>
</html>