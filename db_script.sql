-- Base de datos actualizada para Alimentación Balanceada
CREATE DATABASE IF NOT EXISTS alimentacion_balanceada;
USE alimentacion_balanceada;

-- Tabla Usuario (actualizada)
CREATE TABLE IF NOT EXISTS Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    rol ENUM('usuario', 'admin') DEFAULT 'usuario',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    edad INT,
    genero ENUM('masculino', 'femenino', 'otro', 'prefiero_no_decir'),
    peso DECIMAL(5,2),
    altura INT,
    nivel_actividad ENUM('sedentario', 'ligero', 'moderado', 'activo', 'muy_activo'),
    objetivo ENUM('mantener_peso', 'balance', 'perder_peso', 'ganar_masa', 'rendimiento'),
    estado ENUM('activo', 'inactivo') DEFAULT 'activo'
);

-- Tabla Alimento (actualizada)
CREATE TABLE IF NOT EXISTS Alimento (
    id_alimento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('fruta', 'verdura', 'cereal', 'proteina_animal', 'proteina_vegetal', 'lacteo', 'grasa_saludable', 'azucar'),
    grasas DECIMAL(5,2),
    calorias DECIMAL(6,2),
    proteinas DECIMAL(5,2),
    carbohidratos DECIMAL(5,2),
    porcion_100gr DECIMAL(5,2),
    piramide_nivel INT
);

-- Tabla RegistroConsumo (actualizada)
CREATE TABLE IF NOT EXISTS RegistroConsumo (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_alimento INT,
    cantidad_gr DECIMAL(6,2),
    tipo_comida ENUM('desayuno', 'almuerzo', 'cena', 'snack'),
    fecha_consumo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    calorias_totales DECIMAL(6,2),
    proteinas_totales DECIMAL(5,2),
    carbohidratos_totales DECIMAL(5,2),
    grasas_totales DECIMAL(5,2),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_alimento) REFERENCES Alimento(id_alimento) ON DELETE CASCADE
);

-- Nueva tabla: Recetas
CREATE TABLE IF NOT EXISTS Receta (
    id_receta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria ENUM('desayuno', 'almuerzo', 'cena', 'snack', 'vegetariana'),
    tiempo_preparacion INT, -- en minutos
    dificultad ENUM('facil', 'medio', 'dificil'),
    calorias_porcion DECIMAL(6,2),
    instrucciones TEXT,
    imagen VARCHAR(255),
    estado ENUM('activa', 'inactiva') DEFAULT 'activa'
);

-- Nueva tabla: Ingredientes de Recetas
CREATE TABLE IF NOT EXISTS RecetaIngrediente (
    id_receta_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    id_receta INT,
    id_alimento INT,
    cantidad DECIMAL(6,2),
    unidad VARCHAR(20),
    FOREIGN KEY (id_receta) REFERENCES Receta(id_receta) ON DELETE CASCADE,
    FOREIGN KEY (id_alimento) REFERENCES Alimento(id_alimento) ON DELETE CASCADE
);

-- Nueva tabla: Preferencias Alimenticias
CREATE TABLE IF NOT EXISTS PreferenciaUsuario (
    id_preferencia INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tipo ENUM('vegetariano', 'sin_gluten', 'sin_lactosa', 'sin_mani', 'pescetariano', 'vegano'),
    estado ENUM('activa', 'inactiva') DEFAULT 'activa',
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Nueva tabla: Logros
CREATE TABLE IF NOT EXISTS Logro (
    id_logro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    icono VARCHAR(50),
    tipo ENUM('consistencia', 'variedad', 'hidratacion', 'balance', 'progreso'),
    meta INT,
    unidad VARCHAR(20)
);

-- Nueva tabla: Logros de Usuarios
CREATE TABLE IF NOT EXISTS UsuarioLogro (
    id_usuario_logro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_logro INT,
    fecha_obtencion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    progreso_actual INT DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_logro) REFERENCES Logro(id_logro) ON DELETE CASCADE
);

-- Tabla de Logs del Sistema (para admin)
CREATE TABLE IF NOT EXISTS LogSistema (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    accion VARCHAR(255),
    modulo VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip VARCHAR(45),
    detalles TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE SET NULL
);

-- Insertar datos iniciales

-- Insertar usuario administrador
INSERT INTO Usuario (nombre, email, contrasena, rol) VALUES 
('Administrador', 'admin@alimentacion.com', 'admin123', 'admin');

-- Insertar alimentos de ejemplo
INSERT INTO Alimento (nombre, categoria, grasas, calorias, proteinas, carbohidratos, porcion_100gr, piramide_nivel) VALUES 
-- Nivel 1: Frutas y Verduras
('Manzana', 'fruta', 0.3, 52, 0.3, 14, 100, 1),
('Plátano', 'fruta', 0.3, 89, 1.1, 23, 100, 1),
('Naranja', 'fruta', 0.2, 47, 0.9, 12, 100, 1),
('Brócoli', 'verdura', 0.4, 34, 2.8, 7, 100, 1),
('Zanahoria', 'verdura', 0.2, 41, 0.9, 10, 100, 1),
('Espinaca', 'verdura', 0.4, 23, 2.9, 3.6, 100, 1),

-- Nivel 2: Carbohidratos
('Arroz Integral', 'cereal', 2.7, 112, 2.6, 23, 100, 2),
('Avena', 'cereal', 6.9, 389, 16.9, 66, 100, 2),
('Pan Integral', 'cereal', 4.0, 265, 13.0, 48, 100, 2),
('Pasta Integral', 'cereal', 2.1, 124, 5.0, 25, 100, 2),

-- Nivel 3: Proteínas
('Pechuga de Pollo', 'proteina_animal', 3.6, 165, 31, 0, 100, 3),
('Salmón', 'proteina_animal', 13.0, 208, 20, 0, 100, 3),
('Huevo', 'proteina_animal', 11.0, 155, 13, 1.1, 100, 3),
('Lentejas', 'proteina_vegetal', 1.1, 116, 9, 20, 100, 3),
('Garbanzos', 'proteina_vegetal', 6.0, 139, 7.2, 21, 100, 3),
('Tofu', 'proteina_vegetal', 4.8, 76, 8.1, 1.9, 100, 3),

-- Nivel 4: Lácteos y Grasas
('Leche Desnatada', 'lacteo', 0.2, 34, 3.4, 5, 100, 4),
('Yogur Natural', 'lacteo', 3.3, 61, 3.5, 4.7, 100, 4),
('Queso Fresco', 'lacteo', 22.0, 280, 20, 2, 100, 4),
('Aguacate', 'grasa_saludable', 15.0, 160, 2.0, 9, 100, 4),
('Almendras', 'grasa_saludable', 49.0, 579, 21, 22, 100, 4),
('Aceite de Oliva', 'grasa_saludable', 100.0, 884, 0, 0, 100, 4),

-- Nivel 5: Azúcares
('Azúcar Blanco', 'azucar', 0, 387, 0, 100, 100, 5),
('Miel', 'azucar', 0, 304, 0.3, 82, 100, 5),
('Chocolate Negro', 'azucar', 43.0, 546, 4.9, 61, 100, 5);

-- Insertar logros
INSERT INTO Logro (nombre, descripcion, icono, tipo, meta, unidad) VALUES 
('Primeros Pasos', 'Registra tu primer alimento en el sistema', '🥦', 'progreso', 1, 'alimentos'),
('Consistencia Semanal', 'Registra alimentos por 7 días consecutivos', '📅', 'consistencia', 7, 'días'),
('Hidratación Perfecta', 'Consume 2L de agua por 3 días seguidos', '💧', 'hidratacion', 3, 'días'),
('Explorador de Frutas', 'Prueba 5 frutas diferentes', '🍎', 'variedad', 5, 'frutas'),
('Maestro del Balance', 'Incluye todos los grupos alimenticios en un día', '🥗', 'balance', 1, 'día'),
('Analista Nutricional', 'Revisa tus reportes de progreso 5 veces', '📊', 'progreso', 5, 'reportes'),
('Chef Saludable', 'Prueba 3 recetas diferentes', '👨‍🍳', 'variedad', 3, 'recetas');

-- Insertar recetas de ejemplo
INSERT INTO Receta (nombre, descripcion, categoria, tiempo_preparacion, dificultad, calorias_porcion, instrucciones, imagen) VALUES 
('Tostadas de Aguacate', 'Tostadas integrales con aguacate, tomate y huevo pochado. Perfectas para empezar el día con energía.', 'desayuno', 15, 'facil', 420, '1. Tostar el pan integral\n2. Machacar el aguacate y extender sobre el pan\n3. Agregar tomate en rodajas\n4. Preparar huevo pochado y colocar encima\n5. Sazonar con sal, pimienta y limón', '🥑'),
('Ensalada de Quinoa', 'Ensalada fresca con quinoa, vegetales crujientes y aderezo de limón. Ideal para cenas ligeras.', 'cena', 20, 'facil', 280, '1. Cocinar la quinoa según instrucciones\n2. Picar todos los vegetales\n3. Mezclar quinoa con vegetales\n4. Preparar aderezo de limón y aceite de oliva\n5. Refrigerar por 30 minutos antes de servir', '🥗'),
('Pollo al Horno con Verduras', 'Pechuga de pollo horneada con una variedad de verduras de temporada. Plato completo y nutritivo.', 'almuerzo', 45, 'medio', 350, '1. Precalentar horno a 200°C\n2. Cortar pollo y verduras\n3. Sazonar con especias\n4. Hornear por 30-35 minutos\n5. Servir caliente', '🍗');

-- Insertar ingredientes para las recetas
INSERT INTO RecetaIngrediente (id_receta, id_alimento, cantidad, unidad) VALUES 
(1, 19, 2, 'rebanadas'),  -- Pan integral
(1, 22, 0.5, 'unidad'),   -- Aguacate
(1, 11, 1, 'unidad'),     -- Huevo
(2, 7, 100, 'gramos'),    -- Quinoa (arroz integral como proxy)
(2, 5, 50, 'gramos'),     -- Zanahoria
(2, 6, 30, 'gramos'),     -- Espinaca
(3, 10, 150, 'gramos'),   -- Pechuga de pollo
(3, 4, 100, 'gramos'),    -- Brócoli
(3, 5, 80, 'gramos');     -- Zanahoria