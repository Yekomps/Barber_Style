-- Procedimientos almacenados para Tipo_Genero

CREATE OR REPLACE FUNCTION insert_tipo_genero(p_descripcion VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Tipo_Genero (Descripcion) VALUES (p_descripcion);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_tipo_generos()
RETURNS TABLE(
    idTipoGenero UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Tipo_Genero;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_tipo_genero(p_idTipoGenero UUID)
RETURNS TABLE(
    idTipoGenero UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT tg.*
    FROM Tipo_Genero tg
    WHERE tg.idTipoGenero = p_idTipoGenero AND tg.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_tipo_genero(
    p_idTipoGenero UUID, 
    p_descripcion VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Tipo_Genero 
    SET Descripcion = p_descripcion, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idTipoGenero = p_idTipoGenero;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_tipo_genero(p_idTipoGenero UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Tipo_Genero 
    WHERE idTipoGenero = p_idTipoGenero AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_tipo_genero(p_idTipoGenero UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Tipo_Genero 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idTipoGenero = p_idTipoGenero AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
