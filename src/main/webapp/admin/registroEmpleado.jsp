<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="modelo.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"ADMIN".equals(usuario.getRol())) {
        response.sendRedirect("admin/login.jsp");
        return;
    }
%>
<html>
<head><title>Registrar Empleado</title></head>
<body>
<h2>Registrar Empleado</h2>
<form action="RegistroEmpleadoServlet" method="post">
    Nombre: <input type="text" name="nombre" required><br>
    Email: <input type="email" name="email" required><br>
    Password: <input type="password" name="password" required><br>
    <button type="submit">Registrar</button>
</form>
</body>
</html>
