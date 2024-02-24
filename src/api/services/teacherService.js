const Teacher = require('../models/teacherModel');

const addNewTeacher = async (teacherData) => {
    try {
        const newTeacher = await Teacher.create(teacherData);
        return newTeacher;
    } catch (error) {
        throw new Error('Failed to add new teacher');
    }
};

const getTeacherInfo = async (teacherId) => {
    try {
        const teacher = await Teacher.findByPk(teacherId);
        return teacher;
    } catch (error) {
        throw new Error('Teacher not found');
    }
};

module.exports = {
    addNewTeacher,
    getTeacherInfo,
};