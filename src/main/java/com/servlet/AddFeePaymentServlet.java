package com.servlet;



import java.io.IOException;

import javax.servlet.*;

import javax.servlet.http.*;

import javax.servlet.annotation.WebServlet;



import com.dao.FeePaymentDAO;

import com.model.FeePayment;



@WebServlet("/AddFeePaymentServlet")

public class AddFeePaymentServlet extends HttpServlet {



    protected void doPost(HttpServletRequest req, HttpServletResponse res)

            throws ServletException, IOException {



        try {

            String sid = req.getParameter("sid");

            String name = req.getParameter("name");

            String date = req.getParameter("date");

            String amount = req.getParameter("amount");

            String status = req.getParameter("status");



            // 🔴 VALIDATION



            // Student ID

            if (!sid.matches("\\d+") || Integer.parseInt(sid) <= 0) {

                res.sendRedirect("feepaymentadd.jsp?error=sid");

                return;

            }



            // ✅ NAME VALIDATION (ONLY CHARACTERS)

            if (name == null || !name.matches("[A-Za-z ]+")) {

                res.sendRedirect("feepaymentadd.jsp?error=name");

                return;

            }



            // Amount

            if (!amount.matches("\\d+(\\.\\d+)?") || Double.parseDouble(amount) <= 0) {

                res.sendRedirect("feepaymentadd.jsp?error=amount");

                return;

            }



            // Date check (optional but good)

            if (date == null || date.isEmpty()) {

                res.sendRedirect("feepaymentadd.jsp?error=date");

                return;

            }



            // Create object

            FeePayment f = new FeePayment();

            f.setStudentId(Integer.parseInt(sid));

            f.setStudentName(name);

            f.setPaymentDate(date);

            f.setAmount(Double.parseDouble(amount));

            f.setStatus(status);



            new FeePaymentDAO().addPayment(f);



            // Redirect with success

            res.sendRedirect("feepaymentadd.jsp?success=1");



        } catch (Exception e) {

            e.printStackTrace();

            res.sendRedirect("feepaymentadd.jsp?error=server");

        }

    }

}





