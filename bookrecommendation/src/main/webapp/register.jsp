<%-- 
    Document   : register
    Created on : 5 Apr 2025, 4:27:22 pm
    Author     : Siddhant Kumar
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Book Recommendation</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: 
                        url('https://images.unsplash.com/photo-1512820790803-83ca734da794') no-repeat center center/cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        .register-card {
            background: white;
            border: 2px solid black;
            border-radius: 15px;
            padding: 2rem;
            max-width: 450px;
            width: 100%;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .form-control {
            border-color: black;
            color: black;
        }

        .form-label {
            color: black;
        }

        .btn-black {
            background-color: black;
            color: white;
            transition: 0.3s ease;
        }

        .btn-black:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

<div class="register-card">
    <h3 class="text-center mb-4">Register</h3>

    <form action="register" method="post">
        <div class="mb-3">
            <label for="fullname" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="fullname" name="fullname" required placeholder="Enter your full name">
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required placeholder="Create a password">
        </div>

        <button type="submit" class="btn btn-black w-100">Register</button>
    </form>

    <p class="text-center mt-3">
        Already have an account? <a href="login.jsp" class="text-decoration-none">Login here</a>
    </p>

    <%-- Display error if exists --%>
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <div class="alert alert-danger mt-3" role="alert">
            <%= error %>
        </div>
    <%
        }
    %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
