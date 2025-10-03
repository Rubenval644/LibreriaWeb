<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modelo.Usuario" %>
<%
    Usuario empleado = (Usuario) request.getAttribute("empleado");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Empleado</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            h2 {
                color: #333;
            }
            form {
                width: 350px;
                padding: 15px;
                border: 1px solid #ccc;
                border-radius: 6px;
                background: #f9f9f9;
            }
            label {
                display: block;
                margin-top: 10px;
            }
            input {
                width: 95%;
                padding: 8px;
                margin-top: 5px;
            }
            button {
                margin-top: 15px;
                padding: 10px;
                background: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
            }
            a {
                display: inline-block;
                margin-top: 10px;
                text-decoration: none;
                color: #555;
            }
        </style>
    </head>
    <body>
        <h2>Editar Empleado</h2>

        <form action="${pageContext.request.contextPath}/EmpleadoServlet" method="post">

            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="<%= empleado.getId()%>">

            <label>Nombre:</label>
            <input type="text" name="nombre" value="<%= empleado.getNombre()%>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<%= empleado.getEmail()%>" required>

            <label>Contraseña:</label>
            <input type="password" name="password" value="<%= empleado.getPassword()%>" required>

            <button type="submit">Guardar Cambios</button>
        </form>

        <a href="listarEmpleados.jsp">Volver a la lista</a>
    </body>
</html>