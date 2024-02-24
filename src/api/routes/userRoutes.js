const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// Маршруты для получения профиля пользователя и обновления профиля
router.get('/users/:id', userController.getUserProfile);
router.put('/users/:id', userController.updateUserProfile);

module.exports = router;