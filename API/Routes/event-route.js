const express = require('express')
const eventController = require('../Controllers/event-controller.js')

const router = express.Router()

router.get('/', eventController.getAll);
router.get('/:id', eventController.getById);
router.post('/create', eventController.create);
router.patch('/:id', eventController.update);
router.delete('/:id', eventController.delete);

module.exports = router;