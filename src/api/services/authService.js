const User = require('../models/userModel');

const register = async (username, email, password) => {
  try {
    const newUser = await User.create({ username, email, password });
    return newUser;
  } catch (error) {
    throw new Error('Registration failed');
  }
};

const login = async (email, password) => {
  try {
    // Проверка введенных учетных данных и генерация JWT токена
    // Возвращение JWT токена
  } catch (error) {
    throw new Error('Login failed');
  }
};

module.exports = {
  register,
  login,
};