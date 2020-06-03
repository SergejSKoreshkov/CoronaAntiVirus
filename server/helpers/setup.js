const fs = require('fs')
const path = require('path')
const colors = require('colors')
const enc = require('../helpers/encrypt')

const removeDBFile = () => new Promise((resolve, reject) => {
    fs.unlink(path.join(__dirname, '../database/database.sqlite3'), err => {
        if (err) {
            if (err.code !== 'ENOENT') {
                reject(err)
            }
        }
        console.log(colors.green('Database file deleted'))
        resolve()
    })
})

const createDBFile = () => new Promise((resolve, reject) => {
    fs.appendFile(path.join(__dirname, '../database/database.sqlite3'), '', {}, err => {
        if (err) reject(err)
        console.log(colors.green('Database file created'))
        resolve()
    })
})

const initDB = () => {
    const db = require('../database/database')
    return db.initUsers().then(db.initHistory).then(db.initActive)
}

const addDefaultUser = () => {
    const db = require('../database/database')
    return db.addUser(['admin', '$2b$10$cWPNH3UdzSzMm59SpNPeAukHTnxR.9Kv1tuwks5dKeGiJ06.q5xmS'])
}

removeDBFile()
    .then(createDBFile)
    .then(initDB)
    .then(addDefaultUser)
    .then(() => {
        console.log(colors.green('Database initialized'))
        console.log(colors.green('User added'))
    })
    .catch(err => console.log(err))
