const auth = require('../firebase-auth')
const Event = require('../Models/event-model')

const eventController = {
    getAll: async(req, res) => {
        try {
            const events = await Event.getAll();
            res.status(200).json(events);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    getById: async(req, res) => {
        try {
            const event = await Event.getById(req.params.id);
            if (!event) {
                res.status(404).json({ message: 'Data not found' });
            } else {
                res.status(200).json(event);
            }
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    create: async(req, res) => {
        // const user = auth.currentUser

        // if (!user) {
        //     return res.status(401).json({
        //         message: 'Anda harus login terlebih dahulu.',
        //     });
        // }

        try {
            const event = req.body;
            const newEvent = await Event.create(event);
            res.status(201).json(newEvent);
        } catch (error) {
            res.status(500).json({ error: error.message })
        }
    },

    update: async(req, res) => {
        try {
            const id = req.params.id
            const data = req.body;
            const event = await Event.update(id, data);
            res.status(201).json(event);
        } catch (error) {
            res.status(500).json({ error: error.message })
        }
    },

    delete: async(req, res) => {
        try {
            const event = await Event.delete(req.params.id);
            res.status(201).json(event);
        } catch (error) {
            res.status(500).json({ error: error.message })
        }
    }
}

module.exports = eventController