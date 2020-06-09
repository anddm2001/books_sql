База данных для хранения книг и категорий.

Таблицы:

Books- книги
Categories- категории книг,
Covers- типы обложек,
Book_category- Таблица, реализующая связь многие-ко-многим для сущности книг и категорий.

Остальные таблицы- служебные для Laravel 5.8

По результам двух выборок книг в базе данных созданы представления.

Пункт №1 из тестового задания

Представление:

books_select

SQL запрос для формирования представления:

select `t2`.`book_id` AS `id`,`t1`.`name` AS `books` 
from (`books` `t1` 
left join `book_category` `t2` 
on(`t1`.`id` = `t2`.`book_id`)) 
where `t1`.`cover_id` = 2 and `t1`.`circulation` >= 5000 
group by `t2`.`book_id` 
having count(`t2`.`category_id`) >= 3 
order by `t2`.`book_id`,`t1`.`name`;

Пункт №2 из тестового задания 

Представление:

books_select_two

SQL запрос для формирования представления:

select `t1`.`id` AS `book_id`,`t1`.`name` AS `book`,count(`t2`.`category_id`) AS `count_category`,`t3`.`name` AS `category` 
from ((`books` `t1` 
left join `book_category` `t2` on(`t1`.`id` = `t2`.`book_id`)) 
left join `categories` `t3` on(`t3`.`id` = `t2`.`category_id`)) 
group by `t2`.`book_id` 
having count(`t2`.`category_id`) >= 10 
and `t2`.`book_id` in (
select distinct `c1`.`book_id` 
from `book_category` `c1` 
group by `c1`.`book_id` 
having count(`c1`.`category_id`) >= 3) 
order by `t1`.`id`,`t1`.`name`
