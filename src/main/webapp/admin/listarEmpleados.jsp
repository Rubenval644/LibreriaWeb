<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dao.UsuarioDAO,modelo.Usuario" %>
<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> empleados = dao.listarPorRol("EMPLEADO");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Empleados</title>
    </head>
    <body>
        <h2>Listado de Empleados</h2>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Rol</th>
                <th>Acciones</th>
            </tr>
            <%
                for (Usuario u : empleados) {
            %>
            <tr>
                <td><%= u.getId()%></td>
                <td><%= u.getNombre()%></td>
                <td><%= u.getEmail()%></td>
                <td><%= u.getRol()%></td>
                <td>
                    <a href="EditarUsuarioServlet?id=<%= u.getId()%>">Editar</a> |
                    <a href="EliminarUsuarioServlet?id=<%= u.getId()%>" onclick="return confirm('¿Eliminar este empleado?')">Eliminar</a>
                </td>
            </tr>
            <% }%>
        </table>
        <br>
        <a href="${pageContext.request.contextPath}/admin/registroEmpleado.jsp">Agregar Nuevo Empleado</a><br>
        <a href="${pageContext.request.contextPath}/admin/panel.jsp">Volver al Panel Admin</a>
    </body>
</html>