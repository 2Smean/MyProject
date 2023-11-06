<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="user.db.UserDao" %>
<%@ page import="user.db.UserDto" %>
<%@ page import="mysql.db.DbConnect" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Result</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    // 사용자로부터 입력 받은 정보 추출
    String sUserEmail = request.getParameter("sUserEmail");
    String sUserPassword = request.getParameter("sUserPassword");
    String sUserName = request.getParameter("sUserName");
    String sUserPhoneNumber = request.getParameter("sUserPhoneNumber");
    String sUserType = request.getParameter("sUserType");

    // 사용자 정보 객체 생성
    UserDto newUser = new UserDto();
    newUser.setsUserEmail(sUserEmail);
    newUser.setsUserPassword(sUserPassword);
    newUser.setsUserName(sUserName);
    newUser.setsUserPhoneNumber(sUserPhoneNumber);
    newUser.setsUserType(sUserType);

    // UserDao 객체 생성
    UserDao userDao = new UserDao();

    // 사용자 정보 등록
    userDao.addUser(newUser);
%>

<h2>Registration Result</h2>
<p>회원가입을 성공했습니다.</p>
<p>Email: <%= sUserEmail %></p>
<p>Name: <%= sUserName %></p>
<p>Phone Number: <%= sUserPhoneNumber %></p>

<p><a href="index.jsp">Go back to the homepage</a></p>
</body>
</html>
