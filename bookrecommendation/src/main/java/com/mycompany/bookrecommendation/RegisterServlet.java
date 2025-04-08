package com.mycompany.bookrecommendation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/bookdb"; // replace with your DB name
        String user = "root"; // replace with your DB username
        String pass = ""; // replace with your DB password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, user, pass);
            String query = "INSERT INTO users (fullname, email, password) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, password);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("register.jsp?error=Registration failed. Try again!");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Something went wrong. Try again later!");
        }
    }
}
