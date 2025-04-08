<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String user = (session != null) ? (String) session.getAttribute("user") : null;
    if (user == null) {
        response.sendRedirect("login.jsp?error=Please login first!");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Book Recommendation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
            animation: fadeIn 1.2s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        .navbar {
            background-color: black;
        }

        .navbar-brand,
        .nav-link,
        .navbar-text {
            color: white !important;
        }

        .dashboard-header {
            margin-top: 2rem;
            text-align: center;
            color: #333;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .logout-btn {
            background-color: #dc3545;
            color: white;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Book Recommendetion</a>
        <div class="d-flex ms-auto">
            <span class="navbar-text me-3">Welcome, <strong><%= user %></strong></span>
            <a href="logout.jsp" class="btn logout-btn btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container">
    <h2 class="dashboard-header">Your Personalized Dashboard</h2>

    <div class="row mt-4">
        <div class="col-md-4 mb-4">
            <div class="card p-3">
                <h5>Recommended Books</h5>
                <p>Get tailored book suggestions based on your preferences.</p>
                <a href="#" class="btn btn-dark">Explore Now</a>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card p-3">
                <h5>Book List</h5>
                <p>View and manage books you've saved for later reading.</p>
                <a href="booklist.jsp" class="btn btn-dark">View List</a>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card p-3">
                <h5>Profile Settings</h5>
                <p>Update your profile, preferences, and account info.</p>
                <a href="#" class="btn btn-dark">Go to Profile</a>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card p-3">
                <h5>Admin pannel</h5>
                <p>Update your profile, preferences, and account info.</p>
                <a href="admin.jsp" class="btn btn-dark">Admin</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
