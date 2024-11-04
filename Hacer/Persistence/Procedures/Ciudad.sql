-- Procedimientos almacenados para Ciudad

CREATE OR REPLACE FUNCTION insert_ciudad(p_idDepartamento UUID, p_nombre VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Ciudad (idDepartamento, Nombre) VALUES (p_idDepartamento, p_nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_ciudades()
RETURNS TABLE(
    idCiudad UUID,
    idDepartamento UUID,
    Nombre VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Ciudad;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_ciudad(p_idCiudad UUID)
RETURNS TABLE(
    idCiudad UUID,
    idDepartamento UUID,
    Nombre VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT c.*
    FROM Ciudad c
    WHERE c.idCiudad = p_idCiudad AND c.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_ciudad(
    p_idCiudad UUID, 
    p_idDepartamento UUID, 
    p_nombre VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Ciudad 
    SET idDepartamento = p_idDepartamento, 
        Nombre = p_nombre, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idCiudad = p_idCiudad;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_ciudad(p_idCiudad UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Ciudad 
    WHERE idCiudad = p_idCiudad AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_ciudad(p_idCiudad UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Ciudad 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idCiudad = p_idCiudad AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
