-- Crear tabla de clientes
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    ciudad TEXT
);

-- Crear tabla de productos
CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio REAL
);

-- Crear tabla de ventas
CREATE TABLE ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    email TEXT,
    telefono TEXT,
    ciudad TEXT
);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad) VALUES
('Ana','Pérez','ana@email.com','111111111','Santiago'),
('Luis','Gómez','luis@email.com','222222222','Valparaíso'),
('Carlos','López','carlos@email.com','333333333','Concepción'),
('Marta','Rojas','marta@email.com','444444444','Santiago'),
('Pedro','Díaz','pedro@email.com','555555555','Valparaíso'),
('Sofía','Torres','sofia@email.com','666666666','Concepción'),
('Jorge','Vargas','jorge@email.com','777777777','Santiago'),
('Lucía','Castro','lucia@email.com','888888888','Valparaíso'),
('Diego','Morales','diego@email.com','999999999','Concepción'),
('Elena','Herrera','elena@email.com','101010101','Santiago'),
('Raúl','Silva','raul@email.com','111111112','Valparaíso'),
('Valentina','Mendoza','vale@email.com','121212121','Concepción'),
('Tomás','Navarro','tomas@email.com','131313131','Santiago'),
('Camila','Ortega','camila@email.com','141414141','Valparaíso'),
('Andrés','Paredes','andres@email.com','151515151','Concepción'),
('Daniela','Reyes','daniela@email.com','161616161','Santiago'),
('Fernando','Soto','fernando@email.com','171717171','Valparaíso'),
('Paula','Fuentes','paula@email.com','181818181','Concepción'),
('Ricardo','Contreras','ricardo@email.com','191919191','Santiago'),
('Gabriela','Espinoza','gabriela@email.com','202020202','Valparaíso');
INSERT INTO productos (nombre, precio) VALUES
('Notebook', 500000),
('Mouse', 15000),
('Teclado', 25000),
('Monitor', 120000),
('Impresora', 80000);
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha) VALUES
(1,1,1,'2026-03-01'),
(2,2,2,'2026-03-02'),
(3,3,1,'2026-03-03'),
(4,4,1,'2026-03-04'),
(5,5,2,'2026-03-05'),
(6,1,1,'2026-03-06'),
(7,2,3,'2026-03-07'),
(8,3,2,'2026-03-08'),
(9,4,1,'2026-03-09'),
(10,5,1,'2026-03-10'),
(11,1,2,'2026-03-11'),
(12,2,1,'2026-03-12'),
(13,3,1,'2026-03-13'),
(14,4,2,'2026-03-14'),
(15,5,1,'2026-03-15'),
(16,1,3,'2026-03-16'),
(17,2,2,'2026-03-17'),
(18,3,1,'2026-03-18'),
(19,4,1,'2026-03-19'),
(20,5,2,'2026-03-20'),
(1,2,1,'2026-03-21'),
(2,3,2,'2026-03-22'),
(3,4,1,'2026-03-23'),
(4,5,1,'2026-03-24'),
(5,1,2,'2026-03-25'),
(6,2,1,'2026-03-26'),
(7,3,2,'2026-03-27'),
(8,4,1,'2026-03-28'),
(9,5,1,'2026-03-29'),
(10,1,2,'2026-03-30');
SELECT * FROM clientes;
SELECT * FROM clientes
WHERE ciudad = 'Santiago';
SELECT * FROM clientes
WHERE nombre = 'Pedro';
SELECT * FROM clientes
WHERE nombre LIKE '%an%';
CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio REAL NOT NULL
);
CREATE TABLE IF NOT EXISTS ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_producto INTEGER,
    cantidad INTEGER NOT NULL,
    fecha TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
-- Tabla clientes (clave primaria)
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    ciudad TEXT
);

-- Tabla productos (clave primaria)
CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio REAL
);

-- Tabla ventas (clave primaria + foráneas)
CREATE TABLE IF NOT EXISTS ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_producto INTEGER,
    cantidad INTEGER NOT NULL,
    fecha TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
ALTER TABLE ventas ADD COLUMN fecha TEXT;
SELECT 
    clientes.nombre,
    clientes.apellido,
    productos.nombre AS producto,
    ventas.fecha
FROM ventas
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
INNER JOIN productos ON ventas.id_producto = productos.id_producto;

SELECT SUM(cantidad) AS total_productos_vendidos
FROM ventas;

SELECT AVG(cantidad) AS promedio_venta
FROM ventas;

SELECT COUNT(*) AS total_ventas
FROM ventas;

SELECT 
    id_cliente,
    SUM(cantidad) AS total_comprado
FROM ventas
GROUP BY id_cliente;

SELECT 
    id_producto,
    SUM(cantidad) AS total_vendido
FROM ventas
GROUP BY id_producto;

SELECT 
    clientes.nombre,
    clientes.apellido,
    SUM(ventas.cantidad) AS total_comprado
FROM ventas
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
GROUP BY ventas.id_cliente;

SELECT 
    productos.nombre,
    SUM(ventas.cantidad) AS total_vendido
FROM ventas
INNER JOIN productos ON ventas.id_producto = productos.id_producto
GROUP BY ventas.id_producto;

--total de ventas por clientes--
SELECT 
    clientes.nombre,
    clientes.apellido,
    SUM(ventas.cantidad) AS total_comprado
FROM ventas
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
GROUP BY ventas.id_cliente;

--Listar los clientes que hayan hecho más de una compra.--
SELECT 
    clientes.nombre,
    clientes.apellido,
    COUNT(ventas.id_venta) AS cantidad_compras
FROM ventas
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
GROUP BY ventas.id_cliente
HAVING COUNT(ventas.id_venta) > 1;

--Obtener el producto más vendido utilizando una subconsulta.--
SELECT nombre
FROM productos
WHERE id_producto = (
    SELECT id_producto
    FROM ventas
    GROUP BY id_producto
    ORDER BY SUM(cantidad) DESC
    LIMIT 1
);

--Consultar el cliente que más gastó en total.--
SELECT 
    clientes.nombre,
    clientes.apellido,
    SUM(ventas.cantidad) AS total_comprado
FROM ventas
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
GROUP BY ventas.id_cliente
ORDER BY total_comprado DESC
LIMIT 1;

--Modificar la tabla de productos para agregar una columna stock.--
ALTER TABLE productos ADD COLUMN stock INTEGER;

PRAGMA table_info(productos);

--asingar stock a los productos--
UPDATE productos SET stock = 10;

SELECT * FROM productos;

--Actualizar el stock luego de una venta.--
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha)
VALUES (1, 1, 2, '2026-03-26');

UPDATE productos
SET stock = stock - (
    SELECT cantidad 
    FROM ventas 
    WHERE id_producto = 1 
    ORDER BY id_venta DESC 
    LIMIT 1
)
WHERE id_producto = 1;


SELECT * FROM productos;

--Eliminar un producto obsoleto y documentar el impacto.--
DELETE FROM productos
WHERE id_producto = 10;

SELECT * FROM productos;



