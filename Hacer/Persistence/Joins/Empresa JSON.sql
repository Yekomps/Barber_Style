SELECT 
    json_build_object(
        'idSede', Sede.idSede,
        'Direccion', Sede.Direccion,
        'NIT', Sede.NIT,
        'Barberos', json_agg(
            json_build_object(
                'idBarbero', Barbero.idBarbero,
                'Nombre', Barbero.Nombre,
                'Apellido', Barbero.Apellido
            )
        )
    ) AS Sede
FROM 
    Sede
JOIN 
    Barbero ON Sede.idSede = Barbero.idSede
WHERE 
    Sede.Activo = '1' AND Barbero.Activo = '1'
GROUP BY 
    Sede.idSede, Sede.Direccion, Sede.NIT;
