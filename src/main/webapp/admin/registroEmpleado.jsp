<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nuevo Empleado</title>
</head>
<style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            form {
                max-width: 400px;
            }
            label {
                display: block;
                margin: 8px 0 4px;
            }
            input {
                width: 100%;
                padding: 6px;
                margin-bottom: 10px;
            }
            button {
                padding: 8px 12px;
                background: #28a745;
                color: white;
                border: none;
                cursor: pointer;
            }
            a {
                display: inline-block;
                margin-top: 10px;
            }
        </style>
<body>
    <h2>Registrar Nuevo Empleado</h2>

    <form action="${pageContext.request.contextPath}/EmpleadoServlet" method="post">
    <input type="hidden" name="accion" value="insertar">

    <label>Nombre:</label><br>
    <input type="text" name="nombre" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Contraseña:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Guardar Empleado</button>
</form>

    <br>
    <a href="listarEmpleados.jsp">Volver a la lista</a>
</body>
</html>