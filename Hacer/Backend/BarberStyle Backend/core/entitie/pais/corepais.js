
// corepais.js

//import { ModelPais, modelpais } from '../../../domain/entitie/pais/modelpais.js'; 
import  InfrastructurePais  from '../../../infrastructure/entitie/pais/infrastructurepais.js'; 

class CorePais {
	
	constructor(){	
	}

	async consultarpais(){
		const infrastructurepais= new InfrastructurePais();	
		try {
            return await infrastructurepais.consultarpais();			
		} catch (err) {
			console.error(err.message);
		}
	}
	
	async consultarpaisid(id){
		const infrastructurepais= new InfrastructurePais();	
		try {
            return await infrastructurepais.consultarpaisid(id);			
		} catch (err) {
			console.error(err.message);
		}
	}		

	async consultarpaisnombrepais(nombrepais){
		const infrastructurepais= new InfrastructurePais();	
		try {
            return await infrastructurepais.consultarpaisnombrepais(nombrepais);			
		} catch (err) {
			console.error(err.message);
		}
	}		
	
	async ingresarpais(cuerpo){
		const infrastructurepais= new InfrastructurePais();	
		try {
            return await infrastructurepais.ingresarpais(cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async modificarpais(parametro, cuerpo){
		const infrastructurepais= new InfrastructurePais();	
		try {
            return await infrastructurepais.modificarpais(parametro, cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async eliminarpais(parametro){
		const infrastructurepais= new InfrastructurePais();	
		try {
            return await infrastructurepais.eliminarpais(parametro);			
		} catch (err) {
			console.error(err.message);
		}
	}		
}

export default CorePais ;
