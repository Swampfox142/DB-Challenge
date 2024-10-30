CREATE TABLE Authors (
    _id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    death_date DATE
);

CREATE TABLE Books (
    _id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(100),
    published_date DATE
);

CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(_id),
    FOREIGN KEY (author_id) REFERENCES Authors(_id)
);

CREATE TABLE Borrowers (
    _id SERIAL PRIMARY KEY,
    library_card_number VARCHAR(16) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE BookBorrowers (
    _id SERIAL PRIMARY KEY,
    borrower_id INT NOT NULL,
    book_id INT NOT NULL,
    borrowed_date DATE NOT NULL DEFAULT CURRENT_DATE,
    returned_date DATE,
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(_id),
    FOREIGN KEY (book_id) REFERENCES Books(_id)
);
