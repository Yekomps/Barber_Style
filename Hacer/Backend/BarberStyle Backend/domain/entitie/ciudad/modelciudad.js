
// domain/entitie/ciudad/modelciudad.js
const modelciudad = [];

class ModelCiudad{
	constructor(
				idciudad, 
				iddepartamento, 
				nombre, 
				activo,
				actualiza){
		this.idciudad = idciudad;					
		this.iddepartamento = iddepartamento;
		this.nombre = nombre;
		this.activo = activo;
		this.actualiza = actualiza;		
	}
}

export default {modelciudad , ModelCiudad };