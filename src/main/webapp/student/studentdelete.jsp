<%@page import="studentdata.StudentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  String num=request.getParameter("num");
  studentdata.StudentDto dao=new studentdata.StudentDto();
  dao.deleteStudent(num);
%>