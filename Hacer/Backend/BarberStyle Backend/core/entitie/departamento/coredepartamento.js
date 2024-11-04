
// coredepartamento.js

//import { ModelDepartamento, modeldepartamento } from '../../../domain/entitie/departamento/modeldepartamento.js'; 
import InfrastructureDepartamento  from '../../../infrastructure/entitie/departamento/infrastructuredepartamento.js'; 

class CoreDepartamento {
	
	constructor(){	
	}

	async consultardepartamento(){
		const infrastructuredepartamento= new InfrastructureDepartamento();	
		try {
            return await infrastructuredepartamento.consultardepartamento();			
		} catch (err) {
			console.error(err.message);
		}
	}
	
	async consultardepartamentoid(id){
		const infrastructuredepartamento= new InfrastructureDepartamento();	
		try {
            return await infrastructuredepartamento.consultardepartamentoid(id);			
		} catch (err) {
			console.error(err.message);
		}
	}		

	async consultardepartamentonombredepartamento(nombredepartamento){
		const infrastructuredepartamento= new InfrastructureDepartamento();	
		try {
            return await infrastructuredepartamento.consultardepartamentonombredepartamento(nombredepartamento);			
		} catch (err) {
			console.error(err.message);
		}
	}		
	
	async ingresardepartamento(cuerpo){
		const infrastructuredepartamento= new InfrastructureDepartamento();	
		try {
            return await infrastructuredepartamento.ingresardepartamento(cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async modificardepartamento(parametro, cuerpo){
		const infrastructuredepartamento= new InfrastructureDepartamento();	
		try {
            return await infrastructuredepartamento.modificardepartamento(parametro, cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async eliminardepartamento(parametro){
		const infrastructuredepartamento= new InfrastructureDepartamento();	
		try {
            return await infrastructuredepartamento.eliminardepartamento(parametro);			
		} catch (err) {
			console.error(err.message);
		}
	}		
}

export default CoreDepartamento ;
