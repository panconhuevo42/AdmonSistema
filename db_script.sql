CREATE TABLE IF NOT EXISTS Usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(45) NOT NULL UNIQUE,
  contrasena VARCHAR(45) NOT NULL,
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Alimento (
  id_alimento INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(45),
  grasas FLOAT,
  calorias FLOAT,
  proteinas FLOAT,
  carbohidratos FLOAT,
  porcion_100gr FLOAT
);

CREATE TABLE IF NOT EXISTS Registro_Consumo (
  id_registro INT AUTO_INCREMENT PRIMARY KEY,
  id_alimento INT,
  id_usuario INT,
  cantidad_gr FLOAT,
  fecha_consumo DATE,
  FOREIGN KEY (id_alimento) REFERENCES Alimento(id_alimento),
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
