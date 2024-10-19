<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="thuy.dev.bean.StudentBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Lấy đối tượng StudentBean từ session
            StudentBean std = (StudentBean) request.getSession().getAttribute("student");
            // Kiểm tra xem đối tượng std có null không
            if (std != null) {
        %>
            <h1>First Name: <%= std.getFirstName() %></h1>
            <h2>Last Name: <%= std.getLastName() %></h2>
            <h3>Age: <%= std.getAge() %></h3>
        <%
            } else { 
        %>
            <h1>No student information available.</h1>
        <%
            }
        %>
    </body>
</html>
