<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,modelo.Producto" %>

<%
    // Recuperar la lista desde el Servlet
    List<Producto> lista = (List<Producto>) request.getAttribute("lista");

    // Evitar NullPointerException si entras directo al JSP
    if (lista == null) {
        lista = new ArrayList<>();
    }
%>

<html>
    <head>
        <title>Lista de Productos - Panel Administrativo</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            h2 {
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }
            th, td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: center;
            }
            th {
                background: #f4f4f4;
            }
            a {
                text-decoration: none;
                padding: 5px 10px;
                border-radius: 4px;
                margin: 2px;
            }
            .btn-editar {
                background: #007bff;
                color: white;
            }
            .btn-eliminar {
                background: #dc3545;
                color: white;
            }
            .btn-agregar {
                display: inline-block;
                margin-top: 10px;
                background: #28a745;
                color: white;
            }
        </style>
    </head>
    <body>
        <h2>Lista de Productos</h2>

        <a href="ProductoServlet?action=nuevo" class="btn-agregar">Agregar Producto</a>

        <table>
            <tr>
                <th>ID</th>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Acciones</th>
            </tr>

            <% for (Producto p : lista) {%>
            <tr>
                <td><%= p.getId()%></td>
                <td>
    <img src="img/<%= p.getImagen() %>" alt="<%= p.getNombre() %>" width="100" height="100">
</td>
                <td><%= p.getNombre()%></td>
                <td>S/. <%= p.getPrecio()%></td>
                <td><%= p.getStock()%></td>

                <td>
                    <a href="ProductoServlet?action=editar&id=<%= p.getId()%>" class="btn-editar">Editar</a>
                    <a href="ProductoServlet?action=eliminar&id=<%= p.getId()%>" class="btn-eliminar" onclick="return confirm('¿Estás seguro de eliminar este producto?');">
                        Eliminar</a>
                </td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
