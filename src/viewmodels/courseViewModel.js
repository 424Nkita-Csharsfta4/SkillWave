const adaptCourse = (course) => {
    return {
        id: course.id,
        name: course.name,
        description: course.description,
        imageUrl: course.imageUrl,
    };
};

module.exports = {
    adaptCourse,
};