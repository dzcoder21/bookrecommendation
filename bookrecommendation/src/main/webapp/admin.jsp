<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f9f9f9, #e0eaff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .dashboard {
            max-width: 700px;
            margin: 50px auto;
            background: #fff;
            border: 2px solid #000;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            animation: fadeIn 1s ease-in-out;
        }
        h2 {
            font-weight: bold;
            color: #2c3e50;
        }
        label {
            font-weight: 500;
            color: #333;
        }
        .btn-primary {
            background-color: #000;
            border-color: #000;
            font-weight: bold;
            padding: 10px;
        }
        a{
            background-color: #000;
            border-color: #000;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }
        .btn-primary:hover {
            background-color: #333;
        }
        .form-control, .form-select {
            border-color: #000;
            color: #000;
        }
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 0.2rem rgba(0,0,0,0.25);
        }
        @keyframes fadeIn {
            from {opacity: 0;transform: translateY(-30px);}
            to {opacity: 1;transform: translateY(0);}
        }
        .footer-text {
            text-align: center;
            font-size: 14px;
            color: #777;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="dashboard">
    <h2 class="text-center mb-4">📚 Admin Dashboard - Book Manager</h2>
    <% String message = request.getParameter("message");
       if(message != null) { %>
        <div class="alert alert-info text-center"> <%= message %> </div>
    <% } %>
    <form action="admin" method="post">
        <div class="mb-3">
            <label for="title" class="form-label">Book Title</label>
            <input type="text" name="title" class="form-control" id="title" placeholder="Enter book title" required>
        </div>
        <div class="mb-3">
            <label for="author" class="form-label">Author</label>
            <input type="text" name="author" class="form-control" id="author" placeholder="Enter author's name" required>
        </div>
        <div class="mb-3">
            <label for="rating" class="form-label">Rating</label>
            <input type="number" step="0.1" name="rating" class="form-control" id="rating" placeholder="Rating (e.g. 4.5)" required>
        </div>
        <div class="mb-4">
            <label for="action" class="form-label">Action</label>
            <select name="action" class="form-select" id="action" required>
                <option value="add">Add Book</option>
                <option value="update">Update Book</option>
                <option value="delete">Delete Book</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary w-100">🚀 Submit</button>
        <button type="submit" class="btn btn-primary w-100"><a  class="link" href="Dashboard.jsp">Dashboard</a></button>
    </form>
    <p class="footer-text">Designed with ❤️ by Siddhant | Book Recommendation Admin</p>
</div>
</body>
</html>