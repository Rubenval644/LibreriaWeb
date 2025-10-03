<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,dao.ClienteDAO,modelo.Cliente" %>

<%
    ClienteDAO dao = new ClienteDAO();
    List<Cliente> lista = dao.listar();
%>

<html>
    <head>
        <title>Lista de Clientes - Panel Administrativo</title>
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
        <h2>Lista de Clientes</h2>

        <a href="ClienteServlet?action=nuevo" class="btn-agregar">Registrar Cliente</a>
        <a href="${pageContext.request.contextPath}/admin/panel.jsp" class="btn-agregar">Volver al panel</a>

        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Sexo</th>
                <th>Email</th>
                <th>Password</th>
                <th>Acciones</th>
            </tr>

            <% for (Cliente c : lista) {%>
            <tr>
                <td><%= c.getId()%></td>
                <td><%= c.getNombre()%></td>
                <td><%= c.getApellido()%></td>
                <td><%= c.getSexo()%></td>
                <td><%= c.getEmail()%></td>
                <td><%= c.getPassword()%></td>

                <td>
                    <a href="ClienteServlet?action=editar&id=<%= c.getId()%>" class="btn-editar">Editar</a>
                    <a href="ClienteServlet?action=eliminar&id=<%= c.getId()%>" class="btn-eliminar" 
                       onclick="return confirm('¿Estás seguro de eliminar este cliente?');">
                        Eliminar</a>
                </td>
            </tr>
            <% }%>
        </table>
    </body>
</html>