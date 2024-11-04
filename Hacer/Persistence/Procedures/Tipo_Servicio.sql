-- Procedimientos almacenados para Tipo_Servicio

CREATE OR REPLACE FUNCTION insert_tipo_servicio(
    p_descripcion VARCHAR, 
    p_valor DECIMAL
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Tipo_Servicio (Descripcion, Valor) VALUES (p_descripcion, p_valor);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_tipo_servicios()
RETURNS TABLE(
    idTipoServicio UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP,
    Valor DECIMAL
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Tipo_Servicio;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_tipo_servicio(p_idTipoServicio UUID)
RETURNS TABLE(
    idTipoServicio UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP,
    Valor DECIMAL
) AS $$
BEGIN
    RETURN QUERY 
    SELECT ts.*
    FROM Tipo_Servicio ts
    WHERE ts.idTipoServicio = p_idTipoServicio AND ts.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_tipo_servicio(
    p_idTipoServicio UUID, 
    p_descripcion VARCHAR, 
    p_valor DECIMAL, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Tipo_Servicio 
    SET Descripcion = p_descripcion, 
        Valor = p_valor, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idTipoServicio = p_idTipoServicio;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_tipo_servicio(p_idTipoServicio UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Tipo_Servicio 
    WHERE idTipoServicio = p_idTipoServicio AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_tipo_servicio(p_idTipoServicio UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Tipo_Servicio 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idTipoServicio = p_idTipoServicio AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
