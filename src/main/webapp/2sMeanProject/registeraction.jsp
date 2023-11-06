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

    // 사용자 정보 객체 생성
    UserDto userDto = new UserDto();
    userDto.setsUserEmail(sUserEmail);
    userDto.setsUserPassword(sUserPassword);
    userDto.setsUserName(sUserName);
    userDto.setsUserPhoneNumber(sUserPhoneNumber);
    userDto.setsUserType(String.valueOf(0));

    // UserDao 객체 생성
    UserDao userDao = new UserDao();

    // 사용자 정보 등록
    userDao.addUser(userDto);

%>
<script>
    alert('회원가입 성공하였습니다!')
    location.href = "/2sMeanProject/index.jsp";
</script>

<p><a href="index.jsp">Go back to the homepage</a></p>
</body>
</html>
