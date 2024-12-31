    -- Create Database
    CREATE DATABASE QuizApp;
    USE QuizApp;

    -- Create tables
    CREATE TABLE Users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        role ENUM('student', 'teacher') NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );


    CREATE TABLE Quizzes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        teacher_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (teacher_id) REFERENCES Users(id)
    );


    CREATE TABLE Questions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        quiz_id INT NOT NULL,
        text TEXT NOT NULL,
        FOREIGN KEY (quiz_id) REFERENCES Quizzes(id)
    );


    CREATE TABLE Options (
        id INT AUTO_INCREMENT PRIMARY KEY,
        question_id INT NOT NULL,
        text TEXT NOT NULL,
        is_correct BOOLEAN NOT NULL DEFAULT FALSE,
        FOREIGN KEY (question_id) REFERENCES Questions(id)
    );


    CREATE TABLE Student_Answers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        student_id INT NOT NULL,
        quiz_id INT NOT NULL,
        question_id INT NOT NULL,
        option_id INT NOT NULL,
        FOREIGN KEY (student_id) REFERENCES Users(id),
        FOREIGN KEY (quiz_id) REFERENCES Quizzes(id),
        FOREIGN KEY (question_id) REFERENCES Questions(id),
        FOREIGN KEY (option_id) REFERENCES Options(id)
    );

-- Insert Demo Data
INSERT INTO Users (name, role) VALUES
('Abu Hanif', 'teacher'),
('Rafiqul Islam', 'teacher'),
('Tanjina Akter', 'student'),
('Hasibul Alam', 'student');

INSERT INTO Quizzes (title, teacher_id) VALUES
('Bangladesh History Quiz', 1),
('General Knowledge Quiz', 2);

INSERT INTO Questions (quiz_id, text) VALUES
(1, 'What is the capital of Bangladesh?'),
(1, 'In which year did Bangladesh gain independence?');

INSERT INTO Options (question_id, text, is_correct) VALUES
(1, 'Dhaka', TRUE),
(1, 'Chittagong', FALSE),
(1, 'Khulna', FALSE),
(1, 'Sylhet', FALSE);

INSERT INTO Options (question_id, text, is_correct) VALUES
(2, '1971', TRUE),
(2, '1947', FALSE),
(2, '1965', FALSE),
(2, '1990', FALSE);


INSERT INTO Student_Answers (student_id, quiz_id, question_id, option_id) VALUES
(3, 1, 1, 1),
(3, 1, 2, 5);  


INSERT INTO Student_Answers (student_id, quiz_id, question_id, option_id) VALUES
(4, 1, 1, 1),
(4, 1, 2, 5);
