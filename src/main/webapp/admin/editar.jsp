<%@ page import="modelo.Producto" %>
<%
    // Obtenemos el producto enviado por el servlet
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

        <a href="listar.jsp">Volver a la lista</a>
    </body>
</html>