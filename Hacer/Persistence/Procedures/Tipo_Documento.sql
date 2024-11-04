-- Procedimientos almacenados para Tipo_Documento

CREATE OR REPLACE FUNCTION insert_tipo_documento(p_descripcion VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Tipo_Documento (Descripcion) VALUES (p_descripcion);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_tipo_documentos()
RETURNS TABLE(
    idTipoDocumento UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Tipo_Documento;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_tipo_documento(p_idTipoDocumento UUID)
RETURNS TABLE(
    idTipoDocumento UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT td.*
    FROM Tipo_Documento td
    WHERE td.idTipoDocumento = p_idTipoDocumento AND td.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_tipo_documento(
    p_idTipoDocumento UUID, 
    p_descripcion VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Tipo_Documento 
    SET Descripcion = p_descripcion, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idTipoDocumento = p_idTipoDocumento;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_tipo_documento(p_idTipoDocumento UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Tipo_Documento 
    WHERE idTipoDocumento = p_idTipoDocumento AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_tipo_documento(p_idTipoDocumento UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Tipo_Documento 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idTipoDocumento = p_idTipoDocumento AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
