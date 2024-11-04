SELECT 
    json_build_object(
        'idCliente', Cliente.idCliente,
        'Nombre', Cliente.Nombre,
        'Apellido', Cliente.Apellido,
        'FechaNacimiento', Cliente.FechaNacimiento,
        'Correo', Cliente.Correo,
        'TipoDocumento', json_build_object(
            'idTipoDocumento', Tipo_Documento.idTipoDocumento,
            'Descripcion', Tipo_Documento.Descripcion
        ),
        'TipoEstadoCivil', json_build_object(
            'idTipoEstadoCivil', Tipo_EstadoCivil.idTipoEstadoCivil,
            'Descripcion', Tipo_EstadoCivil.Descripcion
        ),
        'TipoGenero', json_build_object(
            'idTipoGenero', Tipo_Genero.idTipoGenero,
            'Descripcion', Tipo_Genero.Descripcion
        )
    ) AS Cliente
FROM 
    Cliente
LEFT JOIN 
    Tipo_Documento ON Cliente.idTipoDocumento = Tipo_Documento.idTipoDocumento
LEFT JOIN 
    Tipo_EstadoCivil ON Cliente.idTipoEstadoCivil = Tipo_EstadoCivil.idTipoEstadoCivil
LEFT JOIN 
    Tipo_Genero ON Cliente.idTipoGenero = Tipo_Genero.idTipoGenero
WHERE 
    Cliente.Activo = '1';
