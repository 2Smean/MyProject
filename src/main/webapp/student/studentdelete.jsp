<%@page import="student.data.StudentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  String num=request.getParameter("num");
  StudentDto dao=new StudentDto();
  dao.deleteStudent(num);
%>