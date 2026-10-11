SCRIPT PARA LA BASE DE DATOS TiendaOnline:

CREATE DATABASE TiendaOnline;
GO

USE TiendaOnline;
GO

-- Tabla 2: categorias
CREATE TABLE categorias (
    idCategoria INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(100) NOT NULL
);
GO

-- Tabla 1: productos (con clave foránea hacia categorias)
CREATE TABLE productos (
    idProducto INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria INT NOT NULL,
    CONSTRAINT FK_Productos_Categorias FOREIGN KEY (categoria) 
        REFERENCES categorias(idCategoria)
);
GO

-- Carga inicial de datos para pruebas
INSERT INTO categorias (descripcion) VALUES 
('Periféricos'),
('Monitores'),
('Componentes');

INSERT INTO productos (nombre, precio, categoria) VALUES 
('Teclado Mecánico RGB', 45000.00, 1),
('Mouse Gamer Inalámbrico', 32000.00, 1),
('Monitor 24 Pulgadas 144Hz', 185000.00, 2),
('Placa de Video RTX 3060', 420000.00, 3),
('Memoria RAM 16GB DDR4', 48000.00, 3);
GO
