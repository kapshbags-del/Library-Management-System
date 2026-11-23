-- 1. Оқырмандар (10 адам)
INSERT INTO readers (full_name, email, phone, registered_at, status) VALUES
('Аружан Серікқызы', 'aruzhan.serik@example.com', '+77011112233', '2026-01-15', 'active'),
('Данияр Төлеуов', 'daniyar.t@example.com', '+77022223344', '2026-02-01', 'active'),
('Мәдина Қасымова', 'madina.k@example.com', '+77053334455', '2026-02-10', 'active'),
('Әлихан Нұрланов', 'alikhan.n@example.com', '+77074445566', '2026-03-05', 'blocked'),
('Айгерім Мұратқызы', 'aigerim.m@example.com', '+77015556677', '2026-03-18', 'active'),
('Санжар Есболов', 'sanzhar.e@example.com', '+77026667788', '2026-04-02', 'active'),
('Жансая Әбдірахман', 'zhansaya.a@example.com', '+77057778899', '2026-04-19', 'active'),
('Темірлан Омаров', 'temirlan.o@example.com', '+77078889900', '2026-05-11', 'active'),
('Камила Сейітова', 'kamila.s@example.com', '+77019990011', '2026-06-03', 'active'),
('Нұрсұлтан Бекболат', 'nursultan.b@example.com', '+77021234567', '2026-07-22', 'active');

-- 2. Авторлар (8 автор)
INSERT INTO authors (full_name, country, birth_year) VALUES
('Абай Құнанбайұлы', 'Kazakhstan', 1845),
('Мұхтар Әуезов', 'Kazakhstan', 1897),
('Ілияс Есенберлин', 'Kazakhstan', 1915),
('Robert C. Martin', 'USA', 1952),
('George Orwell', 'United Kingdom', 1903),
('Martin Kleppmann', 'United Kingdom', 1980),
('J.K. Rowling', 'United Kingdom', 1965),
('Fyodor Dostoevsky', 'Russia', 1821);

-- 3. Баспалар (5 баспа)
INSERT INTO publishers (name, city, website) VALUES
('Атамұра', 'Almaty', 'https://atamura.kz'),
('Мектеп', 'Almaty', 'https://mektep.kz'),
('Prentice Hall', 'Boston', 'https://pearson.com'),
('Secker & Warburg', 'London', NULL),
('O''Reilly Media', 'Sebastopol', 'https://oreilly.com');

-- 4. Категориялар (5 категория)
INSERT INTO categories (name, description) VALUES
('Классикалық әдебиет', 'Әлем және қазақ классикасы'),
('Бағдарламалау', 'Деректер қоры, кодтау және жүйелік талдау'),
('Ғылым және білім', 'Оқулықтар мен зерттеу еңбектері'),
('Фантастика және антиутопия', 'Көркем әдебиет бағыты'),
('Тарих және өмірбаян', 'Тарихи романдар мен зерттеулер');

-- 5. Кітапхана филиалдары (3 филиал)
INSERT INTO branches (name, address, phone) VALUES
('Орталық кітапхана', 'Алматы қ., Абай даңғылы, 181', '+77273001122'),
('Студенттік филиал', 'Алматы қ., Қазыбек би көшесі, 65', '+77273001133'),
('Алатау филиалы', 'Алматы қ., Рысқұлов даңғылы, 140', '+77273001144');

-- 6. Қызметкерлер (6 қызметкер)
INSERT INTO employees (branch_id, full_name, position, email, hired_at) VALUES
(1, 'Гүлнар Оспанова', 'Бас кітапханашы', 'gulnar.o@library.kz', '2023-09-01'),
(1, 'Ержан Ахметов', 'Кітапханашы', 'yerzhan.a@library.kz', '2024-03-15'),
(2, 'Динара Сәдуақасова', 'Филиал меңгерушісі', 'dinara.s@library.kz', '2023-11-10'),
(2, 'Мақсат Кенжебаев', 'Кітапханашы', 'maksat.k@library.kz', '2025-01-20'),
(3, 'Әсел Тұрсынқызы', 'Филиал меңгерушісі', 'asel.t@library.kz', '2024-06-05'),
(3, 'Бағдат Нұрғалиев', 'Кітапханашы', 'bagdat.n@library.kz', '2025-08-12');

-- 7. Кітаптар (8 кітап)
INSERT INTO books (title, isbn, publication_year, publisher_id, category_id) VALUES
('Қара сөздер', '978-601-282-001-1', 2020, 1, 1),
('Абай жолы', '978-601-282-002-8', 2019, 2, 1),
('Көшпенділер', '978-601-282-003-5', 2021, 1, 5),
('Clean Code', '978-0132350884', 2008, 3, 2),
('1984', '978-0451524935', 1949, 4, 4),
('Designing Data-Intensive Applications', '978-1449373320', 2017, 5, 2),
('Harry Potter and the Philosopher''s Stone', '978-0747532699', 1997, 4, 4),
('Crime and Punishment', '978-0140449136', 1866, 2, 1);

-- 8. Кітап пен автор байланысы
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4),
(5, 5), (6, 6), (7, 7), (8, 8);

-- 9. Кітап даналары (12 дана)
INSERT INTO book_copies (book_id, branch_id, inventory_number, condition, status) VALUES
(1, 1, 'INV-0001', 'good', 'borrowed'),
(1, 2, 'INV-0002', 'good', 'available'),
(2, 1, 'INV-0003', 'good', 'borrowed'),
(2, 2, 'INV-0004', 'good', 'available'),
(3, 3, 'INV-0005', 'good', 'borrowed'),
(3, 1, 'INV-0006', 'good', 'available'),
(4, 2, 'INV-0007', 'good', 'borrowed'),
(4, 1, 'INV-0008', 'good', 'available'),
(5, 1, 'INV-0009', 'fair', 'borrowed'),
(6, 2, 'INV-0010', 'good', 'available'),
(7, 3, 'INV-0011', 'good', 'borrowed'),
(8, 1, 'INV-0012', 'good', 'available');

-- 10. Кітап беру (8 жазба)
INSERT INTO borrowings (copy_id, reader_id, employee_id, borrow_date, due_date, status) VALUES
(1, 1, 1, '2026-10-20', '2026-11-03', 'overdue'),
(3, 2, 2, '2026-11-10', '2026-11-24', 'borrowed'),
(9, 4, 1, '2026-10-01', '2026-10-15', 'returned'),
(5, 5, 5, '2026-11-05', '2026-11-19', 'overdue'),
(7, 6, 4, '2026-11-12', '2026-11-26', 'borrowed'),
(11, 7, 6, '2026-11-08', '2026-11-22', 'borrowed'),
(2, 3, 3, '2026-09-10', '2026-09-24', 'returned'),
(4, 8, 4, '2026-09-15', '2026-09-29', 'returned');

-- 11. Кітап брондау (5 бронь)
INSERT INTO reservations (book_id, reader_id, branch_id, reservation_date, status) VALUES
(3, 1, 2, '2026-11-20', 'active'),
(2, 3, 1, '2026-11-21', 'active'),
(6, 5, 2, '2026-11-21', 'active'),
(4, 9, 1, '2026-11-22', 'active'),
(1, 10, 1, '2026-11-22', 'fulfilled');

-- 12. Кітап қайтару (3 қайтару)
INSERT INTO returns (borrowing_id, employee_id, return_date, condition_on_return) VALUES
(3, 1, '2026-10-25', 'fair'),
(7, 3, '2026-09-22', 'good'),
(8, 4, '2026-09-28', 'good');

-- 13. Айыппұлдар (4 айыппұл)
INSERT INTO fines (borrowing_id, reader_id, amount, reason, issued_date, status) VALUES
(1, 1, 1500.00, 'Кітапты қайтару мерзімін кешіктіру', '2026-11-05', 'unpaid'),
(3, 4, 1000.00, 'Мерзімінен кеш қайтару', '2026-10-25', 'paid'),
(4, 5, 1200.00, 'Қайтару мерзімі өтіп кетті', '2026-11-20', 'unpaid'),
(7, 3, 500.00, 'Кешіктірілген төлем', '2026-09-23', 'paid');

-- 14. Төлемдер (2 төлем)
INSERT INTO payments (fine_id, reader_id, amount, payment_date, payment_method) VALUES
(2, 4, 1000.00, '2026-10-25', 'card'),
(4, 3, 500.00, '2026-09-23', 'cash');
