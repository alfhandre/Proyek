const Joi = require('joi')
const admin = require('../firebase-admin')
const auth = require('../firebase-auth')

const db = admin.firestore()

const eventSchema = Joi.object({
    title: Joi.string().allow('', null).empty(['', null]).default("Untitled Event"),
    creator: Joi.string().required(),
    description: Joi.string(),
    created_at: Joi.alternatives([
            Joi.object()
            .keys({
                _seconds: Joi.number(),
                _nanoseconds: Joi.number()
            }), Joi.date(), null
        ])
        .default(new Date()),
    start_event: Joi.alternatives([
            Joi.object()
            .keys({
                _seconds: Joi.number(),
                _nanoseconds: Joi.number()
            }), Joi.date(), null
        ])
        .default(new Date()),
    end_event: Joi.alternatives([
            Joi.object()
            .keys({
                _seconds: Joi.number(),
                _nanoseconds: Joi.number()
            }), Joi.date(), null
        ])
        .default(new Date()),
    updated_at: Joi.alternatives([
            Joi.object()
            .keys({
                _seconds: Joi.number(),
                _nanoseconds: Joi.number()
            }), Joi.date(), null
        ])
        .default(new Date()),
})

const Event = {
    getAll: async() => {
        const currentUser = auth.currentUser

        const eventCollection = db
            .collection('users')
            .doc(currentUser.uid)
            .collection('events')

        const snapshot = await eventCollection.get();
        const events = snapshot.docs.map(doc => ({
            id: doc.id,
            ...doc.data()
        }));
        return events
    },
    getById: async(id) => {
        const currentUser = auth.currentUser

        const eventCollection = db
            .collection('users')
            .doc(currentUser.uid)
            .collection('events')

        const docRef = await eventCollection.doc(id);
        const doc = await docRef.get();
        if (!doc.exists) {
            return null;
        }
        return {
            id: doc.id,
            ...doc.data()
        }
    },
    create: async(data) => {
        const currentUser = auth.currentUser

        const eventCollection = db
            .collection('users')
            .doc(currentUser.uid)
            .collection('events')

        data.creator = currentUser.uid

        const { error, value } = eventSchema.validate(data);
        if (error) {
            throw new Error(error.details.map(d => d.message).join(', '));
        }

        const docRef = await eventCollection.add(value)
        const doc = await docRef.get();
        return {
            id: doc.id,
            ...doc.data()
        };
    },
    update: async(id, data) => {
        const currentUser = auth.currentUser

        const eventCollection = db
            .collection('users')
            .doc(currentUser.uid)
            .collection('events')

        const { error, value } = eventSchema.validate(data, { abortEarly: false });
        if (error) {
            throw new Error(error.details.map(d => d.message).join(', '));
        }

        const docRef = eventCollection.doc(id);
        await docRef.update(value);
        const doc = await docRef.get();
        return {
            id: doc.id,
            ...doc.data()
        };
    },
    delete: async(id) => {
        const currentUser = auth.currentUser

        const eventCollection = db
            .collection('users')
            .doc(currentUser.uid)
            .collection('events')

        const docRef = eventCollection.doc(id);
        await docRef.delete();
        return true;
    }
};

module.exports = Event;