-- Procedimientos almacenados para Cliente

CREATE OR REPLACE FUNCTION insert_cliente(
    p_nombre VARCHAR, 
    p_apellido VARCHAR, 
    p_fechaNacimiento DATE, 
    p_correo VARCHAR, 
    p_idTipoDocumento UUID, 
    p_idTipoEstadoCivil UUID, 
    p_idTipoGenero UUID
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Cliente (
        Nombre, 
        Apellido, 
        FechaNacimiento, 
        Correo, 
        idTipoDocumento, 
        idTipoEstadoCivil, 
        idTipoGenero
    ) VALUES (
        p_nombre, 
        p_apellido, 
        p_fechaNacimiento, 
        p_correo, 
        p_idTipoDocumento, 
        p_idTipoEstadoCivil, 
        p_idTipoGenero
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_clientes()
RETURNS TABLE(
    idCliente UUID,
    Nombre VARCHAR,
    Apellido VARCHAR,
    FechaNacimiento DATE,
    Activo BIT,
    Actualiza TIMESTAMP,
    Correo VARCHAR,
    idTipoDocumento UUID,
    idTipoEstadoCivil UUID,
    idTipoGenero UUID
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Cliente;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_cliente(p_idCliente UUID)
RETURNS TABLE(
    idCliente UUID,
    Nombre VARCHAR,
    Apellido VARCHAR,
    FechaNacimiento DATE,
    Activo BIT,
    Actualiza TIMESTAMP,
    Correo VARCHAR,
    idTipoDocumento UUID,
    idTipoEstadoCivil UUID,
    idTipoGenero UUID
) AS $$
BEGIN
    RETURN QUERY 
    SELECT c.*
    FROM Cliente c
    WHERE c.idCliente = p_idCliente AND c.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_cliente(
    p_idCliente UUID, 
    p_nombre VARCHAR, 
    p_apellido VARCHAR, 
    p_fechaNacimiento DATE, 
    p_correo VARCHAR, 
    p_idTipoDocumento UUID, 
    p_idTipoEstadoCivil UUID, 
    p_idTipoGenero UUID, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Cliente 
    SET Nombre = p_nombre, 
        Apellido = p_apellido, 
        FechaNacimiento = p_fechaNacimiento, 
        Correo = p_correo, 
        idTipoDocumento = p_idTipoDocumento, 
        idTipoEstadoCivil = p_idTipoEstadoCivil, 
        idTipoGenero = p_idTipoGenero, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idCliente = p_idCliente;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_cliente(p_idCliente UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Cliente 
    WHERE idCliente = p_idCliente AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_cliente(p_idCliente UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Cliente 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idCliente = p_idCliente AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
