const firebase = require('firebase/app');

const firebaseConfig = {
    apiKey: "AIzaSyBk5lfb3z7I99rmMY0vc2ZSrRsQz0VguS0",
    authDomain: "eventing-api-1c61e.firebaseapp.com",
    projectId: "eventing-api-1c61e",
    storageBucket: "eventing-api-1c61e.appspot.com",
    messagingSenderId: "129688831214",
    appId: "1:129688831214:web:d06e0277ac58b43d6a9fff"
};

firebase.initializeApp(firebaseConfig); //initialize firebase app 

module.exports = firebase; //export the app