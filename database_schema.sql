-- College Notes Sharing Database Schema

-- Create database
CREATE DATABASE IF NOT EXISTS college_notes_db;
USE college_notes_db;

-- Users table
CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `user_type` ENUM('admin', 'teacher', 'student') NOT NULL,
  `stream` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `idx_email` (`email`),
  INDEX `idx_user_type` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Streams table (Mumbai University based streams)
CREATE TABLE `streams` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) UNIQUE NOT NULL,
  `description` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Classes table
CREATE TABLE `classes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `stream_id` INT NOT NULL,
  `class_name` VARCHAR(255) NOT NULL,
  `subject` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE CASCADE,
  INDEX `idx_stream_id` (`stream_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Teacher Classes Junction table
CREATE TABLE `teacher_classes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `teacher_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  UNIQUE KEY `unique_teacher_class` (`teacher_id`, `class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Student Classes Junction table
CREATE TABLE `student_classes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `student_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  UNIQUE KEY `unique_student_class` (`student_id`, `class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Timetable table
CREATE TABLE `timetables` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `class_id` INT NOT NULL,
  `day_of_week` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `subject` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  INDEX `idx_class_id` (`class_id`),
  INDEX `idx_day` (`day_of_week`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Materials table (Teacher resources)
CREATE TABLE `materials` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `class_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `content` LONGTEXT,
  `file_url` VARCHAR(500),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  INDEX `idx_class_id` (`class_id`),
  INDEX `idx_teacher_id` (`teacher_id`),
  INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Notes table (Student shared notes)
CREATE TABLE `notes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `class_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `content` LONGTEXT,
  `file_url` VARCHAR(500),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  INDEX `idx_class_id` (`class_id`),
  INDEX `idx_student_id` (`student_id`),
  INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample Mumbai University based streams
INSERT INTO `streams` (`name`, `description`) VALUES
('FY (First Year)', 'First Year students across all streams'),
('SY (Second Year)', 'Second Year students across all streams'),
('TY (Third Year)', 'Third Year students across all streams'),
('BCS (Bachelor of Computer Science)', 'Computer Science Stream'),
('BIT (Bachelor of Information Technology)', 'Information Technology Stream'),
('BE IT (Bachelor of Engineering IT)', 'Engineering IT Stream'),
('BSc CS (Bachelor of Science Computer Science)', 'Science Computer Science Stream');

-- Create sample admin user (password: admin123)
INSERT INTO `users` (`name`, `email`, `password`, `user_type`) VALUES
('Admin User', 'admin@example.com', '$2a$10$H/cIPz0ZK87fdB.rwWbu4eQd5pN0jc2d.4qc6kZK6Qu6PoVT0VJ/a', 'admin');

-- Create sample teacher user (password: teacher123)
INSERT INTO `users` (`name`, `email`, `password`, `user_type`) VALUES
('John teacher', 'teacher@example.com', '$2a$10$Xm9G1qVpJ2z8jKn7Q5K3l.9Zq1L8Ro4M5S2T3U4V5W6X7Y8Z9A0b', 'teacher');

-- Create sample student user (password: student123) with stream
INSERT INTO `users` (`name`, `email`, `password`, `user_type`, `stream`) VALUES
('Alice Student', 'student@example.com', '$2a$10$kL9K8J7I6H5G4F3E2D1C0B9A8Z7Y6X5W4V3U2T1S0R9Q8P7O6N5M4', 'student', 'FY (First Year)');
