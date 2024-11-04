-- Inserción de datos en la tabla Departamento
INSERT INTO Departamento (idDepartamento, idPais, Nombre) VALUES
(uuid_generate_v4(), (SELECT idPais FROM Pais WHERE Nombre = 'Colombia'), 'Antioquia'),
(uuid_generate_v4(), (SELECT idPais FROM Pais WHERE Nombre = 'Argentina'), 'Buenos Aires'),
(uuid_generate_v4(), (SELECT idPais FROM Pais WHERE Nombre = 'México'), 'Jalisco');