-- Procedimientos almacenados para Barbero

CREATE OR REPLACE FUNCTION insert_barbero(
    p_nombre VARCHAR, 
    p_apellido VARCHAR, 
    p_idSede UUID
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Barbero (Nombre, Apellido, idSede) VALUES (p_nombre, p_apellido, p_idSede);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_barberos()
RETURNS TABLE(
    idBarbero UUID,
    Nombre VARCHAR,
    Apellido VARCHAR,
    idSede UUID,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Barbero;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_barbero(p_idBarbero UUID)
RETURNS TABLE(
    idBarbero UUID,
    Nombre VARCHAR,
    Apellido VARCHAR,
    idSede UUID,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT b.*
    FROM Barbero b
    WHERE b.idBarbero = p_idBarbero AND b.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_barbero(
    p_idBarbero UUID, 
    p_nombre VARCHAR, 
    p_apellido VARCHAR, 
    p_idSede UUID, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Barbero 
    SET Nombre = p_nombre, 
        Apellido = p_apellido, 
        idSede = p_idSede, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idBarbero = p_idBarbero;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_barbero(p_idBarbero UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Barbero 
    WHERE idBarbero = p_idBarbero AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_barbero(p_idBarbero UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Barbero 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idBarbero = p_idBarbero AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
