DROP DATABASE IF EXISTS streaming_tm_db;
CREATE DATABASE streaming_tm_db;

USE streaming_tm_db;

CREATE TABLE Actors(
   Id_Actors INT NOT NULL AUTO_INCREMENT,
   firstname VARCHAR(50) NOT NULL,
   lastname VARCHAR(50) NOT NULL,
   birthday DATE NOT NULL,
   PRIMARY KEY(Id_Actors)
);

CREATE TABLE Directors(
   Id_Directors INT NOT NULL AUTO_INCREMENT,
   firstname VARCHAR(50) NOT NULL,
   lastname VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Directors)
);

CREATE TABLE Users(
   Id_Users INT NOT NULL AUTO_INCREMENT,
   firstname VARCHAR(50) NOT NULL,
   lastname VARCHAR(50) NOT NULL,
   email VARCHAR(255) NOT NULL,
   password VARCHAR(255) NOT NULL,
   role VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Users)
);

CREATE TABLE Movies(
   Id_Movies INT NOT NULL AUTO_INCREMENT,
   title VARCHAR(255) NOT NULL,
   duration TIME NOT NULL,
   realizedAt DATE NOT NULL,
   Id_Directors INT NOT NULL,
   PRIMARY KEY(Id_Movies),
   FOREIGN KEY(Id_Directors) REFERENCES Directors(Id_Directors)
);

CREATE TABLE Favorites(
   Id_Movies INT,
   Id_Users INT,
   PRIMARY KEY(Id_Movies, Id_Users),
   FOREIGN KEY(Id_Movies) REFERENCES Movies(Id_Movies),
   FOREIGN KEY(Id_Users) REFERENCES Users(Id_Users)
);

CREATE TABLE Casting(
   Id_Movies INT,
   Id_Actors INT,
   PRIMARY KEY(Id_Movies, Id_Actors),
   FOREIGN KEY(Id_Movies) REFERENCES Movies(Id_Movies),
   FOREIGN KEY(Id_Actors) REFERENCES Actors(Id_Actors)
);

INSERT INTO Actors (firstname, lastname, birthday)
VALUES
    ('Tom', 'Hanks', '1956-07-09'),
    ('Meryl', 'Streep', '1949-06-22'),
    ('Leonardo', 'DiCaprio', '1974-11-11'),
    ('Brad', 'Pitt', '1963-12-18'),
    ('Jennifer', 'Aniston', '1969-02-11'),
    ('Scarlett', 'Johansson', '1984-11-22'),
    ('Noah', 'Schnapp', '2004-10-03');

INSERT INTO Directors (firstname, lastname)
VALUES
    ('Steven', 'Spielberg'),
    ('Martin', 'Scorsese'),
    ('Christopher', 'Nolan'),
    ('Quentin', 'Tarantino'),
    ('Robert', 'Zemeckis'),
    ('Frank', 'Darabont'),
    ('David', 'Fincher'),
    ('Sofia', 'Coppola');

INSERT INTO Movies (title, duration, realizedAt, Id_Directors)
VALUES
    ('Forrest Gump', '02:22:00', '1994-07-06', 5),
    ('The Shawshank Redemption', '02:22:00', '1994-09-23', 6),
    ('Inception', '02:28:00', '2010-07-16', 3),
    ('Fight Club', '02:19:00', '1999-10-15', 7),
    ('Pulp Fiction', '02:34:00', '1994-10-14', 4),
    ('Lost in Translation', '01:42:00', '2003-08-29', 8);

INSERT INTO Users (firstname, lastname, email, password, role)
VALUES
    ('Emma', 'Johnson', 'emma@example.com', '$2y$10$V4cDQ73rSeCi5RN8z6dR9OV9yIYUyUfPC5d47jt32sBw8cMt332ra', 'user'),
    ('Liam', 'Smith', 'liam@example.com', '$2y$10$.sDaAK7Ini2Izlf30KRfZ.Z943lKmMWl0Kyf/RWeoUzSQ/Xp.pWg.', 'admin'),
    ('Olivia', 'Brown', 'olivia@example.com', '$2y$10$EYkEkrUopaA2Ok340HHcG.iuC0B.//JGJE4l1qySIe15uLyrllGMG', 'user'),
    ('Sophia', 'Williams', 'sophia@example.com', '$2y$10$O016AuSKLOIeDgC4rRQbqu0MshZF25DvLpEVcce2C55Lpgo2Bo.sa', 'user'),
    ('Ethan', 'Johnson', 'ethan@example.com', '$2y$10$/Lw/mWaFuVnrjrQjfTqxsOyD6IkSQMT7MFXsokeg.OyUFsYF44ox.', 'admin'),
    ('Ava', 'Davis', 'ava@example.com', '$2y$10$HpHfYyDNPpbnA/JZ7ijmLe/evn4xRvmDMWMwJVhi8H0eWqqKQJJBq', 'user');


INSERT INTO Casting (Id_Movies, Id_Actors)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (4, 4),
    (5, 1),
    (5, 2),
    (6, 3);

INSERT INTO Favorites (Id_Movies, Id_Users)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 3);