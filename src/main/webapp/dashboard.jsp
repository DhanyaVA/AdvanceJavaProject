<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">  <!-- 🔥 FIXES SYMBOL ISSUE -->

<title>Dashboard</title>



<style>

body {

    margin: 0;

    font-family: Arial, sans-serif;

    background: #f5f5f5;

    text-align: center;

}



/* HEADER */

.header {

    background: white;

    width: 60%;

    margin: 40px auto 20px;

    padding: 20px;

    border-radius: 10px;

    box-shadow: 0px 0px 8px #ccc;

}



/* BUTTON GRID */

.actions {

    width: 60%;

    margin: auto;

    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 15px;

}



/* BUTTON STYLE */

.btn {

    display: block;

    padding: 20px;

    text-decoration: none;

    color: white;

    border-radius: 10px;

    font-size: 16px;

    font-weight: bold;

    transition: 0.3s;

}



/* COLORS */

.add { background: #27ae60; }

.all { background: #2c3e50; }

.paid { background: #2ecc71; }

.overdue { background: #e74c3c; }

.pending { background: #f39c12; }

.update { background: #2980b9; }

.delete { background: #c0392b; }

.report { background: #8e44ad; }



/* HOVER */

.btn:hover {

    transform: scale(1.05);

    opacity: 0.9;

}

</style>



</head>



<body>



<!-- HEADER -->

<div class="header">

    <h1>Dashboard</h1>

    <p>Welcome to Fee Management System</p>

</div>



<!-- BUTTONS -->

<div class="actions">



    <a href="feepaymentadd.jsp" class="btn add">Add Payment</a>



    <a href="DisplayFeePaymentsServlet" class="btn all">All Payments</a>



    <a href="DisplayFeePaymentsServlet?status=Paid" class="btn paid">Paid</a>



    <a href="DisplayFeePaymentsServlet?status=Overdue" class="btn overdue">Overdue</a>



    <a href="DisplayFeePaymentsServlet?status=Pending" class="btn pending">Pending</a>



    <a href="feepaymentupdate.jsp" class="btn update">Update Payment</a>



    <a href="feepaymentdelete.jsp" class="btn delete">Delete Payment</a>



    <a href="report_form.jsp" class="btn report">Reports</a>



</div>



</body>

</html>