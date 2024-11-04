// coreservicio.js
 
import modelServicioObject from '../../../domain/object/servicio/modelServicio.js';
const { ModelServicio, modelservicio } = modelServicioObject;

import InfraestructureServicioObject from '../../../infrastructure/object/servicio/infrastrutureServicio.js';
const InfrastructureServicio = InfraestructureServicioObject.InfrastructureServicio;


class CoreServicio {
	constructor(){}

	async getServicio(){
		const infrastructureServicio = new InfrastructureServicio();	
		try {
            return infrastructureServicio.getServicio();			
		} catch (e) {
			console.error(e);
		}
	}	

	async getServicioSpecificbyid(idcat){
		const infrastructureServicio = new InfrastructureServicio();
		try{
			return infrastructureServicio.getServicioSpecificbyid(idcat);
		}catch(error){
			console.error(error);
		}
	}

	async getServicioSpecificbyname(name){
		const infrastructureServicio = new InfrastructureServicio();
		try{
			return infrastructureServicio.getServicioSpecificbyname(name);
		}catch(error){
			console.error(error);
		}
	}
}

export default CoreServicio;