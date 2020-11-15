const express = require('express')
const app = express()
const bcrypt = require('bcrypt');

app.use(express.json()) //use json type
require('./database/mongodb') //initialize mongoose

const userRouter = require('./router/user_router')

app.use('/api/user', userRouter)

app.listen(3000, (suc, err) => {
    if (err) throw err

    console.log("Server is running");
})