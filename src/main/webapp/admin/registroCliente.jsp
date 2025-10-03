<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registrar Cliente</title>
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
                background: #28a745;
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
        <h2>Registrar Cliente</h2>
        <form action="${pageContext.request.contextPath}/ClienteServlet" method="post">
            <input type="hidden" name="accion" value="insertar">

            <label>Nombre:</label>
            <input type="text" name="nombre" required>

            <label>Apellido:</label>
            <input type="text" name="apellido" required>

            <label>Sexo:</label>
            <select name="sexo" required>
                <option value="">Seleccione...</option>
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Contraseña:</label>
            <input type="password" name="password" required>

            <button type="submit">Registrar</button>
        </form>
        <a href="${pageContext.request.contextPath}/ClienteServlet?action=listar">Volver a la lista</a>
    </body>
</html>