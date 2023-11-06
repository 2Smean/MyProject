<%@ page import="user.db.UserDao" %>
<%@ page import="user.db.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String loginid = request.getParameter("loginid");
  String loginpass = request.getParameter("loginpass");
  String saveid = request.getParameter("saveid");
  UserDao dao = new UserDao();
  UserDto dto = new UserDto();
  dto.setsUserEmail(loginid);
  dto.setsUserPassword(loginpass);


  dto=dao.Checklogin(dto);
  if(dto.getsUserName()!=null){
    // 로그인 성공
    session.setAttribute("loginok", "yes");
    session.setAttribute("loginid", loginid);
    session.setAttribute("savestatus", (saveid == null) ? "no" : "yes");
    session.setMaxInactiveInterval(60 * 60); // 1시간 유지
    response.sendRedirect("main.jsp");
  } else {%>
    // 로그인 실패
    <script>
      alert("비밀번호가 맞지 않습니다");
    history.back();
    </script>
<%}%>
