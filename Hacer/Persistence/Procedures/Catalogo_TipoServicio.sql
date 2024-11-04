-- Procedimientos almacenados para Catalogo_TipoServicio

CREATE OR REPLACE FUNCTION insert_catalogo_tipo_servicio(
    p_idCatalogo UUID, 
    p_idTipoServicio UUID
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Catalogo_TipoServicio (idCatalogo, idTipoServicio) VALUES (p_idCatalogo, p_idTipoServicio);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_catalogo_tipo_servicios()
RETURNS TABLE(
    idCatalogo UUID,
    idTipoServicio UUID,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Catalogo_TipoServicio;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_catalogo_tipo_servicio(
    p_idCatalogo UUID, 
    p_idTipoServicio UUID
)
RETURNS TABLE(
    idCatalogo UUID,
    idTipoServicio UUID,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT cts.*
    FROM Catalogo_TipoServicio cts
    WHERE cts.idCatalogo = p_idCatalogo 
      AND cts.idTipoServicio = p_idTipoServicio 
      AND cts.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_catalogo_tipo_servicio(
    p_idCatalogo UUID, 
    p_idTipoServicio UUID, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Catalogo_TipoServicio 
    SET Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idCatalogo = p_idCatalogo 
      AND idTipoServicio = p_idTipoServicio;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_catalogo_tipo_servicio(
    p_idCatalogo UUID, 
    p_idTipoServicio UUID
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Catalogo_TipoServicio 
    WHERE idCatalogo = p_idCatalogo 
      AND idTipoServicio = p_idTipoServicio 
      AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_catalogo_tipo_servicio(
    p_idCatalogo UUID, 
    p_idTipoServicio UUID
)
RETURNS VOID AS $$
BEGIN
    UPDATE Catalogo_TipoServicio 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idCatalogo = p_idCatalogo 
      AND idTipoServicio = p_idTipoServicio 
      AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
