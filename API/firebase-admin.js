const admin = require('firebase-admin')

const serviceAccount = require('./eventing-api-1c61e-firebase-adminsdk-xi9ru-5de6bc7440.json')

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: 'https://eventing-api-1c61e.firebaseio.com'
});

module.exports = admin