<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nuevo Empleado</title>
</head>
<body>
    <h2>Registrar Nuevo Empleado</h2>

    <form action="<%=request.getContextPath()%>/EmpleadoServlet" method="post">
    <input type="hidden" name="accion" value="insertar">

    <label>Nombre:</label><br>
    <input type="text" name="nombre" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Contraseña:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Guardar Empleado</button>
</form>

    <br>
    <a href="listarEmpleados.jsp">Volver a la lista</a>
</body>
</html>