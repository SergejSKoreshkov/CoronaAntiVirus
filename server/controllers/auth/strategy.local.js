const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const encrypt = require('../../helpers/encrypt')
const response = require('../../helpers/response')

const db = require('../../database/database')

const verifyHandler = function (username, password, done) {
    try {
        db.getUser(username)
            .then(data => {
                if (data.length === 0) return Promise.reject(new Error('userNotFound'))
                else return encrypt.comparePassword(password, data[0].pass_hash)
            })
            .then(isCorrectPass => {
                if (isCorrectPass) done(null, username)
                else return Promise.reject(new Error('incorrectPassword'))
            })
            .catch(err => {
                done(err, null)
            })
    } catch (err) {
        done(err, null)
    }
}

passport.use(new LocalStrategy({
    usernameField: 'login',
    passwordField: 'password',
    session: false
}, verifyHandler))

module.exports = (req, res, next) => {
    return passport.authenticate('local', (error, user, info) => {
        if (error) response(res, { status: 'Bad Request', error })
        else {
            req.user = user
            next()
        }
    })(req, res, next)
}
