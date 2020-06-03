const router = require('express').Router()
const authorize = require('../controllers/auth/authorize')
const sendHistory = require('../controllers/getHistory')
const sendActive = require('../controllers/getActive')
const sendUsers = require('../controllers/getUsers')
const removeUser = require('../controllers/removeUser')

router
    .route('/history')
    .get(
        authorize,
        sendHistory
    )

router
    .route('/active')
    .get(
        authorize,
        sendActive
    )

router
    .route('/users')
    .get(
        authorize,
        sendUsers
    )
    .delete(
        authorize,
        removeUser
    )

module.exports = router
