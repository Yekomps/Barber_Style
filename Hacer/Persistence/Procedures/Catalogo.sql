-- Procedimientos almacenados para Catalogo

CREATE OR REPLACE FUNCTION insert_catalogo(p_descripcion VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Catalogo (Descripcion) VALUES (p_descripcion);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_catalogos()
RETURNS TABLE(
    idCatalogo UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Catalogo;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_catalogo(p_idCatalogo UUID)
RETURNS TABLE(
    idCatalogo UUID,
    Descripcion VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT c.*
    FROM Catalogo c
    WHERE c.idCatalogo = p_idCatalogo AND c.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_catalogo(
    p_idCatalogo UUID, 
    p_descripcion VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Catalogo 
    SET Descripcion = p_descripcion, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idCatalogo = p_idCatalogo;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_catalogo(p_idCatalogo UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Catalogo 
    WHERE idCatalogo = p_idCatalogo AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_catalogo(p_idCatalogo UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Catalogo 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idCatalogo = p_idCatalogo AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
