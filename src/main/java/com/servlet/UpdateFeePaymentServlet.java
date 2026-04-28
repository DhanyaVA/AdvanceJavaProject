package com.servlet;



import java.io.IOException;

import javax.servlet.*;

import javax.servlet.http.*;

import javax.servlet.annotation.WebServlet;



import com.dao.FeePaymentDAO;

import com.model.FeePayment;

@WebServlet("/UpdateFeePaymentServlet")

public class UpdateFeePaymentServlet extends HttpServlet {



    protected void doPost(HttpServletRequest req, HttpServletResponse res)

            throws ServletException, IOException {



        try {

            String id = req.getParameter("id");

            String sid = req.getParameter("sid");

            String name = req.getParameter("name");

            String amount = req.getParameter("amount");



            // 🔴 VALIDATION



            // Payment ID

            if (!id.matches("\\d+") || Integer.parseInt(id) <= 0) {

                res.sendRedirect("feepaymentupdate.jsp?error=id");

                return;

            }



            // Student ID

            if (sid != null && !sid.isEmpty()) {

                if (!sid.matches("\\d+") || Integer.parseInt(sid) <= 0) {

                    res.sendRedirect("feepaymentupdate.jsp?error=sid");

                    return;

                }

            }



            // ✅ NAME VALIDATION (ONLY CHARACTERS)

            if (name != null && !name.isEmpty()) {

                if (!name.matches("[A-Za-z ]+")) {

                    res.sendRedirect("feepaymentupdate.jsp?error=name");

                    return;

                }

            }



            // Amount

            if (amount != null && !amount.isEmpty()) {

                if (!amount.matches("\\d+(\\.\\d+)?") || Double.parseDouble(amount) <= 0) {

                    res.sendRedirect("feepaymentupdate.jsp?error=amount");

                    return;

                }

            }



            // ✅ Create object

            FeePayment f = new FeePayment();

            f.setPaymentId(Integer.parseInt(id));



            if (sid != null && !sid.isEmpty()) {

                f.setStudentId(Integer.parseInt(sid));

            }



            f.setStudentName(name);

            f.setPaymentDate(req.getParameter("date"));



            if (amount != null && !amount.isEmpty()) {

                f.setAmount(Double.parseDouble(amount));

            }



            f.setStatus(req.getParameter("status"));



            new FeePaymentDAO().updatePayment(f);



            res.sendRedirect("dashboard.jsp?success=update");



        } catch (Exception e) {

            e.printStackTrace();

            res.sendRedirect("feepaymentupdate.jsp?error=server");

        }

    }

}



