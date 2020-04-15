console.log(__dirname)

const dotenv = require('dotenv')
dotenv.config({ path: '.env' })

const bodyParser = require('body-parser')
const cors = require('cors')
const morgan = require('morgan')

const db = require('./database/database')
db.init()

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

app.use('/', express.static('dist'))

app.all('*', (req, res) => {
    res.redirect('/')
})

app.listen(process.env.PORT, () => {
    console.log(colors.green(`Server started at ${colors.cyan(`http://localhost:${process.env.PORT}`)}`))
})
