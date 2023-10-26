DELIMITER //
CREATE TRIGGER update_valor_total AFTER INSERT ON productos_pedidos
FOR EACH ROW
BEGIN
    UPDATE pedidos AS p
    SET valor_total_compra = (
        SELECT SUM(productos.precio_unitario * productos_pedidos.cantidad_comprada)
        FROM productos_pedidos
        JOIN productos ON productos.id_producto = productos_pedidos.id_producto
        WHERE productos_pedidos.id_pedido = p.id_pedido
    )
    WHERE p.id_pedido = NEW.id_pedido;
END;
//
DELIMITER ;