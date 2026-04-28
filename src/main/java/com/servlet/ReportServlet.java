package com.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ReportServlet")   // REMOVE if using web.xml mapping
public class ReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // 🔹 When user opens URL directly
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Option 1: show message
        // res.getWriter().println("ReportServlet is working. Use form to submit data.");

        // ✅ Better: redirect to form
        RequestDispatcher rd = req.getRequestDispatcher("report_form.jsp");
        rd.forward(req, res);
    }

    // 🔹 When form is submitted
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String from = req.getParameter("from");
        String to = req.getParameter("to");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/collegefee", "root", "student");

            PreparedStatement ps = con.prepareStatement(
            	    "SELECT COALESCE(SUM(Amount),0) FROM FeePayments " +
            	    "WHERE Status='Paid' AND PaymentDate BETWEEN ? AND ?"
            	);

            	ps.setDate(1, java.sql.Date.valueOf(from));
            	ps.setDate(2, java.sql.Date.valueOf(to));

            	ResultSet rs = ps.executeQuery();

            	double total = 0;
            	if (rs.next()) {
            	    total = rs.getDouble(1);
            	}

            	req.setAttribute("total", total);
            	RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
            	rd.forward(req, res);

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

