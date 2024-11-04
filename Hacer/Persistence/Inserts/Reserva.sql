-- Inserción de datos en la tabla Reserva
INSERT INTO Reserva (idReserva, idServicio, Fecha, idCliente, idSede, idEmpleado) VALUES
(uuid_generate_v4(), (SELECT idServicio FROM Servicio WHERE EstadoServicio = 'En Proceso'), '2023-10-01 10:00:00', (SELECT idCliente FROM Cliente WHERE Nombre = 'Pedro'), (SELECT idSede FROM Sede WHERE Direccion = 'Calle 123'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Juan')),
(uuid_generate_v4(), (SELECT idServicio FROM Servicio WHERE EstadoServicio = 'Completado'), '2023-10-02 11:00:00', (SELECT idCliente FROM Cliente WHERE Nombre = 'Ana'), (SELECT idSede FROM Sede WHERE Direccion = 'Avenida 45'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Carlos')),
(uuid_generate_v4(), (SELECT idServicio FROM Servicio WHERE EstadoServicio = 'Pendiente'), '2023-10-03 12:00:00', (SELECT idCliente FROM Cliente WHERE Nombre = 'Jorge'), (SELECT idSede FROM Sede WHERE Direccion = 'Calle Revolución'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Luis'));

