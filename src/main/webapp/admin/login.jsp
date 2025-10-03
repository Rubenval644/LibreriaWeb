<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    <style>
        body{
            background-color: #007bff;
            font-family: Arial,sans-serif;
        }
        .container {
            display: flex;
            padding: 200px;
            align-items: center;
            justify-content: center;
            gap: 50px;

        }
        .formulario{
            max-width:300px;
        }
        .formulario input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }
        .formulario button{
            background-color: beige;
            color: black;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        .imagen img {
            max-width: 600px;
            width: 100%;
            height: auto;
        }

    </style>
    <body>
        <div class="container">
            <div class="imagen">
                <img src="../img/librecrea.png" alt="libreria">
            </div>

            <div class="formulario">
                <h2>Iniciar Sesión</h2>
                <form action="../LoginServlet" method="post">
                    <label for="co">Correo:</label><br>
                    <input type="text" name="email" required><br><br>
                    <label for="con">Contraseña:</label><br>
                    <input type="password" name="password" required><br><br>
                    <button type="submit">Ingresar</button>
            </div> 
        </section>
        <div class="imagen">

        </div>
    </div>

    <%
        String error = request.getParameter("error");
        if (error != null) {
            out.println("<p style='color:red'>" + error + "</p>");
        }
    %>
</body>
</html>

