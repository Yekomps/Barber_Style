import pkg from 'body-parser';
import cors from 'cors';
import express from 'express';
import { serve, setup } from 'swagger-ui-express';
import { PORT_SERVER } from './config.js';

import servicioAPI from './application/entitie/geografia/apigeografia.js';
import swaggerSpec from './swagger/entitie/geografia/swaggerspecificationgeografia.js';

const { json } = pkg;
const app = express();

app.use(cors());

app.use(json());

app.use('/api-docs', serve, setup(swaggerSpec));

app.use(servicioAPI);

app.listen(PORT_SERVER, () => {
  console.log('Server is running on port', PORT_SERVER);
  console.log(`Swagger docs available at http://localhost:${PORT_SERVER}/api-docs`);
});