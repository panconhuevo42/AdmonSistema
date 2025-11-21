<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
    <div class="register-container">
        <h2>Registrar nuevo usuario</h2>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="error-message">
                Error en el registro. Intente con otro email.
            </div>
        <% } %>
        
        <form action="registro" method="post">
            <label>Nombre:</label><br>
            <input type="text" name="nombre" required><br><br>

            <label>Email:</label><br>
            <input type="email" name="email" required><br><br>

            <label>Contraseña:</label><br>
            <input type="password" name="contrasena" required><br><br>

            <button type="submit">Registrar</button>
        </form>
        <p>¿Ya tienes cuenta? <a href="login.jsp">Inicia sesión aquí</a></p>
    </div>
</body>
</html>