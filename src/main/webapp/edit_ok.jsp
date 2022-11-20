<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.myapp.dao.MemberDAO"%>
<%@page import="com.myapp.member.MemberVO"%>
<%@page import="com.myapp.file.FileUpload"%>
<%@ page import="java.io.File" %>

<%
    request.setCharacterEncoding("utf-8");
    MemberDAO memberDAO = new MemberDAO();
    FileUpload up = new FileUpload();
    MemberVO vo = up.uploadPhoto(request);

    int i = memberDAO.updateMember(vo);
    String msg = "데이터 수정 성공!";
    if(i==0) msg = "[에러] 데이터 수정 실패!";
%>

<script>
    alert('<%=msg%>');
    location.href='list.jsp';
</script>