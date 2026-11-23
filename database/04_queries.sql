-- 1. Оқырмандар мен олар алған кітаптар (JOIN + CASE)
SELECT 
    r.full_name AS reader_name,
    r.status AS reader_status,
    b.title AS book_title,
    br.borrow_date,
    br.due_date,
    CASE 
        WHEN br.status = 'overdue' THEN 'Мерзімі өткен'
        WHEN br.status = 'borrowed' THEN 'Қолда бар'
        ELSE 'Қайтарылған'
    END AS borrowing_status
FROM borrowings br
JOIN readers r ON br.reader_id = r.reader_id
JOIN book_copies bc ON br.copy_id = bc.copy_id
JOIN books b ON bc.book_id = b.book_id
ORDER BY br.borrow_date DESC;

-- 2. Оқырмандардың айыппұл сомасы (JOIN + GROUP BY + HAVING)
SELECT 
    r.full_name AS reader_name,
    COUNT(f.fine_id) AS fines_count,
    SUM(f.amount) AS total_fine_amount
FROM readers r
JOIN fines f ON r.reader_id = f.reader_id
GROUP BY r.reader_id, r.full_name
HAVING SUM(f.amount) > 500
ORDER BY total_fine_amount DESC;

-- 3. Айыппұл мәртебесін жаңарту (UPDATE) және тексеру (SELECT)
UPDATE fines
SET status = 'paid'
WHERE fine_id = 1;

SELECT fine_id, reader_id, amount, status
FROM fines
WHERE fine_id = 1;

-- 4. Брондау жазбасын жою (DELETE) және тексеру (SELECT)
DELETE FROM reservations
WHERE reservation_id = 5;

SELECT reservation_id, book_id, reader_id, status
FROM reservations
ORDER BY reservation_id;
