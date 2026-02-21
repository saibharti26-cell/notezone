## College Campus Notes Sharing Application - Getting Started Guide

Welcome! This guide will help you set up and run the college campus notes sharing web application.

## Quick Start (5 minutes)

### Step 1: Open Terminal/Command Prompt
Navigate to your project directory:
```bash
cd c:\Users\Admin\project
```

### Step 2: Install Dependencies
```bash
npm install
```

This will install all required Node.js packages listed in package.json

### Step 3: Set Up MySQL Database
1. Open MySQL command line or MySQL Workbench
2. Create the database:
```sql
CREATE DATABASE college_notes_db;
```

3. Run the database schema:
```bash
mysql -u root -p college_notes_db < database_schema.sql
```
(Enter your MySQL password when prompted)

### Step 4: Update Environment Variables
Edit the `.env` file with your database credentials:
```
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=college_notes_db
JWT_SECRET=your_secret_key_change_in_production
NODE_ENV=development
```

### Step 5: Start the Server
```bash
npm start
```

You should see: `Server running on port 3000`

### Step 6: Open in Browser
Navigate to: `http://localhost:3000`

## Test Login Credentials

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@example.com | admin123 |
| Teacher | teacher@example.com | teacher123 |
| Student | student@example.com | student123 |

## Project File Structure

```
project/
├── public/                 # Frontend files
│   ├── css/               # Stylesheets
│   │   ├── dashboard.css
│   │   ├── login.css
│   │   ├── admin.css
│   │   ├── teacher.css
│   │   └── student.css
│   ├── js/                # JavaScript files
│   │   ├── login.js
│   │   ├── admin.js
│   │   ├── teacher.js
│   │   └── student.js
│   ├── login.html         # Login page
│   ├── admin.html         # Admin dashboard
│   ├── teacher.html       # Teacher dashboard
│   └── student.html       # Student dashboard
├── routes/                # API routes
│   ├── auth.js
│   ├── admin.js
│   ├── teacher.js
│   └── student.js
├── controllers/           # Business logic
│   ├── authController.js
│   ├── adminController.js
│   ├── teacherController.js
│   └── studentController.js
├── middleware/            # Express middleware
│   └── auth.js
├── config/                # Configuration
│   └── database.js
├── app.js                 # Main application
├── package.json           # Dependencies
├── .env                   # Environment variables
├── database_schema.sql    # Database schema
└── README.md              # Project documentation
```

## What Each Dashboard Does

### Admin Dashboard
1. **Overview**: View statistics about users, streams, and materials
2. **Users Management**: Add, edit, and delete users
3. **Streams**: Manage university streams
4. **Classes**: Create and manage classes across streams
5. **Timetable**: Create class schedules
6. **All Notes**: View all shared notes and materials

### Teacher Dashboard
1. **Overview**: See your classes, students, and materials
2. **My Classes**: View and edit your assigned classes
3. **Course Materials**: Upload notes and study materials
4. **Students**: See all students in your classes
5. **Schedule**: View your teaching schedule

### Student Dashboard
1. **Overview**: See your classes and learning materials
2. **My Classes**: View classes in your stream
3. **Learning Materials**: Access materials uploaded by teachers
4. **Shared Notes**: View and share notes with classmates
5. **Timetable**: Check your class schedule

## Common Issues & Solutions

### Issue: "Cannot find module 'express'"
**Solution**: Run `npm install` to download dependencies

### Issue: "Access Denied for user 'root'@'localhost'"
**Solution**: Update DB_PASSWORD in `.env` file with correct MySQL password

### Issue: "Cannot GET /"
**Solution**: Make sure server is running (`npm start`) on port 3000

### Issue: "Database 'college_notes_db' doesn't exist"
**Solution**: Run the database_schema.sql file as shown in Step 3

### Issue: Port 3000 already in use
**Solution**: Change PORT in `.env` to a different number (e.g., 3001)

## Features Overview

### Authentication ✅
- 3-type login system (Admin, Teacher, Student)
- Secure password hashing
- JWT token authorization

### Admin Features ✅
- Full control over all data
- Can edit all pages and information
- User management
- Stream and class management

### Teacher Features ✅
- Upload course materials
- Edit class information
- View assigned students
- Create timetable entries
- View their schedule

### Student Features ✅
- View assigned classes (read-only)
- Access learning materials
- Share notes with classmates
- View notes from others
- Check timetable

## Mumbai University Streams Included

- FY (First Year)
- SY (Second Year)
- TY (Third Year)
- BCS (Bachelor of Computer Science)
- BIT (Bachelor of Information Technology)
- BE IT (Bachelor of Engineering IT)
- BSc CS (Bachelor of Science Computer Science)

## Database Tables

1. **users** - Store user credentials and info
2. **streams** - University streams/programs
3. **classes** - Classes within streams
4. **teacher_classes** - Map teachers to classes
5. **student_classes** - Map students to classes
6. **timetables** - Class schedules
7. **materials** - Teacher resources
8. **notes** - Student-shared notes

## API Endpoints Summary

### Authentication
- POST `/api/auth/login` - User login
- POST `/api/auth/register` - Admin creates user

### Admin Routes
- GET `/api/admin/users` - List all users
- GET `/api/admin/streams` - List all streams
- GET `/api/admin/classes` - List all classes
- POST `/api/admin/class` - Create class
- GET `/api/admin/timetables` - List schedules

### Teacher Routes
- GET `/api/teacher/classes` - My classes
- GET `/api/teacher/students` - My students
- POST `/api/teacher/material` - Upload material

### Student Routes
- GET `/api/student/classes` - My classes
- GET `/api/student/all-materials` - All materials
- POST `/api/student/notes` - Share notes
- GET `/api/student/all-notes` - All student notes

## Modifying the Application

### Adding a New Stream
1. Go to Admin Dashboard
2. Click "Streams" in sidebar
3. Click "+ Add Stream" button
4. Fill in stream name and description

### Creating a New Class
1. Admin Dashboard → Classes
2. Click "+ Add Class"
3. Select stream, enter class name and subject
4. Click "Add Class"

### Adding a User
1. Admin Dashboard → Users Management
2. Click "+ Add User"
3. Fill in user details and select user type
4. Click "Add User"

## Security Notes

⚠️ **Important for Production**:
1. Change `JWT_SECRET` in `.env` to a strong random value
2. Use environment-specific `.env` files
3. Enable HTTPS
4. Implement rate limiting
5. Add input validation
6. Use environment-based error messages

## Next Steps

1. ✅ Install and setup application
2. ✅ Test all three login types
3. ✅ Explore each dashboard
4. ✅ Create sample data (streams, classes, users)
5. ✅ Test material uploading
6. ✅ Test note sharing
7. 🔄 Customize for your institution
8. 🔄 Deploy to production server

## Support

If you encounter any issues:
1. Check the console error messages
2. Review the README.md file
3. Verify all dependencies are installed
4. Check MySQL is running
5. Verify .env file configuration

## Development Tips

- **Browser Console**: Open DevTools (F12) to see JavaScript errors
- **Network Tab**: Check API calls for errors
- **MySQL**: Verify data is being saved correctly
- **Git**: Use version control for your changes

## Performance Optimization (Future)

- Add pagination to data tables
- Implement caching
- Optimize database indexes
- Compress images and files
- Use CDN for static files

---

**You're all set! Happy coding! 🎉**

For more details, refer to README.md
