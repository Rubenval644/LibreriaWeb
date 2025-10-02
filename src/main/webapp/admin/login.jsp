<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Iniciar Sesión</h2>
<form action="../LoginServlet" method="post">
    Email: <input type="text" name="email" required><br>
    Contraseña: <input type="password" name="password" required><br>
    <input type="submit" value="Ingresar">
</form>

<% 
    String error = request.getParameter("error");
    if (error != null) {
        out.println("<p style='color:red'>" + error + "</p>");
    }
%>
</body>
</html>