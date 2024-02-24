const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { handleError } = require('./utils/errorHandler');
const authRoutes = require('./api/routes/authRoutes');
const courseRoutes = require('./api/routes/courseRoutes');
const userRoutes = require('./api/routes/userRoutes');
const teacherRoutes = require('./api/routes/teacherRoutes');

const app = express();

app.use(bodyParser.json());
app.use(cors());

// Подключаем маршруты
app.use('/api/auth', authRoutes);
app.use('/api/courses', courseRoutes);
app.use('/api/users', userRoutes);
app.use('/api/teachers', teacherRoutes);

// Обработка ошибок
app.use((error, req, res, next) => {
    handleError(res, error);
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});