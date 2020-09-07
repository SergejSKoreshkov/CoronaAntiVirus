const sqlite3 = require('sqlite3').verbose()
const db = new sqlite3.Database('./server/database/database.sqlite3')

exports.initHistory = () => new Promise((resolve, reject) => {
    db.run('CREATE TABLE IF NOT EXISTS history (id INTEGER PRIMARY KEY AUTOINCREMENT, gate_id TEXT NOT NULL, card_id TEXT NOT NULL, temp TEXT NOT NULL, time TIME NOT NULL, day TEXT NOT NULL)', (err) => {
        if (err) reject(err)
        else resolve()
    })
})

exports.initActive = () => new Promise((resolve, reject) => {
    db.run('CREATE TABLE IF NOT EXISTS active (gate_id TEXT PRIMARY KEY, card_id TEXT NOT NULL, temp TEXT NOT NULL, time TIME NOT NULL)', (err) => {
        if (err) reject(err)
        else resolve()
    })
})

exports.initUsers = () => new Promise((resolve, reject) => {
    db.run('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, login TEXT NOT NULL UNIQUE, pass_hash TEXT NOT NULL)', (err) => {
        if (err) reject(err)
        else resolve()
    })
})

exports.addHistory = (values = []) => new Promise((resolve, reject) => {
    db.run(`INSERT INTO history (gate_id, card_id, temp, time, day) VALUES ('${values.join('\',\'')}')`, (err) => {
        if (err) reject(err)
        else resolve()
    })
})

exports.updateActive = (values = []) => new Promise((resolve, reject) => {
    db.run(`INSERT INTO active (gate_id, card_id, temp, time) VALUES ('${values.join('\',\'')}') ON CONFLICT(gate_id) DO UPDATE SET card_id='${values[1]}', temp='${values[2]}', time='${values[3]}'`, (err) => {
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

exports.showUsers = () => new Promise((resolve, reject) => {
    db.all('SELECT login FROM users', (err, rows) => {
        if (err) reject(err)
        else resolve(rows)
    })
})

exports.removeUser = (login) => new Promise((resolve, reject) => {
    db.all(`DELETE FROM users WHERE login='${login}'`, (err, rows) => {
        if (err) reject(err)
        else resolve(rows)
    })
})

exports.getHistory = (day, limit, offset) => new Promise((resolve, reject) => {
    db.all(`SELECT * FROM history ${limit ? `LIMIT ${limit} ` : ''}${offset ? `OFFSET ${offset} ` : ''}${day ? `WHERE day=${day}` : ''}`, (err, rows) => {
        if (err) reject(err)
        else resolve(rows)
    })
})

exports.removeHistory = (day) => new Promise((resolve, reject) => {
    db.all(`DELETE FROM history WHERE day='${day}'`, (err, rows) => {
        if (err) reject(err)
        else resolve(rows)
    })
})

exports.getDays = () => new Promise((resolve, reject) => {
    db.all('SELECT DISTINCT day FROM history', (err, rows) => {
        console.log(err, rows)
        if (err) reject(err)
        else resolve(rows)
    })
})

exports.getActive = (limit, offset) => new Promise((resolve, reject) => {
    db.all(`SELECT * FROM active ${limit ? `LIMIT ${limit} ` : ''}${offset ? `OFFSET ${offset} ` : ''}`, (err, rows) => {
        if (err) reject(err)
        else resolve(rows)
    })
})
