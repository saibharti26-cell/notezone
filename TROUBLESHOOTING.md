## Troubleshooting Guide - Campus Notes Sharing Application

This guide helps you resolve common issues when setting up and running the application.

## Installation Issues

### Problem: "npm: command not found"
**Cause**: Node.js/npm is not installed or not in PATH

**Solution**:
1. Download Node.js from https://nodejs.org/
2. Install the LTS version
3. Restart your terminal/command prompt
4. Verify installation: `node --version` and `npm --version`

---

### Problem: "Cannot find module 'express'"
**Cause**: Dependencies not installed

**Solution**:
```bash
npm install
```

Make sure `package.json` exists in your project directory.

---

### Problem: "npm ERR! code EACCES"
**Cause**: Permission denied on npm packages

**Solution** (for Windows):
- Run as Administrator
- Delete `node_modules` folder and `package-lock.json`
- Run `npm install` again

**Solution** (for Mac/Linux):
```bash
sudo npm install -g npm
npm cache clean --force
npm install
```

---

## Database Issues

### Problem: "Access denied for user 'root'@'localhost'"
**Cause**: Wrong MySQL password in .env file

**Solution**:
1. Open `.env` file
2. Update `DB_PASSWORD` with correct MySQL password
3. Test MySQL connection:
   ```bash
   mysql -u root -p
   ```
4. Enter password when prompted
5. Try running app again

---

### Problem: "Database 'college_notes_db' doesn't exist"
**Cause**: Database wasn't created

**Solution**:
1. Open MySQL command line:
   ```bash
   mysql -u root -p
   ```
2. Create database:
   ```sql
   CREATE DATABASE college_notes_db;
   ```
3. Run schema file:
   ```bash
   mysql -u root -p college_notes_db < database_schema.sql
   ```

---

### Problem: "PROTOCOL_CONNECTION_LOST"
**Cause**: MySQL server not running

**Solution**:
1. **Windows**: 
   - Press `Win+R`, type `services.msc`
   - Find "MySQL" service
   - Click "Start" if it's stopped

2. **Mac**:
   ```bash
   brew services start mysql
   ```

3. **Linux**:
   ```bash
   sudo service mysql start
   ```

---

### Problem: "ER_PARSE_ERROR" in database schema
**Cause**: MySQL version incompatibility

**Solution**:
1. Check MySQL version:
   ```sql
   SELECT VERSION();
   ```
2. Update database connection in `.env`
3. Modify SQL syntax if needed for your version

---

## Server Issues

### Problem: "Port 3000 already in use"
**Cause**: Another process using port 3000

**Solution**:
1. Change port in `.env`:
   ```
   PORT=3001
   ```
2. Or kill process using port 3000:

   **Windows**:
   ```bash
   netstat -ano | findstr :3000
   taskkill /PID <PID> /F
   ```

   **Mac/Linux**:
   ```bash
   lsof -i :3000
   kill -9 <PID>
   ```

---

### Problem: "Cannot GET /"
**Cause**: Server not running or wrong URL

**Solution**:
1. Make sure terminal shows: "Server running on port 3000"
2. Check URL is correct: `http://localhost:3000`
3. Restart server: `npm start`

---

### Problem: "ECONNREFUSED 127.0.0.1:3000"
**Cause**: Server crashed or not started

**Solution**:
1. Check terminal for error messages
2. Look at full error output
3. Try `npm start` again
4. Check if port is available

---

## Authentication Issues

### Problem: "Login failed. Please try again."
**Cause**: Wrong credentials or user doesn't exist

**Solution**:
1. Use default credentials:
   - Admin: `admin@example.com` / `admin123`
   - Teacher: `teacher@example.com` / `teacher123`
   - Student: `student@example.com` / `student123`

2. Check database has user:
   ```sql
   SELECT * FROM users;
   ```

3. Verify password hashing is correct

---

### Problem: "Invalid token"
**Cause**: Expired or tampered token

**Solution**:
1. Clear browser cache: `Ctrl+Shift+Delete`
2. Clear localStorage: Open DevTools → Application → Clear
3. Log out and log in again
4. Check if `JWT_SECRET` is same in `.env`

---

### Problem: "Unauthorized" error
**Cause**: Missing or invalid authorization header

**Solution**:
1. Make sure token is being sent in API calls
2. Check token is valid: `localStorage.getItem('token')` in console
3. Verify user type matches role requirements
4. Clear cookies and try again

---

## API Issues

### Problem: "Cannot POST /api/auth/login"
**Cause**: Route not configured

**Solution**:
1. Check `routes/auth.js` exists
2. Verify route is registered in `app.js`
3. Make sure Express middleware is set up
4. Restart server after checking files

---

### Problem: "CORS error"
**Cause**: Cross-Origin Resource Sharing not configured

**Solution**:
In `app.js`, make sure CORS is enabled:
```javascript
const cors = require('cors');
app.use(cors());
```

---

### Problem: API returns "Not Found" (404)
**Cause**: Wrong endpoint or route not defined

**Solution**:
1. Check endpoint URL is correct
2. Verify route file exists in `routes/` folder
3. Check spelling of endpoint
4. Restart server after changes

---

### Problem: API returns empty response
**Cause**: Database query returned no data

**Solution**:
1. Check if data exists: `SELECT * FROM table_name;` in MySQL
2. Verify query syntax is correct
3. Check user has permission to access data
4. Add debug logging to see query

---

## Frontend Issues

### Problem: "Blank white screen"
**Cause**: JavaScript error or page not loading

**Solution**:
1. Open Browser DevTools: `F12`
2. Check Console tab for errors
3. Check Network tab - are files loading?
4. Refresh page: `Ctrl+F5` (hard refresh)
5. Clear browser cache

---

### Problem: "Styling not working"
**Cause**: CSS file not loading

**Solution**:
1. Check CSS file exists: `public/css/`
2. Verify path in HTML: Should be `/css/filename.css`
3. Hard refresh page: `Ctrl+Shift+R`
4. Open DevTools → Network → check if CSS loaded
5. Check file permissions

---

### Problem: "Images not showing"
**Cause**: Image path wrong or image missing

**Solution**:
1. Verify image exists in `public/images/`
2. Check path in HTML: `<img src="/images/filename">`
3. Verify file extension is correct
4. Try full URL instead of relative path

---

### Problem: "Page layout broken"
**Cause**: CSS not applied or responsive design issue

**Solution**:
1. Hard refresh: `Ctrl+Shift+R`
2. Check viewport meta tag in HTML
3. Open DevTools → Responsive Design Mode (Ctrl+Shift+M)
4. Check browser zoom: `Ctrl+0` to reset
5. Clear browser cache

---

## JavaScript Issues

### Problem: "Uncaught ReferenceError: function not defined"
**Cause**: Function not loaded or wrong scope

**Solution**:
1. Check JavaScript file is linked in HTML
2. Verify function name spelling
3. Check function is in global scope
4. Make sure .js file comes after needed libraries
5. Check for typos in function calls

---

### Problem: "Cannot read property of undefined"
**Cause**: Trying to access property of undefined variable

**Solution**:
1. Add null checks before accessing properties
2. Use optional chaining: `obj?.property`
3. Initialize variables before use
4. Check API response format

---

### Problem: "Fetch request fails silently"
**Cause**: Network error or CORS issue

**Solution**:
1. Check Network tab in DevTools
2. Verify API endpoint is correct
3. Check server is running
4. Look for CORS error messages
5. Check request headers

---

## Performance Issues

### Problem: "Application runs slowly"
**Cause**: Many factors - database, network, client

**Solution**:
1. **Database**:
   - Check indexes: `SHOW INDEX FROM table_name;`
   - Optimize queries
   - Check database server status

2. **Network**:
   - Check API response times in Network tab
   - Reduce payload size
   - Enable compression

3. **Client**:
   - Minimize JavaScript
   - Lazy load images
   - Reduce DOM reflows

---

### Problem: "High memory usage"
**Cause**: Memory leak or too much data loading

**Solution**:
1. Check for infinite loops
2. Clear event listeners
3. Limit data pagination
4. Restart server regularly
5. Monitor with `node --inspect`

---

## Browser-Specific Issues

### Problem: "Works in Chrome but not in Firefox/Safari"
**Cause**: Browser compatibility issue

**Solution**:
1. Check for unsupported JavaScript features
2. Use polyfills if needed
3. Check CSS browser prefixes
4. Test in different browsers
5. Use transpilers like Babel

---

## Debugging Tips

### Enable Debug Mode
Edit `app.js`:
```javascript
process.env.NODE_ENV = 'development';
console.log('Debug mode ON');
```

### View Server Logs
1. Check terminal output while running
2. Look for red error messages
3. Add `console.log()` in controllers

### Check Browser Console
1. Press `F12`
2. Click "Console" tab
3. Look for errors in red
4. Check Network requests

### Database Debugging
```sql
-- Check all users
SELECT * FROM users;

-- Check specific data
SELECT * FROM classes WHERE stream_id = 1;

-- Check table structure
DESCRIBE table_name;

-- Count records
SELECT COUNT(*) FROM table_name;
```

### API Testing
Use tools like:
- Postman (https://www.postman.com/)
- Insomnia (https://insomnia.rest/)
- Thunder Client (VS Code extension)

Test endpoints:
```
POST http://localhost:3000/api/auth/login
Headers: Content-Type: application/json

Body:
{
  "email": "admin@example.com",
  "password": "admin123",
  "userType": "admin"
}
```

---

## Getting Help

If you still have issues:

1. **Read Error Messages Carefully**: They usually tell you what's wrong
2. **Check the Console**: Both browser and server console
3. **Review README.md**: May answer your question
4. **Check Configuration**: Verify `.env` and `package.json`
5. **Restart Everything**: Close and reopen terminal, server, browser
6. **Search Stack Overflow**: Include full error message in search
7. **Check Project Documentation**: May have specific requirements

### Useful Commands

```bash
# Check Node version
node --version

# Check npm version
npm --version

# Check MySQL version
mysql --version

# Clear npm cache
npm cache clean --force

# Reinstall packages
rm -rf node_modules package-lock.json
npm install

# Run with debug logging
NODE_DEBUG=http node app.js
```

---

## Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| ECONNREFUSED | Server not running | Run `npm start` |
| EACCES | Permission denied | Run with sudo or check permissions |
| ENOENT | File not found | Check file exists, verify path |
| Error: connect ECONNREFUSED 127.0.0.1:3306 | MySQL not running | Start MySQL service |
| ER_DUP_ENTRY | Duplicate key | Data already exists, use different value |
| ER_NO_REFERENCED_ROW | Foreign key error | Parent record doesn't exist |
| SyntaxError | Invalid JavaScript | Check syntax, look for missing commas/brackets |
| TypeError: Cannot read property | Undefined variable | Add null checks, initialize variables |

---

## Prevention Tips

1. ✅ Always check `.env` file is configured correctly
2. ✅ Keep MySQL server running
3. ✅ Restart server after changing files
4. ✅ Hard refresh browser (Ctrl+Shift+R)
5. ✅ Check terminal for error messages
6. ✅ Use descriptive variable names
7. ✅ Test API endpoints with Postman
8. ✅ Backup database regularly
9. ✅ Use Git for version control
10. ✅ Test in different browsers

---

**Still having issues? Make sure all services are running and configuration is correct!**

Happy troubleshooting! 🔧

