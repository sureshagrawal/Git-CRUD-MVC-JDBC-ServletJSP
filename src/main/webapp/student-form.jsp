<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nsgacademy.crudmvc.model.Student" %>
<jsp:useBean id="student" class="com.nsgacademy.crudmvc.model.Student" scope="request" />

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


        <%--
                <%
                    Student student = (Student) request.getAttribute("student");
                    if (student != null && student.getId() != 0) {
                %>
                <form action="update" method="post">
                    <h2>Edit Student</h2>
                    <input type="hidden" name="id" value="<%= student.getId() %>" />
                <% } else { %>
                <form action="insert" method="post">
                    <h2>Add New Student</h2>
                <% } %>
        --%>



        <%--
            Student student = (Student) request.getAttribute("student");
            OR
            <jsp:useBean id="student" class="com.nsgacademy.crudmvc.model.Student" scope="request" />
            We should declare the bean before using it in scriptlet or JSTL code
        --%>


        <%

            boolean isEdit = student != null && student.getId() != 0;
        %>
        <form action="<%= isEdit ? "update" : "insert" %>" method="post">
            <h2><%= isEdit ? "Edit Student" : "Add New Student" %></h2>

            <% if (isEdit) { %>
                <input type="hidden" name="id" value="<%= student.getId() %>" />
            <% } %>


            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" placeholder="Enter your name" name="name"
                    value="<%= (student.getName() != null) ? student.getName() : "" %>" id="stnameid" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="text" class="form-control" placeholder="Enter your Email" name="email"
                    value="<%= (student.getEmail() != null) ? student.getEmail() : "" %>" id="stemailid" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Mobile</label>
                <input type="text" class="form-control" placeholder="Enter your Mobile" name="mobile"
                    value="<%= (student.getMobile() != null) ? student.getMobile() : "" %>" id="stmobileid" required>
            </div>

            <button type="submit" class="btn btn-primary" name="submit">Submit</button>
            <button type="reset" class="btn btn-dark">Reset</button>
        </form>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
