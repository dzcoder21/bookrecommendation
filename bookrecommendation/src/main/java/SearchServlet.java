//package com.mycompany.bookrecommendation.servlets;

import com.mycompany.bookrecommendation.model.Book; // ✅ Correct import

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/book_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = ""; // Change if needed

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        ArrayList<Book> books = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, "%" + query + "%");
                    ps.setString(2, "%" + query + "%");

                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        Book book = new Book(
                                rs.getInt("id"),
                                rs.getString("title"),
                                rs.getString("author"),
                                rs.getDouble("rating")
                        );
                        books.add(book);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bookList", books);
        request.getRequestDispatcher("recommendation.jsp").forward(request, response);
    }
}
