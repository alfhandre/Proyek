const auth = require('../firebase-auth')
const User = require('../Models/user-model.js')

const userController = {
    signup: async(req, res) => {
        try {
            const email = await req.body.email
            const password = await req.body.password
            const newUser = await User.signup(email, password)
            res.status(201).json(newUser);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    signin: async(req, res) => {
        try {
            const email = await req.body.email
            const password = await req.body.password
            const user = await User.signin(email, password)
            res.status(201).json({
                status_message: 'successfully signed in',
                userInfo: user
            });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    accessProfile: async(req, res) => {
        const user = auth.currentUser

        if (!user) {
            return res.status(401).json({
                message: 'Anda harus login terlebih dahulu.',
            });
        }

        try {
            const userDoc = await User.getUserDoc(user)
            res.status(200).json(userDoc)
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

module.exports = userController