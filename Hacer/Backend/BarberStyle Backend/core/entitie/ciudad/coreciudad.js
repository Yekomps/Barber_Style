
// coreciudad.js

//import { ModelCiudad, modelciudad } from '../../../domain/entitie/ciudad/modelciudad.js'; 
import InfrastructureCiudad from '../../../infrastructure/entitie/ciudad/infrastructureciudad.js'; 

class CoreCiudad {
	
	constructor(){	
	}

	async consultarciudad(){
		const infrastructureciudad= new InfrastructureCiudad();	
		try {
            return await infrastructureciudad.consultarciudad();			
		} catch (err) {
			console.error(err.message);
		}
	}
	
	async consultarciudadid(id){
		const infrastructureciudad= new InfrastructureCiudad();	
		try {
            return await infrastructureciudad.consultarciudadid(id);			
		} catch (err) {
			console.error(err.message);
		}
	}		

	async consultarciudadnombreciudad(nombreciudad){
		const infrastructureciudad= new InfrastructureCiudad();	
		try {
            return await infrastructureciudad.consultarciudadnombreciudad(nombreciudad);			
		} catch (err) {
			console.error(err.message);
		}
	}		
	
	async ingresarciudad(cuerpo){
		const infrastructureciudad= new InfrastructureCiudad();	
		try {
            return await infrastructureciudad.ingresarciudad(cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async modificarciudad(parametro, cuerpo){
		const infrastructureciudad= new InfrastructureCiudad();	
		try {
            return await infrastructureciudad.modificarciudad(parametro, cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async eliminarciudad(parametro){
		const infrastructureciudad= new InfrastructureCiudad();	
		try {
            return await infrastructureciudad.eliminarciudad(parametro);			
		} catch (err) {
			console.error(err.message);
		}
	}		
}

export default CoreCiudad;
