<%@ page import="java.util.*, com.model.FeePayment" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Payments</title>



<style>

body {

    margin: 0;

    font-family: Arial, sans-serif;

    background: #f4f6f9;

    text-align: center;

}



/* CONTAINER */

.container {

    width: 90%;

    margin: 40px auto;

    background: white;

    padding: 20px;

    border-radius: 10px;

    box-shadow: 0px 0px 10px #ccc;

}



/* TABLE */

table {

    width: 100%;

    border-collapse: collapse;

    margin-top: 20px;

}



th {

    background: #2c3e50;

    color: white;

    padding: 10px;

}



td {

    padding: 10px;

    border-bottom: 1px solid #ddd;

}



tr:hover {

    background: #f1f1f1;

}



/* STATUS COLORS */

.paid { color: green; font-weight: bold; }

.overdue { color: red; font-weight: bold; }

.pending { color: orange; font-weight: bold; }



/* BACK BUTTON */

.back-btn {

    display: inline-block;

    margin-top: 15px;

    text-decoration: none;

    color: white;

    background: #2980b9;

    padding: 10px 15px;

    border-radius: 5px;

}



.back-btn:hover {

    background: #3498db;

}

</style>



</head>



<body>



<div class="container">



<h2>All Payments</h2>



<%

List<FeePayment> list = (List<FeePayment>) request.getAttribute("data");



if(list == null){

%>

<h3 style="color:red;">ERROR: No data received</h3>

<%

} else if(list.isEmpty()){

%>

<h3 style="color:orange;">No Records Found</h3>

<%

} else {

%>



<table>

<tr>

<th>ID</th>

<th>Student ID</th>

<th>Name</th>

<th>Date</th>

<th>Amount</th>

<th>Status</th>

</tr>



<%

for(FeePayment f : list){



    String statusClass = "";

    if("Paid".equals(f.getStatus())) statusClass = "paid";

    else if("Overdue".equals(f.getStatus())) statusClass = "overdue";

    else if("Pending".equals(f.getStatus())) statusClass = "pending";

%>



<tr>

<td><%= f.getPaymentId() %></td>

<td><%= f.getStudentId() %></td>

<td><%= f.getStudentName() %></td>

<td><%= f.getPaymentDate() %></td>

<td>₹<%= f.getAmount() %></td>

<td class="<%= statusClass %>"><%= f.getStatus() %></td>

</tr>



<%

}

%>



</table>



<%

}

%>



<!-- BACK BUTTON -->

<a href="dashboard.jsp" class="back-btn">&#8592; Back to Dashboard</a>



</div>



</body>

</html>



