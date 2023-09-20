PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS replies;   
DROP TABLE IF EXISTS question_likes; 
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS users; 


CREATE TABLE users (
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    id INTEGER PRIMARY KEY
);

INSERT INTO
    users (fname, lname)
VALUES
    ('John','Doe'),
    ('Jane','Air');

CREATE TABLE questions (
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    id INTEGER PRIMARY KEY,

    FOREIGN KEY (author_id) REFERENCES  users(id)
);

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Salary?','How much will we make?',1),
    ('Weather?','Will it rain?',2);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NUll,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_follows (user_id,question_id)
VALUES
    (1,1),
    (1,1);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NUll,
    body TEXT NOT NULL,



    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    replies (parent_reply_id,user_id,question_id,body)
VALUES
    (1,1,1,'Yes'),
    (2,2,2,'No');

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NUll,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_likes (user_id,question_id)
VALUES
    (1,1),
    (2,2);