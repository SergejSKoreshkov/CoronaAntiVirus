const db = require('../database/database')
const response = require('../helpers/response')

module.exports = (req, res, next) => {
    db.getHistory(req.query.date, req.query.limit, req.query.offset)
        .then(data => response(res, { status: 'OK', data }))
        .catch(error => response(res, { status: 'Bad Request', error }))
}
