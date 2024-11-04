-- Procedimientos almacenados para EstadoReserva

CREATE OR REPLACE FUNCTION insert_estado_reserva(p_estado VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO EstadoReserva (Estado) VALUES (p_estado);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_estado_reservas()
RETURNS TABLE(
    idEstadoReserva UUID,
    Estado VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoReserva;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_estado_reserva(p_idEstadoReserva UUID)
RETURNS TABLE(
    idEstadoReserva UUID,
    Estado VARCHAR,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT er.*
    FROM EstadoReserva er
    WHERE er.idEstadoReserva = p_idEstadoReserva AND er.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_estado_reserva(
    p_idEstadoReserva UUID, 
    p_estado VARCHAR, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE EstadoReserva 
    SET Estado = p_estado, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idEstadoReserva = p_idEstadoReserva;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_estado_reserva(p_idEstadoReserva UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM EstadoReserva 
    WHERE idEstadoReserva = p_idEstadoReserva AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_estado_reserva(p_idEstadoReserva UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE EstadoReserva 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idEstadoReserva = p_idEstadoReserva AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
