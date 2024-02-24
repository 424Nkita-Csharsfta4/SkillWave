const jwt = require('jsonwebtoken');
const { jwtSecret } = require('../config/config');
const { handleServerError } = require('../utils/errorHandler');

const authenticateUser = (req, res, next) => {
    const token = req.headers.authorization?.split(' ')[1];

    if (!token) {
        return res.status(401).json({ message: 'Unauthorized' });
    }

    jwt.verify(token, jwtSecret, (error, decodedToken) => {
        if (error) {
            return res.status(401).json({ message: 'Invalid token' });
        }
        req.userId = decodedToken.userId;
        next();
    });
};

module.exports = {
    authenticateUser,
};