/**
 * Assign the project to an employee.
 * @param {Object} res - Express response object
 * @param {String} status - Status message ('OK', 'Bad Request')
 * @param {Object} error - Error object (new Error(''))
 * @param {Object} data - Response data in JSON format
 */

module.exports = (res, { status, error = false, data = {} }) => {

  status = status ? status : (error ? 'Bad Request' : 'OK')

  const responseObject = {
    error: { name: error.name, message: error.message },
    data: data || {},
    status,
    timestamp: new Date().getTime()
  }

  switch (status) {
    // 1XX Informational
    case 'Continue': res.status(100); break
    case 'Switching Protocols': res.status(101); break
    case 'Processing': res.status(102); break
    // 2XX Success
    case 'OK': res.status(200); break
    case 'Created': res.status(201); break
    case 'Accepted': res.status(202); break
    case 'Non-authoritative Information': res.status(203); break
    case 'No Content': res.status(204); break
    case 'Reset Content': res.status(205); break
    case 'Partial Content': res.status(206); break
    case 'Multi-Status': res.status(207); break
    case 'Already Reported': res.status(208); break
    case 'IM Used': res.status(226); break
    // 3XX Redirectional
    case 'Multiple Choices': res.status(300); break
    case 'Moved Permanently': res.status(301); break
    case 'Found': res.status(302); break
    case 'See Other': res.status(303); break
    case 'Not Modified': res.status(304); break
    case 'Use Proxy': res.status(305); break
    case 'Temporary Redirect': res.status(307); break
    case 'Permanent Redirect': res.status(308); break
    // 4XX Client Error
    case 'Bad Request': res.status(400); break
    case 'Unauthorized': res.status(401); break
    case 'Payment Required': res.status(402); break
    case 'Forbidden': res.status(403); break
    case 'Not Found': res.status(404); break
    case 'Method Not Allowe': res.status(405); break
    case 'Not Acceptable': res.status(406); break
    case 'Proxy Authentication Required': res.status(407); break
    case 'Request Timeout': res.status(408); break
    case 'Conflict': res.status(409); break
    case 'Gone': res.status(410); break
    case 'Length Required': res.status(411); break
    case 'Precondition Failed': res.status(412); break
    case 'Payload Too Long': res.status(413); break
    case 'Request-URI Too Long': res.status(414); break
    case 'Unsupported Media Type': res.status(415); break
    case 'Requested Range Not Satisfiable': res.status(416); break
    case 'Expectation Failed': res.status(417); break
    case `I'm a teapot`: res.status(418); break
    case 'Misdirected Request': res.status(421); break
    case 'Unprocessable Entity': res.status(422); break
    case 'Locked': res.status(423); break
    case 'Failed Dependency': res.status(424); break
    case 'Upgrade Required': res.status(426); break
    case 'Precondition Required': res.status(428); break
    case 'Too Many Requests': res.status(429); break
    case 'Request Header Fields Too Large': res.status(431); break
    case 'Connection Closed Without Response': res.status(444); break
    case 'Unavailable For Legal Reason': res.status(451); break
    case 'Client Close Request': res.status(499); break
    // 5XX Server Error
    case 'Internal Server Error': res.status(500); break
    case 'Not Implemented': res.status(501); break
    case 'Bad Gateway': res.status(502); break
    case 'Service Unavailable': res.status(503); break
    case 'Gateway Timeout': res.status(504); break
    case 'HTTP Version Not Supported': res.status(505); break
    case 'Variant Also Negotiates': res.status(506); break
    case 'Insufficient Storage': res.status(507); break
    case 'Loop Detected': res.status(508); break
    case 'Not Extended': res.status(510); break
    case 'Network Authentication Required': res.status(511); break
    case 'Network Connect Timeout Error': res.status(599); break
  }

  return res.json(responseObject)
}