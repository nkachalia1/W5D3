PRAGMA foreign_keys = ON;

CREATE TABLE users (
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    id INTEGER PRIMARY KEY
);

CREATE TABLE questions (
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    id INTEGER PRIMARY KEY,

    FOREIGN KEY (author_id) REFERENCES  users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NUll,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

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

CREATE TABLE question_likes (
    
);