const handleServerError = (res, error) => {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
};

const handleNotFoundError = (res, message) => {
    res.status(404).json({ message: message || 'Not found' });
};

module.exports = {
    handleServerError,
    handleNotFoundError,
};