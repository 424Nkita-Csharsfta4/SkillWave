const authService = require('../services/authService');

const register = async (req, res) => {
    try {
        const { username, email, password } = req.body;
        const newUser = await authService.register(username, email, password);
        res.status(201).json(newUser);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const login = async (req, res) => {
    try {
        const { email, password } = req.body;
        const token = await authService.login(email, password);
        res.status(200).json({ token });
    } catch (error) {
        res.status(401).json({ message: 'Invalid credentials' });
    }
};

module.exports = {
    register,
    login,
};