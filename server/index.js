const dotenv = require('dotenv')
dotenv.config({ path: '.env' })

const response = require('./helpers/response')

const bodyParser = require('body-parser')
const cors = require('cors')
const morgan = require('morgan')

const db = require('./database/database')

const colors = require('colors')

const passport = require('passport')
require('./controllers/auth/strategy.local')
passport.serializeUser((user, cb) => cb(null, user))
passport.deserializeUser((obj, cb) => cb(null, obj))

const express = require('express')
const app = express()

app.use(cors())
app.use(passport.initialize())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json({ extended: true }))
app.use(morgan(`${colors.green(':method')} ${colors.cyan(':url')} ${colors.magenta(':status')} :response-time ms`))

app.use('/api/auth/', require('./routes/routes.api.auth'))
app.use('/api/', require('./routes/routes.api'))

app.use('/', express.static('dist'))

app.all('/api/*', (req, res) => {
    response(res, { status: 'Not Found', error: new Error('notFound') })
})

app.all('*', (req, res) => {
    res.redirect('/')
})

db.initHistory()
    .then(() => {
        const init = db.initUsers()
        require('./serial/index')
        return init
    })
    .catch(console.log)

app.listen(process.env.PORT, () => {
    console.log(colors.green(`Server started at ${colors.cyan(`http://localhost:${process.env.PORT}`)}`))
})
