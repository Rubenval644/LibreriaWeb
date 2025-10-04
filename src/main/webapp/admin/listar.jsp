<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Producto" %>

<%
    List<Producto> lista = (List<Producto>) request.getAttribute("lista");
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


        <form action="ProductoServlet" method="get" style="margin-bottom:15px;">
            <input type="hidden" name="action" value="filtrar">
            <label for="categoria">Filtrar por categoría:</label>
            <select name="categoria" id="categoria" onchange="this.form.submit()">
                <option value="">Todas</option>
                <%
                    Set<String> categorias = new HashSet<>();
                    for (Producto p : lista) {
                        if (p.getCategoria() != null && !p.getCategoria().isEmpty()) {
                            categorias.add(p.getCategoria());
                        }
                    }
                    for (String cat : categorias) {
                %>
                <option value="<%= cat%>" <%= cat.equals(request.getParameter("categoria")) ? "selected" : ""%>>
                    <%= cat%>
                </option>
                <% } %>
            </select>
        </form>

        <a href="ProductoServlet?action=nuevo" class="btn-agregar">Agregar Producto</a>
        <a href="${pageContext.request.contextPath}/admin/panel.jsp" class="btn-agregar">Volver al panel</a>

        <table>
            <tr>
                <th>ID</th>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Acciones</th>
            </tr>

            <% for (Producto p : lista) {%>
            <tr>
                <td><%= p.getId()%></td>
                <td>
                    <img src="img/<%= p.getImagen()%>" alt="<%= p.getNombre()%>" width="100" height="100">
                </td>
                <td><%= p.getNombre()%></td>
                <td><%= p.getCategoria() != null ? p.getCategoria() : "Sin categoría"%></td>
                <td>S/. <%= p.getPrecio()%></td>
                <td><%= p.getStock()%></td>
                <td>
                    <a href="ProductoServlet?action=editar&id=<%= p.getId()%>" class="btn-editar">Editar</a>
                    <a href="ProductoServlet?action=eliminar&id=<%= p.getId()%>" class="btn-eliminar"
                       onclick="return confirm('¿Estás seguro de eliminar este producto?');">Eliminar</a>
                </td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
