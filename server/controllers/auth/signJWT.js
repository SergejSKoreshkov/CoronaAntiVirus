const jwt = require('jsonwebtoken')
const response = require('../../helpers/response')

const authenticatePromise = (login) => new Promise((resolve, reject) => {
    const token = jwt.sign(login, process.env.JWT_SECRET)
    if (token) resolve({ login, token })
    else reject(new Error('Token error'))
})

module.exports = (req, res, next) => {
    authenticatePromise(req.user)
        .then(user => {
            response(res, { status: 'OK', data: { token: user.token } })
        })
        .catch(err => response(res, { status: 'Bad Request', error: err }))
}
