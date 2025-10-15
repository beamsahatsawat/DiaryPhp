-- Create the diary database if it doesn't exist
CREATE DATABASE IF NOT EXISTS diary CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE diary;

-- Create the entries table
CREATE TABLE IF NOT EXISTS entries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    message TEXT NOT NULL,
    image VARCHAR(255) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_date (date DESC),
    INDEX idx_created_at (created_at DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create sample entry (optional, comment out if not needed)
INSERT INTO entries (title, date, message) VALUES 
('Welcome to PHP Diary', CURRENT_DATE, 'This is your first diary entry. You can add more entries by clicking the "New entry" button.');