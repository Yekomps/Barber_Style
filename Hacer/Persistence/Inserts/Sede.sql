-- Inserción de datos en la tabla Sede
INSERT INTO Sede (idSede, idCiudad, Direccion, NIT) VALUES
(uuid_generate_v4(), (SELECT idCiudad FROM Ciudad WHERE Nombre = 'Medellín'), 'Calle 123', '900123456'),
(uuid_generate_v4(), (SELECT idCiudad FROM Ciudad WHERE Nombre = 'La Plata'), 'Avenida 45', '900654321'),
(uuid_generate_v4(), (SELECT idCiudad FROM Ciudad WHERE Nombre = 'Guadalajara'), 'Calle Revolución', '900987654');