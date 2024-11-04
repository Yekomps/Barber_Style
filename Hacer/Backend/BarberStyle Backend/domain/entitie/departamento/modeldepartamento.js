
// domain/entitie/departamento/modeldepartamento.js

class ModelDepartamento{
	constructor(
				iddepartamento, 
				idpais, 
				nombre, 
				activo,
				actualiza){
		this.iddepartamento = iddepartamento;					
		this.idpais = idpais;
		this.nombre = nombre;
		this.activo = activo;
		this.actualiza = actualiza;		
	}
}

export default ModelDepartamento;