package com.model;



public class FeePayment {



    private int paymentId;

    private int studentId;

    private String studentName;

    private String paymentDate;

    private double amount;

    private String status;



    // 🔹 Default Constructor

    public FeePayment() {

    }



    // 🔹 Parameterized Constructor (without ID)

    public FeePayment(int studentId, String studentName, String paymentDate, double amount, String status) {

        this.studentId = studentId;

        this.studentName = studentName;

        this.paymentDate = paymentDate;

        this.amount = amount;

        this.status = status;

    }



    // 🔹 Full Constructor

    public FeePayment(int paymentId, int studentId, String studentName, String paymentDate, double amount, String status) {

        this.paymentId = paymentId;

        this.studentId = studentId;

        this.studentName = studentName;

        this.paymentDate = paymentDate;

        this.amount = amount;

        this.status = status;

    }



    // 🔹 Getters and Setters



    public int getPaymentId() {

        return paymentId;

    }



    public void setPaymentId(int paymentId) {

        this.paymentId = paymentId;

    }



    public int getStudentId() {

        return studentId;

    }



    public void setStudentId(int studentId) {

        this.studentId = studentId;

    }



    public String getStudentName() {

        return studentName;

    }



    public void setStudentName(String studentName) {

        this.studentName = studentName;

    }



    public String getPaymentDate() {

        return paymentDate;

    }



    public void setPaymentDate(String paymentDate) {

        this.paymentDate = paymentDate;

    }



    public double getAmount() {

        return amount;

    }



    public void setAmount(double amount) {

        this.amount = amount;

    }



    public String getStatus() {

        return status;

    }



    public void setStatus(String status) {

        this.status = status;

    }



    // 🔹 toString() Method

    @Override

    public String toString() {

        return "FeePayment [paymentId=" + paymentId +

                ", studentId=" + studentId +

                ", studentName=" + studentName +

                ", paymentDate=" + paymentDate +

                ", amount=" + amount +

                ", status=" + status + "]";

    }

}

