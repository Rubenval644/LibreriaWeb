<%@ page import="modelo.Producto" %>
<%
    Producto p = (Producto) request.getAttribute("producto");
    if (p == null) {
        out.println("<h2>Error: No se encontró el producto</h2>");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Producto</title>
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
        <h2>Editar Producto</h2>
        <form action="ProductoServlet" method="post">
            <input type="hidden" name="id" value="${producto.id}"/>
            <input type="hidden" name="action" value="actualizar">

            Nombre: <input type="text" name="nombre" value="${producto.nombre}"><br>
            Descripción: <input type="text" name="descripcion" value="${producto.descripcion}"><br>
            Precio: <input type="number" step="0.01" name="precio" value="${producto.precio}"><br>
            Stock: <input type="number" name="stock" value="${producto.stock}"><br>
            Imagen (ej: lapazul.jpg): 
            <input type="text" name="imagen" value="${producto.imagen}"><br>

            <input type="submit" value="Actualizar">
        </form>

        
    </body>
</html>