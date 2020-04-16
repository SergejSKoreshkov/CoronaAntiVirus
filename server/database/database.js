const sqlite3 = require('sqlite3').verbose()
const db = new sqlite3.Database('./server/database/database.sqlite3')

exports.initHistory = () => new Promise((resolve, reject) => {
    db.run('CREATE TABLE IF NOT EXISTS history (id INTEGER PRIMARY KEY AUTOINCREMENT, gate_id TEXT NOT NULL, first_name TEXT NOT NULL, last_name TEXT NOT NULL, temp TEXT NOT NULL, time TIME NOT NULL)', (err) => {
        if (err) reject(err)
        else resolve()
    })
})

exports.initUsers = () => new Promise((resolve, reject) => {
    db.run('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, login TEXT NOT NULL UNIQUE, pass_hash TEXT NOT NULL)', (err) => {
        if (err) reject(err)
    })
})

exports.addHistory = (values = []) => new Promise((resolve, reject) => {
    db.run(`INSERT INTO history (gate_id, first_name, last_name, temp, time) VALUES ('${values.join('\',\'')}')`, (err) => {
        if (err) reject(err)
        else resolve()
    })
})

exports.addUser = (values = []) => new Promise((resolve, reject) => {
    db.run(`INSERT INTO users (login, pass_hash) VALUES ('${values.join('\',\'')}')`, (err) => {
        if (err) reject(err)
        else resolve()
    })
})

exports.getUser = (login) => new Promise((resolve, reject) => {
    db.all(`SELECT * FROM users WHERE login='${login}'`, (err, rows) => {
        if (err) reject(err)
        else resolve(rows)
    })
})

exports.getHistory = (limit, offset) => new Promise((resolve, reject) => {
    db.all(`SELECT * FROM history ${limit ? `LIMIT ${limit} ` : ''}${offset ? `OFFSET ${offset} ` : ''}`, (err, rows) => {
        if (err) reject(err)
        else resolve(rows)
    })
})
