const router = require('express').Router()

const register = require('../controllers/auth/register')
const authorize = require('../controllers/auth/authorize')

const sendJWT = require('../controllers/auth/signJWT')
const login = require('../controllers/auth/strategy.local')

router.route('/local')
    .post(
        login,
        sendJWT
    )

router.route('/local/register')
    .post(
        authorize,
        register,
        sendJWT
    )

module.exports = router
