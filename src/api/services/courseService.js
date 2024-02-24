const Course = require('../models/courseModel');

const getAllCourses = async () => {
    try {
        const courses = await Course.findAll();
        return courses;
    } catch (error) {
        throw new Error('Failed to fetch courses');
    }
};

const getCourseById = async (courseId) => {
    try {
        const course = await Course.findByPk(courseId);
        return course;
    } catch (error) {
        throw new Error('Course not found');
    }
};


module.exports = {
    getAllCourses,
    getCourseById,
};