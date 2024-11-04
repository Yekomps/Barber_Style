
// infrastructurepais.js
import pg from 'pg';
const { Pool } = pg ;
//mport { ModelPais } from '../../../domain/entitie/pais/modelpais.js'; 
import { HOST_POSTGRES,USER_POSTGRES,PASSWORD_POSTGRES,DATA_BASE_POSTGRES,PORT_POSGRES} from '../../../config.js';

const pool = new Pool({
	host: HOST_POSTGRES,
	user: USER_POSTGRES,
	password: PASSWORD_POSTGRES,
	database: DATA_BASE_POSTGRES,
	port: PORT_POSGRES,
});

class InfrastructurePais {
	
	constructor(){	
	}	
	
	async consultarpais(){
		let results = [];
		try {
			results = await pool.query('SELECT * FROM get_all_paises();');
            console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}	

	async consultarpaisid(id){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultarpaisid($1)', [id]);
			console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}

	async consultarpaisnombrepais(nombrepais){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultarpaisnombre($1)', [nombrepais]);
			console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}
		
	
	async ingresarpais(cuerpo){
		let results = [];
		return results;	
	}	
	
	async modificarpais(parametro, cuerpo){
		let results = []
		return results;	
	}

	async eliminarpais(parametro){	
		let results = [];	
		return results;			
	}	
}

export default InfrastructurePais ;

