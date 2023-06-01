const { async } = require('@firebase/util');
const { createUserWithEmailAndPassword, signInWithEmailAndPassword } = require('firebase/auth')

const admin = require('../firebase-admin')
const auth = require('../firebase-auth')

const db = admin.firestore()

const User = {
    signup: async(email, password) => {
        const user = await createUserWithEmailAndPassword(auth, email, password)
        const userData = user.user.providerData[0]
        await db.collection('users').doc(user.user.uid).set(userData);
        return user;
    },

    signin: async(email, password) => {
        const user = await signInWithEmailAndPassword(auth, email, password);
        return user;
    },

    getUserDoc: async(user) => {
        const docRef = await db.collection('users').doc(user.uid)
        const userDoc = await docRef.get()
        if (!userDoc.exists) {
            return null;
        }

        return userDoc.data()
    },

    updateProfile: async(userDoc, data) => {

    }
};

module.exports = User;