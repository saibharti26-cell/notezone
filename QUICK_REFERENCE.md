# QUICK REFERENCE CARD
## College Campus Notes Sharing Application

---

## 🚀 STARTUP COMMANDS

```bash
# Install dependencies (run once)
npm install

# Start server
npm start

# Run in development mode (with auto-reload)
npm run dev

# URL to access
http://localhost:3000
```

---

## 🔐 DEFAULT LOGIN CREDENTIALS

```
ADMIN
Email:    admin@example.com
Password: admin123

TEACHER  
Email:    teacher@example.com
Password: teacher123

STUDENT
Email:    student@example.com
Password: student123
```

---

## ⚙️ ENVIRONMENT SETUP (.env)

```
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password_here
DB_NAME=college_notes_db
JWT_SECRET=your_secret_key_here
NODE_ENV=development
```

---

## 💾 DATABASE SETUP

```bash
# Import database schema
mysql -u root -p college_notes_db < database_schema.sql

# View MySQL version
mysql --version

# Connect to MySQL
mysql -u root -p
```

---

## 📂 PROJECT STRUCTURE

```
project/
├── public/          → Frontend files (HTML, CSS, JS)
├── routes/          → API endpoints
├── controllers/     → Business logic
├── middleware/      → Express middleware
├── config/          → Database config
├── app.js           → Main server
├── package.json     → Dependencies
└── .env             → Configuration
```

---

## 🌐 MAIN PAGES

| Page | URL | Access |
|------|-----|--------|
| Login | http://localhost:3000 | Everyone |
| Admin Dashboard | http://localhost:3000/admin-dashboard | Admin only |
| Teacher Dashboard | http://localhost:3000/teacher-dashboard | Teacher only |
| Student Dashboard | http://localhost:3000/student-dashboard | Student only |

---

## 👥 ADMIN TASKS

- Add/edit/delete users
- Create streams and classes
- Manage timetables
- View all notes
- Monitor system

---

## 👨‍🏫 TEACHER TASKS

- View assigned classes
- Upload materials
- Edit class info
- Create schedules
- View students

---

## 👨‍🎓 STUDENT TASKS

- View classes
- Download materials
- Share notes
- View notes
- Check timetable

---

## 🗄️ MAIN DATABASE TABLES

```sql
-- View all data
SELECT * FROM users;
SELECT * FROM streams;
SELECT * FROM classes;
SELECT * FROM timetables;
SELECT * FROM materials;
SELECT * FROM notes;

-- Count records
SELECT COUNT(*) FROM users;

-- Add new stream
INSERT INTO streams (name, description) 
VALUES ('Stream Name', 'Description');

-- View specific user
SELECT * FROM users WHERE email = 'email@example.com';
```

---

## 🔌 KEY API ENDPOINTS

```
POST   /api/auth/login
POST   /api/auth/register
GET    /api/admin/users
GET    /api/admin/classes
POST   /api/teacher/material
GET    /api/student/classes
GET    /api/student/all-notes
POST   /api/student/notes
```

---

## 🛠️ TROUBLESHOOTING

| Problem | Fix |
|---------|-----|
| Port already in use | Change PORT in .env to 3001 |
| Database connection error | Check .env credentials, start MySQL |
| Login fails | Verify user exists, check password |
| 404 error | Check URL spelling, restart server |
| Styling broken | Hard refresh (Ctrl+Shift+R) |

---

## 📋 FILE CHECKLIST

✓ app.js  
✓ package.json  
✓ .env  
✓ database_schema.sql  
✓ public/login.html  
✓ public/admin.html  
✓ public/teacher.html  
✓ public/student.html  
✓ routes/ (4 files)  
✓ controllers/ (4 files)  
✓ middleware/auth.js  

---

## 🎨 CUSTOMIZATION QUICK TIPS

```javascript
// Change colors in CSS files
--primary-color: #667eea;
--secondary-color: #764ba2;

// Update institution name in JS
const INSTITUTION = "Your College";

// Add new stream to database
INSERT INTO streams VALUES (...);

// Create new user
POST /api/auth/register
```

---

## 📚 DOCUMENTATION FILES

- **README.md** - Full documentation
- **SETUP_GUIDE.md** - Installation steps
- **CONFIG.md** - Customization options
- **TROUBLESHOOTING.md** - Problem solutions
- **SUMMARY.md** - Project overview

---

## 🔐 IMPORTANT REMEMBER!

1. Keep .env file safe - contains passwords
2. Change JWT_SECRET before production
3. Backup database regularly
4. Test all features before deploying
5. Use HTTPS in production
6. Keep Node.js updated

---

## 🎯 5-MINUTE SETUP

```bash
# 1. Install
npm install

# 2. Setup database
mysql -u root -p college_notes_db < database_schema.sql

# 3. Edit .env with your MySQL password

# 4. Start
npm start

# 5. Login at http://localhost:3000
```

---

## 💡 USEFUL COMMANDS

```bash
# Clear npm cache
npm cache clean --force

# Reinstall packages
rm -rf node_modules package-lock.json
npm install

# Check Node version
node --version

# Check npm version
npm --version

# Kill process on port 3000
npx kill-port 3000
```

---

## 🌍 MUMBAI UNIVERSITY STREAMS

1. FY (First Year)
2. SY (Second Year)
3. TY (Third Year)
4. BCS (Computer Science)
5. BIT (Information Technology)
6. BE IT (Engineering IT)
7. BSc CS (Science CS)

---

## 📱 BROWSERS SUPPORTED

✅ Chrome  
✅ Firefox  
✅ Safari  
✅ Edge  
✅ Mobile browsers  

---

## 🚀 PRODUCTION CHECKLIST

- [ ] Change JWT_SECRET in .env
- [ ] Enable HTTPS
- [ ] Set NODE_ENV=production
- [ ] Configure production database
- [ ] Enable logging
- [ ] Set up automated backups
- [ ] Configure domain name
- [ ] Test all features
- [ ] Monitor performance
- [ ] Document custom changes

---

## 📞 QUICK HELP

**App won't start?**
- Check if Node.js is installed
- Verify port 3000 is free
- Check .env file exists

**Can't login?**
- Use test credentials above
- Check database is running
- Clear browser cache

**Database issues?**
- Verify MySQL is running
- Check credentials in .env
- Run schema file again

---

## 📊 TECH STACK AT A GLANCE

**Frontend**: HTML5 + CSS3 + JavaScript  
**Backend**: Node.js + Express.js  
**Database**: MySQL  
**Auth**: JWT + bcryptjs  
**Ports**: 3000 (app), 3306 (MySQL)  

---

## 🎓 KEY FEATURES

✅ 3-way login system  
✅ Complete CRUD operations  
✅ Role-based access control  
✅ Responsive design  
✅ Material sharing  
✅ Note sharing  
✅ Timetable management  
✅ User management  

---

**PRINT THIS PAGE - KEEP IT HANDY!**

---

*Last Updated: 2026*  
*Version: 1.0.0*  
*Status: Ready to Use ✅*
