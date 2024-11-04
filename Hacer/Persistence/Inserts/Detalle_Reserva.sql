-- Inserción de datos en la tabla Detalle_Reserva
INSERT INTO Detalle_Reserva (idDetalleReserva, idReserva, idEstadoReserva) VALUES
(uuid_generate_v4(), (SELECT idReserva FROM Reserva WHERE idCliente = (SELECT idCliente FROM Cliente WHERE Nombre = 'Pedro')), (SELECT idEstadoReserva FROM EstadoReserva WHERE Estado = 'Pendiente')),
(uuid_generate_v4(), (SELECT idReserva FROM Reserva WHERE idCliente = (SELECT idCliente FROM Cliente WHERE Nombre = 'Ana')), (SELECT idEstadoReserva FROM EstadoReserva WHERE Estado = 'Completado')),
(uuid_generate_v4(), (SELECT idReserva FROM Reserva WHERE idCliente = (SELECT idCliente FROM Cliente WHERE Nombre = 'Jorge')), (SELECT idEstadoReserva FROM EstadoReserva WHERE Estado = 'Pendiente'));
