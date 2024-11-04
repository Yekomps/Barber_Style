// infrastructureservicio.js
import { MongoClient } from 'mongodb';
import { COLLECTION, DBNAME, MONGO_URI } from '../../../config.js';

import modelServicioObject from '../../../domain/object/servicio/modelServicio.js';
const { ModelServicio, modelServicio } = modelServicioObject;

// Collections: Cliente, Geografia, Producto, Transaccion, Organizacion
const uri = MONGO_URI;
const dbName = DBNAME;
const collectionName = COLLECTION;

class InfrastructureServicio {
	
	constructor(){}	
	
	async getServicio(){
		const client = new MongoClient(uri);
		const db = client.db(dbName);
		const collection = db.collection(collectionName);

		let query = {};
		try{
			const result = await collection.find(query).toArray();
			return result
		}catch(error){
			console.error(error);
		}finally{
			 await client.close();
		}
	}	

	async getServicioSpecificbyid(idcat){
		const client = new MongoClient(uri);
		const db = client.db(dbName);
		const collection = db.collection(collectionName);

		let query = {idcatalogo: idcat };
		try{
			const result = await collection.findOne(query);
			return result
		}catch(error){
			console.error(error);
		}finally{
			await client.close();
		}

	}

	async getServicioSpecificbyname(name){
		const client = new MongoClient(uri);
		const db = client.db(dbName);
		const collection = db.collection(collectionName);

		let query = {DescripcionTipoServicio: name };
		try{
			const result = await collection.findOne(query);
			return result
		}catch(error){
			console.error(error);
		}finally{
			await client.close();
		}

	}
}

export default { InfrastructureServicio};