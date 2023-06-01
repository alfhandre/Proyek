const express = require('express')
const userRouter = require('./user-route.js')
const eventRouter = require('./event-route.js')

const router = express.Router();

router.use('/event', eventRouter);
router.use('/', userRouter)

module.exports = router