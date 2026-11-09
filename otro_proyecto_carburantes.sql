-- 1. Tabla de Ubicaciones (Normalizada)
CREATE TABLE `ubicaciones` (
  `id_ubicacion` INT(11) NOT NULL AUTO_INCREMENT,
  `comunidad` VARCHAR(100) NOT NULL,
  `provincia` VARCHAR(100) NOT NULL,
  `localidad` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_ubicacion`),
  UNIQUE KEY `unique_geo` (`comunidad`,`provincia`,`localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 2. NUEVA Tabla: Estaciones de Servicio
-- Separa la entidad física de los precios, incluyendo dirección, horarios y coordenadas POINT.
CREATE TABLE `estaciones_servicio` (
  `id_estacion` INT(11) NOT NULL AUTO_INCREMENT,
  `rotulo` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `horario` VARCHAR(150) DEFAULT NULL,
  `coordenadas` POINT NOT NULL,
  `id_ubicacion` INT(11) NOT NULL,
  PRIMARY KEY (`id_estacion`),
  SPATIAL KEY `idx_coordenadas` (`coordenadas`),
  KEY `id_ubicacion` (`id_ubicacion`),
  CONSTRAINT `fk_estacion_ubicacion` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 3. Tabla de Tipos de Combustible
CREATE TABLE `tipos_combustible` (
  `id_tipo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 4. REFACTORIZADA: Tabla de Precios (Pensada para UPSERT)
-- Al tener como Primary Key la combinación de estación y tipo, garantiza un único precio por combustible en cada gasolinera.
CREATE TABLE `precios_combustible` (
  `id_estacion` INT(11) NOT NULL,
  `id_tipo` INT(11) NOT NULL,
  `precio_litro` DECIMAL(5,3) NOT NULL,
  `fecha_actualizacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estacion`, `id_tipo`),
  CONSTRAINT `fk_precio_estacion` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones_servicio` (`id_estacion`) ON DELETE CASCADE,
  CONSTRAINT `fk_precio_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_combustible` (`id_tipo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
