const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

// Маршруты для регистрации и входа пользователя
router.post('/register', authController.register);
router.post('/login', authController.login);

module.exports = router;