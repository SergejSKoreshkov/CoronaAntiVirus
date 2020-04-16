const router = require('express').Router()
const authorize = require('../controllers/auth/authorize')
const sendHistory = require('../controllers/getHistory')

router
    .route('/history')
    .get(
        authorize,
        sendHistory
    )

module.exports = router
