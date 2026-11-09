CREATE DATABASE IF NOT EXISTS comparacarburantes
  DEFAULT CHARACTER SET utf8mb4;
  
  USE comparacarburantes;
  -- 1. Tabla de Provincias
CREATE TABLE provincias (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Tabla de Municipios
CREATE TABLE municipios (
    id_municipio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    id_provincia INT NOT NULL,
    FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia) ON DELETE CASCADE
);

-- 3. Tabla de Estaciones de Servicio (Gasolineras)
CREATE TABLE estaciones_servicio (
    id_estacion INT PRIMARY KEY, -- ID / IDEST (proporcionado por MITECO)
    rotulo VARCHAR(150),
    direccion VARCHAR(255) NOT NULL,
    codigo_postal VARCHAR(10),
    latitud DECIMAL(10, 8) NOT NULL,
    longitud DECIMAL(11, 8) NOT NULL,
    horario VARCHAR(255),
    id_municipio INT NOT NULL,
    FOREIGN KEY (id_municipio) REFERENCES municipios(id_municipio)
);

-- 4. Tabla de Tipos de Combustible
CREATE TABLE tipos_combustible (
    id_combustible INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE -- Ej: Gasolina 95 E5, Gasóleo A, etc.
);

-- 5. Tabla de Registro de Precios (Histórico / Precios Actuales)
CREATE TABLE historico_precios (
    id_registro BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_estacion INT NOT NULL,
    id_combustible INT NOT NULL,
    precio DECIMAL(5, 3) NOT NULL, -- Soporta precios como 1.589 €/L
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_estacion) REFERENCES estaciones_servicio(id_estacion) ON DELETE CASCADE,
    FOREIGN KEY (id_combustible) REFERENCES tipos_combustible(id_combustible) ON DELETE CASCADE,
    INDEX idx_estacion_combustible (id_estacion, id_combustible),
    INDEX idx_fecha (fecha_registro)
);