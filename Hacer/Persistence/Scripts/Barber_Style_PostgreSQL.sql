-- Creación de la tabla Pais
CREATE TABLE Pais (
    idPais UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Nombre VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Departamento
CREATE TABLE Departamento (
    idDepartamento UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    idPais UUID REFERENCES Pais(idPais),
    Nombre VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Ciudad
CREATE TABLE Ciudad (
    idCiudad UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    idDepartamento UUID REFERENCES Departamento(idDepartamento),
    Nombre VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creación de la tabla Sede
CREATE TABLE Sede (
    idSede UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    idCiudad UUID REFERENCES Ciudad(idCiudad),
    Direccion VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    NIT VARCHAR(125)
);

-- Creación de la tabla Barbero
CREATE TABLE Barbero (
    idBarbero UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	Nombre varchar(250) NOT NULL,
	Apellido varchar(250) NOT NULL,
    idSede UUID REFERENCES Sede(idSede),
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Catalogo
CREATE TABLE Catalogo (
    idCatalogo UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Descripcion VARCHAR(255),
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Tipo_Servicio
CREATE TABLE Tipo_Servicio (
    idTipoServicio UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Descripcion VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Valor DECIMAL NOT NULL
);

-- Creación de la tabla Catalogo_TipoServicio
CREATE TABLE Catalogo_TipoServicio (
    idCatalogo UUID REFERENCES Catalogo(idCatalogo),
    idTipoServicio UUID REFERENCES Tipo_Servicio(idTipoServicio),
    PRIMARY KEY (idCatalogo, idTipoServicio),
	Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Servicio
CREATE TABLE Servicio (
    idServicio UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    idTipoServicio UUID REFERENCES Tipo_Servicio(idTipoServicio),
    idBarbero UUID REFERENCES Barbero(idBarbero),
    EstadoServicio VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Tipo_Documento
CREATE TABLE Tipo_Documento (
    idTipoDocumento UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Descripcion VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Tipo_EstadoCivil
CREATE TABLE Tipo_EstadoCivil (
    idTipoEstadoCivil UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Descripcion VARCHAR(255),
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creación de la tabla Tipo_Genero
CREATE TABLE Tipo_Genero (
    idTipoGenero UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Descripcion VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    idCliente UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Correo VARCHAR(255) NOT NULL,
    idTipoDocumento UUID REFERENCES Tipo_Documento(idTipoDocumento),
    idTipoEstadoCivil UUID REFERENCES Tipo_EstadoCivil(idTipoEstadoCivil),
    idTipoGenero UUID REFERENCES Tipo_Genero(idTipoGenero)
);

-- Creación de la tabla Reserva
CREATE TABLE Reserva (
    idReserva UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    idServicio UUID REFERENCES Servicio(idServicio),
    Fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idCliente UUID REFERENCES Cliente(idCliente),
    idSede UUID REFERENCES Sede(idSede),
    idEmpleado UUID REFERENCES Barbero(idBarbero),
	Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla EstadoReserva
CREATE TABLE EstadoReserva (
    idEstadoReserva UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Estado VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creación de la tabla Detalle_Reserva
CREATE TABLE Detalle_Reserva (
    idDetalleReserva UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    idReserva UUID REFERENCES Reserva(idReserva),
	idEstadoReserva UUID REFERENCES EstadoReserva (idEstadoReserva),
    Activo BIT NOT NULL DEFAULT '1',
    Actualiza TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);