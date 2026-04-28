<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Update Payment</title>



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



.container {

    background: white;

    padding: 30px;

    width: 380px;

    border-radius: 10px;

    box-shadow: 0px 0px 10px #ccc;

}



h2 {

    text-align: center;

    margin-bottom: 20px;

}



input, select {

    width: 100%;

    padding: 10px;

    margin: 8px 0 15px;

    border: 1px solid #ccc;

    border-radius: 5px;

}



button {

    width: 100%;

    padding: 12px;

    background: #2980b9;

    color: white;

    border: none;

    border-radius: 5px;

    font-size: 16px;

    cursor: pointer;

}



button:hover {

    background: #3498db;

}



.error {

    color: red;

    text-align: center;

    margin-bottom: 10px;

}



.success {

    color: green;

    text-align: center;

    margin-bottom: 10px;

}



.back-btn {

    display: block;

    text-align: center;

    margin-top: 10px;

    text-decoration: none;

    color: #2980b9;

    font-weight: bold;

}

</style>



</head>



<body>



<div class="container">



<h2>Update Fee Payment</h2>



<%

String error = request.getParameter("error");

String success = request.getParameter("success");



if ("id".equals(error)) {

%>

<p class="error">Invalid Payment ID</p>

<%

} else if ("sid".equals(error)) {

%>

<p class="error">Invalid Student ID</p>

<%

} else if ("name".equals(error)) {

%>

<p class="error">Name must contain only letters</p>

<%

} else if ("amount".equals(error)) {

%>

<p class="error">Invalid Amount (must be positive)</p>

<%

} else if ("server".equals(error)) {

%>

<p class="error">Server Error</p>

<%

} else if ("update".equals(success)) {

%>

<p class="success">Payment Updated Successfully</p>

<%

}

%>   <!-- ❗ THIS WAS MISSING -->



<form action="UpdateFeePaymentServlet" method="post">



    <label>Payment ID</label>

    <input type="number" name="id" min="1" required>



    <label>Student ID</label>

    <input type="number" name="sid" min="1">



    <label>Student Name</label>

    <input type="text" name="name" pattern="[A-Za-z ]+" title="Only letters allowed">



    <label>Payment Date</label>

    <input type="date" name="date">



    <label>Amount</label>

    <input type="number" name="amount" min="1" step="0.01">



    <label>Status</label>

    <select name="status">

        <option value="Paid">Paid</option>

        <option value="Overdue">Overdue</option>

        <option value="Pending">Pending</option>

    </select>



    <button type="submit">Update Payment</button>



</form>



<a href="dashboard.jsp" class="back-btn">&#8592; Back to Dashboard</a>



</div>



</body>

</html>

