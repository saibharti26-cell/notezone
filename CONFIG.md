/* 
 * College Campus Notes Sharing Application
 * Configuration & Customization Guide
 */

// APPLICATION SETTINGS
const APP_CONFIG = {
    // Application Name
    APP_NAME: "Campus Notes Sharing",
    APP_VERSION: "1.0.0",
    
    // Institution Details
    INSTITUTION: {
        name: "Your College/University Name",
        location: "Mumbai, India",
        website: "https://yourcollegename.edu"
    },
    
    // API Configuration
    API: {
        BASE_URL: "http://localhost:3000/api",
        TIMEOUT: 30000, // 30 seconds
        RETRY_ATTEMPTS: 3
    },
    
    // Authentication
    AUTH: {
        TOKEN_EXPIRES_IN: "24h",
        REFRESH_TOKEN_EXPIRES_IN: "7d",
        PASSWORD_MIN_LENGTH: 6,
        SESSION_TIMEOUT: 3600000 // 1 hour in milliseconds
    },
    
    // Features
    FEATURES: {
        ENABLE_FILE_UPLOAD: true,
        ENABLE_USER_REGISTRATION: false, // Set to true to allow self-registration
        ENABLE_EMAIL_NOTIFICATIONS: false, // Set to true when email service is configured
        ENABLE_ASSIGNMENTS: false, // Future feature
        ENABLE_DISCUSSIONS: false, // Future feature
        MAX_FILE_SIZE: 10485760 // 10MB in bytes
    },
    
    // UI Customization
    UI: {
        THEME: {
            PRIMARY_COLOR: "#667eea",
            SECONDARY_COLOR: "#764ba2",
            ACCENT_COLOR: "#FF6B6B",
            BACKGROUND_COLOR: "#f5f5f5",
            TEXT_COLOR: "#333333"
        },
        
        SIDEBAR: {
            POSITION: "left", // or "right"
            WIDTH: "250px",
            COLLAPSIBLE: true
        },
        
        ANIMATIONS: {
            ENABLED: true,
            DURATION: "0.3s"
        }
    },
    
    // Database
    DATABASE: {
        MAX_CONNECTIONS: 10,
        TIMEOUT: 30000,
        DEBUG: false
    },
    
    // Mumbai University Streams (Customizable)
    STREAMS: [
        {
            id: 1,
            name: "FY (First Year)",
            description: "First Year students across all streams"
        },
        {
            id: 2,
            name: "SY (Second Year)",
            description: "Second Year students across all streams"
        },
        {
            id: 3,
            name: "TY (Third Year)",
            description: "Third Year students across all streams"
        },
        {
            id: 4,
            name: "BCS (Bachelor of Computer Science)",
            description: "Computer Science Stream"
        },
        {
            id: 5,
            name: "BIT (Bachelor of Information Technology)",
            description: "Information Technology Stream"
        },
        {
            id: 6,
            name: "BE IT (Bachelor of Engineering IT)",
            description: "Engineering IT Stream"
        },
        {
            id: 7,
            name: "BSc CS (Bachelor of Science Computer Science)",
            description: "Science Computer Science Stream"
        }
    ],
    
    // Days of Week (for timetable)
    DAYS: [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"
    ],
    
    // User Roles & Permissions
    ROLES: {
        ADMIN: {
            name: "Administrator",
            permissions: [
                "VIEW_ALL_DATA",
                "CREATE_USER",
                "EDIT_USER",
                "DELETE_USER",
                "CREATE_STREAM",
                "EDIT_STREAM",
                "DELETE_STREAM",
                "CREATE_CLASS",
                "EDIT_CLASS",
                "DELETE_CLASS",
                "CREATE_TIMETABLE",
                "EDIT_TIMETABLE",
                "DELETE_TIMETABLE",
                "VIEW_ALL_NOTES",
                "DELETE_NOTES"
            ]
        },
        TEACHER: {
            name: "Teacher/Staff",
            permissions: [
                "VIEW_CLASS",
                "EDIT_CLASS",
                "VIEW_STUDENTS",
                "UPLOAD_MATERIALS",
                "EDIT_MATERIALS",
                "DELETE_OWN_MATERIALS",
                "CREATE_TIMETABLE",
                "VIEW_TIMETABLE"
            ]
        },
        STUDENT: {
            name: "Student",
            permissions: [
                "VIEW_CLASSES",
                "VIEW_MATERIALS",
                "SHARE_NOTES",
                "VIEW_STUDENT_NOTES",
                "DELETE_OWN_NOTES",
                "VIEW_TIMETABLE"
            ]
        }
    },
    
    // Email Configuration (for future use)
    EMAIL: {
        ENABLED: false,
        PROVIDER: "gmail", // or "sendgrid", "mailgun"
        FROM_EMAIL: "noreply@yourcollegename.edu",
        FROM_NAME: "Campus Notes Sharing"
    },
    
    // File Upload Configuration
    FILE_UPLOAD: {
        ENABLED: true,
        ALLOWED_TYPES: [
            "application/pdf",
            "application/msword",
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "application/vnd.ms-excel",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "text/plain",
            "image/jpeg",
            "image/png"
        ],
        MAX_SIZE: 10485760, // 10MB
        UPLOAD_PATH: "./uploads"
    },
    
    // Logging
    LOGGING: {
        ENABLED: true,
        LEVEL: "info", // "error", "warn", "info", "debug"
        FILE: "./logs/app.log"
    },
    
    // Validation Rules
    VALIDATION: {
        USERNAME_MIN_LENGTH: 3,
        USERNAME_MAX_LENGTH: 50,
        PASSWORD_MIN_LENGTH: 6,
        PASSWORD_REQUIRE_UPPERCASE: true,
        PASSWORD_REQUIRE_NUMBERS: true,
        EMAIL_VALIDATION: /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    },
    
    // Pagination
    PAGINATION: {
        DEFAULT_PAGE_SIZE: 10,
        MAX_PAGE_SIZE: 100,
        ALLOWED_SIZES: [10, 25, 50, 100]
    },
    
    // Search
    SEARCH: {
        MIN_CHARACTERS: 2,
        SEARCH_FIELDS: {
            USERS: ["name", "email"],
            CLASSES: ["class_name", "subject"],
            MATERIALS: ["title", "description"],
            NOTES: ["title", "description"]
        }
    }
};

// Customization Examples
// ========================

// Example 1: Change Application Colors for Your Institution
// Set your college colors
APP_CONFIG.UI.THEME.PRIMARY_COLOR = "#FF6B35";      // Your primary color
APP_CONFIG.UI.THEME.SECONDARY_COLOR = "#004E89";    // Your secondary color
APP_CONFIG.UI.THEME.ACCENT_COLOR = "#1BBC9B";       // Your accent color

// Example 2: Add Your Institution Details
APP_CONFIG.INSTITUTION.name = "Mumbai University";
APP_CONFIG.INSTITUTION.location = "Mumbai, India";
APP_CONFIG.INSTITUTION.website = "https://mu.ac.in";

// Example 3: Customize Streams for Your College
APP_CONFIG.STREAMS = [
    {
        id: 1,
        name: "Engineering (IT)",
        description: "Bachelor of Engineering in Information Technology"
    },
    {
        id: 2,
        name: "Engineering (CS)",
        description: "Bachelor of Engineering in Computer Science"
    },
    {
        id: 3,
        name: "Science (CS)",
        description: "Bachelor of Science in Computer Science"
    },
    {
        id: 4,
        name: "Commerce",
        description: "Bachelor of Commerce"
    },
    {
        id: 5,
        name: "Arts",
        description: "Bachelor of Arts"
    }
];

// Example 4: Enable/Disable Features
APP_CONFIG.FEATURES.ENABLE_FILE_UPLOAD = true;
APP_CONFIG.FEATURES.ENABLE_USER_REGISTRATION = false; // Controlled registration
APP_CONFIG.FEATURES.ENABLE_EMAIL_NOTIFICATIONS = false; // Enable when ready

// Example 5: Adjust Session Timeout
APP_CONFIG.AUTH.SESSION_TIMEOUT = 7200000; // 2 hours

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = APP_CONFIG;
}

// JavaScript Constants for Frontend
// ==================================

// Use these in your HTML/JS files:
/*
// In HTML head:
<script>
    const CONFIG = {
        API_URL: "http://localhost:3000/api",
        APP_NAME: "Campus Notes Sharing",
        INSTITUTION: "Your College Name"
    };
</script>

// In your JavaScript:
const apiCall = async (endpoint) => {
    return fetch(`${CONFIG.API_URL}${endpoint}`);
};

// Change theme colors dynamically
document.documentElement.style.setProperty('--primary-color', '#FF6B35');
document.documentElement.style.setProperty('--secondary-color', '#004E89');
*/

// SQL Configuration
// =================
/*
To add more streams to the database, run:

INSERT INTO streams (name, description) VALUES
('Your Stream 1', 'Description 1'),
('Your Stream 2', 'Description 2'),
('Your Stream 3', 'Description 3');

To update stream information:

UPDATE streams SET description = 'New Description' WHERE name = 'Stream Name';

To view all streams:

SELECT * FROM streams;
*/

// Environment-Specific Configuration
// ===================================

const getEnvConfig = () => {
    const env = process.env.NODE_ENV || 'development';
    
    if (env === 'production') {
        return {
            API_URL: "https://yourcollegename.com/api",
            DEBUG: false,
            LOG_LEVEL: "warn",
            CACHE_ENABLED: true
        };
    } else if (env === 'staging') {
        return {
            API_URL: "https://staging.yourcollegename.com/api",
            DEBUG: true,
            LOG_LEVEL: "info",
            CACHE_ENABLED: true
        };
    } else { // development
        return {
            API_URL: "http://localhost:3000/api",
            DEBUG: true,
            LOG_LEVEL: "debug",
            CACHE_ENABLED: false
        };
    }
};

// Common Customizations Checklist
// ================================

/*
☐ 1. Update APP_CONFIG.INSTITUTION with your college name
☐ 2. Customize colors in APP_CONFIG.UI.THEME
☐ 3. Update STREAMS to match your college programs
☐ 4. Set up email configuration if using notifications
☐ 5. Configure file upload settings if needed
☐ 6. Set appropriate session timeout
☐ 7. Review and enable/disable features as needed
☐ 8. Set up logging level appropriate for environment
☐ 9. Configure maximum file upload size
☐ 10. Customize validation rules if needed

For More Help:
- See README.md for feature documentation
- Check SETUP_GUIDE.md for installation help
- Review API documentation for endpoint details
*/
