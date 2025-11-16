const serverless = require('serverless-http');
const app = require('./app'); // file Express app của bạn
module.exports.handler = serverless(app);
