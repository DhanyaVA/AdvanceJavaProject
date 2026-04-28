<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Delete Payment</title>



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

    text-align: center;

}



h2 {

    margin-bottom: 20px;

}



/* INPUT */

input {

    width: 100%;

    padding: 10px;

    margin: 10px 0 20px;

    border: 1px solid #ccc;

    border-radius: 5px;

}



/* BUTTON */

button {

    width: 100%;

    padding: 12px;

    background: #e74c3c;

    color: white;

    border: none;

    border-radius: 5px;

    font-size: 16px;

    cursor: pointer;

}



button:hover {

    background: #c0392b;

}



/* BACK LINK */

.back-btn {

    display: block;

    margin-top: 12px;

    text-decoration: none;

    color: #2980b9;

    font-weight: bold;

}



.back-btn:hover {

    text-decoration: underline;

}

</style>



</head>



<body>



<div class="container">



    <h2>Delete Payment</h2>



    <form action="DeleteFeePaymentServlet" method="get"

          onsubmit="return confirm('Are you sure you want to delete this record?');">



        <label>Payment ID</label>

        <input type="number" name="id" required>



        <button type="submit">Delete Payment</button>



    </form>



    <a href="dashboard.jsp" class="back-btn">&#8592; Back to Dashboard</a>



</div>



</body>

</html>





