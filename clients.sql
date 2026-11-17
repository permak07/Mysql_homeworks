-- 1. для поиска по каждому из имен:
select * from clients where name = 'Robert';
select * from clients where name = 'Jeffrey';
select * from clients where name = 'John';
select * from clients where name = 'Richard';
select * from clients where name = 'David';
select * from clients where name in ('Robert','Jeffrey','John','Richard','David');

-- 2. для выборки всех:
select * from clients where gender = 'F';
select * from clients where gender = 'M';

-- 3. для определения имени и телефона среди всех клиентов с фамилией:
select name, phone from clients where lastname = 'Williams';
select name, phone from clients where lastname = 'Jones';
select name, phone from clients where lastname = 'Brown';
select name, phone from clients where lastname = 'Miller';
select name, phone from clients where lastname in ('Williams','Jones','Brown','Miller');

-- 4. для определения даты рождения и пола пользователей с именем или фамилией (то есть нужно найти всех пользователей, у которых либо имя, либо фамилия соответствуют заданным):
select dbirth, gender from clients where name = 'Kelly' or lastname = 'Kelly';
select dbirth, gender from clients where name = 'Thomas' or lastname = 'Thomas';
select dbirth, gender from clients where name = 'Clark' or lastname = 'Clark';
select dbirth, gender from clients where name = 'Joseph' or lastname = 'Joseph';

-- 5. для определения пола, даты рождения и номера телефона пользователей с именем и фамилией:
select gender, dbirth, phone from clients where name = 'Tom' and lastname = 'Brown';
select gender, dbirth, phone from clients where name = 'Janet' and lastname = 'Silberstein';
select gender, dbirth, phone from clients where name = 'John' and lastname = 'Foster';