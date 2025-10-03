<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Iniciar sesión - Cliente</title>
        <style>
            body {
                font-family: Arial;
                background: #f2f2f2;
                margin:0;
                padding:0;
            }
            .container {
                width: 400px;
                margin: 50px auto;
                background:#fff;
                padding:20px;
                border-radius:8px;
                box-shadow:0 0 10px #ccc;
            }
            input {
                width:100%;
                padding:8px;
                margin:5px 0;
                border-radius:4px;
                border:1px solid #ccc;
            }
            button {
                width:100%;
                padding:10px;
                background:#28a745;
                color:white;
                border:none;
                border-radius:4px;
                cursor:pointer;
            }
            button:hover {
                background:#218838;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Iniciar sesión</h2>
            <form action="ClienteServlet" method="post">
                <input type="hidden" name="accion" value="login">
                <label>Email:</label>
                <input type="email" name="email" required>
                <label>Contraseña:</label>
                <input type="password" name="password" required>
                <button type="submit">Entrar</button>
            </form>
            <a href="tienda.jsp">Volver a la tienda</a>
        </div>
    </body>
</html>