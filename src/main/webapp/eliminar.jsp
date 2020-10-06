<%-- 
    Document   : eliminar
    Created on : 30 sep. 2020, 22:25:17
    Author     : jflinare24
--%>

<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            try {
            String url = "jdbc:mysql://localhost:3306/prueba";
                                    String username = "root";
                                    String password = "";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection(url, username, password);
                                    st = con.createStatement();
                                    st.executeUpdate("delete FROM `agente` where cedula='"+ request.getParameter("cedula")+ "' ");
                                    request.getRequestDispatcher("consultar.jsp").forward(request, response);
                                    
         }catch(Exception e){
         out.print(e);
         }

        %>
    </body>
</html>
