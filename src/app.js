const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const errorHandler = require('./utils/errorHandler');

const app = express();

// Middleware
app.use(bodyParser.json());
app.use(cors());

const authRoutes = require('./api/routes/authRoutes');
const courseRoutes = require('./api/routes/courseRoutes');
const userRoutes = require('./api/routes/userRoutes');
const teacherRoutes = require('./api/routes/teacherRoutes');

app.use('/api/auth', authRoutes);
app.use('/api/courses', courseRoutes);
app.use('/api/users', userRoutes);
app.use('/api/teachers', teacherRoutes);


app.use((error, req, res, next) => {
    errorHandler.handleServerError(res, error);
});

module.exports = app;