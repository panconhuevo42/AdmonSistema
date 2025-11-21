<%-- 
    Document   : recetas.jsp
    Created on : 20/11/2025, 1:05:39 p. m.
    Author     : Nicolas
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // SOLO UNA VALIDACIÓN - usar username que es lo que guarda el LoginServlet
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Recetas Saludables - Alimentación Balanceada</title>
    <link rel="stylesheet" href="../styles/styles.css">
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>

<header>
    <img src="../imagenes/logo.png" alt="Logo App" class="logo">
    <h2>Recetas Saludables - <%= username %></h2>  <!-- Cambiado: usar username -->
    <nav>
        <a href="../dashboard.jsp">Dashboard</a>
        <form action="../logout" method="post" style="display:inline;">
            <button type="submit">Cerrar sesión</button>
        </form>
    </nav>
</header>

<main class="seccion-main">
    <div class="seccion-header">
        <h3>🍽️ Recetas Saludables y Balanceadas</h3>
        <p>Descubre recetas deliciosas que se adaptan a la pirámide alimenticia</p>
    </div>

    <div class="filtros-recetas">
        <h4>Filtrar por categoría:</h4>
        <div class="filtros-container">
            <button class="filtro-btn active" data-categoria="todas">Todas</button>
            <button class="filtro-btn" data-categoria="desayuno">🍳 Desayuno</button>
            <button class="filtro-btn" data-categoria="almuerzo">🍽️ Almuerzo</button>
            <button class="filtro-btn" data-categoria="cena">🌙 Cena</button>
            <button class="filtro-btn" data-categoria="snack">🍏 Snack</button>
            <button class="filtro-btn" data-categoria="vegetariana">🥬 Vegetariana</button>
        </div>
    </div>

    <div class="recetas-container">
        <!-- Receta 1 -->
        <div class="receta-card" data-categoria="desayuno">
            <div class="receta-imagen">🥑</div>
            <div class="receta-content">
                <h3 class="receta-titulo">Tostadas de Aguacate</h3>
                <p class="receta-descripcion">Tostadas integrales con aguacate, tomate y huevo pochado. Perfectas para empezar el día con energía.</p>
                
                <div class="receta-info">
                    <div class="info-item">
                        <span class="info-valor">25 min</span>
                        <span class="info-label">Tiempo</span>
                    </div>
                    <div class="info-item">
                        <span class="info-valor">420 cal</span>
                        <span class="info-label">Calorías</span>
                    </div>
                    <div class="info-item">
                        <span class="info-valor">Fácil</span>
                        <span class="info-label">Dificultad</span>
                    </div>
                </div>

                <div class="receta-ingredientes">
                    <h4>Ingredientes (2 porciones):</h4>
                    <ul class="ingredientes-list">
                        <li>2 rebanadas pan integral</li>
                        <li>1 aguacate maduro</li>
                        <li>2 huevos</li>
                        <li>1 tomate</li>
                        <li>Sal y pimienta al gusto</li>
                        <li>Jugo de limón</li>
                    </ul>
                </div>

                <button class="btn-receta">📖 Ver Receta Completa</button>
            </div>
        </div>

        <!-- Receta 2 -->
        <div class="receta-card" data-categoria="almuerzo">
            <div class="receta-imagen">🍗</div>
            <div class="receta-content">
                <h3 class="receta-titulo">Pollo al Horno con Verduras</h3>
                <p class="receta-descripcion">Pechuga de pollo horneada con una variedad de verduras de temporada. Plato completo y nutritivo.</p>
                
                <div class="receta-info">
                    <div class="info-item">
                        <span class="info-valor">45 min</span>
                        <span class="info-label">Tiempo</span>
                    </div>
                    <div class="info-item">
                        <span class="info-valor">350 cal</span>
                        <span class="info-label">Calorías</span>
                    </div>
                    <div class="info-item">
                        <span class="info-valor">Medio</span>
                        <span class="info-label">Dificultad</span>
                    </div>
                </div>

                <div class="receta-ingredientes">
                    <h4>Ingredientes (3 porciones):</h4>
                    <ul class="ingredientes-list">
                        <li>2 pechugas de pollo</li>
                        <li>2 zanahorias</li>
                        <li>1 brócoli</li>
                        <li>1 pimiento rojo</li>
                        <li>Aceite de oliva</li>
                        <li>Especias al gusto</li>
                    </ul>
                </div>

                <button class="btn-receta">📖 Ver Receta Completa</button>
            </div>
        </div>

        <!-- Receta 3 -->
        <div class="receta-card" data-categoria="cena vegetariana">
            <div class="receta-imagen">🥗</div>
            <div class="receta-content">
                <h3 class="receta-titulo">Ensalada de Quinoa</h3>
                <p class="receta-descripcion">Ensalada fresca con quinoa, vegetales crujientes y aderezo de limón. Ideal para cenas ligeras.</p>
                
                <div class="receta-info">
                    <div class="info-item">
                        <span class="info-valor">20 min</span>
                        <span class="info-label">Tiempo</span>
                    </div>
                    <div class="info-item">
                        <span class="info-valor">280 cal</span>
                        <span class="info-label">Calorías</span>
                    </div>
                    <div class="info-item">
                        <span class="info-valor">Fácil</span>
                        <span class="info-label">Dificultad</span>
                    </div>
                </div>

                <div class="receta-ingredientes">
                    <h4>Ingredientes (2 porciones):</h4>
                    <ul class="ingredientes-list">
                        <li>1 taza de quinoa cocida</li>
                        <li>1 pepino</li>
                        <li>1 aguacate</li>
                        <li>Tomates cherry</li>
                        <li>Jugo de limón</li>
                        <li>Hierbas frescas</li>
                    </ul>
                </div>

                <button class="btn-receta">📖 Ver Receta Completa</button>
            </div>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2025 Alimentación Balanceada - Proyecto Académico</p>
</footer>

<script>
    // Filtrado de recetas
    document.querySelectorAll('.filtro-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            // Remover active de todos los botones
            document.querySelectorAll('.filtro-btn').forEach(b => b.classList.remove('active'));
            // Agregar active al botón clickeado
            this.classList.add('active');
            
            const categoria = this.getAttribute('data-categoria');
            filtrarRecetas(categoria);
        });
    });

    function filtrarRecetas(categoria) {
        const recetas = document.querySelectorAll('.receta-card');
        
        recetas.forEach(receta => {
            if (categoria === 'todas') {
                receta.style.display = 'block';
            } else {
                const recetaCategoria = receta.getAttribute('data-categoria');
                if (recetaCategoria.includes(categoria)) {
                    receta.style.display = 'block';
                } else {
                    receta.style.display = 'none';
                }
            }
        });
    }
</script>
</body>
</html>
