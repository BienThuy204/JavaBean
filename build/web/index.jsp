<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>

<html>
    <head>
        <title>Ví dụ JSTL</title>
    </head>
    <body>

        <!-- 1. Thẻ Cơ Bản (Core Tags) -->
        <h2>Ví dụ Thẻ Cơ Bản</h2>
        <c:set var="message" value="Hello, JSTL!" />
        <p>${message}</p>

        <!-- 2. Thẻ Định Dạng (Format Tags) -->
        <h2>Ví dụ Thẻ Định Dạng</h2>
        <fmt:setLocale value="vi_VN" /> <!-- Thiết lập ngôn ngữ là tiếng Việt -->
        <fmt:formatNumber value="12345.6789" type="currency" /> <!-- Định dạng số thành tiền tệ -->
        <br />
        <fmt:formatDate value="<%= new Date() %>" pattern="dd/MM/yyyy" /> <!-- Định dạng ngày tháng hiện tại -->

        <!-- 3. Thẻ SQL (SQL Tags) -->
        <h2>Ví dụ Thẻ SQL</h2>
        <sql:setDataSource var="myDataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/shop" user="root" password="" /> <!-- Thiết lập nguồn dữ liệu -->
        <sql:query dataSource="${myDataSource}" var="result"> 
            SELECT * FROM users
        </sql:query>
            
        <c:forEach var="row" items="${result.rows}"> 
            <p>${row.name} - ${row.email}</p> 
        </c:forEach>


        <h2>Ví dụ Thẻ XML</h2>
        <x:out select="/*" /> 

        <!-- 5. Thẻ Hàm (Function Tags) -->
        <h2>Ví dụ Thẻ Hàm</h2>
        <p>Chữ hoa: ${fn:toUpperCase(message)}</p> 
        <p>Độ dài: ${fn:length(message)}</p> 
    </body>
</html>
