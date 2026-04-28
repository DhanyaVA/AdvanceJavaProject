<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Login - Fees Management System</title>



<style>

body {

    margin: 0;

    font-family: Arial, sans-serif;

    background: linear-gradient(to right, #2f3640, #353b48);

    height: 100vh;

    display: flex;

    justify-content: center;

    align-items: center;

}



.login-box {

    background: white;

    padding: 40px;

    width: 350px;

    border-radius: 10px;

    box-shadow: 0px 0px 15px rgba(0,0,0,0.3);

    text-align: center;

}



.login-box h2 {

    margin-bottom: 20px;

    color: #2f3640;

}



.login-box input {

    width: 90%;

    padding: 10px;

    margin: 10px 0;

    border: 1px solid #ccc;

    border-radius: 5px;

}



.login-box button {

    width: 95%;

    padding: 10px;

    background: #44bd32;

    color: white;

    border: none;

    border-radius: 5px;

    cursor: pointer;

    font-size: 16px;

}



.login-box button:hover {

    background: #4cd137;

}



.error {

    color: red;

    font-size: 14px;

}

</style>



</head>

<body>



<div class="login-box">



    <h2>Fees Management Login</h2>



    <form action="LoginServlet" method="post">



        <input type="text" name="username" placeholder="Enter Username" required>

        <input type="password" name="password" placeholder="Enter Password" required>



        <button type="submit">Login</button>



    </form>



    <%

        String error = request.getParameter("error");

        if ("invalid".equals(error)) {

    %>

        <p class="error">❌ Invalid username or password</p>

    <%

        } else if ("empty".equals(error)) {

    %>

        <p class="error">⚠ Please fill all fields</p>

    <%

        }

    %>



</div>



</body>





</html>