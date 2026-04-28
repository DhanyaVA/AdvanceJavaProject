package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

@WebServlet("/DisplayFeePaymentsServlet")
public class DisplayFeePaymentsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            FeePaymentDAO dao = new FeePaymentDAO();
            List<FeePayment> list = dao.getAllPayments();

            // 🔥 GET FILTER PARAMETER
            String status = req.getParameter("status");

            System.out.println("STATUS = " + status); // debug

            // 🔥 APPLY FILTER
            if (status != null && !status.equalsIgnoreCase("All")) {

                List<FeePayment> filtered = new java.util.ArrayList<>();

                for (FeePayment f : list) {

                    if (f.getStatus() != null &&
                        f.getStatus().equalsIgnoreCase(status)) {

                        filtered.add(f);
                    }
                }

                list = filtered;
            }

            req.setAttribute("data", list);

            RequestDispatcher rd =
                    req.getRequestDispatcher("feepaymentdisplay.jsp");

            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
  

