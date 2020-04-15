const jwt = require('jsonwebtoken')
const response = require('../../helpers/response')

const authorize = (req, res, next) => {
    if (req && req.headers) {
        try {
            const verified = jwt.verify(req.headers.token, process.env.JWT_SECRET)
            if (verified) {
                req.login = jwt.decode(req.headers.token)
                next()
            } else response(res, { status: 'Bad Request', error: new Error('JWTNotVerified') })
        } catch (err) { response(res, { status: 'Bad Request', error: new Error('incorrectJWT') }) }
    } else response(res, { status: 'Bad Request', error: new Error('noTokenPassed') })
}

module.exports = authorize
