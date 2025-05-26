<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.nsgacademy.crudmvc.model.Student" %>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NSG Academy</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
    rel="stylesheet">
</head>

<body>

    <div class="container my-5">
        <h1 class="text-center">MVC CRUD APPLICATION</h1>
        <h3 class="text-center">Using JSP AND Servlet</h3>
        <%
            Student std = (Student) request.getAttribute("student");
            if (std != null) {
        %>
        <form action="update" method="post">
            <h2>Edit Student</h2>
            <input type="hidden" name="id" value="<%= std.getId() %>" />
        <% } else { %>
        <form action="insert" method="post">
            <h2>Add New Student</h2>
        <% } %>
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" placeholder="Enter your name" name="name"
                    value="<%= (std != null) ? std.getName() : "" %>" id="stnameid" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="text" class="form-control" placeholder="Enter your Email" name="email"
                    value="<%= (std != null) ? std.getEmail() : "" %>" id="stemailid" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Mobile</label>
                <input type="text" class="form-control" placeholder="Enter your Mobile" name="mobile"
                    value="<%= (std != null) ? std.getMobile() : "" %>" id="stmobileid" required>
            </div>

            <button type="submit" class="btn btn-primary" name="submit">Submit</button>
            <button type="reset" class="btn btn-dark">Reset</button>
        </form>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
