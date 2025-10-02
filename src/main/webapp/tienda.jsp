<%@page import="dao.ProductoDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Producto" %>

<%
    ProductoDAO dao = new ProductoDAO();
    List<Producto> lista = dao.listar();
%>

<html>
    <head>
        <title>Tienda Escolar - Catálogo</title>
        <link rel="stylesheet" href="css/tienda.css"/>
    </head>
    <body>

        <header>
            <nav class="navbar">
                <a href="#" class="logo">LibreCrea</a>
                <ul class="links">
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#nosotros">Nosotros</a></li>
                    <li><a href="#productos">Productos</a></li>

                </ul>
            </nav>
        </header>

        <main> 
            <section id="nosotros" class="about">
                <div class="about-content container">
                    <div class="about-txt">
                        <h2>Acerca de Nosotros</h2>
                        <hr>
                        <p>Liberacrea es una empresa dedicada a la venta de útiles
                            escolares, manualidades, arte y diseño. Opera principalmente 
                            como tienda online (Shopify) con cobertura nacional y un local físico en Lima.</p>
                        <br>
                        <p><strong>Misión:</strong> Liberacrea tiene como misión 
                            brindar a estudiantes, padres de familia y docentes 
                            una plataforma confiable y accesible para adquirir útiles 
                            escolares y de oficina de manera rápida, segura y eficiente, 
                            contribuyendo al desarrollo académico y fomentando la 
                            transformación digital en la educación peruana.</p>
                        <br>
                        <p><strong>Visión:</strong> Liberacrea tiene como visión ser la tienda 
                            virtual líder en el Perú en la venta de útiles escolares y de oficina, 
                            reconocida por su innovación tecnológica, precios accesibles y compromiso 
                            con la educación, logrando llegar a cada estudiante y familia en el país</p>
                    </div>

                    <div class="about-img">
                        <img src="img/libreria.png" alt="acerca">
                    </div>
                </div>
            </section>    

            <section id="productos" class="product">
                <h2>Productos</h2>
                <br>
                <br>
            <div class="contenedor">
                <% for (Producto p : lista) {%>
                <div class="producto">
                    <img src="img//<%= p.getImagen()%>" alt="<%= p.getNombre()%>" width="150" height="150">
                    <h3><%= p.getNombre()%></h3>
                    <p><%= p.getDescripcion()%></p>
                    <p>Precio: S/. <%= p.getPrecio()%></p>
                    <p>Stock: <%= p.getStock()%></p>
                    <form action="CompraServlet" method="post">
                        <input type="hidden" name="id" value="<%= p.getId()%>">
                        <% if (p.getStock() > 0) { %>
                        <button class="btn" type="submit">Comprar</button>
                        <% } else { %>
                        <button class="btn2" type="button" disabled>Agotado</button>
                        <% } %>
                    </form>
                </div>
                <% }%>
            </div>
            </section>
        </main> 
    </body>
</html>