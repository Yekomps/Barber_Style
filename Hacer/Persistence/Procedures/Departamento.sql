-- Procedimientos almacenados para Departamento

CREATE OR REPLACE FUNCTION insert_departamento(p_idPais UUID, p_nombre VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Departamento (idPais, Nombre) VALUES (p_idPais, p_nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_departamentos()
RETURNS TABLE(
    idDepartamento UUID,
    idPais UUID,
    Nombre VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Departamento;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_departamento(p_idDepartamento UUID)
RETURNS TABLE(
    idDepartamento UUID,
    idPais UUID,
    Nombre VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT d.*
    FROM Departamento d
    WHERE d.idDepartamento = p_idDepartamento AND d.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_departamento(
    p_idDepartamento UUID, 
    p_idPais UUID, 
    p_nombre VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Departamento 
    SET idPais = p_idPais, 
        Nombre = p_nombre, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idDepartamento = p_idDepartamento;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_departamento(p_idDepartamento UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Departamento 
    WHERE idDepartamento = p_idDepartamento AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_departamento(p_idDepartamento UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Departamento 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idDepartamento = p_idDepartamento AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
