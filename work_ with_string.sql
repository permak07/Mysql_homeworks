-- 1. Приведение имен к верхнему и нижнему регистру
-- а) верхний регистр
select id, upper(name) as name_upper 
from clients;

-- б) нижний регистр
select id, lower(name) as name_lower 
from clients;


-- 2. Объединение ФИО и маскировка телефона
select 
    concat(lastname, ' ', name) as full_name,
    concat(left(phone, 3), '***', right(phone, 1)) as phone_number
from clients
where phone is not null;


-- 3. Поиск по вхождениям tt, ss, ll и сокращение имени до инициала
select 
    concat(left(name, 1), '. ', lastname) as formatted_name
from clients
where lastname like '%tt%' 
   or lastname like '%ss%' 
   or lastname like '%ll%';


-- 4. Поиск по телефонным номерам

-- Вариант 1: Через оператор LIKE
-- а) начинается на 586
select * from clients where phone like '586%';
-- б) содержит 657
select * from clients where phone like '%657%';
-- в) заканчивается на 707
select * from clients where phone like '%707';


-- Вариант 2: через строковые функции (left, right, instr/locate)
-- а) начинается на 586
select * from clients where left(phone, 3) = '586';
-- б) содержит 657
select * from clients where instr(phone, '657') > 0;
-- в) заканчивается на 707
select * from clients where right(phone, 3) = '707';