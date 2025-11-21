<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Dashboard - Alimentación Balanceada</title>
  <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
<%
    // Validar sesión
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<header>
    <img src="imagenes/logo.png" alt="Logo App" class="logo">
    <h2>Bienvenido, <%= username %></h2>
    <nav>
        <a href="logout">Cerrar sesión</a>
    </nav>
</header>

<main class="dashboard">
    <section class="bienvenida">
        <p>
            Este es el <b>Dashboard</b> de la aplicación <i>Alimentación Balanceada</i>.
            Desde aquí puedes gestionar las secciones principales, explorar los niveles de la pirámide alimenticia
            y acceder a información para llevar un estilo de vida más saludable.
        </p>
    </section>

    <section class="opciones">
        <h3>Opciones de navegación</h3>
        <ul>
            <li><a href="secciones/alimentos.jsp">Alimentos</a></li>
            <li><a href="secciones/recetas.jsp">Recetas</a></li>
            <li><a href="secciones/reportes.jsp">Reportes</a></li>
            <li><a href="secciones/perfil.jsp">Perfil</a></li>
        </ul>
    </section>
</main>

<footer>
    <p>&copy; 2025 Alimentación Balanceada - Proyecto Académico</p>
</footer>
</body>
</html>

