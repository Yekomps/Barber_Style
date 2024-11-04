import { Router } from 'express';
const router = Router();

import CoreServicio from '../../../core/object/servicio/coreServicio.js';
import modelServicioObject from '../../../domain/object/servicio/modelServicio.js';
const { ModelServicio, modelservicio } = modelServicioObject;

//GET
/** 
* @swagger
* /getservicio:
*    get:
*     summary: Obtiene una lista de servicios
*     tags: [Servicios]
*     responses:
*       200:
*         description: Lista de servicios obtenida con éxito
*         content:
*           application/json:
*             schema:
*               type: array
*               items:
*                 type: object
*                 properties:
*                   idcatalogo:
*                     type: string
*                     description: ID del catálogo
*                   descripcioncatalog:
*                     type: string
*                     description: Descripción del catálogo
*                   idtiposervicio:
*                     type: string
*                     description: ID del tipo de servicio
*                   descripciontiposervicio:
*                     type: string
*                     description: Descripción del tipo de servicio
*                   valor:
*                     type: string
*                     description: Valor del servicio
*                   idservicio:
*                     type: string
*                     description: ID del servicio
*                   estadoservicio:
*                     type: string
*                     description: Estado del servicio
*       500:
*         description: Error interno del servidor

*/
router.get('/getservicio',async (req, res) => {
	//res.json(modelservicio);
    //res.status(200).json(["Esto","Es","Una","Prueba","De","Get"]);
  const coreservicio = new CoreServicio();
  try {
    const resultCoreServicio = await coreservicio.getServicio();
    res.status(200).json({ msg: 'Servicios encontrados', servicio: resultCoreServicio });
  } catch (error) {
    res.status(500).json({ error: err.message });
    console.error(error);
}
});

//GET SPECIFIC BY ID
/**
 * @swagger
 * /getservicioespecificobyid/{idcatalogo}:
 *   get:
 *     summary: Obtiene un servicio específico por ID
 *     tags: [Servicios]
 *     parameters:
 *       - name: catalogo
 *         in: path
 *         required: true
 *         description: ID del catalogo que se desea obtener
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Servicio encontrado con éxito
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 idcatalogo:
 *                   type: string
 *                   description: ID del catálogo
 *                 descripcioncatalog:
 *                   type: string
 *                   description: Descripción del catálogo
 *                 idtiposervicio:
 *                   type: string
 *                   description: ID del tipo de servicio
 *                 descripciontiposervicio:
 *                   type: string
 *                   description: Descripción del tipo de servicio
 *                 valor:
 *                   type: string
 *                   description: Valor del servicio
 *                 idservicio:
 *                   type: string
 *                   description: ID del servicio
 *                 estadoservicio:
 *                   type: string
 *                   description: Estado del servicio
 *       404:
 *         description: Servicio no encontrado
 *       500:
 *         description: Error interno del servidor
 */
router.get('/getservicioespecificobyid/:idservicio',async (req, res) => {
    const idcatalogo = req.params.idcatalogo;
    // const producto = modelservicio.find((p) => p.idcatalogo === idcatalogo);
    const coreservicio = new CoreServicio();
  try {
    const resultCoreServicioSpecificbyid = await coreservicio.getServicioSpecificbyid(idcatalogo);
    res.status(200).json({ msg: 'Servicios encontrados', servicio: resultCoreServicioSpecificbyid});
  } catch (error) {
    res.status(500).json({ error: err.message });
    console.error(error);
    }
});

//GET SPECIFIC BY NAME
/**
 * @swagger
 * /getservicioespecificobyname/{descripciontiposervicio}:
 *   get:
 *     summary: Obtiene un servicio específico por su nombre
 *     tags: [Servicios]
 *     parameters:
 *       - name: descripciontiposervicio
 *         in: path
 *         required: true
 *         description: Nombre del servicio que se desea obtener
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Servicio encontrado con éxito
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 idcatalogo:
 *                   type: string
 *                   description: ID del catálogo
 *                 descripcioncatalog:
 *                   type: string
 *                   description: Descripción del catálogo
 *                 idtiposervicio:
 *                   type: string
 *                   description: ID del tipo de servicio
 *                 descripciontiposervicio:
 *                   type: string
 *                   description: Descripción del tipo de servicio
 *                 valor:
 *                   type: string
 *                   description: Valor del servicio
 *                 idservicio:
 *                   type: string
 *                   description: ID del servicio
 *                 estadoservicio:
 *                   type: string
 *                   description: Estado del servicio
 *       404:
 *         description: Servicio no encontrado
 *       500:
 *         description: Error interno del servidor
 */
router.get('/getservicioespecificobyname/:descripciontiposervicio',async (req, res) => {
    const descripciontiposervicio = req.params.descripciontiposervicio;
    const coreservicio = new CoreServicio();
  try {
    const resultCoreServicioSpecificbyname = await coreservicio.getServicioSpecificbyname(descripciontiposervicio);
    res.status(200).json({ msg: 'Servicios encontrados', servicio: resultCoreServicioSpecificbyname});
  } catch (error) {
    res.status(500).json({ error: err.message });
    console.error(error);
    }
});


//POST
/**
 * @swagger
 * /addservicio:
 *   post:
 *     summary: Crea un nuevo servicio
 *     tags: [Servicios]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               idcatalogo:
 *                 type: string
 *                 description: ID del catálogo
 *               descripcioncatalog:
 *                 type: string
 *                 description: Descripción del catálogo
 *               idtiposervicio:
 *                 type: string
 *                 description: ID del tipo de servicio
 *               descripciontiposervicio:
 *                 type: string
 *                 description: Descripción del tipo de servicio
 *               valor:
 *                 type: string
 *                 description: Valor del servicio
 *               estadoservicio:
 *                 type: string
 *                 description: Estado del servicio
 *             required:
 *               - idcatalogo
 *               - descripcioncatalog
 *               - idtiposervicio
 *               - descripciontiposervicio
 *               - valor
 *               - estadoservicio
 *     responses:
 *       201:
 *         description: Servicio creado con éxito
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 Servicio:
 *                   type: string
 *                   description: ID del servicio creado
 *                   example: 3
 *       400:
 *         description: Error en los datos proporcionados
 *       500:
 *         description: Error interno del servidor
 */

router.post('/addservicio',(req,res) =>{
    const {
        idcatalogo,
        descripcioncatalog,
        idtiposervicio,
        descripciontiposervicio,
        valor,
        idservicio,
        estadoservicio} = req.body;
    
    const newmodelServicio = new ModelServicio({
        idcatalogo,
        descripcioncatalog,
        idtiposervicio,
        descripciontiposervicio,
        valor,
        idservicio,
        estadoservicio
        });

    res.status(201).json(newmodelServicio);
    /*modelservicio.push(newmodelServicio);

    res.status(201).json('Servicio Added')
    */

    res.json(newmodelServicio)
});

//PUT
/**
 * @swagger
 * /actualizarservicio/{idcatalogo}:
 *   put:
 *     summary: Actualiza un servicio existente por ID
 *     tags: [Servicios]
 *     parameters:
 *       - in: path
 *         name: idcatalogo
 *         required: true
 *         description: ID del catalogo que se desea actualizar
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               descripcioncatalog:
 *                 type: string
 *                 description: Descripción del catálogo
 *               idtiposervicio:
 *                 type: string
 *                 description: ID del tipo de servicio
 *               descripciontiposervicio:
 *                 type: string
 *                 description: Descripción del tipo de servicio
 *               valor:
 *                 type: string
 *                 description: Valor del servicio
 *               estadoservicio:
 *                 type: string
 *                 description: Estado del servicio
 *     responses:
 *       200:
 *         description: Servicio actualizado con éxito
 *       404:
 *         description: Servicio no encontrado
 *       400:
 *         description: Error en los datos proporcionados
 *       500:
 *         description: Error interno del servidor
 */

router.put('/actualizarservicio/:idcatalogo', (req, res) => {
    const idcatalogo  = req.params.idcatalogo;
    const {descripcioncatalog, 
        idtiposervicio, 
        descripciontiposervicio, 
        valor, 
        idservicio,
        estadoservicio } = req.body;
    
    const newmodelServicio = new ModelServicio({
        idcatalogo,
        descripcioncatalog,
        idtiposervicio,
        descripciontiposervicio,
        valor,
        idservicio,
        estadoservicio
    });

    newmodelServicio.idcatalogo = idcatalogo
    newmodelServicio.descripcioncatalog = descripcioncatalog
    newmodelServicio.idtiposervicio = idtiposervicio
    newmodelServicio.descripciontiposervicio = descripciontiposervicio
    newmodelServicio.valor = valor
    newmodelServicio.idservicio = idservicio
    newmodelServicio.estadoservicio = estadoservicio

    res.status(200).json({msg: 'Servicio Actualizado', servicio: newmodelServicio })
  });

//DElETE
/**
 * @swagger
 * /borrarservicio/{idcatalogo}:
 *   delete:
 *     summary: Elimina un servicio existente por ID
 *     tags: [Servicios]
 *     parameters:
 *       - in: path
 *         name: idcatalogo
 *         required: true
 *         description: ID del servicio que se desea eliminar
 *         schema:
 *           type: string
 *     responses:
 *       204:
 *         description: Servicio eliminado con éxito
 *       404:
 *         description: Servicio no encontrado
 *       500:
 *         description: Error interno del servidor
 */
router.delete('/borrarservicio/:idcatalogo', (req, res) => {
    const idcatalogo  = req.params.idcatalogo;

    res.status(201).json({msg:'Servicio Borrado', servicio : idcatalogo})

  });

 export default router;