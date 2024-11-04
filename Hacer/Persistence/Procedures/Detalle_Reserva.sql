-- Procedimientos almacenados para Detalle_Reserva

CREATE OR REPLACE FUNCTION insert_detalle_reserva(
    p_idReserva UUID, 
    p_idEstadoReserva UUID
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Detalle_Reserva (idReserva, idEstadoReserva) VALUES (p_idReserva, p_idEstadoReserva);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_all_detalle_reservas()
RETURNS TABLE(
    idDetalleReserva UUID,
    idReserva UUID,
    idEstadoReserva UUID,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Detalle_Reserva;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_specific_detalle_reserva(p_idDetalleReserva UUID)
RETURNS TABLE(
    idDetalleReserva UUID,
    idReserva UUID,
    idEstadoReserva UUID,
    Activo BIT,
    Actualiza TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY 
    SELECT dr.*
    FROM Detalle_Reserva dr
    WHERE dr.idDetalleReserva = p_idDetalleReserva AND dr.Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_detalle_reserva(
    p_idDetalleReserva UUID, 
    p_idReserva UUID, 
    p_idEstadoReserva UUID, 
    p_activo BIT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Detalle_Reserva 
    SET idReserva = p_idReserva, 
        idEstadoReserva = p_idEstadoReserva, 
        Activo = p_activo, 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idDetalleReserva = p_idDetalleReserva;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_fisico_detalle_reserva(p_idDetalleReserva UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Detalle_Reserva 
    WHERE idDetalleReserva = p_idDetalleReserva AND Activo = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_detalle_reserva(p_idDetalleReserva UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Detalle_Reserva 
    SET Activo = '0', 
        Actualiza = CURRENT_TIMESTAMP 
    WHERE idDetalleReserva = p_idDetalleReserva AND Activo = '1';
END;
$$ LANGUAGE plpgsql;
