<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Registro Cliente</title></head>
<body>
<h2>Registro de Cliente</h2>
<form action="RegistroServlet" method="post">
    Nombre: <input type="text" name="nombre" required><br>
    Email: <input type="email" name="email" required><br>
    Password: <input type="password" name="password" required><br>
    <button type="submit">Registrarse</button>
</form>
</body>
</html>