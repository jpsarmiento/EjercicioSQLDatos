DROP TABLE Movimiento;
DROP TABLE Cliente;
DROP TABLE Fecha;
DROP TABLE TipoTransaccion;
DROP TABLE Producto;
DROP TABLE Proveedor;

CREATE TABLE Fecha (
Fecha DATETIME, 
Dia TINYINT, 
Mes VARCHAR(20), 
Anio SMALLINT,
Numero_semana_ISO TINYINT,
PRIMARY KEY(Fecha));

CREATE TABLE TipoTransaccion(
ID_Tipo_transaccion TINYINT,
Tipo VARCHAR(20),
PRIMARY KEY(ID_Tipo_transaccion));

CREATE TABLE Cliente (
ID_Categoria smallint,
ID_GrupoCompra smallint,
ID_Cliente smallint,
Nombre varchar(20),
ClienteFactura int,
ID_CiudadEntrega smallint,
LimiteCredito decimal(10,0),
FechaAperturaCuenta datetime,
DiasPago int,
PRIMARY KEY(ID_Cliente),
FOREIGN KEY (FechaAperturaCuenta) REFERENCES Fecha(Fecha));

CREATE TABLE Producto (
ID_Producto SMALLINT, 
Nombre VARCHAR(100),
Marca VARCHAR(30), 
Paquete_de_compra VARCHAR(20), 
Color VARCHAR(10), 
Necesita_refrigeracion BOOLEAN, 
Dias_tiempo_entrega SMALLINT, 
cantidad_por_salida INT, 
Precio_minorista_recomendado FLOAT, 
Paquete_de_venta VARCHAR(20), 
Precio_unitario FLOAT,
PRIMARY KEY(ID_Producto));

CREATE TABLE Proveedor(
ID_proveedor INT,
Nombre VARCHAR(20),
Categoria VARCHAR(20),
Contacto_principal VARCHAR(30),
Referencia VARCHAR(30),
Dias_pago INT, 
Codigo_postal INT,
PRIMARY KEY(ID_proveedor));

CREATE TABLE Movimiento (
FechaMovimiento datetime,
ID_Producto smallint,
ID_Proveedor INT,
ID_Cliente smallint,
ID_TipoTransaccion tinyint,
Cantidad double,
primary key (FechaMovimiento, ID_Producto, ID_Proveedor, ID_Cliente, ID_TipoTransaccion),
FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto),
FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_proveedor),
FOREIGN KEY (FechaMovimiento) REFERENCES Fecha(Fecha),
FOREIGN KEY (ID_TipoTransaccion) REFERENCES TipoTransaccion(ID_Tipo_transaccion)
);

INSERT INTO Fecha 
	(Fecha, Dia, Mes, Anio, Numero_semana_ISO)
    values
    ('1998-01-23 12:45:56', 23, 'Jan', 1998, 5),
    ('2000-01-01 10:33:56', 1, 'Jan', 2000, 52),
    ('2001-01-1 12:45:56', 1, 'Jan', 2001, 1),
    ('2001-04-06 12:45:56', 6, 'Apr', 2001, 14),
    ('2002-02-16 12:45:56', 16, 'Feb', 2002, 7),
    ('2022-01-23 12:45:56', 23, 'Jan', 2023, 12),
    ('2020-01-01 10:33:56', 1, 'Jan', 2020, 2),
    ('2021-01-01 12:45:56', 1, 'Jan', 2021, 6),
    ('2022-04-06 12:45:56', 6, 'Apr', 2022, 5),
    ('2021-02-16 12:45:56', 16, 'Feb', 2021, 2);

INSERT INTO TipoTransaccion
	(ID_Tipo_transaccion, Tipo)
    values
    (1, 'Debito'),
    (2, 'Credito'),
    (3, 'Cheque'),
    (4, 'Efectivo'),
    (5, 'Cupon');

INSERT INTO Cliente
	(ID_Cliente, ID_Categoria, ID_GrupoCompra, Nombre, ClienteFactura, ID_CiudadEntrega, LimiteCredito, FechaAperturaCuenta, DiasPago)
    values
    (1, 1, 1, 'Juan A', 123, 2, 10000, '2020-01-01 10:33:56', 5),
    (2, 2, 1, 'Pedro G', 654, 2, 5000, '2021-02-16 12:45:56', 9),
    (3, 1, 1, 'Maria F', 346, 3, 80000, '2020-01-01 10:33:56', 2),
    (4, 2, 1, 'Silvia C', 987, 1, 13000, '2020-01-01 10:33:56', 1),
    (5, 2, 1, 'Sofia D', 444, 5, 55000, '2002-02-16 12:45:56', 7);

INSERT INTO Producto
	(ID_Producto, Nombre, Marca, Paquete_de_compra, Color,Necesita_refrigeracion, Dias_tiempo_entrega, 
    cantidad_por_salida, Precio_minorista_recomendado, Paquete_de_venta,Precio_unitario)
    values
    (1, 'Balon', 'Fifa', 'paq', 'blanco', False, 7, 15, 120.85, 'paq', 32.50),
    (2, 'Bicicleta', 'Bmx', 'paq', 'azul', True, 15, 4, 800, 'paq', 250),
    (3, 'Camisa', 'Adidas', 'paq', 'negro', False, 5, 30, 55.30, 'paq', 22.85),
    (4, 'Pantalon', 'Jeans', 'paq', 'azul', False, 7, 32, 40.50, 'paq', 19.85),
    (5, 'Sombrilla', 'Sin marca', 'paq', 'rojo', True, 4, 40, 15.75, 'paq', 8.25);

INSERT INTO Proveedor
	(ID_proveedor, Nombre, Categoria, Contacto_principal, Referencia, Dias_pago, Codigo_postal)
    values
    (1, 'Exportaciones Lucho', 'Alimentos', 'Contacto 1', 'REF1', 10, 4567),
    (2, 'Chinese Exports', 'Bienes', 'Contacto 2', 'REF1', 4, 7654),
    (3, 'America Retail', 'Ropa', 'Contacto 1', 'REF1', 4, 8764),
    (4, 'JPN C.O.', 'Electrodomesticos', 'Contacto 1', 'REF1', 8, 6789),
    (5, 'EU Company', 'Bienes', 'Contacto 2', 'REF1', 5, 2343);
    
INSERT INTO Movimiento
	(FechaMovimiento, ID_Producto, ID_Proveedor, ID_Cliente, ID_TipoTransaccion, Cantidad)
    values
    ('2022-01-23 12:45:56', 1, 3, 5, 1, 5),
    ('2020-01-01 10:33:56', 2, 4, 5, 1, 3),
    ('2021-01-01 12:45:56', 1, 3, 3, 1, 8),
    ('2022-04-06 12:45:56', 4, 4, 4, 2, 24),
    ('2021-02-16 12:45:56', 5, 4, 2, 1, 2),
    ('2022-01-23 12:45:56', 2, 3, 3, 1, 4),
    ('2020-01-01 10:33:56', 5, 4, 3, 1, 20),
    ('2021-01-01 12:45:56', 1, 1, 5, 1, 10),
    ('2022-04-06 12:45:56', 3, 4, 5, 2, 5),
    ('2021-02-16 12:45:56', 1, 3, 1, 1, 9);

SELECT * FROM Movimiento
WHERE FechaMovimiento >= '20201231'
AND FechaMovimiento < '20221231'
AND ID_Cliente = 5
ORDER BY Movimiento.FechaMovimiento ASC

