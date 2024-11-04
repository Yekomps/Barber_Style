const swaggerJSDoc = require('swagger-jsdoc');

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Servicio API',
            version: '1.0.0',
            description: 'Servicio API',
        }
    },
    apis: ['../../../application/object/contrato/*.js']
};

const swaggerSpec = swaggerJSDoc(options);
module.exports = swaggerSpec;