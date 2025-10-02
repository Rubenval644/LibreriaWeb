<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Login</title></head>
<body>
<h2>Iniciar Sesión</h2>
<form action="LoginServlet" method="post">
    Email: <input type="email" name="email" required><br>
    Password: <input type="password" name="password" required><br>
    <button type="submit">Ingresar</button>
</form>
<p style="color:red;">${error}</p>
<a href="registro.jsp">Registrarse</a>
</body>
</html>