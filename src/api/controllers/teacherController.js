const teacherService = require('../services/teacherService');

const addNewTeacher = async (req, res) => {
    try {
        const newTeacher = await teacherService.addNewTeacher(req.body);
        res.status(201).json(newTeacher);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const getTeacherInfo = async (req, res) => {
    try {
        const teacherId = req.params.id;
        const teacherInfo = await teacherService.getTeacherInfo(teacherId);
        res.status(200).json(teacherInfo);
    } catch (error) {
        res.status(404).json({ message: 'Teacher not found' });
    }
};

module.exports = {
    addNewTeacher,
    getTeacherInfo,
};