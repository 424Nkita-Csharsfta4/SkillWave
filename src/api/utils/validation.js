const validateEmail = (email) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
};

const validatePassword = (password) => {
    // Пароль должен содержать не менее 8 символов, включая хотя бы одну заглавную букву, одну строчную букву и одну цифру
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    return passwordRegex.test(password);
};

module.exports = {
    validateEmail,
    validatePassword,
};