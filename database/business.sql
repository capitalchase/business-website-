-- =========================================================
-- PRIMECORE BUSINESS WEBSITE DATABASE
-- =========================================================

CREATE DATABASE IF NOT EXISTS business_website;

USE business_website;


-- =========================================================
-- ADMIN USERS
-- =========================================================

CREATE TABLE IF NOT EXISTS admin_users (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    full_name VARCHAR(150) NOT NULL,

    email VARCHAR(190) NOT NULL UNIQUE,

    password_hash VARCHAR(255) NOT NULL,

    role ENUM('admin', 'editor') NOT NULL DEFAULT 'admin',

    status TINYINT(1) NOT NULL DEFAULT 1,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- CONTACT / INQUIRIES
-- =========================================================

CREATE TABLE IF NOT EXISTS contact_messages (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(150) NOT NULL,

    email VARCHAR(190) NOT NULL,

    phone VARCHAR(50) DEFAULT NULL,

    company VARCHAR(190) DEFAULT NULL,

    service VARCHAR(100) DEFAULT NULL,

    budget VARCHAR(100) DEFAULT NULL,

    message TEXT NOT NULL,

    status ENUM(
        'new',
        'read',
        'replied',
        'archived'
    ) NOT NULL DEFAULT 'new',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_contact_email (email),

    INDEX idx_contact_status (status),

    INDEX idx_contact_created (created_at)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- SERVICES
-- =========================================================

CREATE TABLE IF NOT EXISTS services (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(190) NOT NULL,

    slug VARCHAR(190) NOT NULL UNIQUE,

    short_description TEXT DEFAULT NULL,

    description TEXT DEFAULT NULL,

    icon VARCHAR(100) DEFAULT NULL,

    image VARCHAR(255) DEFAULT NULL,

    sort_order INT NOT NULL DEFAULT 0,

    status TINYINT(1) NOT NULL DEFAULT 1,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- PROJECTS
-- =========================================================

CREATE TABLE IF NOT EXISTS projects (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(190) NOT NULL,

    slug VARCHAR(190) NOT NULL UNIQUE,

    category VARCHAR(100) DEFAULT NULL,

    client_name VARCHAR(190) DEFAULT NULL,

    short_description TEXT DEFAULT NULL,

    description TEXT DEFAULT NULL,

    image VARCHAR(255) DEFAULT NULL,

    completion_date DATE DEFAULT NULL,

    status TINYINT(1) NOT NULL DEFAULT 1,

    sort_order INT NOT NULL DEFAULT 0,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- TEAM MEMBERS
-- =========================================================

CREATE TABLE IF NOT EXISTS team_members (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    full_name VARCHAR(150) NOT NULL,

    position VARCHAR(150) DEFAULT NULL,

    bio TEXT DEFAULT NULL,

    photo VARCHAR(255) DEFAULT NULL,

    linkedin VARCHAR(255) DEFAULT NULL,

    email VARCHAR(190) DEFAULT NULL,

    sort_order INT NOT NULL DEFAULT 0,

    status TINYINT(1) NOT NULL DEFAULT 1,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- GALLERY
-- =========================================================

CREATE TABLE IF NOT EXISTS gallery (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(190) DEFAULT NULL,

    category VARCHAR(100) DEFAULT 'general',

    image VARCHAR(255) NOT NULL,

    description TEXT DEFAULT NULL,

    sort_order INT NOT NULL DEFAULT 0,

    status TINYINT(1) NOT NULL DEFAULT 1,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- TESTIMONIALS
-- =========================================================

CREATE TABLE IF NOT EXISTS testimonials (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    client_name VARCHAR(150) NOT NULL,

    company VARCHAR(190) DEFAULT NULL,

    position VARCHAR(150) DEFAULT NULL,

    testimonial TEXT NOT NULL,

    photo VARCHAR(255) DEFAULT NULL,

    rating TINYINT UNSIGNED DEFAULT 5,

    sort_order INT NOT NULL DEFAULT 0,

    status TINYINT(1) NOT NULL DEFAULT 1,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- NEWSLETTER SUBSCRIBERS
-- =========================================================

CREATE TABLE IF NOT EXISTS newsletter_subscribers (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    email VARCHAR(190) NOT NULL UNIQUE,

    status TINYINT(1) NOT NULL DEFAULT 1,

    subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- WEBSITE SETTINGS
-- =========================================================

CREATE TABLE IF NOT EXISTS site_settings (

    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    setting_key VARCHAR(100) NOT NULL UNIQUE,

    setting_value TEXT DEFAULT NULL,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================
-- DEFAULT SITE SETTINGS
-- =========================================================

INSERT INTO site_settings
    (setting_key, setting_value)
VALUES
    ('company_name', 'PrimeCore'),
    ('company_email', 'hello@primecore.com'),
    ('company_phone', '+234 000 000 0000'),
    ('company_address', 'Lagos, Nigeria'),
    ('business_hours', 'Monday - Friday, 8:00 AM - 6:00 PM'),
    ('facebook', ''),
    ('instagram', ''),
    ('linkedin', ''),
    ('twitter', '')
ON DUPLICATE KEY UPDATE
    setting_value = VALUES(setting_value);
