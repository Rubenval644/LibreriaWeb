<%@ page import="modelo.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>

<ul>
    <li><a href="ProductoServlet?action=listar">Productos</a></li>
    <% if ("ADMIN".equals(usuario.getRol())) { %>
        <li><a href="registroEmpleado.jsp">Registrar Empleado</a></li>
    <% } %>
</ul>

