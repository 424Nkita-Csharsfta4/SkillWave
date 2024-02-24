const { validateEmail, validatePassword } = require('../utils/validation');

const validateRegistrationData = (req, res, next) => {
    const { username, email, password } = req.body;

    if (!username || !email || !password) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    if (!validateEmail(email)) {
        return res.status(400).json({ message: 'Invalid email' });
    }

    if (!validatePassword(password)) {
        return res.status(400).json({ message: 'Invalid password' });
    }

    next();
};

module.exports = {
    validateRegistrationData,
};