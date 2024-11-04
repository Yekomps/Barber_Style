-- Inserción de datos en la tabla Tipo_Servicio
INSERT INTO Tipo_Servicio (idTipoServicio, Descripcion, Valor) VALUES
(uuid_generate_v4(), 'Corte Hombre', 10000),
(uuid_generate_v4(), 'Corte Mujer', 20000),
(uuid_generate_v4(), 'Afeitado', 5000);
