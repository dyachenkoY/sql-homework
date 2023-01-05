/* Создайте таблицу “workers” с полями (“id”, “birthday”, “name”, “salary”).

Задачи на ALTER TABLE
К уже созданной таблице добавте поля "is_male", "email" и "department".
Затем удалите поле "department" отдельной командой.
Добавте столбцу salary значение по умолчанию в 150$;
Задачи на INSERT
Добавьте нового работника Никиту, 90го года, зарплата 300$.
Добавьте нового работника Светлану с зарплатой 1200$.
Добавьте двух новых работников одним запросом: Ярослава с зарплатой 1200$ и годом 80го, Петра с зарплатой 1000$ и 93 года.
(Так же добавте еще несколько пользователей чтобы раздуть табличку и иметь возможность делать задачки из следующего блока)


Задачи на UPDATE
Поставьте Никите зарплату в 425$.
Работнику с id=4 измените дату рождения так, чтобы год рождения стал 75-ым.
Работникам-женщинам с id больше 2 и меньше 5 включительно установите заплату в 600$.
Поменяйте Васю на Женю и поменяйте почту.

Задачи на DELETE
Удалите работника с id=2.
Удалите всех Николаев.
Удалите всех работников, у которых зарплата меньше 200$. */


CREATE TABLE workers (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    birthday date CHECK (birthday < current_date),
    salary int NOT NULL CHECK (salary > 0)
);

-- К уже созданной таблице добавте поля "is_male", "email" и "department".
ALTER TABLE workers 
ADD COLUMN is_male boolean,
ADD COLUMN email varchar(256) NOT NULL CHECK (email != ''),
ADD COLUMN department varchar(256) NOT NULL CHECK (department != '');

-- Затем удалите поле "department" отдельной командой.
ALTER TABLE workers DROP COLUMN department;

-- Добавте столбцу salary значение по умолчанию в 150$;
ALTER TABLE workers
ALTER COLUMN salary
SET DEFAULT 150;


/* Добавьте нового работника Никиту, 90го года, зарплата 300$.
Добавьте нового работника Светлану с зарплатой 1200$.
Добавьте двух новых работников одним запросом: Ярослава с зарплатой 1200$ и годом 80го, Петра с зарплатой 1000$ и 93 года.
(Так же добавте еще несколько пользователей чтобы раздуть табличку и иметь возможность делать задачки из следующего блока) */

INSERT INTO workers (
        name,
        birthday,
        salary,
        is_male,
        email
    )
VALUES (
        'Nikita',
        '1990-05-08',
        300,
        true,
        'sddsfd@sdf.df'
    );

INSERT INTO workers (
        name,
        birthday,
        salary,
        is_male,
        email
    )
VALUES (
        'Svetlana',
        '1990-09-11',
        1200,
        false,
        'qweq@we.ewe'
    );

INSERT INTO workers (
        name,
        birthday,
        salary,
        is_male,
        email
    )
VALUES (
        'Yaroslav',
        '1980-09-11',
        1200,
        true,
        'qwsdeq@we.ewe'
    ),
    (
        'Petr',
        '1993-10-10',
        1000,
        true,
        'xcdeq@we.ewe'
    );

INSERT INTO workers (
        name,
        birthday,
        salary,
        is_male,
        email
    )
VALUES (
        'Anna',
        '1999-01-01',
        2000,
        false,
        'anna@we.ewe'
    ),
    (
        'Alex',
        '1997-09-10',
        1500,
        true,
        'alex@we.ewe'
    ),
    (
        'Max',
        '1992-10-10',
        1400,
        true,
        'max@we.ewe'
    ),
    (
        'Maria',
        '1995-10-10',
        9000,
        false,
        'rosoMaha@we.ewe'
    );


-- Задачи на UPDATE
-- Поставьте Никите зарплату в 425$.
    UPDATE workers
    SET salary = 425
    WHERE salary = 300;

-- Работнику с id=4 измените дату рождения так, чтобы год рождения стал 75-ым.
    UPDATE workers
    SET birthday = '1975-10-10'
    WHERE id = 4;

-- Работникам-женщинам с id больше 2 и меньше 5 включительно установите заплату в 600$.
    UPDATE workers
    SET salary = 600
    WHERE is_male = false AND id >= 2 AND id <= 5;

-- Поменяйте Васю на Женю и поменяйте почту.
    UPDATE workers
    SET name = 'Zhenya', email = 'zhenya@dsd.sd'
    WHERE name = 'Alex';


-- Задачи на DELETE
-- Удалите работника с id=2.
    DELETE FROM workers
    WHERE id = 2;

-- Удалите всех Николаев. 

    DELETE FROM workers
    WHERE name = 'Nikolay';

-- Удалите всех работников, у которых зарплата меньше 200$. (сделал у которых зарплата меньше 1000$)

    DELETE FROM workers
    WHERE salary < 1000;