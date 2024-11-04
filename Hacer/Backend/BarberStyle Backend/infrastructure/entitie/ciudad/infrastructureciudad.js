
// infrastructureciudad.js
import pg from 'pg';
const { Pool } = pg ;
//import { ModelCiudad } from '../../../domain/entitie/ciudad/modelciudad.js'; 
import { HOST_POSTGRES,USER_POSTGRES,PASSWORD_POSTGRES,DATA_BASE_POSTGRES,PORT_POSGRES} from '../../../config.js';
 
const pool = new Pool({
  host: HOST_POSTGRES,
  user: USER_POSTGRES,
  password: PASSWORD_POSTGRES,
  database: DATA_BASE_POSTGRES,
  port: PORT_POSGRES,  
});

class InfrastructureCiudad{
	
	constructor(){	
	}	
	
	async consultarciudad(){
		let results = [];
		try {
			results = await pool.query('SELECT * FROM functionconsultarciudad();');
            console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}	

	async consultarciudadid(id){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultarciudadid($1)', [id]);
			console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}

	async consultarciudadnombreciudad(nombreciudad){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultarciudadnombre($1)', [nombreciudad]);
			console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}
		
	
	async ingresarciudad(cuerpo){
		let results = [];
		return results;	
	}	
	
	async modificarciudad(parametro, cuerpo){
		let results = []
		return results;	
	}

	async eliminarciudad(parametro){	
		let results = [];	
		return results;			
	}	
}

export default InfrastructureCiudad;

