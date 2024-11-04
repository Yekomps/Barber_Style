-- Inserción de datos en la tabla EstadoReserva
INSERT INTO EstadoReserva (idEstadoReserva, Estado) VALUES
(uuid_generate_v4(), 'Pendiente'),
(uuid_generate_v4(), 'Completado'),
(uuid_generate_v4(), 'Cancelado');