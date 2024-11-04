
// swaggerspecification.js

import swaggerJSDoc from 'swagger-jsdoc';

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Geografia API',
            version: '1.0.0',
            description: 'BackEnd Swagger Barber_Style Project'
        }
    },
    apis: ['./application/entitie/geografia/*.js'], 
};

const swaggerSpec = swaggerJSDoc(options);

export default swaggerSpec;
