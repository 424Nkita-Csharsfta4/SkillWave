<h1>#SkillWave Api </h1>

<h2>Node.js + SupaBase</h2>

skillwave_api
│
├── src
│   ├── api
│   │   ├── controllers
│   │   │   ├── authController.js
│   │   │   ├── courseController.js
│   │   │   ├── userController.js
│   │   │   └── teacherController.js
│   │   │
│   │   ├── models
│   │   │   ├── courseModel.js
│   │   │   └── userModel.js
│   │   │
│   │   ├── routes
│   │   │   ├── authRoutes.js
│   │   │   ├── courseRoutes.js
│   │   │   ├── userRoutes.js
│   │   │   └── teacherRoutes.js
│   │   │
│   │   ├── services
│   │   │   ├── authService.js
│   │   │   ├── courseService.js
│   │   │   ├── userService.js
│   │   │   └── teacherService.js
│   │   │
│   │   └── utils
│   │       ├── errorHandler.js
│   │       └── validation.js
│   │
│   ├── config
│   │   └── config.js
│   │
│   ├── database
│   │   └── supabase.js
│   │
│   ├── middleware
│   │   ├── authMiddleware.js
│   │   └── validationMiddleware.js
│   │
│   ├── viewmodels
│   │   ├── courseViewModel.js
│   │   └── userViewModel.js
│   │
│   ├── app.js
│   └── server.js
│
├── .env
├── .gitignore
├── package.json
└── README.md

