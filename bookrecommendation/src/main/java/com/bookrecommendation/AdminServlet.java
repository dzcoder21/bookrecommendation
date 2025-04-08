package com.bookrecommendation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/bookdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = ""; // <-- replace with your password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String ratingStr = request.getParameter("rating");
        String action = request.getParameter("action");

        try {
            double rating = Double.parseDouble(ratingStr);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String message;

            switch (action) {
                case "add":
                    String insertSQL = "INSERT INTO books (title, author, rating) VALUES (?, ?, ?)";
                    PreparedStatement insertStmt = conn.prepareStatement(insertSQL);
                    insertStmt.setString(1, title);
                    insertStmt.setString(2, author);
                    insertStmt.setDouble(3, rating);
                    insertStmt.executeUpdate();
                    insertStmt.close();
                    message = "Book added successfully!";
                    break;

                case "update":
                    String updateSQL = "UPDATE books SET author=?, rating=? WHERE title=?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
                    updateStmt.setString(1, author);
                    updateStmt.setDouble(2, rating);
                    updateStmt.setString(3, title);
                    int rowsUpdated = updateStmt.executeUpdate();
                    updateStmt.close();
                    message = (rowsUpdated > 0) ? "Book updated successfully!" : "Book not found!";
                    break;

                case "delete":
                    String deleteSQL = "DELETE FROM books WHERE title=?";
                    PreparedStatement deleteStmt = conn.prepareStatement(deleteSQL);
                    deleteStmt.setString(1, title);
                    int rowsDeleted = deleteStmt.executeUpdate();
                    deleteStmt.close();
                    message = (rowsDeleted > 0) ? "Book deleted successfully!" : "Book not found!";
                    break;

                default:
                    message = "Invalid action selected!";
            }

            conn.close();
            response.sendRedirect("admin.jsp?message=" + java.net.URLEncoder.encode(message, "UTF-8"));

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?message=" + java.net.URLEncoder.encode("Something went wrong!", "UTF-8"));
        }
    }
}
