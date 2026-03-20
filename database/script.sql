-- Crear la base de datos
CREATE DATABASE MiAppCRUDDB;
GO

USE MiAppCRUDDB;
GO

-- Crear la tabla de productos
CREATE TABLE Productos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(500),
    Precio DECIMAL(18,2) NOT NULL,
    Stock INT NOT NULL,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE()
);
GO

-- Insertar datos de ejemplo
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock) VALUES
('Laptop HP', 'Laptop HP Pavilion 15.6 pulgadas', 850.99, 10),
('Mouse Logitech', 'Mouse inalámbrico Logitech MX Master', 45.50, 50),
('Teclado Mecánico', 'Teclado mecánico RGB', 89.99, 30);
GO
