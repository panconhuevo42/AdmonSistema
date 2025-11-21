<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%    
    // Validar sesión
    String username = (String) session.getAttribute("username");
    String userrol = (String) session.getAttribute("userrol");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    boolean esAdmin = "admin".equals(userrol);
%>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Dashboard - Alimentación Balanceada</title>
  <link rel="stylesheet" href="styles/styles.css">
</head>
<body>

<header>
    <img src="imagenes/logo.png" alt="Logo App" class="logo">
    <div class="user-info">
        <h2>Bienvenido, <%= username %></h2>
        <% if (esAdmin) { %>
            <span class="admin-badge">👑 Administrador</span>
        <% } %>
    </div>
    <nav>
        <form action="logout" method="post" style="display:inline;">
            <button type="submit">Cerrar sesión</button>
        </form>
    </nav>
</header>

<main class="dashboard">
    <section class="bienvenida">
        <p>
            Este es el <b>Dashboard</b> de la aplicación <i>Alimentación Balanceada</i>.
            <% if (esAdmin) { %>
                <strong>Tienes acceso completo al sistema como administrador.</strong>
            <% } %>
            Desde aquí puedes gestionar las secciones principales, explorar los niveles de la pirámide alimenticia
            y acceder a información para llevar un estilo de vida más saludable.
        </p>
    </section>

    <section class="opciones">
        <h3>Opciones de navegación</h3>
        <ul>
            <li><a href="secciones/alimentos.jsp">🍎 Alimentos</a></li>
            <li><a href="secciones/recetas.jsp">🍽️ Recetas</a></li>
            <li><a href="secciones/progreso.jsp">📈 Progreso</a></li>
            <li><a href="secciones/perfil.jsp">👤 Perfil</a></li>
            
            <% if (esAdmin) { %>
                <li><a href="secciones/admin/usuarios.jsp" class="admin-link">👥 Gestión de Usuarios</a></li>
            <% } %>
        </ul>
    </section>

    
</main>

<footer>
    <p>&copy; 2025 Alimentación Balanceada - Proyecto Académico</p>
</footer>
</body>
</html>

