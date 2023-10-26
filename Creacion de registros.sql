-- Registros para la tabla "direccion"
INSERT INTO direcciones (calle, altura, barrio, codigo_postal, provincia)
VALUES
    ('Calle A', 123, 'Barrio X', '12345', 'Provincia 1'),
    ('Calle B', 456, 'Barrio Y', '54321', 'Provincia 2'),
    ('Calle C', 789, 'Barrio Z', '67890', 'Provincia 3');

-- Registros para la tabla "categorias"
INSERT INTO categorias (nombre)
VALUES
    ('Electrónica'),
    ('Ropa'),
    ('Alimentos');

-- Registros para la tabla "clientes"
INSERT INTO clientes (nombre, apellido, numero_telefono, id_direccion)
VALUES
    ('Juan', 'Pérez', 1234567890, 1),
    ('María', 'Gómez', 9876543210, 2),
    ('Carlos', 'López', 5551112222, 3);

-- Registros para la tabla "proveedores"
INSERT INTO proveedores (razon_social, telefono, id_direccion)
VALUES
    ('Proveedor A', 1111111111, 1),
    ('Proveedor B', 2222222222, 2),
    ('Proveedor C', 3333333333, 3);

-- Registros para la tabla "productos"
INSERT INTO productos (nombre, fecha_vencimiento, precio_unitario, id_categoria, id_proveedor)
VALUES
    ('Producto 1', '2023-12-31', 10.99, 1, 1),
    ('Producto 2', '2024-06-30', 19.99, 2, 2),
    ('Producto 3', '2023-08-15', 5.99, 3, 3);

-- Registros para la tabla "pedidos"
INSERT INTO pedidos (envio, id_cliente)
VALUES
    (1, 1),
    (0, 2),
    (1, 3);

-- Registros para la tabla "productos_pedidos" (asumiendo que estos productos se han comprado en los pedidos)
INSERT INTO productos_pedidos (id_pedido, id_producto, cantidad_comprada)
VALUES
    (1, 1, 3),  -- 3 unidades del Producto 1 en Pedido 1
    (1, 2, 2),  -- 2 unidades del Producto 2 en Pedido 1
    (2, 2, 1),  -- 1 unidad del Producto 2 en Pedido 2
    (3, 3, 5);  -- 5 unidades del Producto 3 en Pedido 3
