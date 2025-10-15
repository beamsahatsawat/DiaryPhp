# PHP Diary

A simple web application for keeping a personal diary with image upload support. Built with PHP and MySQL.

## Features

- Create diary entries with titles and dates
- Upload and resize images automatically
- Responsive design
- Pagination support
- Clean and modern interface

## Requirements

- PHP 7.4 or higher
- MySQL 5.7 or higher
- Web server (Apache/Nginx)
- GD extension for PHP (for image processing)

## Installation

1. Clone this repository to your web server directory:
```bash
git clone [your-repo-url]
cd php-diary
```

2. Create a MySQL database named 'diary':
```sql
CREATE DATABASE diary CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. Import the database schema:
```bash
mysql -u your_username -p diary < schema.sql
```

4. Configure the database connection:
   - Copy `inc/db-connect.example.php` to `inc/db-connect.inc.php`
   - Edit the file with your database credentials:
```php
$pdo = new PDO('mysql:host=localhost;dbname=diary;charset=utf8mb4', 'your_username', 'your_password', [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
]);
```

5. Ensure the `uploads` directory exists and is writable:
```bash
mkdir -p uploads
chmod 755 uploads
```

## Database Schema

The application uses a single table `entries` with the following structure:

```sql
CREATE TABLE entries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    message TEXT NOT NULL,
    image VARCHAR(255) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Usage

1. Navigate to the project URL in your web browser
2. Click "New entry" to create a diary entry
3. Fill in the title, date, optional image, and your diary message
4. Click "Save" to store your entry
5. View all entries on the main page with pagination

## Image Handling

- Images are automatically resized to a maximum dimension of 400px
- Original aspect ratio is maintained
- Images are converted to JPEG format
- Original filenames are sanitized and timestamped

## Directory Structure

```
├── images/           # Static image assets
├── inc/             # PHP includes
│   ├── db-connect.inc.php
│   └── functions.inc.php
├── styles/          # CSS files
├── uploads/         # User uploaded images
├── views/           # Template files
├── form.php         # New entry form
└── index.php        # Main entry list
```

## Security Features

- PDO prepared statements for SQL injection prevention
- Input sanitization
- Image upload validation
- HTML entity encoding for XSS prevention

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).