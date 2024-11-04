const modelservicio= [];

class ModelServicio{
    constructor(idcatalogo,
                descripcioncatalog,
                idsede,
                idtiposervicio,
                descripciontiposervicio,
                valor,
                idservicio,
                estadoservicio
    ){
        this.idcatalogo=idcatalogo;
        this.descripcioncatalog=descripcioncatalog;
        this.idsede=idsede;
        this.idtiposervicio=idtiposervicio;
        this.descripciontiposervicio=descripciontiposervicio;
        this.valor=valor;
        this.idservicio=idservicio;
        this.estadoservicio=estadoservicio;
    }
}

export default {ModelServicio, modelservicio};
