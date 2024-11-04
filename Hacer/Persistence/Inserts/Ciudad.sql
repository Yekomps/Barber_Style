-- Inserción de datos en la tabla Ciudad
INSERT INTO Ciudad (idCiudad, idDepartamento, Nombre) VALUES
(uuid_generate_v4(), (SELECT idDepartamento FROM Departamento WHERE Nombre = 'Antioquia'), 'Medellín'),
(uuid_generate_v4(), (SELECT idDepartamento FROM Departamento WHERE Nombre = 'Buenos Aires'), 'La Plata'),
(uuid_generate_v4(), (SELECT idDepartamento FROM Departamento WHERE Nombre = 'Jalisco'), 'Guadalajara');