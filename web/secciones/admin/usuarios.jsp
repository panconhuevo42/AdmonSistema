<%-- 
    Document   : usuarios.jsp
    Created on : 20/11/2025, 1:07:07 p. m.
    Author     : Nicolas
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios - Admin</title>
    <link rel="stylesheet" href="../../styles/styles.css">
    
</head>
<body>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"admin".equals(usuario.getRol())) {
        response.sendRedirect("../../login.jsp");
        return;
    }
%>

<header>
    <img src="../../imagenes/logo.png" alt="Logo App" class="logo">
    <h2>Gestión de Usuarios - Administrador</h2>
    <nav>
        <a href="../../dashboard.jsp">Dashboard</a>
        <form action="../../logout" method="post" style="display:inline;">
            <button type="submit">Cerrar sesión</button>
        </form>
    </nav>
</header>

<main class="seccion-main">
    <div class="seccion-header">
        <h3>👥 Gestión de Usuarios del Sistema</h3>
        <p>Administra los usuarios registrados en la plataforma</p>
    </div>

    <div class="admin-container">
        <div class="admin-header">
            <h3>Lista de Usuarios Registrados</h3>
            <button class="btn-admin btn-success" onclick="mostrarFormularioUsuario()">➕ Agregar Usuario</button>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <span class="stat-number">12</span>
                <span class="stat-label">Total Usuarios</span>
            </div>
            <div class="stat-card">
                <span class="stat-number">1</span>
                <span class="stat-label">Administradores</span>
            </div>
            <div class="stat-card">
                <span class="stat-number">11</span>
                <span class="stat-label">Usuarios Normales</span>
            </div>
            <div class="stat-card">
                <span class="stat-number">7</span>
                <span class="stat-label">Activos Hoy</span>
            </div>
        </div>

        <div class="search-box">
            <input type="text" placeholder="🔍 Buscar usuarios por nombre o email...">
        </div>

        <div class="admin-actions">
            <button class="btn-admin" onclick="filtrarUsuarios('todos')">Todos</button>
            <button class="btn-admin" onclick="filtrarUsuarios('admin')">Administradores</button>
            <button class="btn-admin" onclick="filtrarUsuarios('usuario')">Usuarios</button>
            <button class="btn-admin" onclick="filtrarUsuarios('activos')">Activos</button>
        </div>

        <table class="admin-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Rol</th>
                    <th>Fecha Registro</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Administrador</td>
                    <td>admin@alimentacion.com</td>
                    <td><span class="badge badge-admin">Admin</span></td>
                    <td>2025-01-15</td>
                    <td>🟢 Activo</td>
                    <td>
                        <button class="btn-admin btn-warning">✏️ Editar</button>
                        <button class="btn-admin btn-danger">🗑️ Eliminar</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Juan Pérez</td>
                    <td>juan@example.com</td>
                    <td><span class="badge badge-user">Usuario</span></td>
                    <td>2025-01-16</td>
                    <td>🟢 Activo</td>
                    <td>
                        <button class="btn-admin btn-warning">✏️ Editar</button>
                        <button class="btn-admin">👑 Hacer Admin</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>María García</td>
                    <td>maria@example.com</td>
                    <td><span class="badge badge-user">Usuario</span></td>
                    <td>2025-01-17</td>
                    <td>🟢 Activo</td>
                    <td>
                        <button class="btn-admin btn-warning">✏️ Editar</button>
                        <button class="btn-admin">👑 Hacer Admin</button>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Carlos López</td>
                    <td>carlos@example.com</td>
                    <td><span class="badge badge-user">Usuario</span></td>
                    <td>2025-01-18</td>
                    <td>🔴 Inactivo</td>
                    <td>
                        <button class="btn-admin btn-warning">✏️ Editar</button>
                        <button class="btn-admin">👑 Hacer Admin</button>
                    </td>
                </tr>
            </tbody>
        </table>

        <div style="margin-top: 20px; text-align: center;">
            <button class="btn-admin">⏪ Anterior</button>
            <span style="margin: 0 15px;">Página 1 de 1</span>
            <button class="btn-admin">Siguiente ⏩</button>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2025 Alimentación Balanceada - Proyecto Académico</p>
</footer>

<script>
    function mostrarFormularioUsuario() {
        alert('Funcionalidad para agregar usuario - En desarrollo');
        // Aquí iría el modal o formulario para agregar usuario
    }

    function filtrarUsuarios(tipo) {
        alert('Filtrando usuarios por: ' + tipo);
        // Aquí iría la lógica de filtrado
    }
</script>
</body>
</html>
