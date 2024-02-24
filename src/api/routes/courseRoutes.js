const express = require('express');
const router = express.Router();
const courseController = require('../controllers/courseController');

// Маршруты для получения списка всех курсов и информации о конкретном курсе
router.get('/courses', courseController.getAllCourses);
router.get('/courses/:id', courseController.getCourseById);


module.exports = router;