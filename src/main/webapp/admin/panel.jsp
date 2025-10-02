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
    .buttom{
    display:inline-block;
    background-color: green;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius:5px;
}
</style>
<body>
<h2>Bienvenido, <%= u.getNombre() %> (<%= u.getRol() %>)</h2>

<!--Esto lo puede ver el admin y empleados-->

<a href="../ClienteServlet?action=listar" class="buttom">Gestionar Clientes</a><br><br>
<a href="../ProductoServlet?action=listar" class="buttom">Lista de productos</a><br><br>

<!-- Solo el admin puede ver esto -->
<% if ("ADMIN".equals(u.getRol())) { %>
    <a href="../EmpleadoServlet?action=listar" class="buttom">Gestionar Empleados</a><br><br>
<% } %>

<a href="../logout.jsp">Cerrar Sesión</a>
</body>
</html>