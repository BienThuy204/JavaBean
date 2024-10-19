<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Information</title>
</head>
<body>
    <jsp:useBean id="student" class="thuy.dev.bean.StudentBean" scope="session">
        <jsp:setProperty name="student" property="firstName" value="Zara"/>
        <jsp:setProperty name="student" property="lastName" value="Ali"/>
        <jsp:setProperty name="student" property="age" value="10"/>
    </jsp:useBean>

    <h2>Student Information:</h2>
    <p>First Name: <jsp:getProperty name="student" property="firstName"/></p>
    <p>Last Name: <jsp:getProperty name="student" property="lastName"/></p>
    <p>Age: <jsp:getProperty name="student" property="age"/></p>
</body>
</html>
