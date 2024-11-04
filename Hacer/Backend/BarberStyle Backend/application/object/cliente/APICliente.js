const express = require('express');
const router = express.Router();

const {ModelServicio,modelservicio} = require('../../../domain/object/servicio/modelServicio');

// GET
/**
    *@swagger
    * /servicio:
    * get:
    *   summary: Get Servicio
    *   description: Get all Servicio
    *   responses:
    *       200:
    *           description: succes getting servicios

 */
router.get('/getservicio', (req, res) => {
	//res.json(modelservicio);
    res.status(200).json(["Esto","Es","Una","Prueba","De","Get"]);
});

router.post('/addservicio',(req,res) =>{
    const {
        idcatalogo,
        descripcioncatalog,
        idsede,
        idtiposervicio,
        descripciontiposervicio,
        valor,
        idservicio,
        estadoservicio} = req.body;
    
    const newmodelServicio = new ModelServicio({
        idcatalogo,
        descripcioncatalog,
        idsede,
        idtiposervicio,
        descripciontiposervicio,
        valor,
        idservicio,
        estadoservicio
        });

    /*modelservicio.push(newmodelServicio);

    res.status(201).json('Servicio Added')
    */

    res.json(newmodelServicio)
});
module.exports = router;