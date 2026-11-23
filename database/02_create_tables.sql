-- 1. Оқырмандар кестесі
CREATE TABLE readers (
    reader_id SERIAL PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(25),
    registered_at DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'active'
);

-- 2. Авторлар кестесі
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    country VARCHAR(60),
    birth_year INT
);

-- 3. Баспалар кестесі
CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    city VARCHAR(80),
    website VARCHAR(150)
);

-- 4. Кітап категориялары кестесі
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(80) UNIQUE NOT NULL,
    description TEXT
);

-- 5. Кітапхана филиалдары кестесі
CREATE TABLE branches (
    branch_id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone VARCHAR(25)
);

-- 6. Қызметкерлер кестесі
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES branches(branch_id) ON DELETE SET NULL,
    full_name VARCHAR(120) NOT NULL,
    position VARCHAR(80) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    hired_at DATE NOT NULL DEFAULT CURRENT_DATE
);

-- 7. Кітаптар кестесі
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_year INT,
    publisher_id INT REFERENCES publishers(publisher_id) ON DELETE SET NULL,
    category_id INT REFERENCES categories(category_id) ON DELETE SET NULL
);

-- 8. Кітап пен автор байланысы кестесі
CREATE TABLE book_authors (
    book_id INT NOT NULL REFERENCES books(book_id) ON DELETE CASCADE,
    author_id INT NOT NULL REFERENCES authors(author_id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, author_id)
);

-- 9. Кітап даналары кестесі
CREATE TABLE book_copies (
    copy_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL REFERENCES books(book_id) ON DELETE CASCADE,
    branch_id INT NOT NULL REFERENCES branches(branch_id) ON DELETE CASCADE,
    inventory_number VARCHAR(50) UNIQUE NOT NULL,
    condition VARCHAR(30) NOT NULL DEFAULT 'good',
    status VARCHAR(30) NOT NULL DEFAULT 'available'
);

-- 10. Кітап беру кестесі
CREATE TABLE borrowings (
    borrowing_id SERIAL PRIMARY KEY,
    copy_id INT NOT NULL REFERENCES book_copies(copy_id) ON DELETE RESTRICT,
    reader_id INT NOT NULL REFERENCES readers(reader_id) ON DELETE RESTRICT,
    employee_id INT REFERENCES employees(employee_id) ON DELETE SET NULL,
    borrow_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'borrowed'
);

-- 11. Кітап брондау кестесі
CREATE TABLE reservations (
    reservation_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL REFERENCES books(book_id) ON DELETE CASCADE,
    reader_id INT NOT NULL REFERENCES readers(reader_id) ON DELETE CASCADE,
    branch_id INT NOT NULL REFERENCES branches(branch_id) ON DELETE CASCADE,
    reservation_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(30) NOT NULL DEFAULT 'active'
);

-- 12. Кітап қайтару кестесі
CREATE TABLE returns (
    return_id SERIAL PRIMARY KEY,
    borrowing_id INT UNIQUE NOT NULL REFERENCES borrowings(borrowing_id) ON DELETE CASCADE,
    employee_id INT REFERENCES employees(employee_id) ON DELETE SET NULL,
    return_date DATE NOT NULL DEFAULT CURRENT_DATE,
    condition_on_return VARCHAR(30) NOT NULL DEFAULT 'good'
);

-- 13. Айыппұлдар кестесі
CREATE TABLE fines (
    fine_id SERIAL PRIMARY KEY,
    borrowing_id INT NOT NULL REFERENCES borrowings(borrowing_id) ON DELETE CASCADE,
    reader_id INT NOT NULL REFERENCES readers(reader_id) ON DELETE CASCADE,
    amount NUMERIC(10, 2) NOT NULL CHECK (amount >= 0),
    reason VARCHAR(200) NOT NULL,
    issued_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(30) NOT NULL DEFAULT 'unpaid'
);

-- 14. Төлемдер кестесі
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    fine_id INT NOT NULL REFERENCES fines(fine_id) ON DELETE CASCADE,
    reader_id INT NOT NULL REFERENCES readers(reader_id) ON DELETE CASCADE,
    amount NUMERIC(10, 2) NOT NULL CHECK (amount > 0),
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    payment_method VARCHAR(30) NOT NULL DEFAULT 'card'
);
