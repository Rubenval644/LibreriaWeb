<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, dao.ProductoDAO, modelo.Producto" %>
<%
    ProductoDAO dao = new ProductoDAO();
    List<Producto> lista = dao.listar();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Tienda - Catálogo</title>
  <link rel="stylesheet" href="css/principal.css"/>
</head>
<body>
    <header>
            <nav class="navbar">
              <a href="#" class="logo">LibreCrea</a>
                <ul class="links">
                    <li><a href="index.html">Inicio</a></li>
                    <li><a href="vida_estudiantil.html">Productos</a></li>
                    
                </ul>
            </nav>
    </header>
  <h1>Tienda de útiles</h1>
  <a href="ProductoServlet?action=listar">Ir al panel administrativo</a>
  <hr>
  <div>
    <% for (Producto p : lista) { %>
      <div class="producto">
          <img src="img//<%= p.getImagen() %>" alt="<%= p.getNombre() %>" width="150" height="150">
        <h3><%= p.getNombre() %></h3>
        <p><%= p.getDescripcion() %></p>
        <p>Precio: S/. <%= p.getPrecio() %></p>
        <p>Stock: <%= p.getStock() %></p>
        <form action="CompraServlet" method="post">
          <input type="hidden" name="id" value="<%= p.getId() %>">
          <% if (p.getStock() > 0) { %>
            <button class="btn" type="submit">Comprar</button>
          <% } else { %>
            <button class="btn" type="button" disabled>Agotado</button>
          <% } %>
        </form>
      </div>
    <% } %>
  </div>
</body>
</html>