
-- Creación de la base de datos y configuración inicial
CREATE DATABASE IF NOT EXISTS telovendo_db;
USE telovendo_db;

-- Creación de tablas para almacenar la información del proyecto
-- Tabla Provincia: Almacena las provincias disponibles
CREATE TABLE Provincia (
    codigo_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla Camionero: Almacena información de los camioneros
CREATE TABLE Camionero (
    dni INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    poblacion VARCHAR(100) NOT NULL,
    codigo_provincia INT,
    FOREIGN KEY (codigo_provincia) REFERENCES Provincia(codigo_provincia)
);

-- Tabla Camion: Almacena datos sobre los camiones
CREATE TABLE Camion (
    matricula VARCHAR(50) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    potencia INT NOT NULL
);

-- Tabla Paquete: Detalles de los paquetes enviados
CREATE TABLE Paquete (
    codigo_paquete INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    destinatario VARCHAR(100) NOT NULL,
    direccion_destinatario VARCHAR(150) NOT NULL,
    dni_camionero INT,
    FOREIGN KEY (dni_camionero) REFERENCES Camionero(dni)
);

-- Tabla Distribucion: Registro de distribuciones realizadas
CREATE TABLE Distribucion (
    dni_camionero INT,
    matricula VARCHAR(50),
    fecha DATE NOT NULL,
    PRIMARY KEY (dni_camionero, matricula),
    FOREIGN KEY (dni_camionero) REFERENCES Camionero(dni),
    FOREIGN KEY (matricula) REFERENCES Camion(matricula)
);

-- Tabla Cliente: Información de los clientes
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    direccion VARCHAR(200)
);

-- Tabla Proveedor: Datos de los proveedores
CREATE TABLE Proveedor (
    id INT PRIMARY KEY,
    nombre_corporativo VARCHAR(100),
    representante_legal VARCHAR(100),
    telefono VARCHAR(15),
    categoria VARCHAR(50),
    email VARCHAR(100)
);

-- Tabla Producto: Información sobre los productos
CREATE TABLE Producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    categoria VARCHAR(50),
    proveedor_id INT,
    color VARCHAR(50),
    stock INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(id)
);


-- Inserción de datos para Provincia
INSERT INTO Provincia (nombre) VALUES 
('Madrid'), 
('Barcelona');

-- Inserción de datos para Camionero
INSERT INTO Camionero (dni, nombre, telefono, direccion, salario, poblacion, codigo_provincia) VALUES
(123456789, 'Juan Pérez', '912345678', 'Calle Falsa 123', 1200.50, 'Madrid', 1),
(987654321, 'Ana García', '987654321', 'Avenida Siempre Viva 456', 1300.75, 'Barcelona', 2);

-- Inserción de datos para Camion
INSERT INTO Camion (matricula, modelo, tipo, potencia) VALUES
('M-1234-AB', 'Volvo', 'Grande', 450),
('B-4321-CD', 'Mercedes', 'Mediano', 350);

-- Inserción de datos para Paquete
INSERT INTO Paquete (descripcion, destinatario, direccion_destinatario, dni_camionero) VALUES
('Paquete de libros', 'Carlos Ruiz', 'Plaza Mayor 5, Madrid', 123456789),
('Electrodomésticos', 'María López', 'Gran Vía 27, Barcelona', 987654321);

-- Inserción de datos para Distribucion
INSERT INTO Distribucion (dni_camionero, matricula, fecha) VALUES
(123456789, 'M-1234-AB', '2023-07-01'),
(987654321, 'B-4321-CD', '2023-07-02');

-- Inserción de datos para Cliente
INSERT INTO Cliente (id, nombre, apellido, direccion) VALUES
(1, 'Luis', 'González', 'Av. Libertador 1234'),
(2, 'Maria', 'Fernandez', 'Calle 8 4567'),
(3, 'Carlos', 'Mendez', 'Paseo Colón 890'),
(4, 'Juana', 'Molina', 'Diagonal Norte 213'),
(5, 'Ana', 'Perez', 'Avenida Siempre Viva 742');

-- Inserción de datos para Proveedor
INSERT INTO Proveedor (id, nombre_corporativo, representante_legal, telefono, categoria, email) VALUES
(1, 'ElectroMax', 'Juan Martínez', '1234567890', 'Electrónica', 'contacto@electromax.com'),
(2, 'CompTech', 'Ana Rivera', '2345678901', 'Computación', 'info@comptech.com'),
(3, 'HomeGoods', 'Carlos López', '3456789012', 'Hogar', 'ventas@homegoods.com'),
(4, 'SoundWave', 'Lucía Hernández', '4567890123', 'Audio', 'support@soundwave.com'),
(5, 'GameSphere', 'Marco Díaz', '5678901234', 'Videojuegos', 'help@gamesphere.com');

-- Inserción de datos para Producto
INSERT INTO Producto (id, nombre, precio, categoria, proveedor_id, color, stock) VALUES
(1, 'Altavoz Bluetooth', 49.99, 'Audio', 4, 'Negro', 150),
(2, 'Laptop Gamer', 1299.99, 'Computación', 2, 'Rojo', 30),
(3, 'Smartphone 5G', 999.99, 'Electrónica', 1, 'Azul', 75),
(4, 'Consola de Videojuegos', 399.99, 'Videojuegos', 5, 'Blanco', 100),
(5, 'Robot Aspiradora', 299.99, 'Hogar', 3, 'Gris', 50),
(6, 'Teclado Mecánico', 89.99, 'Computación', 2, 'Negro', 120),
(7, 'Frigorífico Inteligente', 1200.99, 'Hogar', 3, 'Plateado', 20),
(8, 'Cámara de Seguridad WiFi', 199.99, 'Electrónica', 1, 'Blanco', 85),
(9, 'Auriculares Inalámbricos', 59.99, 'Audio', 4, 'Verde', 200),
(10, 'Mando para Consola', 59.99, 'Videojuegos', 5, 'Negro', 150);

-- Datos para Provincia
INSERT INTO Provincia (nombre) VALUES ('Madrid'), ('Barcelona');

-- Datos para Camionero
INSERT INTO Camionero (dni, nombre, telefono, direccion, salario, poblacion, codigo_provincia) VALUES
(123456789, 'Juan Pérez', '912345678', 'Calle Falsa 123', 1200.50, 'Madrid', 1),
(987654321, 'Ana García', '987654321', 'Avenida Siempre Viva 456', 1300.75, 'Barcelona', 2);

-- Consultas de análisis sobre la base de datos
-- Consulta para obtener la categoría de producto más repetida
SELECT categoria, COUNT(*) AS cantidad
FROM Producto
GROUP BY categoria
ORDER BY cantidad DESC
LIMIT 1;

-- Consulta para obtener el producto con mayor stock
SELECT nombre, stock
FROM Producto
ORDER BY stock DESC
LIMIT 1;

-- Consulta para determinar el color de producto más común
SELECT color, COUNT(*) AS cantidad
FROM Producto
GROUP BY color
ORDER BY cantidad DESC
LIMIT 1;

-- Consulta para encontrar el proveedor con el menor stock total
SELECT Proveedor.nombre_corporativo, SUM(Producto.stock) AS total_stock
FROM Proveedor
JOIN Producto ON Proveedor.id = Producto.proveedor_id
GROUP BY Proveedor.id
ORDER BY total_stock;
