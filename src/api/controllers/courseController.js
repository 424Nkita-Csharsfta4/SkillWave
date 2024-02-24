const courseService = require('../services/courseService');

const getAllCourses = async (req, res) => {
    try {
        const courses = await courseService.getAllCourses();
        res.status(200).json(courses);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const getCourseById = async (req, res) => {
    try {
        const courseId = req.params.id;
        const course = await courseService.getCourseById(courseId);
        res.status(200).json(course);
    } catch (error) {
        res.status(404).json({ message: 'Course not found' });
    }
};


module.exports = {
    getAllCourses,
    getCourseById,
};