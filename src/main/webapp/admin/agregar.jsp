🔹 agregar.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Agregar Producto</title>
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
    </head>
    <body>
        <h2>Agregar Producto</h2>
        <form action="ProductoServlet" method="post">
            <input type="hidden" name="action" value="insertar">
            Nombre: <input type="text" name="nombre"><br>
            Descripción: <input type="text" name="descripcion"><br>
            Precio: <input type="number" step="0.01" name="precio"><br>
            Stock: <input type="number" name="stock"><br>
            Imagen (ruta): 
            <input type="text" name="imagen" >
            <button type="submit">Guardar</button>
        </form>

        <a href="../ProductoServlet?action=listar">Volver a la lista</a>
    </body>
</html>