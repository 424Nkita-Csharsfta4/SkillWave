const User = require('../models/userModel');

const getUserProfile = async (userId) => {
    try {
        const user = await User.findByPk(userId);
        return user;
    } catch (error) {
        throw new Error('User not found');
    }
};

const updateUserProfile = async (userId, updatedUserData) => {
    try {
        const user = await User.findByPk(userId);
        if (!user) {
            throw new Error('User not found');
        }
        // Обновление профиля пользователя с использованием переданных данных
        return user;
    } catch (error) {
        throw new Error('Failed to update user profile');
    }
};

module.exports = {
    getUserProfile,
    updateUserProfile,
};