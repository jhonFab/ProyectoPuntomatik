<%-- 
    Document   : loginAgente
    Created on : 18-nov-2020, 21:02:45
    Author     : Usuario
--%>
<%@page import="Model.Agente"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.accessibility.AccessibleRole"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="estilos.css">
        <title>Login</title>
    </head>

    <h1 style="color: white;text-align: center" class="mt-5"> PuntoMatik </h1>
    <h1 style="color: white;text-align: center"> <img src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTM4Ni41MDkgNTEyaC0yNjEuMDI1YzIxLjE5LTM1LjgxOCA1Ni42OTUtNjIuMTYyIDk4LjY0NS03MS4xMzh2LTU1LjIyOWg2My43MzZ2NTUuMjI5YzQxLjk0OSA4Ljk3NiA3Ny40NTQgMzUuMzIgOTguNjQ0IDcxLjEzOHoiIGZpbGw9IiNiM2U1OWYiLz48cGF0aCBkPSJtMjQxLjc0IDM4NS42Mjh2NTUuMjM0Yy0xOC43NzkgOC45NzItMzQuNjYzIDM1LjMyMi00NC4xNSA3MS4xMzhoLTcyLjEwNmMyMS4xODktMzUuODE2IDU2LjY5Ni02Mi4xNjYgOTguNjQyLTcxLjEzOHYtNTUuMjM0eiIgZmlsbD0iIzk1ZDZhNCIvPjxwYXRoIGQ9Im0yODguNzI0IDQxOS45NThoLTY2LjY0NmMtNy4yODIgMC0xMy4xODYtNS45MDQtMTMuMTg2LTEzLjE4NnYtNy45NTNjMC03LjI4MiA1LjkwNC0xMy4xODYgMTMuMTg2LTEzLjE4Nmg2Ni42NDZjNy4yODIgMCAxMy4xODYgNS45MDQgMTMuMTg2IDEzLjE4NnY3Ljk1M2MwIDcuMjgyLTUuOTA0IDEzLjE4Ni0xMy4xODYgMTMuMTg2eiIgZmlsbD0iI2IzZTU5ZiIvPjxwYXRoIGQ9Im0yNjEuMTI4IDQxOS45NjFoLTM5LjA1MWMtNy4yODMgMC0xMy4xODUtNS45MDItMTMuMTg1LTEzLjE4NXYtNy45NTJjMC03LjI4MyA1LjkwMi0xMy4xOTUgMTMuMTg1LTEzLjE5NWgzOS4wNTFjLTcuMjgzIDAtMTMuMTg1IDUuOTEzLTEzLjE4NSAxMy4xOTV2Ny45NTJjLS4wMDEgNy4yODMgNS45MDIgMTMuMTg1IDEzLjE4NSAxMy4xODV6IiBmaWxsPSIjOTVkNmE0Ii8+PHBhdGggZD0ibTQwOC4yNTUgMjY2LjQwOXYtMTg4Ljk0OGMwLTI3LjQxMS0yMi4yMjgtNDkuNjIxLTQ5LjYzOS00OS42MjEtMTguMjc0IDAtMzQuMjMzIDkuODg1LTQyLjgzNSAyNC41OTctMjAuMTYyLTMxLjUyNS01NS40NDUtNTIuNDM1LTk1LjY0NS01Mi40MzUtMzEuMzI5IDAtNTkuNzAyIDEyLjY5OS04MC4yMzggMzMuMjM1cy0zMy4yMzUgNDguODkxLTMzLjIzNSA4MC4yMzh2MTUyLjA0NCIgZmlsbD0iI2FhN2E2MyIvPjxwYXRoIGQ9Im0xMDYuNjYzIDI2NS41MTd2LTE1Mi4wNDJjMC0zMS4zNDYgMTIuNzAxLTU5LjcwNCAzMy4yNDEtODAuMjQ0IDIwLjUzLTIwLjUzIDQ4LjkwOS0zMy4yMzEgODAuMjM0LTMzLjIzMSAxNy4zNDcgMCAzMy43ODcgMy45MDQgNDguNDg3IDEwLjg2OC0xMS44NDYgNS42MDQtMjIuNTY5IDEzLjIwNi0zMS43MzcgMjIuMzYzLTIwLjU0IDIwLjU0LTMzLjIzMSA0OC44OTktMzMuMjMxIDgwLjI0NHYxNTIuMDQyeiIgZmlsbD0iIzk4NmI1NCIvPjxnIGZpbGw9IiNmZmNiYmUiPjxjaXJjbGUgY3g9IjExNC4zMzkiIGN5PSIyNzIuOTAxIiByPSI0MC44MDYiLz48Y2lyY2xlIGN4PSIzOTcuNjYxIiBjeT0iMjcyLjkwMSIgcj0iNDAuODA2Ii8+PC9nPjxwYXRoIGQ9Im0xMzYuNDE4IDI4NC43MThjLTIuNzk2IDAtNS41MDgtMS40NzYtNi45NjQtNC4wOTItMi40OTgtNC40OTMtNi43OTMtNi45ODYtMTMuMTI4LTcuNjIyLTUuMTg0LS41MjEtOS42NzEuNTAxLTkuNzE0LjUxMS00LjI3MiAxLjA0Ni04LjU4LTEuNTY0LTkuNjI3LTUuODMzLTEuMDQ4LTQuMjY5IDEuNTYzLTguNTggNS44MzMtOS42MjcuNzEyLS4xNzUgNy4xODgtMS42ODYgMTUuMS0uODkgMTEuNTc1IDEuMTYzIDIwLjM3NSA2LjYgMjUuNDQ5IDE1LjcyNCAyLjEzNyAzLjg0Mi43NTQgOC42ODgtMy4wODggMTAuODI1LTEuMjI0LjY4LTIuNTUyIDEuMDAzLTMuODYxIDEuMDA0eiIgZmlsbD0iI2VhYWM5ZCIvPjxwYXRoIGQ9Im0zNzUuNTgxIDI4NC43MThjLTEuMzEgMC0yLjYzNi0uMzI0LTMuODYyLTEuMDA1LTMuODQxLTIuMTM3LTUuMjI0LTYuOTgzLTMuMDg3LTEwLjgyNSA1LjA3NS05LjEyNCAxMy44NzUtMTQuNTYxIDI1LjQ1LTE1LjcyNCA3LjkwOS0uNzk1IDE0LjM4Ny43MTUgMTUuMS44OSA0LjI2OSAxLjA0OCA2Ljg4MSA1LjM1OCA1LjgzMyA5LjYyNy0xLjA0NiA0LjI1OC01LjM0IDYuODY2LTkuNTk0IDUuODQxLS4xNTgtLjAzNi00LjgxMi0xLjA4Ny0xMC4xMjctLjQ3OS02LjEzMi43MDItMTAuMzAyIDMuMTgyLTEyLjc0OSA3LjU4Mi0xLjQ1NiAyLjYxNy00LjE2OCA0LjA5Mi02Ljk2NCA0LjA5M3oiIGZpbGw9IiNlYWFjOWQiLz48cGF0aCBkPSJtMzc3LjIyMyAxOTQuMTc1djgxLjk5NWMwIDYxLjY5Mi01MC4wMTEgMTExLjcwMy0xMTEuNzAzIDExMS43MDNoLTE5LjAzNmMtNjEuNjkyIDAtMTExLjcxNC01MC4wMTEtMTExLjcxNC0xMTEuNzAzdi04MS45OTVjMC0uMzMgMC0uNjcuMDExLS45OTkuMjk5LTM4LjA0MSA0MS40NzEtNjEuNDA0IDc0Ljc1NC00Mi45NTUgMTMuNzYyIDcuNjIzIDI5LjYwNSAxMS45NyA0Ni40NjggMTEuOTcgMzcuNzIyIDAgNzAuMzc2LTIxLjc1NiA4Ni4wNDQtNTMuNDEgMjEuNzQ0IDIxLjg5OSAzNS4xNzYgNTIuMDcxIDM1LjE3NiA4NS4zOTR6IiBmaWxsPSIjZmZkZGNlIi8+PHBhdGggZD0ibTI5Mi4zMTcgMzg0LjYyN2MtOC41ODEgMi4xMjItMTcuNTUzIDMuMjQ1LTI2Ljc5MyAzLjI0NWgtMTkuMDM2Yy02MS42OTIgMC0xMTEuNzEzLTUwLjAxMS0xMTEuNzEzLTExMS43MDN2LTgxLjk5NWMwLS4zMyAwLS42Ny4wMS0uOTk5LjI5OS0zOC4wNDEgNDEuNDcyLTYxLjQwNCA3NC43NTQtNDIuOTU1IDQuNTUzIDIuNTI0IDkuMzMzIDQuNjg3IDE0LjMwOCA2LjQ0OC05Ljg0NyA4Ljc3Ni0xNi4zMjcgMjEuNDk4LTE2LjQ0IDM2LjUwNi0uMDEuMzMtLjAxLjY3LS4wMS45OTl2ODEuOTk1Yy0uMDAxIDUyLjQ1MyAzNi4xNjUgOTYuNDY5IDg0LjkyIDEwOC40NTl6IiBmaWxsPSIjZmZjYmJlIi8+PGcgZmlsbD0iIzJiNGQ2NiI+PGVsbGlwc2UgY3g9IjIwMy41NzMiIGN5PSIyNDUuMzA3IiByeD0iMTMuNTE4IiByeT0iMTguNTIiLz48cGF0aCBkPSJtMzA4LjQyNiAyMjYuNzg3Yy03LjQ1NCAwLTEzLjUxNyA4LjMwOC0xMy41MTcgMTguNTJzNi4wNjMgMTguNTIgMTMuNTE3IDE4LjUyIDEzLjUxOC04LjMwOCAxMy41MTgtMTguNTItNi4wNjQtMTguNTItMTMuNTE4LTE4LjUyeiIvPjwvZz48ZyBmaWxsPSIjYWE3YTYzIj48cGF0aCBkPSJtMjE1LjgwMSAxOTUuODFjLTEuOTc3IDAtMy45NTUtLjc1NC01LjQ2My0yLjI2My02LjEzMS02LjEyOS0xNi4xMDMtNi4xMjktMjIuMjMzIDAtMy4wMTcgMy4wMTctNy45MDkgMy4wMTctMTAuOTI3IDAtMy4wMTctMy4wMTgtMy4wMTctNy45MDkuMDAxLTEwLjkyNyAxMi4xNTMtMTIuMTU0IDMxLjkzMi0xMi4xNTQgNDQuMDg1IDAgMy4wMTggMy4wMTcgMy4wMTggNy45MDkuMDAxIDEwLjkyNy0xLjUxIDEuNTA5LTMuNDg4IDIuMjYzLTUuNDY0IDIuMjYzeiIvPjxwYXRoIGQ9Im0zMzAuNTIzIDE5NS44MWMtMS45NzcgMC0zLjk1NS0uNzU0LTUuNDYzLTIuMjYzLTYuMTMxLTYuMTI5LTE2LjEwMy02LjEyOS0yMi4yMzMgMC0zLjAxNyAzLjAxNy03LjkwOSAzLjAxNy0xMC45MjcgMC0zLjAxNy0zLjAxOC0zLjAxNy03LjkwOS4wMDEtMTAuOTI3IDEyLjE1My0xMi4xNTQgMzEuOTMyLTEyLjE1NCA0NC4wODUgMCAzLjAxOCAzLjAxNyAzLjAxOCA3LjkwOS4wMDEgMTAuOTI3LTEuNTA5IDEuNTA5LTMuNDg3IDIuMjYzLTUuNDY0IDIuMjYzeiIvPjwvZz48cGF0aCBkPSJtMjU2LjAwMiAzMjkuNDg5Yy0xMC4yNyAwLTIwLjA0MS00LjkzMi0yNi4xMzgtMTMuMTkyLTIuNTM0LTMuNDMzLTEuODA1LTguMjcxIDEuNjI4LTEwLjgwNSAzLjQzNS0yLjUzMyA4LjI3MS0xLjgwNSAxMC44MDUgMS42MjggMy4yNDQgNC4zOTUgOC4yMzkgNi45MTYgMTMuNzA1IDYuOTE2czEwLjQ2MS0yLjUyMSAxMy43MDUtNi45MTZjMi41MzMtMy40MzMgNy4zNjktNC4xNjMgMTAuODA1LTEuNjI4IDMuNDMzIDIuNTM0IDQuMTYyIDcuMzcxIDEuNjI4IDEwLjgwNS02LjA5NyA4LjI2LTE1Ljg2OSAxMy4xOTItMjYuMTM4IDEzLjE5MnoiIGZpbGw9IiNlYWE1OTgiLz48cGF0aCBkPSJtMzU0Ljg4OSAyNDkuNzI2Yy0yLjc0MiAwLTUuMzk5LTEuNDY0LTYuNzk5LTQuMDQ0LTIuMDM0LTMuNzUxLS42NDMtOC40NDEgMy4xMDgtMTAuNDc1bDIyLjM0NC0xMi4xMmMzLjc1LTIuMDM1IDguNDQyLS42NDQgMTAuNDc2IDMuMTA4IDIuMDM0IDMuNzUxLjY0MyA4LjQ0MS0zLjEwOCAxMC40NzVsLTIyLjM0NCAxMi4xMmMtMS4xNzEuNjM0LTIuNDMyLjkzNi0zLjY3Ny45MzZ6IiBmaWxsPSIjNTQ5MGY5Ii8+PHBhdGggZD0ibTE1Ny4xMSAyNDkuNzI2Yy0xLjI0NCAwLTIuNTA2LS4zMDEtMy42NzctLjkzNmwtMjIuMzQzLTEyLjEyYy0zLjc1MS0yLjAzNS01LjE0Mi02LjcyNS0zLjEwOC0xMC40NzZzNi43MjMtNS4xNDIgMTAuNDc2LTMuMTA3bDIyLjM0MyAxMi4xMmMzLjc1MSAyLjAzNSA1LjE0MiA2LjcyNSAzLjEwOCAxMC40NzYtMS4zOTkgMi41NzktNC4wNTYgNC4wNDMtNi43OTkgNC4wNDN6IiBmaWxsPSIjNTQ5MGY5Ii8+PHBhdGggZD0ibTMzMi44NTMgMTk4Ljg0OWgtMzkuOThjLTE0LjkzOSAwLTI3LjMzOCAxMS4wNjctMjkuNDM4IDI1LjQzMi0yLjM3Ny0uNzIzLTQuODc1LTEuMTExLTcuNDM0LTEuMTExcy01LjA1OS4zODgtNy40MzUgMS4xMTFjLTIuMS0xNC4zNjUtMTQuNDk5LTI1LjQzMi0yOS40MzgtMjUuNDMyaC0zOS45ODFjLTE2LjQwNyAwLTI5Ljc1NiAxMy4zNDgtMjkuNzU2IDI5Ljc1NnYzOC41OGMwIDE2LjQwNyAxMy4zNDggMjkuNzU2IDI5Ljc1NiAyOS43NTZoMzkuOTgxYzE2LjQwNyAwIDI5Ljc1Ni0xMy4zNDggMjkuNzU2LTI5Ljc1NnYtMjUuNThjMS44NTktMS45MDUgNC4zNTktMi45ODIgNy4xMTgtMi45ODIgMi43NTggMCA1LjI1OCAxLjA3NyA3LjExNyAyLjk4MnYyNS41OGMwIDE2LjQwNyAxMy4zNDggMjkuNzU2IDI5Ljc1NiAyOS43NTZoMzkuOThjMTYuNDA3IDAgMjkuNzU2LTEzLjM0OCAyOS43NTYtMjkuNzU2di0zOC41OGMtLjAwMy0xNi40MDgtMTMuMzUxLTI5Ljc1Ni0yOS43NTgtMjkuNzU2em0tOTkuNDIzIDY4LjMzNmMwIDcuODg3LTYuNDE3IDE0LjMwMy0xNC4zMDMgMTQuMzAzaC0zOS45ODFjLTcuODg2IDAtMTQuMzAzLTYuNDE2LTE0LjMwMy0xNC4zMDN2LTM4LjU4YzAtNy44ODcgNi40MTYtMTQuMzAzIDE0LjMwMy0xNC4zMDNoMzkuOTgxYzcuODg2IDAgMTQuMzAzIDYuNDE2IDE0LjMwMyAxNC4zMDN6bTExMy43MjYgMGMwIDcuODg3LTYuNDE3IDE0LjMwMy0xNC4zMDMgMTQuMzAzaC0zOS45OGMtNy44ODYgMC0xNC4zMDMtNi40MTYtMTQuMzAzLTE0LjMwM3YtMzguNThjMC03Ljg4NyA2LjQxNi0xNC4zMDMgMTQuMzAzLTE0LjMwM2gzOS45OGM3Ljg4NiAwIDE0LjMwMyA2LjQxNiAxNC4zMDMgMTQuMzAzeiIgZmlsbD0iIzYxYTJmOSIvPjwvZz48L3N2Zz4=" heigth="80" width="80"/></i>   Inicio de sesión</h1>
<hr style="width:75%; border-color: blue" >
<body >

    <%
        PreparedStatement pst = null;
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
    %>
    <style>

        form{
            width: 400px;
            height: 300px;
            text-align: center;
            border: 5px solid blue;
            margin: auto;
            position: static; 
            border-radius: 5px;
            background: aliceblue;
            color: blue;

        }
        div.alert alert-danger{
            text-align: center;
            margin: auto; 
        }
    </style>

    <form>
        <div class="container_P mt-5 ">
            <div class="row">
                <div class="col-sm">
                    <form>
                        <div class="form-group">
                            <label class="label_1" ><i class="fa fa-user fa-2x" aria-hidden="true"></i>Usuario</label>
                            <input type="text" class="form-control" name="cedula"placeholder="Ingrese cedula">


                        </div> 




                        <button  type="submit" style="background: #000066" class="btn btn-primary"name="login"><i class="fa fa-sign-in" aria-hidden="true"></i> Iniciar sesión</button>
                    </form>
                </div>
            </div>
        </div>
    </form>
</body>

<%                    if (request.getParameter("login") != null) {
        String cedula = request.getParameter("cedula");
        try {

            String url = "jdbc:mysql://localhost:3307/software";
            String username = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            st = con.createStatement();
            rs = st.executeQuery("SELECT id_agente, nombre FROM `agente`   WHERE id_agente=" + cedula + "");

            while (rs.next()) {
                HttpSession sesion = request.getSession();
                if (cedula.equals(rs.getString(1))) {

                    sesion.setAttribute("logueo", "1");
                    response.sendRedirect("inicioAgente.jsp");
                }

            }

        } catch (Exception e) {%>
<div class="alert alert-danger" role="alert"><%
                                out.print("Usario o contraseña invalido   !!! verifique de nuevo");
                            }
                        }
    %>
</html>
