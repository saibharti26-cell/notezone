# College Campus Notes Sharing Web Application

A comprehensive web application designed for college students and faculty to share notes, course materials, and manage class schedules in an organized manner.

## Features

### 1. **Login System**
- Three different login options: Admin, Teacher/Staff, and Student
- Secure JWT-based authentication
- Session management with localStorage

### 2. **Admin Dashboard**
- Manage all users (Create, Read, Update, Delete)
- Manage streams (Mumbai University based)
- Manage classes across all streams
- Upload and manage timetables
- View all notes shared by students and teachers
- View overall statistics

### 3. **Teacher Dashboard**
- View assigned classes
- Upload course materials and notes
- Edit class information
- View assigned students
- Create and manage timetable entries
- Track shared materials

### 4. **Student Dashboard**
- View classes based on their stream
- Access learning materials shared by teachers
- Share personal notes with classmates
- View timetable for their classes
- Browse notes from other students in the same stream
- Delete their own notes

## Tech Stack

### Frontend
- **HTML5**: Structure and markup
- **CSS3**: Responsive styling with modern design
- **JavaScript (Vanilla)**: Client-side logic and API interactions

### Backend
- **Node.js**: Runtime environment
- **Express.js**: Web framework
- **MySQL**: Database
- **JWT**: Authentication
- **bcryptjs**: Password hashing

## Project Structure

```
college-notes-sharing/
├── public/
│   ├── css/
│   │   ├── dashboard.css       # Common dashboard styles
│   │   ├── login.css           # Login page styles
│   │   ├── admin.css           # Admin-specific styles
│   │   ├── teacher.css         # Teacher-specific styles
│   │   └── student.css         # Student-specific styles
│   ├── js/
│   │   ├── login.js            # Login functionality
│   │   ├── admin.js            # Admin dashboard logic
│   │   ├── teacher.js          # Teacher dashboard logic
│   │   └── student.js          # Student dashboard logic
│   ├── login.html              # Login page
│   ├── admin.html              # Admin dashboard
│   ├── teacher.html            # Teacher dashboard
│   └── student.html            # Student dashboard
├── routes/
│   ├── auth.js                 # Authentication routes
│   ├── admin.js                # Admin routes
│   ├── teacher.js              # Teacher routes
│   └── student.js              # Student routes
├── controllers/
│   ├── authController.js       # Authentication logic
│   ├── adminController.js      # Admin operations
│   ├── teacherController.js    # Teacher operations
│   └── studentController.js    # Student operations
├── middleware/
│   └── auth.js                 # JWT verification middleware
├── config/
│   └── database.js             # Database connection
├── app.js                      # Main application file
├── package.json                # Node.js dependencies
├── .env                        # Environment variables
└── database_schema.sql         # Database schema
```

## Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm or yarn

### Step 1: Install Dependencies
```bash
npm install
```

### Step 2: Database Setup
1. Create a MySQL database
2. Run the schema:
```bash
mysql -u your_username -p college_notes_db < database_schema.sql
```

### Step 3: Configure Environment Variables
Edit `.env` file:
```
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=college_notes_db
JWT_SECRET=your_secret_key_here_change_in_production
NODE_ENV=development
```

### Step 4: Start the Server
```bash
npm start
```

For development with auto-reload:
```bash
npm run dev
```

The application will be available at `http://localhost:3000`

## Default Login Credentials

### Admin
- **Email**: admin@example.com
- **Password**: admin123

### Teacher
- **Email**: teacher@example.com
- **Password**: teacher123

### Student
- **Email**: student@example.com
- **Password**: student123

## Mumbai University Based Streams

The application includes the following streams:
- FY (First Year)
- SY (Second Year)
- TY (Third Year)
- BCS (Bachelor of Computer Science)
- BIT (Bachelor of Information Technology)
- BE IT (Bachelor of Engineering IT)
- BSc CS (Bachelor of Science Computer Science)

These can be expanded in the database as needed.

## API Endpoints

### Authentication
- `POST /api/auth/login` - Login user
- `POST /api/auth/register` - Register new user (Admin only)
- `GET /api/auth/verify` - Verify JWT token
- `POST /api/auth/logout` - Logout user

### Admin
- `GET /api/admin/users` - Get all users
- `GET /api/admin/streams` - Get all streams
- `GET /api/admin/classes` - Get all classes
- `POST /api/admin/class` - Create class
- `PUT /api/admin/class/:id` - Update class
- `DELETE /api/admin/class/:id` - Delete class
- `GET /api/admin/timetables` - Get all timetables
- `POST /api/admin/timetable` - Create timetable
- `PUT /api/admin/timetable/:id` - Update timetable
- `DELETE /api/admin/timetable/:id` - Delete timetable

### Teacher
- `GET /api/teacher/classes` - Get assigned classes
- `GET /api/teacher/students` - Get assigned students
- `GET /api/teacher/timetables` - Get teacher's timetables
- `POST /api/teacher/material` - Upload material
- `GET /api/teacher/materials/:classId` - Get materials for class
- `PUT /api/teacher/class/:classId` - Update class info

### Student
- `GET /api/student/classes` - Get student's classes
- `GET /api/student/timetables` - Get student's timetable
- `GET /api/student/materials/:classId` - Get materials for class
- `GET /api/student/all-materials` - Get all materials for stream
- `POST /api/student/notes` - Share notes
- `GET /api/student/notes/:classId` - Get notes for class
- `GET /api/student/all-notes` - Get all notes for stream
- `DELETE /api/student/notes/:noteId` - Delete note

## Features Details

### Admin Panel
- **Overview Dashboard**: Statistics and quick actions
- **User Management**: Add, edit, delete users; filter by type and search
- **Stream Management**: View and manage Mumbai University streams
- **Class Management**: Create and manage classes across streams
- **Timetable Management**: Schedule classes and manage time slots
- **Notes Overview**: View all shared notes and materials

### Teacher Panel
- **Overview Dashboard**: Classes, students, materials, and schedule statistics
- **Class Management**: View assigned classes and edit class information
- **Course Materials**: Upload notes, presentations, and study materials
- **Student Management**: View students enrolled in their classes
- **Schedule Management**: View personal timetable

### Student Panel
- **Overview Dashboard**: Classes, learning materials, notes, and stream info
- **Class View**: Browse classes for their assigned stream
- **Learning Materials**: Access and download course materials from teachers
- **Notes Sharing**: Share personal notes with classmates
- **Student Notes**: View notes shared by other students
- **Timetable**: Check class schedule

## Security Features

1. **Password Hashing**: bcryptjs for secure password storage
2. **JWT Authentication**: Token-based authentication with expiration
3. **Route Protection**: Middleware-based authorization checks
4. **SQL Injection Prevention**: Prepared statements with parameterized queries
5. **CORS**: Cross-Origin Resource Sharing configuration

## Best Practices Implemented

1. **Modular Code**: Separated concerns (routes, controllers, middleware)
2. **Error Handling**: Try-catch blocks and proper error responses
3. **Environment Variables**: Sensitive data in .env file
4. **Database Transactions**: Proper connection handling
5. **Responsive Design**: Mobile-friendly interface
6. **User Experience**: Loading states and feedback messages

## Future Enhancements

1. File upload system for documents and PDFs
2. Search and filter functionality across all modules
3. Notification system for new materials and notes
4. Comments and ratings on shared notes
5. Discussion forum per class
6. Email notifications
7. Attendance tracking  (for teachers)
8. Grade book and assignment submission
9. Real-time collaboration tools
10. Mobile app version

## License

This project is created for educational purposes. Feel free to use and modify as needed.

## Support & Contact

For issues, questions, or suggestions, please contact the development team.

---

**Happy Learning! 📚**
