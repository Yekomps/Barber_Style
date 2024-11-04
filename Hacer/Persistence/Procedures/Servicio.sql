-- Procedimientos almacenados para Servicio

CREATE OR REPLACE FUNCTION insert_servicio(
    p_idTipoServicio UUID, 
    p_idBarbero UUID, 
    p_estadoServicio VARCHAR
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Servicio (idTipoServicio, idBarbero, EstadoServicio) 
    VALUES (p_idTipoServicio, p_idBarbero, p_estadoServicio);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_servicios()
RETURNS TABLE(
    idServicio UUID,
    idTipoServicio UUID,
    idBarbero UUID,
    EstadoServicio VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Servicio;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_servicio(p_idServicio UUID)
RETURNS TABLE(
    idServicio UUID,
    idTipoServicio UUID,
    idBarbero UUID,
    EstadoServicio VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT s.*
    FROM Servicio s
    WHERE s.idServicio = p_idServicio AND s.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_servicio(
    p_idServicio UUID, 
    p_idTipoServicio UUID, 
    p_idBarbero UUID, 
    p_estadoServicio VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Servicio 
    SET idTipoServicio = p_idTipoServicio, 
        idBarbero = p_idBarbero, 
        EstadoServicio = p_estadoServicio, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idServicio = p_idServicio;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_servicio(p_idServicio UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Servicio 
    WHERE idServicio = p_idServicio AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_servicio(p_idServicio UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Servicio 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idServicio = p_idServicio AND Activo = '1';
END;
$$ LANGUAGE plpgsql;