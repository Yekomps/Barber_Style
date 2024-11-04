-- Procedimientos almacenados para Tipo_EstadoCivil

CREATE OR REPLACE FUNCTION insert_tipo_estado_civil(p_descripcion VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Tipo_EstadoCivil (Descripcion) VALUES (p_descripcion);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_tipo_estado_civiles()
RETURNS TABLE(
    idTipoEstadoCivil UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Tipo_EstadoCivil;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_tipo_estado_civil(p_idTipoEstadoCivil UUID)
RETURNS TABLE(
    idTipoEstadoCivil UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT tec.*
    FROM Tipo_EstadoCivil tec
    WHERE tec.idTipoEstadoCivil = p_idTipoEstadoCivil AND tec.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_tipo_estado_civil(
    p_idTipoEstadoCivil UUID, 
    p_descripcion VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Tipo_EstadoCivil 
    SET Descripcion = p_descripcion, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idTipoEstadoCivil = p_idTipoEstadoCivil;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_tipo_estado_civil(p_idTipoEstadoCivil UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Tipo_EstadoCivil 
    WHERE idTipoEstadoCivil = p_idTipoEstadoCivil AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_tipo_estado_civil(p_idTipoEstadoCivil UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Tipo_EstadoCivil 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idTipoEstadoCivil = p_idTipoEstadoCivil AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
