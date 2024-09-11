CREATE DATABASE personal;
USE personal;

CREATE TABLE uesrs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    full_name VARCHAR(100)
);

CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    account_type ENUM('checking', 'savings', 'credit card', 'loan') NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
);

CREATE TABLE transactions (
    id INT AUTO_INCREAMENT PRIMARY KEY,
    account_id INT,
    category_id INT,
    transaction_type ENUM('deposit','withdrawal', 'transfer') NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY ( category_id) REFERENCES categories(id)
);
