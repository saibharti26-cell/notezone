const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');
const db = require('./config/database');
require('dotenv').config();

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// Set views directory
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'html');
app.engine('html', (filepath, options, callback) => {
    const fs = require('fs');
    fs.readFile(filepath, (err, content) => {
        if (err) return callback(err);
        return callback(null, content.toString());
    });
});


//testdb
// Test Database Connection
async function testDBConnection() {
    try {
        const connection = await db.getConnection();
        console.log('✅ Database connected successfully');
        connection.release();
    } catch (error) {
        console.error('❌ Database connection failed:', error.message);
    }
}

testDBConnection();

// Routes
app.use('/api/auth', require('./routes/auth'));
app.use('/api/admin', require('./routes/admin'));
app.use('/api/teacher', require('./routes/teacher'));
app.use('/api/student', require('./routes/student'));

// Serve HTML pages
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'login.html'));
});

app.get('/admin-dashboard', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'admin.html'));
});

app.get('/teacher-dashboard', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'teacher.html'));
});

app.get('/student-dashboard', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'student.html'));
});

app.get('/student-notes', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'student-notes.html'));
});

// Error handling
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ error: 'Something went wrong!' });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
