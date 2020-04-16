const bcrypt = require('bcrypt')

exports.cryptPassword = (password) => new Promise((resolve, reject) => {
    bcrypt.genSalt(10, (err, salt) => {
        if (err) reject(err)

        bcrypt.hash(password, salt, function (err, hash) {
            if (err) reject(err)
            else resolve(hash)
        })
    })
})

exports.comparePassword = (plainPass, hashword) => new Promise((resolve, reject) => {
    bcrypt.compare(plainPass, hashword, (err, isPasswordMatch) => {
        if (err) reject(err)
        else resolve(isPasswordMatch)
    })
})
