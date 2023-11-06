<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <style>
    html,
    body {
      height: 100%;
    }

    body {
      display: flex;
      align-items: center;
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
    }

    .form-signin {
      width: 100%;
      max-width: 330px;
      padding: 15px;
      margin: auto;
    }

    .form-signin .checkbox {
      font-weight: 400;
    }

    .form-signin .form-floating:focus-within {
      z-index: 2;
    }

    .form-signin input[type="email"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }
  </style>
</head>
<body>

<main class="form-signin w-100 m-auto">
  <form action="registeraction.jsp" method="post">
    <img src="https://www.bitcamp.co.kr/theme/basic/img/bit_white_logo.png" alt="비트캠프" class="base_logo" title="" style="color: black">
    <h1 class="h3 mb-3 fw-normal">Create Account</h1>

    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" name="sUserEmail" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="sUserPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="sUserName" name="sUserName" placeholder="userName">
      <label for="sUserName">userName</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="sUserPhoneNumber" name="sUserPhoneNumber" placeholder="PhoneNumber">
      <label for="sUserPhoneNumber">PhoneNumber</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="sUserType" name="sUserType" placeholder="User Type">
      <label for="sUserType">User Type</label>
    </div>

    <button class="btn w-100 py-2" style="background-color: blue; color: whitesmoke" type="submit">Create</button>

    <p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2023</p>
  </form>
</main>
</body>
<script>
  const sUserEmail = $("#floatingInput");
</script>
</html>
