-- Inserción de datos en la tabla Tipo_Documento
INSERT INTO Tipo_Documento (idTipoDocumento, Descripcion) VALUES
(uuid_generate_v4(), 'Cédula'),
(uuid_generate_v4(), 'Pasaporte'),
(uuid_generate_v4(), 'Licencia de Conducir');