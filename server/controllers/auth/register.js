const validator = require('validator')

const response = require('../../helpers/response')
const encrypt = require('../../helpers/encrypt')

const db = require('../../database/database')

module.exports = (req, res, next) => {
    if (req && req.body && req.body.login && req.body.password) {
        req.body.login = req.body.login.toLowerCase()
        if (!validator.isAlphanumeric(req.body.login)) return response(res, { status: 'Bad Request', error: new Error('incorrectLoginFormat') })
        if (req.body.login.length < 8) return response(res, { status: 'Bad Request', error: new Error('shortLogin') })
        if (req.body.password.length < 8) return response(res, { status: 'Bad Request', error: new Error('shortPassword') })

        try {
            encrypt.cryptPassword(req.body.password).then(hash => {
                db.addUser([req.body.login, hash])
                    .then(() => {
                        req.user = req.body.login
                        next()
                    })
                    .catch(err => {
                        if (err.message === 'SQLITE_CONSTRAINT: UNIQUE constraint failed: users.login') {
                            response(res, { status: 'Bad Request', error: new Error('loginUsed') })
                        } else {
                            response(res, { status: 'Bad Request', error: err })
                        }
                    })
            })
        } catch (err) {
            response(res, { status: 'Bad Request', error: err })
        }
    } else response(res, { status: 'Bad Request', error: new Error('no Data') })
}
