const SerialPort = require('serialport')
const Delimiter = require('@serialport/parser-delimiter')
const colors = require('colors')

const usbDetect = require('usb-detection')
usbDetect.startMonitoring()

const db = require('../database/database')

let interval = 0
let port = null
let parser = null
let initialized = false

function * deviceGenerator () {
    const deviceList = ['12', '63']
    let index = 0
    while (true) {
        index++
        if (index >= deviceList.length) {
            index = 0
        }
        console.log(deviceList[index])
        yield deviceList[index]
    }
}

let generator = deviceGenerator()

const startMonitoring = (devicePort) => {
    if (!initialized) {
        console.log(colors.yellow(`Device connected to port: ${devicePort}`))
        initialized = true
        port = new SerialPort(devicePort, { baudRate: 9600 }, err => {
            if (err) throw err
        })
        parser = port.pipe(new Delimiter({ delimiter: '\r\n' }))
        parser.on('data', async data => {
            clearInterval(interval)

            const dataArray = data.toString().split('|').map(el => {
                const personalData = el.split(',')
                if (personalData.length === 3) {
                    return [
                        personalData[1], // gate id
                        personalData[0], // card id
                        personalData[2], // temp
                        Date.now() // time
                    ]
                } else {
                    return {}
                }
            })
            await dataArray.reduce((prev, current) => {
                console.log(current, prev)
                return prev.then(() => db.addHistory(current)).then(() => db.updateActive(current)).catch(console.log)
            }, Promise.resolve())

            port.write(generator.next().value)
            interval = setInterval(() => {
                port.write(generator.next().value)
            }, 1000)
        })

        port.on('error', err => {
            console.log(err)
        })

        port.write(generator.next().value)
        interval = setInterval(() => {
            port.write(generator.next().value)
        }, 1000)
    }
}

usbDetect.on('add', devices => {
    SerialPort.list()
        .then(list => {
            const [device] = list.filter(el => {
                return devices.vendorId === parseInt(`0x${el.vendorId}`)
            })
            startMonitoring(device.path)
        })
})

usbDetect.on('remove', () => {
    clearInterval(interval)
    initialized = false
    if (port) {
        port.close()
    }
    if (parser) {
        parser.end()
    }
    parser = null
    generator = deviceGenerator()
})