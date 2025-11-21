<%-- 
    Document   : piramide.jsp
    Created on : 20/11/2025, 1:06:10 p. m.
    Author     : Nicolas
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // SOLO ESTA VALIDACIÓN
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
    <title>Nombre Sección - Alimentación Balanceada</title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>

<header>
    <img src="../imagenes/logo.png" alt="Logo App" class="logo">
    <h2>Nombre Sección - <%= username %></h2>  <!-- Usar username -->
    <nav>
        <a href="../dashboard.jsp">Dashboard</a>
        <form action="../logout" method="post" style="display:inline;">
            <button type="submit">Cerrar sesión</button>
        </form>
    </nav>
<body>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<header>
    <img src="../imagenes/logo.png" alt="Logo App" class="logo">
    <h2>Pirámide Alimenticia - <%= usuario.getNombre() %></h2>
    <nav>
        <a href="../dashboard.jsp">Dashboard</a>
        <form action="../logout" method="post" style="display:inline;">
            <button type="submit">Cerrar sesión</button>
        </form>
    </nav>
</header>

<main class="seccion-main">
    <div class="seccion-header">
        <h3>🏛️ Pirámide Alimenticia Interactiva</h3>
        <p>Haz clic en cada nivel para aprender sobre los grupos de alimentos y sus recomendaciones</p>
    </div>

    <div class="piramide-leyenda">
        <div class="leyenda-item">
            <div class="leyenda-color" style="background: #27ae60;"></div>
            <span>Consumo frecuente</span>
        </div>
        <div class="leyenda-item">
            <div class="leyenda-color" style="background: #3498db;"></div>
            <span>Consumo diario</span>
        </div>
        <div class="leyenda-item">
            <div class="leyenda-color" style="background: #e67e22;"></div>
            <span>Consumo moderado</span>
        </div>
        <div class="leyenda-item">
            <div class="leyenda-color" style="background: #9b59b6;"></div>
            <span>Consumo ocasional</span>
        </div>
        <div class="leyenda-item">
            <div class="leyenda-color" style="background: #e74c3c;"></div>
            <span>Consumo limitado</span>
        </div>
    </div>

    <div class="piramide-container">
        <div class="piramide-visual">
            <!-- Nivel 5 - Azúcares y Dulces -->
            <div class="nivel-piramide nivel-5" data-nivel="5">
                🍬 Nivel 5: Azúcares y Dulces
            </div>
            
            <!-- Nivel 4 - Lácteos y Grasas -->
            <div class="nivel-piramide nivel-4" data-nivel="4">
                🥛 Nivel 4: Lácteos y Grasas Saludables
            </div>
            
            <!-- Nivel 3 - Proteínas -->
            <div class="nivel-piramide nivel-3" data-nivel="3">
                🍗 Nivel 3: Proteínas Animales y Vegetales
            </div>
            
            <!-- Nivel 2 - Carbohidratos -->
            <div class="nivel-piramide nivel-2" data-nivel="2">
                🍞 Nivel 2: Carbohidratos Complejos
            </div>
            
            <!-- Nivel 1 - Frutas y Verduras -->
            <div class="nivel-piramide nivel-1" data-nivel="1">
                🍎 Nivel 1: Frutas y Verduras
            </div>
        </div>

        <!-- Información de los niveles -->
        <div id="info-nivel-1" class="info-container">
            <div class="info-header" style="border-color: #27ae60;">
                <div class="info-icon">🍎</div>
                <div class="info-content">
                    <h3 style="color: #27ae60;">Nivel 1: Frutas y Verduras</h3>
                    <p>Base de la pirámide - Consumo más frecuente</p>
                </div>
            </div>
            
            <div class="alimentos-grid">
                <div class="alimento-item">
                    <h4>🍓 Frutas</h4>
                    <p>Manzanas, naranjas, plátanos, fresas, uvas, etc.</p>
                </div>
                <div class="alimento-item">
                    <h4>🥦 Verduras</h4>
                    <p>Espinacas, brócoli, zanahorias, tomates, lechuga, etc.</p>
                </div>
                <div class="alimento-item">
                    <h4>🥬 Hojas Verdes</h4>
                    <p>Lechuga, espinaca, acelga, rúcula, etc.</p>
                </div>
            </div>
            
            <div class="recomendaciones">
                <h4>💡 Recomendaciones:</h4>
                <ul>
                    <li>Consume una variedad de colores para obtener diferentes nutrientes</li>
                    <li>Incluye frutas y verduras en cada comida principal</li>
                    <li>Prefiere frutas enteras en lugar de jugos</li>
                </ul>
            </div>
            
            <div class="frecuencia">
                <h4>📅 Frecuencia recomendada:</h4>
                <p><strong>5-7 porciones diarias</strong> - La mitad de tu plato en cada comida</p>
            </div>
        </div>

        <div id="info-nivel-2" class="info-container">
            <div class="info-header" style="border-color: #3498db;">
                <div class="info-icon">🍞</div>
                <div class="info-content">
                    <h3 style="color: #3498db;">Nivel 2: Carbohidratos Complejos</h3>
                    <p>Fuente principal de energía</p>
                </div>
            </div>
            
            <div class="alimentos-grid">
                <div class="alimento-item">
                    <h4>🌾 Cereales</h4>
                    <p>Avena, trigo, maíz, cebada, etc.</p>
                </div>
                <div class="alimento-item">
                    <h4>🍚 Granos</h4>
                    <p>Arroz integral, quinoa, pasta integral, etc.</p>
                </div>
                <div class="alimento-item">
                    <h4>🥖 Panes</h4>
                    <p>Pan integral, tortillas de maíz, etc.</p>
                </div>
            </div>
            
            <div class="recomendaciones">
                <h4>💡 Recomendaciones:</h4>
                <ul>
                    <li>Prefiere versiones integrales por su mayor contenido de fibra</li>
                    <li>Combina con proteínas y verduras para comidas balanceadas</li>
                    <li>Controla las porciones según tu nivel de actividad física</li>
                </ul>
            </div>
            
            <div class="frecuencia">
                <h4>📅 Frecuencia recomendada:</h4>
                <p><strong>3-5 porciones diarias</strong> - En cada comida principal</p>
            </div>
        </div>

        <!-- Los otros niveles seguirían la misma estructura -->
        <div id="info-default" class="info-container active">
            <div class="info-header" style="border-color: #88c057;">
                <div class="info-icon">🏛️</div>
                <div class="info-content">
                    <h3 style="color: #88c057;">Pirámide Alimenticia</h3>
                    <p>Haz clic en cualquier nivel de la pirámide para ver información detallada sobre ese grupo de alimentos</p>
                </div>
            </div>
            <p>La pirámide alimenticia es una guía visual que representa cómo debería ser una alimentación balanceada. Los alimentos en la base deben consumirse en mayor cantidad, mientras que los de la punta deben consumirse con moderación.</p>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2025 Alimentación Balanceada - Proyecto Académico</p>
</footer>

<script>
    document.querySelectorAll('.nivel-piramide').forEach(nivel => {
        nivel.addEventListener('click', function() {
            const nivelId = this.getAttribute('data-nivel');
            
            // Ocultar todos los contenedores de información
            document.querySelectorAll('.info-container').forEach(container => {
                container.classList.remove('active');
            });
            
            // Mostrar el contenedor correspondiente
            const infoContainer = document.getElementById(`info-nivel-${nivelId}`);
            if (infoContainer) {
                infoContainer.classList.add('active');
            }
        });
    });
</script>
</body>
</html>