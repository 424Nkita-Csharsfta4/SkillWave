const userService = require('../services/userService');

const getUserProfile = async (req, res) => {
    try {
        const userId = req.params.id;
        const userProfile = await userService.getUserProfile(userId);
        res.status(200).json(userProfile);
    } catch (error) {
        res.status(404).json({ message: 'User not found' });
    }
};

const updateUserProfile = async (req, res) => {
    try {
        const userId = req.params.id;
        const updatedUserProfile = await userService.updateUserProfile(userId, req.body);
        res.status(200).json(updatedUserProfile);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

module.exports = {
    getUserProfile,
    updateUserProfile,
};