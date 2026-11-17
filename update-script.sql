-- 1.1 найдите клиентов gary harrison, michael atwood, amy majors, katherine smith
-- и обновите дату их рождения до 21.10.1930, 12.04.1934, 01.08.1975, 22.09.1959 соответственно

-- клиент 1: gary harrison
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from clients where name = 'gary' and lastname = 'harrison';
-- обновление даты рождения (обновлено строк: 1)
update clients set dbirth = '1930-10-21' where name = 'gary' and lastname = 'harrison' limit 1;

-- клиент 2: michael atwood
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from clients where name = 'michael' and lastname = 'atwood';
-- обновление даты рождения (обновлено строк: 0, так как значение уже совпадало)
update clients set dbirth = '1934-04-12' where name = 'michael' and lastname = 'atwood' limit 1;

-- клиент 3: amy majors
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from clients where name = 'amy' and lastname = 'majors';
-- обновление даты рождения (обновлено строк: 1)
update clients set dbirth = '1975-08-01' where name = 'amy' and lastname = 'majors' limit 1;

-- клиент 4: katherine smith
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from clients where name = 'katherine' and lastname = 'smith';
-- обновление даты рождения (обновлено строк: 0, так как значение уже совпадало)
update clients set dbirth = '1959-09-22' where name = 'katherine' and lastname = 'smith' limit 1;


-- 1.2 найдите клиентов с годом рождения ранее 1933 года и удалите номер телефона
-- предварительный поиск и подсчет записей (найдено записей: 13)
select count(*) from clients where dbirth < '1933-01-01';
-- удаление номера телефона (обновлено строк: 13)
update clients set phone = null where dbirth < '1933-01-01' limit 13;


-- 1.3 исправьте ошибку клиента john ohara, его настоящее имя johanna ohara, не забудьте поправить и пол клиента
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from clients where name = 'john' and lastname = 'ohara';
-- обновление имени и пола (обновлено строк: 1)
update clients set name = 'johanna', gender = 'f' where name = 'john' and lastname = 'ohara' limit 1;


-- 1.4 замените номера телефонов humberto hoosier, irene schreiber, donna wallace на произвольные значения
-- клиент 1: humberto hoosier
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from clients where name = 'humberto' and lastname = 'hoosier';
-- обновление номера телефона (обновлено строк: 1)
update clients set phone = '79991112233' where name = 'humberto' and lastname = 'hoosier' limit 1;

-- клиент 2: irene schreiber
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from clients where name = 'irene' and lastname = 'schreiber';
-- обновление номера телефона (обновлено строк: 1)
update clients set phone = '79992223344' where name = 'irene' and lastname = 'schreiber' limit 1;

-- клиент 3: donna wallace
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from clients where name = 'donna' and lastname = 'wallace';
-- обновление номера телефона (обновлено строк: 1)
update clients set phone = '79993334455' where name = 'donna' and lastname = 'wallace' limit 1;


-- 1.5 удалите клиентов с id 215, 340, 449, 470, 607
-- предварительный поиск и подсчет существующих записей (найдено записей: 4)
select count(*) from clients where id in (215, 340, 449, 470, 607);
-- удаление записей (удалено строк: 4)
delete from clients where id in (215, 340, 449, 470, 607) limit 4;


-- 1.6 удалите клиентов мужского пола с датой рождения в период с 01.01.1941 по 30.04.1941 и с 10.09.1972 по 15.09.1972
-- предварительный поиск и подсчет записей (найдено записей: 2)
select count(*) from clients
where gender = 'm'
and (
(dbirth between '1941-01-01' and '1941-04-30')
or (dbirth between '1972-09-10' and '1972-09-15')
);
-- удаление записей (удалено строк: 2)
delete from clients
where gender = 'm'
and (
(dbirth between '1941-01-01' and '1941-04-30')
or (dbirth between '1972-09-10' and '1972-09-15')
)
limit 2;

-- 2.1 сделать любимым фильм с высоким рейтингом (>= 8.5)
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from relaxing where type = 'фильм' and rating >= 8.5 and is_favorite = false;
-- обновление статуса (обновлено строк: 1)
update relaxing set is_favorite = true where type = 'фильм' and rating >= 8.5 and is_favorite = false limit 1;

-- 2.2 повысить рейтинг для книги с оценкой ниже 9.0 до 9.5
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from relaxing where type = 'книга' and rating < 9.0;
-- обновление рейтинга (обновлено строк: 1)
update relaxing set rating = 9.5 where type = 'книга' and rating < 9.0 limit 1;

-- 2.3 изменить тип с 'песня' на 'трек' для записей до 1980 года
-- предварительный поиск и подсчет записей (найдено записей: 2)
select count(*) from relaxing where type = 'песня' and release_year < 1980;
-- обновление типа (обновлено строк: 2)
update relaxing set type = 'трек' where type = 'песня' and release_year < 1980 limit 2;

-- 2.4 поднять рейтинг на 0.2 для фильмов, вышедших после 2010 года
-- предварительный поиск и подсчет записей (найдено записей: 3)
select count(*) from relaxing where type = 'фильм' and release_year > 2010;
-- обновление рейтинга (обновлено строк: 3)
update relaxing set rating = rating + 0.2 where type = 'фильм' and release_year > 2010 limit 3;

-- 2.5 уточнить название для книги «дюна», переименовав в «дюна (роман)»
-- предварительный поиск и подсчет записей (найдено записей: 1)
select count(*) from relaxing where title = 'дюна' and type = 'книга';
-- обновление названия (обновлено строк: 1)
update relaxing set title = 'дюна (роман)' where title = 'дюна' and type = 'книга' limit 1;