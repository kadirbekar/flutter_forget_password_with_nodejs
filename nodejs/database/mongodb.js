const mongoose = require('mongoose')
const dbConnection = 'mongodb://localhost/forget_password'

mongoose.connect(dbConnection, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
    useCreateIndex: true
}).
    then((res) => console.log("Connected to forget_password.db"))
    .catch((err) => console.log("Error when connection to forget_password.db"));

