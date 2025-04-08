<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book List - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f2f2f2;
            padding: 30px;
        }
        .container {
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            font-weight: bold;
        }
        table {
            margin-top: 20px;
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📚 Book List (Admin Added)</h2>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Rating</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "");

                    String sql = "SELECT * FROM books";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String title = rs.getString("title");
                        String author = rs.getString("author");
                        float rating = rs.getFloat("rating");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= title %></td>
                <td><%= author %></td>
                <td><%= rating %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='4' class='text-danger'>Error loading books: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
        </tbody>
    </table>

    <a href="Dashboard.jsp" class="btn btn-dark btn-back">⬅ Back to Dashboard</a>
</div>
</body>
</html>
