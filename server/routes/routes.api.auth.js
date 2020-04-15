const router = require('express').Router()

const register = require('../controllers/auth/register')

const sendJWT = require('../controllers/auth/signJWT')
const authorize = require('../controllers/auth/authorize')
const login = require('../controllers/auth/strategy.local')

router
    .route('/local')
    .post(
        login,
        sendJWT
    )

router
    .route('/local/register')
    .post(
        register,
        sendJWT
    )

router
    .route('/history')
    .get(
        authorize,
        (req, res) => {
            res.json({ ok: true })
        }
    )

module.exports = router
