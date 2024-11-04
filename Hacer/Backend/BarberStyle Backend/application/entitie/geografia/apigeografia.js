
import {Router}  from 'express';

import  ModelPais  from '../../../domain/entitie/pais/modelpais.js'; 
import CorePais  from '../../../core/entitie/pais/corepais.js'; 

import ModelDepartamento  from '../../../domain/entitie/departamento/modeldepartamento.js'; 
import  CoreDepartamento  from '../../../core/entitie/departamento/coredepartamento.js'; 

import ModelCiudad  from '../../../domain/entitie/ciudad/modelciudad.js'; 
import  CoreCiudad  from '../../../core/entitie/ciudad/coreciudad.js'; 

const router = Router();

///////////////////////////////////////////////////////////////////////////////////////////////////

// GET
/**
 * @swagger
 * /operaciongetpais:
 *   get:
 *     tags:
 *       - Pais
 *     summary: Get all ModelPais
 *     responses:
 *       200:
 *         description: List of ModelPais
 */
router.get('/operaciongetpais', async (req, res) => {
	try {
		const corepais = new CorePais();
		const respuestacorepais = await corepais.consultarpais();
		res.status(200).json(respuestacorepais);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Id
/**
 * @swagger
 * /operaciongetpaisid/{id}:
 *   get:
 *     tags:
 *       - Pais
 *     summary: Get ModelPais by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelPais
 */
router.get('/operaciongetpaisid/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const corepais = new CorePais();
		const respuestacorepais = await corepais.consultarpaisid(id);
		res.status(200).json(respuestacorepais);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Nombre
/**
 * @swagger
 * /operaciongetpaisnombrepais/{nombrepais}:
 *   get:
 *     tags:
 *       - Pais 
 *     summary: Get ModelPais by NombreCiudad
 *     parameters:
 *       - name: nombrepais
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelPais
 */
router.get('/operaciongetpaisnombrepais/:nombrepais', async (req, res) => {
	try {
		const { nombrepais } = req.params;
		const corepais = new CorePais();
		const respuestacorepais = await corepais.consultarpaisnombrepais(nombrepais);
		res.status(200).json(respuestacorepais);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

///////////////////////////////////////////////////////////////////////////////////////////////////

// GET
/**
 * @swagger
 * /operaciongetdepartamento:
 *   get:
 *     tags:
 *       - Departamento 
 *     summary: Get all ModelDepartamento
 *     responses:
 *       200:
 *         description: List of ModelDepartamento
 */
router.get('/operaciongetdepartamento', async (req, res) => {
	try {
		const coredepartamento = new CoreDepartamento();
		const respuestacoredepartamento = await coredepartamento.consultardepartamento();
		res.status(200).json(respuestacoredepartamento);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Id
/**
 * @swagger
 * /operaciongetdepartamentoid/{id}:
 *   get:
 *     tags:
 *       - Departamento  
 *     summary: Get ModelDepartamento by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelDepartamento
 */
router.get('/operaciongetdepartamentoid/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const coredepartamento = new CoreDepartamento();
		const respuestacoredepartamento = await coredepartamento.consultardepartamentoid(id);
		res.status(200).json(respuestacoredepartamento);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Nombre
/**
 * @swagger
 * /operaciongetdepartamentonombredepartamento/{nombredepartamento}:
 *   get:
 *     tags:
 *       - Departamento  
 *     summary: Get ModelDepartamento by NombreCiudad
 *     parameters:
 *       - name: nombredepartamento
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelDepartamento
 */
router.get('/operaciongetdepartamentonombredepartamento/:nombredepartamento', async (req, res) => {
	try {
		const { nombredepartamento } = req.params;
		const coredepartamento = new CoreDepartamento();
		const respuestacoredepartamento = await coredepartamento.consultardepartamentonombredepartamento(nombredepartamento);
		res.status(200).json(respuestacoredepartamento);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

///////////////////////////////////////////////////////////////////////////////////////////////////

// GET
/**
 * @swagger
 * /operaciongetciudad:
 *   get:
 *     tags:
 *       - Ciudad  
 *     summary: Get all ModelCiudad
 *     responses:
 *       200:
 *         description: List of ModelCiudad
 */
router.get('/operaciongetciudad', async (req, res) => {
	try {
		const coreciudad = new CoreCiudad();
		const respuestacoreciudad = await coreciudad.consultarciudad();
		res.status(200).json(respuestacoreciudad);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Id
/**
 * @swagger
 * /operaciongetciudadid/{id}:
 *   get:
 *     tags:
 *       - Ciudad   
 *     summary: Get ModelCiudad by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelCiudad
 */
router.get('/operaciongetciudadid/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const coreciudad = new CoreCiudad();
		const respuestacoreciudad = await coreciudad.consultarciudadid(id);
		res.status(200).json(respuestacoreciudad);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Nombre
/**
 * @swagger
 * /operaciongetciudadnombreciudad/{nombreciudad}:
 *   get:
 *     tags:
 *       - Ciudad   
 *     summary: Get ModelCiudad by NombreCiudad
 *     parameters:
 *       - name: nombreciudad
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelCiudad
 */
router.get('/operaciongetciudadnombreciudad/:nombreciudad', async (req, res) => {
	try {
		const { nombreciudad } = req.params;
		const coreciudad = new CoreCiudad();
		const respuestacoreciudad = await coreciudad.consultarciudadnombreciudad(nombreciudad);
		res.status(200).json(respuestacoreciudad);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});


export default router;