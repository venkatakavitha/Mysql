CREATE DATABASE persons; 

SHOW DATABASES; 

USE `persons`;

create table people(id int primary key,
                    name varchar(100), 
                    age int,
					unique(age));
                    
SELECT * from people;

INSERT INTO people (id, name, age) 
VALUES 
(1, 'kavi', 18),
(2, 'siri', 20),
(3, 'lahari', 18),
(4, 'sam', 21),
(5, 'sri', 20);

SELECT age,  COUNT(*) AS count_of_people
FROM people
GROUP BY age
ORDER BY age;

 

