CREATE DATABASE almacen;

-- Crear tabla "direccion"
CREATE TABLE direcciones(
	id_direccion INT(8) NOT NULL AUTO_INCREMENT,
    calle VARCHAR(20) NOT NULL,
    altura INT(6) NOT NULL,
    barrio VARCHAR(20) NOT NULL,
    piso_departamento VARCHAR(10),
    codigo_postal VARCHAR(6) NOT NULL,
    provincia VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (id_direccion)
);

-- Crear tabla "categoria"
CREATE TABLE categorias(
	id_categoria INT(8) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (id_categoria)
);

-- Crear tabla "clientes"
CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    numero_telefono INT(10),
	id_direccion INT(8) NOT NULL,
    
    PRIMARY KEY (id_cliente),
    INDEX IDX_CLIENTES_DIRECCION (id_direccion),
    CONSTRAINT FK_CLIENTES_DIRECCIONES_ID FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

-- Crear tabla "proveedores"
CREATE TABLE proveedores (
    id_proveedor INT(8) NOT NULL AUTO_INCREMENT,
    razon_social VARCHAR(100) NOT NULL,
    telefono INT(10) NOT NULL,
	id_direccion INT(8) NOT NULL,
    
    PRIMARY KEY (id_proveedor),
    INDEX IDX_PROVEEDORES_DIRECCION (id_direccion),
    CONSTRAINT FK_PROVEEDORES_DIRECCIONES_ID FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

-- Crear tabla "productos"
CREATE TABLE productos(
	id_producto INT(8) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
	fecha_vencimiento DATE NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    id_categoria INT(8) NOT NULL,
    id_proveedor INT(8) NOT NULL,
    
    PRIMARY KEY (id_producto),
    INDEX IDX_PRODUCTOS_CATEGORIA (id_categoria),
    INDEX IDX_PRODUCTOS_PROVEEDOR (id_proveedor),
    CONSTRAINT FK_PRODUCTOS_CATEGORIAS_ID FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    CONSTRAINT FK_PRODUCTOS_PROVEEDORES_ID FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- Crear tabla "pedidos"
CREATE TABLE pedidos (
    id_pedido INT(8) NOT NULL AUTO_INCREMENT,
    valor_total_compra DECIMAL(10, 2) DEFAULT 0.00, -- Se establece en 0.00 por defecto
    envio BOOLEAN NOT NULL,
	id_cliente INT(8) NOT NULL,
    
    PRIMARY KEY (id_pedido),
    INDEX IDX_PEDIDOS_CLIENTE (id_cliente),
    CONSTRAINT FK_PEDIDOS_CLIENTES_ID FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Crear tabla "productos_pedidos" (tabla de relación)
CREATE TABLE productos_pedidos (
	id_prod_pedidos INT AUTO_INCREMENT NOT NULL,
    id_pedido INT(8) NOT NULL,
    id_producto INT(8) NOT NULL,
    cantidad_comprada INT NOT NULL,
    
    PRIMARY KEY (id_prod_pedidos),
    CONSTRAINT FK_PROD_PED_PEDIDOS_ID FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    CONSTRAINT FK_PROD_PED_PRODUCTOS_ID FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);