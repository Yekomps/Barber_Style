CREATE OR REPLACE FUNCTION insert_pais(nombre VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Pais (Nombre) VALUES (nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_paises()
RETURNS TABLE(idPais UUID, nombre VARCHAR, activo BIT, actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Pais;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_paises(P_IdPais UUID)
RETURNS TABLE(idPais UUID, nombre VARCHAR, activo BIT, actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY 
    SELECT p."idpais", p."nombre", p."activo", p."actualiza"
    FROM "pais" p
    WHERE p."idpais" = P_IdPais AND p."activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Update_pais(id UUID, nombre VARCHAR, activo BIT)
RETURNS VOID AS $$
BEGIN
    UPDATE Pais SET Nombre = nombre, Activo = activo, Actualiza = CURRENT_TIMESTAMP WHERE idPais = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Delete_Fisico_pais(id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Pais WHERE idPais = id and activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "Delete_Pais"(P_IdPais UUID)
RETURNS VOID
AS $$
BEGIN
	UPDATE "pais" 
    SET "activo" = '0', "actualiza" = CURRENT_TIMESTAMP
	WHERE "pais"."idpais" = P_IdPais AND "pais"."activo" = '1';
END;
$$ LANGUAGE plpgsql;