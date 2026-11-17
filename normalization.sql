-- Задача №5

-- Создание исходной таблицы
create table project_unnormalized (
    project_id int primary key,
    project_name varchar(100),
    manager_id int,
    manager_name varchar(100)
);

-- Pаполнение исходной таблицы данными
insert into project_unnormalized (project_id, project_name, manager_id, manager_name) 
values
    (1, 'Разработка CRM', 101, 'Иванов И.И.'),
    (2, 'Мобильное приложение', 101, 'Иванов И.И.'),
    (3, 'Редизайн сайта', 102, 'Смирнова А.А.'),
    (4, 'Миграция БД', 103, 'Петров П.П.');

-- Приведение к нормальной форме

-- таблица для руководителей
create table managers (
    manager_id int primary key,
    manager_name varchar(100)
);

-- нормализованная таблица проектов
create table projects (
    project_id int primary key,
    project_name varchar(100),
    manager_id int,
    foreign key (manager_id) references managers(manager_id)
);

-- Перенос данных из ненормализованной таблицы в новые
insert into managers (manager_id, manager_name)
select distinct manager_id, manager_name 
from project_unnormalized;

insert into projects (project_id, project_name, manager_id)
select project_id, project_name, manager_id 
from project_unnormalized;