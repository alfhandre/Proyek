const express = require('express')
const userController = require('../Controllers/user-controller.js')

const router = express.Router()

router.post('/signup', userController.signup);
router.post('/signin', userController.signin);
router.get('/profile', userController.accessProfile)

module.exports = router;