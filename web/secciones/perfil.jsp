<%-- 
    Document   : perfil.jsp
    Created on : 20/11/2025, 1:06:30 p. m.
    Author     : Nicolas
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // SOLO UNA VALIDACIÓN - usar username como las otras páginas
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    // Obtener datos adicionales de la sesión si los necesitas
    String useremail = (String) session.getAttribute("useremail");
    String userrol = (String) session.getAttribute("userrol");
    boolean esAdmin = "admin".equals(userrol);
%>
<!DOCTYPE html>
<html lang="es">
<link rel="stylesheet" href="../styles/styles.css">
</head>
<body>

<header>
    <img src="../imagenes/logo.png" alt="Logo App" class="logo">
    <h2>Mi Perfil - <%= username %></h2>
    <nav>
        <a href="../dashboard.jsp">Dashboard</a>
        <form action="../logout" method="post" style="display:inline;">
            <button type="submit">Cerrar sesión</button>
        </form>
    </nav>
</header>

<main class="seccion-main">
    <div class="seccion-header">
        <h3>👤 Mi Perfil Personal</h3>
        <p>Gestiona tu información personal y preferencias alimenticias</p>
    </div>

    <div class="perfil-container">
        <!-- Sidebar -->
        <div class="perfil-sidebar">
            <div class="perfil-avatar">
                <%= username.charAt(0) %>
            </div>
            <div class="perfil-info">
                <h3><%= username %></h3>
                <div class="perfil-rol">
                    <% if (esAdmin) { %>
                        👑 Administrador
                    <% } else { %>
                        👤 Usuario
                    <% } %>
                </div>
                <p><%= useremail != null ? useremail : "Email no disponible" %></p>
                
                <div class="perfil-stats">
                    <div class="stat-item">
                        <span class="stat-valor">7</span>
                        <span class="stat-label">Días activo</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-valor">23</span>
                        <span class="stat-label">Alimentos</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-valor">5</span>
                        <span class="stat-label">Logros</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-valor">85%</span>
                        <span class="stat-label">Progreso</span>
                    </div>
                </div>
                
                <div style="margin-top: 20px; padding: 15px; background: rgba(52, 152, 219, 0.1); border-radius: 8px;">
                    <h4 style="margin: 0 0 10px 0; color: #2980b9;">🎯 Objetivo Actual</h4>
                    <p style="margin: 0; font-size: 0.9em;">Alimentación balanceada según pirámide alimenticia</p>
                </div>
            </div>
        </div>

        <!-- Contenido principal -->
        <div class="perfil-content">
            <div class="form-tabs">
                <button class="tab-btn active" data-tab="info-personal">Información Personal</button>
                <button class="tab-btn" data-tab="preferencias">Preferencias Alimenticias</button>
                <button class="tab-btn" data-tab="seguridad">Seguridad</button>
            </div>

            <!-- Tab Información Personal -->
            <div id="info-personal" class="tab-content active">
                <h3>Información Personal</h3>
                <form>
                    <div class="form-group">
                        <label>Nombre completo:</label>
                        <input type="text" value="<%= username %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" value="<%= useremail != null ? useremail : "" %>" required>
                    </div>
                    
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <div class="form-group">
                            <label>Edad:</label>
                            <input type="number" min="1" max="120" value="25">
                        </div>
                        <div class="form-group">
                            <label>Género:</label>
                            <select>
                                <option>Masculino</option>
                                <option>Femenino</option>
                                <option>Otro</option>
                                <option>Prefiero no decir</option>
                            </select>
                        </div>
                    </div>
                    
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <div class="form-group">
                            <label>Peso (kg):</label>
                            <input type="number" step="0.1" value="68.5">
                        </div>
                        <div class="form-group">
                            <label>Altura (cm):</label>
                            <input type="number" value="175">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Nivel de actividad física:</label>
                        <select>
                            <option>Sedentario (poco o ningún ejercicio)</option>
                            <option>Ligero (ejercicio 1-3 días/semana)</option>
                            <option selected>Moderado (ejercicio 3-5 días/semana)</option>
                            <option>Activo (ejercicio 6-7 días/semana)</option>
                            <option>Muy activo (atleta profesional)</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label>Objetivo principal:</label>
                        <select>
                            <option>Mantener peso actual</option>
                            <option selected>Alimentación balanceada</option>
                            <option>Pérdida de peso</option>
                            <option>Ganar masa muscular</option>
                            <option>Mejorar rendimiento deportivo</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn-guardar">💾 Guardar Cambios</button>
                </form>
            </div>

            <!-- Los otros tabs (preferencias y seguridad) permanecen igual -->
            <!-- ... -->
            
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2025 Alimentación Balanceada - Proyecto Académico</p>
</footer>

<script>
    // Funcionalidad de pestañas
    document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            // Remover active de todos los botones y contenidos
            document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
            
            // Agregar active al botón clickeado
            this.classList.add('active');
            
            // Mostrar el contenido correspondiente
            const tabId = this.getAttribute('data-tab');
            document.getElementById(tabId).classList.add('active');
        });
    });

    // Funcionalidad de selección de preferencias
    document.querySelectorAll('.preferencia-item').forEach(item => {
        item.addEventListener('click', function() {
            this.classList.toggle('selected');
        });
    });
</script>
</body>
</html>