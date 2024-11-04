-- Inserción de datos en la tabla Catalogo_TipoServicio
INSERT INTO Catalogo_TipoServicio (idCatalogo, idTipoServicio) VALUES
((SELECT idCatalogo FROM Catalogo WHERE Descripcion = 'Corte de Cabello'), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Corte Hombre')),
((SELECT idCatalogo FROM Catalogo WHERE Descripcion = 'Afeitado'), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Afeitado')),
((SELECT idCatalogo FROM Catalogo WHERE Descripcion = 'Corte de Cabello'), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Corte Mujer'));
