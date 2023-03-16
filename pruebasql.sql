CREATE SCHEMA prueba;
use prueba;

CREATE TABLE Clientes (
cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR (15),
correo VARCHAR (50),
medioDePago VARCHAR (20)

);

CREATE TABLE Boletas (
boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nroBoleta BIGINT,
fecha DATE,
total DOUBLE
);

CREATE TABLE Proveedores (
proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR (25),
contacto VARCHAR (25)
);

CREATE TABLE Productos (
producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR (25)
);

CREATE TABLE ProductosProveedores (
producto_id INTEGER,
proveedor_id INTEGER
); 

CREATE TABLE TipoProductos (
tipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
codigo VARCHAR (50),
nombre VARCHAR (25),
precioVenta INTEGER,
stock INTEGER
);

CREATE TABLE Ventas (
venta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
fecha DATE,
total DOUBLE
);

CREATE TABLE Ganancias (
ganancia_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
fecha DATE,
precioCompra DOUBLE,
precioVenta DOUBLE
);

ALTER TABLE Boletas ADD cliente_id INTEGER NOT NULL;
ALTER TABLE Boletas
ADD FOREIGN KEY (cliente_id) REFERENCES Clientes (cliente_id);

ALTER TABLE ProductosProveedores
ADD FOREIGN KEY (producto_id) REFERENCES Productos (producto_id);

ALTER TABLE ProductosProveedores
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedores (proveedor_id);

ALTER TABLE Tipoproductos ADD producto_id INTEGER NOT NULL;
ALTER TABLE TipoProductos
ADD FOREIGN KEY (producto_id) REFERENCES Productos (producto_id);

ALTER TABLE Ventas ADD producto_id INTEGER NOT NULL;
ALTER TABLE Ventas
ADD FOREIGN KEY (producto_id) REFERENCES Productos (producto_id);

ALTER TABLE Ventas ADD ganancia_id INTEGER NOT NULL;
ALTER TABLE Ventas
ADD FOREIGN KEY (ganancia_id) REFERENCES Ganancias (ganancia_id);

ALTER TABLE Ganancias ADD proveedor_id INTEGER NOT NULL;
ALTER TABLE Ganancias
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedores (proveedor_id);

INSERT INTO Productos (nombre) VALUES 
("Abarrotes"),
("lacteos"),
("Frutas"),
("Confitería"),
("Enlatados");

ALTER TABLE TipoProductos RENAME COLUMN nombre TO tipo;

INSERT INTO TipoProductos (tipo) VALUES
("Arroz"),
("Manzanas"),
("Galletas"),
("Leche");

SELECT * FROM  Productos;
SELECT  Productos.nombre  FROM Productos;

SELECT Clientes.nombre, Boletas.total
FROM Clientes RIGHT JOIN Boletas ON clientes.boleta_id = Boletas.boleta_id;

SELECT Ganancias.fecha FROM Ganancias;
SELECT Ventas. fecha, Ventas.total FROM Ventas;














