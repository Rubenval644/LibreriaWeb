<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="modelo.Cliente" %>
<%
    Cliente c = (Cliente) request.getAttribute("cliente");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Cliente</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            h2 {
                color: #333;
            }
            form {
                max-width: 400px;
                margin: auto;
            }
            label {
                display: block;
                margin-top: 10px;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
            }
            button {
                margin-top: 15px;
                padding: 10px;
                width: 100%;
                background: #007bff;
                color: white;
                border: none;
            }
            a {
                display: block;
                margin-top: 10px;
                text-align: center;
                text-decoration: none;
                color: blue;
            }
        </style>
    </head>
    <body>
        <h2>Editar Cliente</h2>
        <form action="${pageContext.request.contextPath}/ClienteServlet" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="<%= c.getId()%>">

            <label>Nombre:</label>
            <input type="text" name="nombre" value="<%= c.getNombre()%>" required>

            <label>Apellido:</label>
            <input type="text" name="apellido" value="<%= c.getApellido()%>" required>

            <label>Sexo:</label>
            <select name="sexo" required>
                <option value="M" <%= "M".equals(c.getSexo()) ? "selected" : ""%>>Masculino</option>
                <option value="F" <%= "F".equals(c.getSexo()) ? "selected" : ""%>>Femenino</option>
            </select>

            <label>Email:</label>
            <input type="email" name="email" value="<%= c.getEmail()%>" required>

            <label>Contraseña:</label>
            <input type="password" name="password" value="<%= c.getPassword()%>" required>

            <button type="submit">Guardar Cambios</button>
        </form>
        <a href="${pageContext.request.contextPath}/ClienteServlet?action=listar">Volver a la lista</a>
    </body>
</html>