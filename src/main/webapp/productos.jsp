<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.util.*, modelo.Producto, dao.ProductoDAO, modelo.Cliente"%>

<%
    ProductoDAO dao = new ProductoDAO();

    // Para obtener lista completa o filtrada
    String categoriaFiltro = request.getParameter("categoria");
    List<Producto> listaProductos;
    if (categoriaFiltro == null || categoriaFiltro.isEmpty()) {
        listaProductos = dao.listar();
    } else {
        listaProductos = dao.listarPorCategoria(categoriaFiltro);
    }

    // Para generar lista de categorías para el filtro
    Set<String> categorias = new HashSet<>();
    for (Producto p : dao.listar()) {
        if (p.getCategoria() != null && !p.getCategoria().isEmpty()) {
            categorias.add(p.getCategoria());
        }
    }

// Cliente en sesión
    Cliente clienteSesion = (Cliente) session.getAttribute("cliente");
%>

<html>
    <head>
        <title>Todos los Productos - Tienda</title>
        <link rel="stylesheet" href="css/tienda.css"/>
        <style>
            .filtro {
                margin-top: 20px;
                margin-bottom: 20px;
                margin-left: 100px;
            }

            h2{
                margin-top: 100px;
                margin-bottom: 50px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <header>
            <nav class="navbar">
                <a href="tienda.jsp" class="logo">LibreCrea</a>
                <ul class="links">
                    <li><a href="tienda.jsp">Inicio</a></li>
                    <li><a href="#nosotros">Nosotros</a></li>
                    <li><a href="productos.jsp">Productos</a></li>
                    <li><a href="carrito.jsp">Carrito</a></li>
                        <% if (clienteSesion == null) { %>
                    <li><a href="registroClienteWeb.jsp">Registrarse</a></li>
                    <li><a href="loginCliente.jsp">Iniciar sesión</a></li>
                        <% } else {%>
                    <li>Bienvenido, <strong><%= clienteSesion.getNombre()%></strong></li>
                    <li><a href="ClienteServlet?action=logout">Cerrar sesión</a></li>
                        <% } %>
                </ul>
            </nav>
        </header>
        <h2>Todos los Productos</h2>

        <!-- Filtro por categoría -->
        <form action="ProductoServlet" method="get" class="filtro">
            <input type="hidden" name="action" value="todos">
            <label for="categoria">Filtrar por categoría:</label>
            <select name="categoria" id="categoria" onchange="this.form.submit()">
                <option value="">Todas</option>
                <% for (String cat : categorias) {%>
                <option value="<%= cat%>" <%= cat.equals(categoriaFiltro) ? "selected" : ""%> ><%= cat%></option>
                <% } %>
            </select>
        </form>

        <!-- Lista de productos -->
        <div class="contenedor">
            <% for (Producto p : listaProductos) {%>
            <div class="producto">
                <img src="img/<%= p.getImagen()%>" alt="<%= p.getNombre()%>">
                <h3><%= p.getNombre()%></h3>
                <p><%= p.getDescripcion()%></p>
                <p>Precio: S/. <%= p.getPrecio()%></p>
                <p>Stock: <%= p.getStock()%></p>
                <form action="CompraServlet" method="post">
                    <input type="hidden" name="id" value="<%= p.getId()%>">
                    <% if (p.getStock() > 0) { %>
                    <button type="submit" class="btn">Comprar</button>
                    <% } else { %>
                    <button type="button" class="btn2"disabled>Agotado</button>
                    <% } %>
                </form>
            </div>
            <% }%>
        </div>
    </body>
</html>