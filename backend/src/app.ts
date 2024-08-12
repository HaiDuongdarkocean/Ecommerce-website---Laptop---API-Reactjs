import express from 'express';
import 'reflect-metadata';
import router from './routes';
import cors from 'cors';
import { config } from './config/config';

const app = express();
const PORT = config.port;

// The cors package is an Express middleware that
// enables CORS (Cross-Origin Resource Sharing)
app.use(cors());

var bodyParser = require('body-parser');
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));

// using middleware -> list router api
app.use('/api/', router);

// listen app
app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
});