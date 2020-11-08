const mongoose = require('mongoose')
const Schema = mongoose.Schema

//  user model schema
const UserSchema = new Schema({
    mail: {
        type: String,
        trim: true
    },
    password: {
        type: String,
        trim: true
    },
}, { collection: 'user' })

module.exports = mongoose.model('User',UserSchema)