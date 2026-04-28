

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Report Result</title>



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

    padding: 40px;

    width: 350px;

    border-radius: 12px;

    box-shadow: 0px 0px 15px rgba(0,0,0,0.2);

    text-align: center;

}



/* TITLE */

h2 {

    margin-bottom: 10px;

    color: #2f3640;

}



/* AMOUNT */

.amount {

    font-size: 30px;

    color: #27ae60;

    font-weight: bold;

    margin: 20px 0;

}



/* TEXT */

.desc {

    color: #555;

    margin-bottom: 20px;

}



/* BUTTON */

.btn {

    display: inline-block;

    text-decoration: none;

    padding: 10px 18px;

    background: #2980b9;

    color: white;

    border-radius: 6px;

    font-size: 14px;

}



.btn:hover {

    background: #3498db;

}

</style>



</head>



<body>



<div class="container">



    <h2>Report Summary</h2>



    <div class="amount">

        ₹ ${total}

    </div>



    <div class="desc">

        Total collection for selected date range

    </div>



    <a href="report_form.jsp" class="btn">

        ← Back to Report

    </a>



</div>



</body>

</html>