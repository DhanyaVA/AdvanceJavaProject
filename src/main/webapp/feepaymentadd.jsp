
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Payment</title>



<style>

body {

    margin: 0;

    font-family: Arial, sans-serif;

    background: #f4f6f9;

    display: flex;

    justify-content: center;

    align-items: center;

    height: 100vh;

}



/* CARD */

.container {

    background: white;

    padding: 30px;

    width: 350px;

    border-radius: 10px;

    box-shadow: 0px 0px 10px #ccc;

}



h2 {

    text-align: center;

}



/* INPUTS */

input, select {

    width: 100%;

    padding: 10px;

    margin: 8px 0 15px;

    border: 1px solid #ccc;

    border-radius: 5px;

}



/* BUTTON */

button {

    width: 100%;

    padding: 12px;

    background: #27ae60;

    color: white;

    border: none;

    border-radius: 5px;

    font-size: 16px;

    cursor: pointer;

}



button:hover {

    background: #2ecc71;

}



/* ERROR */

.error {

    color: red;

    text-align: center;

    margin-bottom: 10px;

}



/* SUCCESS */

.success {

    color: green;

    text-align: center;

    margin-bottom: 10px;

}



/* BACK */

.back-btn {

    display: block;

    text-align: center;

    margin-top: 10px;

    text-decoration: none;

    color: #2980b9;

}

</style>



</head>



<body>



<div class="container">



<h2>Add Fee Payment</h2>



<%

String error = request.getParameter("error");

String success = request.getParameter("success");



if ("sid".equals(error)) {

%>

<p class="error">Invalid Student ID</p>

<%

} else if ("name".equals(error)) {

%>

<p class="error">Name must contain only letters</p>

<%

} else if ("amount".equals(error)) {

%>

<p class="error">Invalid Amount</p>

<%

} else if ("server".equals(error)) {

%>

<p class="error">Server Error</p>

<%

} else if ("1".equals(success)) {

%>

<p class="success">Payment Added Successfully</p>

<%

}

%>



<form action="AddFeePaymentServlet" method="post">



    <label>Student ID</label>

    <input type="number" name="sid" min="1" required>



    <label>Name</label>

    <!-- ✅ Only characters allowed -->

    <input type="text" name="name" pattern="[A-Za-z ]+" title="Only letters allowed" required>



    <label>Date</label>

    <input type="date" name="date" required>



    <label>Amount</label>

    <input type="number" name="amount" min="1" step="0.01" required>



    <label>Status</label>

    <select name="status">

        <option value="Paid">Paid</option>

        <option value="Overdue">Overdue</option>

        <option value="Pending">Pending</option>

    </select>



    <button type="submit">Add Payment</button>



</form>



<a href="dashboard.jsp" class="back-btn">&#8592; Back to Dashboard</a>



</div>



</body>

</html>





