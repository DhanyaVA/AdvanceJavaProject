package com.dao;

import java.sql.*;
import java.util.*;
import com.model.FeePayment;

public class FeePaymentDAO{

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/collegefee", "root", "student");
    }

    // ➕ ADD
    public void addPayment(FeePayment f) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO FeePayments(StudentID,StudentName,PaymentDate,Amount,Status) VALUES (?,?,?,?,?)");

        ps.setInt(1, f.getStudentId());
        ps.setString(2, f.getStudentName());
        ps.setString(3, f.getPaymentDate());
        ps.setDouble(4, f.getAmount());
        ps.setString(5, f.getStatus());

        ps.executeUpdate();
        con.close();
    }
    public void updatePayment(FeePayment f) throws Exception {

        Connection con = getConnection();

        PreparedStatement ps = con.prepareStatement(
            "UPDATE FeePayments SET StudentID=?, StudentName=?, PaymentDate=?, Amount=?, Status=? WHERE PaymentID=?");

        ps.setInt(1, f.getStudentId());
        ps.setString(2, f.getStudentName());
        ps.setString(3, f.getPaymentDate());
        ps.setDouble(4, f.getAmount());
        ps.setString(5, f.getStatus());
        ps.setInt(6, f.getPaymentId());

        int rows = ps.executeUpdate();   // 🔥 capture result

        if (rows > 0) {
            System.out.println("✅ Update successful");
        } else {
            System.out.println("❌ No record found with PaymentID = " + f.getPaymentId());
        }

        con.close();
    }
    // DELETE
    public void deletePayment(int id) throws Exception {
        Connection con = getConnection();

        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM FeePayments WHERE PaymentID=?");

        ps.setInt(1, id);
        ps.executeUpdate();

        con.close();
    }
    // 📋 DISPLAY
    public List<FeePayment> getAllPayments() throws Exception {
        List<FeePayment> list = new ArrayList<>();
        Connection con = getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM FeePayments");

        while (rs.next()) {
            FeePayment f = new FeePayment();
            f.setPaymentId(rs.getInt("PaymentID"));
            f.setStudentId(rs.getInt("StudentID"));
            f.setStudentName(rs.getString("StudentName"));
            f.setPaymentDate(rs.getString("PaymentDate"));
            f.setAmount(rs.getDouble("Amount"));
            f.setStatus(rs.getString("Status"));
            list.add(f);
        }

        con.close();
        return list;
    }
}

