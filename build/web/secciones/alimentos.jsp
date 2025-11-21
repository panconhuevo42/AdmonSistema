<%-- 
    Document   : alimentos.jsp
    Created on : 20/11/2025, 1:04:09 p. m.
    Author     : Nicolas
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
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
    <title>Registro de Alimentos - Alimentación Balanceada</title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>

<header>
    <img src="../imagenes/logo.png" alt="Logo App" class="logo">
    <h2>Registro de Alimentos - <%= username %></h2>
    <nav>
        <a href="../dashboard.jsp">Dashboard</a>
        <form action="../logout" method="post" style="display:inline;">
            <button type="submit">Cerrar sesión</button>
        </form>
    </nav>
</header>

<main class="seccion-main">
    <div class="seccion-header">
        <h3>📝 Registro de Alimentos Consumidos</h3>
        <p>Lleva el control de lo que consumes para mantener una alimentación balanceada según la pirámide alimenticia</p>
    </div>

    <div class="registro-container">
        <div class="form-registro">
            <h4>🍽️ Agregar Nuevo Consumo</h4>
            <form id="form-alimento">
                <div class="form-group">
                    <label>Selecciona alimento:</label>
                    <select name="id_alimento" id="select-alimento" required>
                        <option value="">-- Selecciona un alimento --</option>
                        <optgroup label="🍎 Frutas y Verduras (Nivel 1)">
                            <option value="1" data-calorias="52" data-proteinas="0.3" data-carbohidratos="14" data-grasas="0.3">Manzana</option>
                            <option value="2" data-calorias="89" data-proteinas="1.1" data-carbohidratos="23" data-grasas="0.3">Plátano</option>
                            <option value="3" data-calorias="34" data-proteinas="2.8" data-carbohidratos="7" data-grasas="0.4">Brócoli</option>
                            <option value="4" data-calorias="41" data-proteinas="0.9" data-carbohidratos="10" data-grasas="0.2">Zanahoria</option>
                        </optgroup>
                        <optgroup label="🍞 Carbohidratos (Nivel 2)">
                            <option value="5" data-calorias="112" data-proteinas="2.6" data-carbohidratos="23" data-grasas="2.7">Arroz Integral</option>
                            <option value="6" data-calorias="389" data-proteinas="16.9" data-carbohidratos="66" data-grasas="6.9">Avena</option>
                            <option value="7" data-calorias="265" data-proteinas="13.0" data-carbohidratos="48" data-grasas="4.0">Pan Integral</option>
                        </optgroup>
                        <optgroup label="🍗 Proteínas (Nivel 3)">
                            <option value="8" data-calorias="165" data-proteinas="31" data-carbohidratos="0" data-grasas="3.6">Pechuga de Pollo</option>
                            <option value="9" data-calorias="155" data-proteinas="13" data-carbohidratos="1.1" data-grasas="11">Huevo</option>
                            <option value="10" data-calorias="116" data-proteinas="9" data-carbohidratos="20" data-grasas="1.1">Lentejas</option>
                        </optgroup>
                        <optgroup label="🥛 Lácteos y Grasas (Nivel 4)">
                            <option value="11" data-calorias="61" data-proteinas="3.5" data-carbohidratos="4.7" data-grasas="3.3">Yogur Natural</option>
                            <option value="12" data-calorias="160" data-proteinas="2.0" data-carbohidratos="9" data-grasas="15">Aguacate</option>
                            <option value="13" data-calorias="579" data-proteinas="21" data-carbohidratos="22" data-grasas="49">Almendras</option>
                        </optgroup>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Cantidad (gramos):</label>
                    <input type="number" name="cantidad_gr" id="cantidad" min="1" max="1000" value="100" required>
                </div>
                
                <div class="form-group">
                    <label>Comida del día:</label>
                    <select name="tipo_comida" required>
                        <option value="desayuno">🍳 Desayuno</option>
                        <option value="almuerzo">🍽️ Almuerzo</option>
                        <option value="cena">🌙 Cena</option>
                        <option value="snack">🍏 Snack</option>
                    </select>
                </div>

                <div class="info-nutricional" id="info-nutricional" style="display: none;">
                    <h5>Información Nutricional (por 100g):</h5>
                    <div class="nutrientes-preview">
                        <span>🔥 <strong id="preview-calorias">0</strong> cal</span>
                        <span>💪 <strong id="preview-proteinas">0</strong>g proteínas</span>
                        <span>🌾 <strong id="preview-carbohidratos">0</strong>g carbohidratos</span>
                        <span>🥑 <strong id="preview-grasas">0</strong>g grasas</span>
                    </div>
                </div>
                
                <button type="submit" class="btn-primary">➕ Agregar Consumo</button>
            </form>
        </div>

        <div class="consumo-hoy">
            <h4>📊 Resumen Nutricional de Hoy</h4>
            <div class="resumen-nutricional">
                <div class="nutriente-card">
                    <span class="nutriente-valor" id="total-calorias">0</span>
                    <span class="nutriente-label">Calorías</span>
                </div>
                <div class="nutriente-card">
                    <span class="nutriente-valor" id="total-proteinas">0g</span>
                    <span class="nutriente-label">Proteínas</span>
                </div>
                <div class="nutriente-card">
                    <span class="nutriente-valor" id="total-carbohidratos">0g</span>
                    <span class="nutriente-label">Carbohidratos</span>
                </div>
                <div class="nutriente-card">
                    <span class="nutriente-valor" id="total-grasas">0g</span>
                    <span class="nutriente-label">Grasas</span>
                </div>
            </div>
            
            <div style="margin-top: 20px; text-align: center;">
                <small>Meta diaria recomendada: 2000 calorías</small>
                <div style="background: #ecf0f1; border-radius: 10px; height: 12px; margin: 8px 0; position: relative;">
                    <div id="barra-progreso" style="background: #88c057; width: 0%; height: 100%; border-radius: 10px; transition: width 0.5s ease;"></div>
                </div>
                <small id="porcentaje-progreso">0% completado</small>
            </div>

            <div class="distribucion-piramide" style="margin-top: 25px;">
                <h5>🏛️ Distribución por Niveles de Pirámide</h5>
                <div class="niveles-stats">
                    <div class="nivel-stat">
                        <span class="nivel-icon">🍎</span>
                        <span class="nivel-nombre">Frutas/Verduras</span>
                        <span class="nivel-cantidad">0</span>
                    </div>
                    <div class="nivel-stat">
                        <span class="nivel-icon">🍞</span>
                        <span class="nivel-nombre">Carbohidratos</span>
                        <span class="nivel-cantidad">0</span>
                    </div>
                    <div class="nivel-stat">
                        <span class="nivel-icon">🍗</span>
                        <span class="nivel-nombre">Proteínas</span>
                        <span class="nivel-cantidad">0</span>
                    </div>
                    <div class="nivel-stat">
                        <span class="nivel-icon">🥛</span>
                        <span class="nivel-nombre">Lácteos/Grasas</span>
                        <span class="nivel-cantidad">0</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="historial-container">
        <div style="display: flex; justify-content: between; align-items: center; margin-bottom: 20px;">
            <h4>📋 Historial de Consumo - Hoy</h4>
            <button class="btn-primary" onclick="limpiarHistorial()">🔄 Limpiar Todo</button>
        </div>
        
        <table class="historial-table">
            <thead>
                <tr>
                    <th>Alimento</th>
                    <th>Cantidad</th>
                    <th>Calorías</th>
                    <th>Proteínas</th>
                    <th>Comida</th>
                    <th>Hora</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="tbody-historial">
                <tr id="fila-vacia">
                    <td colspan="7" style="text-align: center; padding: 40px;">
                        <div style="font-size: 3em; margin-bottom: 10px;">🍽️</div>
                        <h4 style="color: #666; margin: 0;">No hay alimentos registrados para hoy</h4>
                        <p style="color: #888; margin: 5px 0 0 0;">Comienza agregando tu primer alimento usando el formulario</p>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="recomendaciones" style="margin-top: 25px; padding: 20px; background: rgba(52, 152, 219, 0.1); border-radius: 8px; border-left: 4px solid #3498db;">
            <h5 style="color: #2980b9; margin-top: 0;">💡 Recomendaciones del Día</h5>
            <ul style="margin: 0; color: #333;">
                <li>Intenta incluir al menos 5 porciones de frutas y verduras</li>
                <li>Mantén una hidratación adecuada (2L de agua mínimo)</li>
                <li>Balancea tu consumo entre todos los grupos alimenticios</li>
                <li>Prefiere alimentos integrales y naturales</li>
            </ul>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2025 Alimentación Balanceada - Proyecto Académico</p>
</footer>

<script>
    // Datos de ejemplo para simulación
    let historial = JSON.parse(localStorage.getItem('historialAlimentos')) || [];
    let totalCalorias = 0;
    let totalProteinas = 0;
    let totalCarbohidratos = 0;
    let totalGrasas = 0;

    // Inicializar la página
    document.addEventListener('DOMContentLoaded', function() {
        actualizarResumen();
        renderizarHistorial();
        
        // Event listener para mostrar información nutricional al seleccionar alimento
        document.getElementById('select-alimento').addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            if (selectedOption.value) {
                document.getElementById('info-nutricional').style.display = 'block';
                document.getElementById('preview-calorias').textContent = selectedOption.getAttribute('data-calorias');
                document.getElementById('preview-proteinas').textContent = selectedOption.getAttribute('data-proteinas');
                document.getElementById('preview-carbohidratos').textContent = selectedOption.getAttribute('data-carbohidratos');
                document.getElementById('preview-grasas').textContent = selectedOption.getAttribute('data-grasas');
            } else {
                document.getElementById('info-nutricional').style.display = 'none';
            }
        });

        // Event listener para el formulario
        document.getElementById('form-alimento').addEventListener('submit', function(e) {
            e.preventDefault();
            agregarAlimento();
        });
    });

    function agregarAlimento() {
        const select = document.getElementById('select-alimento');
        const cantidad = document.getElementById('cantidad').value;
        const tipoComida = document.querySelector('select[name="tipo_comida"]').value;
        
        const selectedOption = select.options[select.selectedIndex];
        const alimento = selectedOption.text;
        const caloriasPor100g = parseFloat(selectedOption.getAttribute('data-calorias'));
        const proteinasPor100g = parseFloat(selectedOption.getAttribute('data-proteinas'));
        const carbohidratosPor100g = parseFloat(selectedOption.getAttribute('data-carbohidratos'));
        const grasasPor100g = parseFloat(selectedOption.getAttribute('data-grasas'));

        // Calcular valores totales
        const factor = cantidad / 100;
        const caloriasTotales = Math.round(caloriasPor100g * factor);
        const proteinasTotales = parseFloat((proteinasPor100g * factor).toFixed(1));
        const carbohidratosTotales = parseFloat((carbohidratosPor100g * factor).toFixed(1));
        const grasasTotales = parseFloat((grasasPor100g * factor).toFixed(1));

        // Crear objeto de consumo
        const consumo = {
            id: Date.now(),
            alimento: alimento,
            cantidad: cantidad + 'g',
            calorias: caloriasTotales,
            proteinas: proteinasTotales,
            carbohidratos: carbohidratosTotales,
            grasas: grasasTotales,
            tipoComida: tipoComida,
            hora: new Date().toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit' }),
            timestamp: new Date().toISOString()
        };

        // Agregar al historial
        historial.push(consumo);
        localStorage.setItem('historialAlimentos', JSON.stringify(historial));

        // Actualizar la interfaz
        actualizarResumen();
        renderizarHistorial();
        
        // Resetear formulario
        document.getElementById('form-alimento').reset();
        document.getElementById('info-nutricional').style.display = 'none';
        
        // Mostrar confirmación
        alert(`✅ ${alimento} agregado correctamente!`);
    }

    function actualizarResumen() {
        // Calcular totales
        totalCalorias = historial.reduce((sum, item) => sum + item.calorias, 0);
        totalProteinas = parseFloat(historial.reduce((sum, item) => sum + item.proteinas, 0).toFixed(1));
        totalCarbohidratos = parseFloat(historial.reduce((sum, item) => sum + item.carbohidratos, 0).toFixed(1));
        totalGrasas = parseFloat(historial.reduce((sum, item) => sum + item.grasas, 0).toFixed(1));

        // Actualizar UI
        document.getElementById('total-calorias').textContent = totalCalorias;
        document.getElementById('total-proteinas').textContent = totalProteinas + 'g';
        document.getElementById('total-carbohidratos').textContent = totalCarbohidratos + 'g';
        document.getElementById('total-grasas').textContent = totalGrasas + 'g';

        // Actualizar barra de progreso
        const porcentaje = Math.min((totalCalorias / 2000) * 100, 100);
        document.getElementById('barra-progreso').style.width = porcentaje + '%';
        document.getElementById('porcentaje-progreso').textContent = Math.round(porcentaje) + '% completado';

        // Cambiar color de la barra según el progreso
        if (porcentaje > 100) {
            document.getElementById('barra-progreso').style.background = '#e74c3c';
        } else if (porcentaje > 80) {
            document.getElementById('barra-progreso').style.background = '#f39c12';
        } else {
            document.getElementById('barra-progreso').style.background = '#88c057';
        }
    }

    function renderizarHistorial() {
        const tbody = document.getElementById('tbody-historial');
        
        if (historial.length === 0) {
            tbody.innerHTML = `
                <tr id="fila-vacia">
                    <td colspan="7" style="text-align: center; padding: 40px;">
                        <div style="font-size: 3em; margin-bottom: 10px;">🍽️</div>
                        <h4 style="color: #666; margin: 0;">No hay alimentos registrados para hoy</h4>
                        <p style="color: #888; margin: 5px 0 0 0;">Comienza agregando tu primer alimento usando el formulario</p>
                    </td>
                </tr>
            `;
            return;
        }

        // Ordenar por timestamp (más reciente primero)
        historial.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp));

        tbody.innerHTML = historial.map(item => `
            <tr>
                <td>${item.alimento}</td>
                <td>${item.cantidad}</td>
                <td>${item.calorias} cal</td>
                <td>${item.proteinas}g</td>
                <td>
                    <span class="badge-comida ${item.tipoComida}">
                        ${getIconoTipoComida(item.tipoComida)} ${item.tipoComida}
                    </span>
                </td>
                <td>${item.hora}</td>
                <td>
                    <button class="btn-danger" onclick="eliminarAlimento(${item.id})">🗑️</button>
                </td>
            </tr>
        `).join('');
    }

    function getIconoTipoComida(tipo) {
        const iconos = {
            'desayuno': '🍳',
            'almuerzo': '🍽️',
            'cena': '🌙',
            'snack': '🍏'
        };
        return iconos[tipo] || '🍽️';
    }

    function eliminarAlimento(id) {
        if (confirm('¿Estás seguro de que quieres eliminar este alimento?')) {
            historial = historial.filter(item => item.id !== id);
            localStorage.setItem('historialAlimentos', JSON.stringify(historial));
            actualizarResumen();
            renderizarHistorial();
        }
    }

    function limpiarHistorial() {
        if (confirm('¿Estás seguro de que quieres eliminar todo el historial de hoy?')) {
            historial = [];
            localStorage.setItem('historialAlimentos', JSON.stringify(historial));
            actualizarResumen();
            renderizarHistorial();
        }
    }
</script>

<style>
    .nutrientes-preview {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 8px;
        margin-top: 10px;
        font-size: 0.9em;
    }

    .niveles-stats {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px;
        margin-top: 10px;
    }

    .nivel-stat {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 8px;
        background: rgba(255,255,255,0.5);
        border-radius: 6px;
    }

    .nivel-icon {
        font-size: 1.2em;
    }

    .nivel-nombre {
        flex: 1;
        font-size: 0.8em;
        color: #666;
    }

    .nivel-cantidad {
        font-weight: bold;
        color: #2d5016;
    }

    .badge-comida {
        padding: 4px 8px;
        border-radius: 12px;
        font-size: 0.8em;
        font-weight: bold;
    }

    .badge-comida.desayuno { background: #f39c12; color: white; }
    .badge-comida.almuerzo { background: #e74c3c; color: white; }
    .badge-comida.cena { background: #3498db; color: white; }
    .badge-comida.snack { background: #9b59b6; color: white; }

    optgroup {
        font-weight: bold;
        color: #2d5016;
    }

    optgroup option {
        font-weight: normal;
        color: #333;
        padding-left: 10px;
    }
</style>
</body>
</html>