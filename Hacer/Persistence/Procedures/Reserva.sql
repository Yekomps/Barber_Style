-- Procedimientos almacenados para Reserva

CREATE OR REPLACE FUNCTION insert_reserva(
    p_idServicio UUID, 
    p_fecha TIMESTAMP, 
    p_idCliente UUID, 
    p_idSede UUID, 
    p_idEmpleado UUID
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Reserva (
        idServicio, 
        Fecha, 
        idCliente, 
        idSede, 
        idEmpleado
    ) VALUES (
        p_idServicio, 
        p_fecha, 
        p_idCliente, 
        p_idSede, 
        p_idEmpleado
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_reservas()
RETURNS TABLE(
    idReserva UUID,
    idServicio UUID,
    Fecha TIMESTAMP,
    idCliente UUID,
    idSede UUID,
    idEmpleado UUID,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Reserva;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_reserva(p_idReserva UUID)
RETURNS TABLE(
    idReserva UUID,
    idServicio UUID,
    Fecha TIMESTAMP,
    idCliente UUID,
    idSede UUID,
    idEmpleado UUID,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT r.*
    FROM Reserva r
    WHERE r.idReserva = p_idReserva AND r.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_reserva(
    p_idReserva UUID, 
    p_idServicio UUID, 
    p_fecha TIMESTAMP, 
    p_idCliente UUID, 
    p_idSede UUID, 
    p_idEmpleado UUID, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Reserva 
    SET idServicio = p_idServicio, 
        Fecha = p_fecha, 
        idCliente = p_idCliente, 
        idSede = p_idSede, 
        idEmpleado = p_idEmpleado, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idReserva = p_idReserva;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_reserva(p_idReserva UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Reserva 
    WHERE idReserva = p_idReserva AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_reserva(p_idReserva UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Reserva 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idReserva = p_idReserva AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
