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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background: #f4f4f4;
        }
        a {
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            margin: 2px;
        }
        .btn-editar {
            background: #007bff;
            color: white;
        }
        .btn-eliminar {
            background: #dc3545;
            color: white;
        }
        .btn-agregar {
            display: inline-block;
            margin-top: 10px;
            background: #28a745;
            color: white;
        }
        .btn-volver {
            display: inline-block;
            margin-top: 10px;
            background: blue;
            color: white;
        }

    </style>
    <body>
        <h2>Lista de Empleados</h2>
        <a href="${pageContext.request.contextPath}/admin/registroEmpleado.jsp" class="btn-agregar">Agregar Nuevo Empleado</a>
        <a href="${pageContext.request.contextPath}/admin/panel.jsp" class="btn-volver">Volver al Panel Admin</a>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
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
                    <a href="EmpleadoServlet?action=editar&id=<%= u.getId()%>" class="btn-editar">Editar</a>
                    <a href="EmpleadoServlet?action=eliminar&id=<%= u.getId()%>" class="btn-eliminar" onclick="return confirm('¿Eliminar este empleado?')">Eliminar</a>
                </td>
            </tr>
            <% }%>
        </table>
        <br>

    </body>
</html>