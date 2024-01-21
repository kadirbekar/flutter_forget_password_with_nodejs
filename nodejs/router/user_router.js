const userController = require('../controllers/user_controller')
const userRouter = require('express').Router()

userRouter.post('/addNewUser',userController.addNewUser)
userRouter.post('/forgetPassword/',userController.forgetPassword)
userRouter.post('/checkUser',userController.checkUser)

module.exports = userRouter

