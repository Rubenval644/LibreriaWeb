<%@ page import="modelo.Usuario" %>
<%
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null) {
        response.sendRedirect("login.jsp?error=Debes iniciar sesión");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Panel Administrativo</title>
    </head>
    <style>
        .btn{
            display:inline-block;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius:5px;
        }
        .clientes{
            background-color: blue;
        }
        .productos{
            background-color: blue;
        }
        .empleados{
            background-color: blue;
        }
        .web{
            background-color: blue;
        }
        .salir{
            background-color: red;
        }
    </style>
    <body>
        <h2>Bienvenido, <%= u.getNombre()%> (<%= u.getRol()%>)</h2>

        <!--Esto lo puede ver el admin y empleados-->

        <a href="../ClienteServlet?action=listar" class="btn clientes">Gestionar Clientes</a>

        <!-- Solo el admin puede ver esto -->
        <% if ("ADMIN".equals(u.getRol())) { %>
        <a href="../EmpleadoServlet?action=listar" class="btn empleados">Gestionar Empleados</a>
        <% }%>
        
        <!--Esto lo puede ver el admin y empleados-->
        <a href="../ProductoServlet?action=listar" class="btn productos">Lista de productos</a>
        <a href="../tienda.jsp" class="btn web">Pagina Web</a><br><br>
        <a href="../logout.jsp" class="btn salir">Cerrar Sesión</a>
    </body>
</html>