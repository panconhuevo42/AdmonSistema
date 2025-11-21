<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
    <div class="login-container">
        <h2>Inicio de Sesión</h2>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="error-message">
                <% if (request.getParameter("error").equals("1")) { %>
                    Email o contraseña incorrectos
                <% } else if (request.getParameter("error").equals("2")) { %>
                    Error del servidor. Intente más tarde.
                <% } %>
            </div>
        <% } %>
        
        <form action="login" method="post">
            <label>Email:</label><br>
            <input type="email" name="email" required><br><br>

            <label>Contraseña:</label><br>
            <input type="password" name="contrasena" required><br><br>

            <input type="submit" value="Ingresar">
        </form>
        <p>¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
    </div>
</body>
</html>
