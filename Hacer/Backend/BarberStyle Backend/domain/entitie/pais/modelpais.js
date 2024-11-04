
// domain/entitie/pais/modelpais.js

class ModelPais{
	constructor(
				idpais, 
				nombre, 
				activo,
				actualiza){
		this.idpais = idpais;
		this.nombre = nombre;
		this.activo = activo;
		this.actualiza = actualiza;		
	}
}

export default ModelPais;