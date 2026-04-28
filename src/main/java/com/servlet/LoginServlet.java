package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Basic validation
        if (username == null || password == null ||
            username.trim().isEmpty() || password.trim().isEmpty()) {

            response.sendRedirect("index.jsp?error=empty");
            return;
        }

        // Hardcoded login (for mini project)
        if (username.equals("admin") && password.equals("admin123")) {

            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("user", username);

            // Session timeout (optional)
            session.setMaxInactiveInterval(30 * 60); // 30 mins

            // Redirect to dashboard
            response.sendRedirect("dashboard.jsp");

        } else {
            // Invalid login
            response.sendRedirect("index.jsp?error=invalid");
        }
    }
}

