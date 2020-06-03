const db = require('../database/database')
const response = require('../helpers/response')

module.exports = (req, res, next) => {
    db.removeUser(req.body.login || '')
        .then(data => response(res, { status: 'OK', data }))
        .catch(error => response(res, { status: 'Bad Request', error }))
}
