-- Создание бд для домашних работ
create database homework_db;
use homework_db;

-- Создание таблицы
create table relaxing (
    id int auto_increment primary key,
    title varchar(100) not null,
    type varchar(50) not null,
    release_year year,
    rating decimal(3,1),
    is_favorite boolean,
    created_at timestamp default current_timestamp
);

-- Вставка данных в таблицу
insert into relaxing(title, type, release_year, rating, is_favorite) values
    ('Матрица', 'Фильм', 1999, 8.7, true),
    ('Нейромант', 'Книга', 1984, 9.1, true),
    ('Space Oddity', 'Песня', 1969, 9.5, true),
    ('Марсианин', 'Фильм', 2015, 8.0, false),
    ('Грокаем алгоритмы', 'Книга', 2016, 8.5, false),
    ('Начало', 'Фильм', 2010, 8.8, true),
    ('Интерстеллар', 'Фильм', 2014, 9.0, true),
    ('Дюна', 'Фильм', 2021, 8.5, false),
    ('1984', 'Книга', 1949, 9.2, true),
    ('Дюна', 'Книга', 1965, 9.0, true),
    ('Bohemian Rhapsody', 'Песня', 1975, 9.8, true),
    ('Smells Like Teen Spirit', 'Песня', 1991, 9.2, true);

-- Проверка
select * from relaxing;