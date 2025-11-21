<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
    <h2>Iniciar Sesión</h2>

    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) { 
    %>
        <p class="error"><%= error %></p>
    <% } %>

    <form action="login" method="post">
        <label for="username">Usuario:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required><br><br>

        <button type="submit">Ingresar</button>
    </form>
</body>
</html>
