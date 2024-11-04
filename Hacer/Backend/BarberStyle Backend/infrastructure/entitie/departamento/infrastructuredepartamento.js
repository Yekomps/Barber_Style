
// infrastructuredepartamento.js
import pg from 'pg';
const { Pool } = pg ;
//import { ModelDepartamento } from '../../../domain/entitie/departamento/modeldepartamento.js'; 
import {HOST_POSTGRES,USER_POSTGRES,PASSWORD_POSTGRES,DATA_BASE_POSTGRES,PORT_POSGRES} from '../../../config.js'

const pool = new Pool({
	host: HOST_POSTGRES,
	user: USER_POSTGRES,
	password: PASSWORD_POSTGRES,
	database: DATA_BASE_POSTGRES,
	port: PORT_POSGRES,  
});

class InfrastructureDepartamento {
	
	constructor(){	
	}	
	
	async consultardepartamento(){
		let results = [];
		try {
			results = await pool.query('SELECT * FROM functionconsultardepartamento();');
            console.log('Departamentoes encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}	

	async consultardepartamentoid(id){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultardepartamentoid($1)', [id]);
			console.log('Departamentoes encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}

	async consultardepartamentonombredepartamento(nombredepartamento){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultardepartamentonombre($1)', [nombredepartamento]);
			console.log('Departamentoes encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}
		
	
	async ingresardepartamento(cuerpo){
		let results = [];
		return results;	
	}	
	
	async modificardepartamento(parametro, cuerpo){
		let results = []
		return results;	
	}

	async eliminardepartamento(parametro){	
		let results = [];	
		return results;			
	}	
}

export default InfrastructureDepartamento;

