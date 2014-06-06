<%-- 
    Document   : logout
    Created on : Jun 4, 2014, 3:51:26 PM
    Author     : jayanthi_raviteja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
 
        
            <%
                session.invalidate();
                response.sendRedirect("index.jsp");
           %>
        %>
        <h1>Hello World!</h1>
        <body>
            
    </body>
</html>
