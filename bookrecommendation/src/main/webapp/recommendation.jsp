<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%--<%@ page import="com.mycompany.bookrecommendation.model.Book" %>--%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Recommendations</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body style="background-color: #f8f9fa">

<div class="container mt-5">
    <h2>Book Recommendations</h2>
    <div class="row">
        <%
            List<Book> books = (List<Book>) request.getAttribute("bookList");
            if (books != null && !books.isEmpty()) {
                for (Book book : books) {
        %>
        <div class="col-md-4">
            <div class="card mb-4 p-3 shadow-sm">
                <h5><%= book.getTitle() %></h5>
                <p><strong>Author:</strong> <%= book.getAuthor() %></p>
                <p><strong>Rating:</strong> <%= book.getRating() %></p>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>No recommended books found.</p>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
