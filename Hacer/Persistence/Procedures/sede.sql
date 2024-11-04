-- Procedimientos almacenados para Sede

CREATE OR REPLACE FUNCTION insert_sede(
    p_idCiudad UUID, 
    p_direccion VARCHAR, 
    p_nit VARCHAR
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Sede (idCiudad, Direccion, NIT) VALUES (p_idCiudad, p_direccion, p_nit);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_sedes()
RETURNS TABLE(
    idSede UUID,
    idCiudad UUID,
    Direccion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP,
    NIT VARCHAR
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Sede;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_sede(p_idSede UUID)
RETURNS TABLE(
    idSede UUID,
    idCiudad UUID,
    Direccion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP,
    NIT VARCHAR
) AS $$
BEGIN
    RETURN QUERY 
    SELECT s.*
    FROM Sede s
    WHERE s.idSede = p_idSede AND s.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_sede(
    p_idSede UUID, 
    p_idCiudad UUID, 
    p_direccion VARCHAR, 
    p_nit VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Sede 
    SET idCiudad = p_idCiudad, 
        Direccion = p_direccion, 
        NIT = p_nit, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idSede = p_idSede;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_sede(p_idSede UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Sede 
    WHERE idSede = p_idSede AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_sede(p_idSede UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Sede 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idSede = p_idSede AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
