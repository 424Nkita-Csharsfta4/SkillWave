const express = require('express');
const router = express.Router();
const teacherController = require('../controllers/teacherController');

// Маршруты для добавления нового преподавателя и получения информации о преподавателе
router.post('/teachers', teacherController.addNewTeacher);
router.get('/teachers/:id', teacherController.getTeacherInfo);

module.exports = router;