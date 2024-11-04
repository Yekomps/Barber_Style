SELECT 
    Sede.idSede,
    Sede.Direccion,
    Sede.NIT,
    Barbero.idBarbero,
    Barbero.Nombre AS BarberoNombre,
    Barbero.Apellido AS BarberoApellido
FROM 
    Sede
JOIN 
    Barbero ON Sede.idSede = Barbero.idSede;
