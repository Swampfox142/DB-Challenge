CREATE PROCEDURE insert_book(
    book_title VARCHAR(100),
    book_genre VARCHAR(100),
    book_published_date DATE,
    author_ids INT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    inserted_book_id INT;
    author_id INT;
BEGIN
    INSERT INTO Books (title, genre, published_date)
    VALUES (book_title, book_genre, book_published_date)
    RETURNING _id INTO inserted_book_id;

    FOREACH author_id IN ARRAY author_ids
    LOOP
        INSERT INTO BookAuthors (book_id, author_id)
        VALUES (inserted_book_id, author_id);
    END LOOP;
END;
$$;
