-- Inserción de datos en la tabla Barbero
INSERT INTO Barbero (idBarbero, Nombre, Apellido, idSede) VALUES
(uuid_generate_v4(), 'Juan', 'Pérez', (SELECT idSede FROM Sede WHERE Direccion = 'Calle 123')),
(uuid_generate_v4(), 'Carlos', 'Martínez', (SELECT idSede FROM Sede WHERE Direccion = 'Avenida 45')),
(uuid_generate_v4(), 'Luis', 'González', (SELECT idSede FROM Sede WHERE Direccion = 'Calle Revolución'));
