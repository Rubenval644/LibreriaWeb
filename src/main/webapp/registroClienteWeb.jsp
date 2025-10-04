<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro de Cliente</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f2f2f2;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 400px;
                margin: 50px auto;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px #ccc;
            }
            h2 {
                text-align: center;
                color: #333;
            }
            label {
                display: block;
                margin-top: 10px;
                font-weight: bold;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                width: 100%;
                padding: 10px;
                background: blue;
                color: white;
                border: none;
                border-radius: 4px;
                margin-top: 15px;
                cursor: pointer;
            }
            button:hover {
                background: #3366ff;
            }
            .volver {
                display: block;
                text-align: center;
                margin-top: 15px;
                color: blue;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Registro de Cliente</h2>
            <form action="ClienteServlet" method="post">
                <input type="hidden" name="accion" value="insertar">
                <input type="hidden" name="origen" value="web">

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

            <a href="tienda.jsp" class="volver">Volver a la tienda</a>
        </div>
    </body>
</html>