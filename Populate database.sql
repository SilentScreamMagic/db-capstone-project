use littlelemondb;

INSERT INTO MenuItems 
VALUES
(1, 'Olives','Starters',5),
(2, 'Flatbread','Starters', 5),
(3, 'Minestrone', 'Starters', 8),
(4, 'Tomato bread','Starters', 8),
(5, 'Falafel', 'Starters', 7),
(6, 'Hummus', 'Starters', 5),
(7, 'Greek salad', 'Main Courses', 15),
(8, 'Bean soup', 'Main Courses', 12),
(9, 'Pizza', 'Main Courses', 15),
(10, 'Greek yoghurt','Desserts', 7),
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4),
(13, 'Athens White wine', 'Drinks', 25),
(14, 'Corfu Red Wine', 'Drinks', 30),
(15, 'Turkish Coffee', 'Drinks', 10),
(16, 'Turkish Coffee', 'Drinks', 10),
(17, 'Kabasa', 'Main Courses', 17);

INSERT INTO Menu
VALUES
(1, 1, 'Greek','Meal 1'),
(1, 7, 'Greek','Meal 1'),
(1, 10, 'Greek','Meal 1'),
(1, 13, 'Greek','Meal 1'),
(2, 3, 'Italian','Meal 2'),
(2, 9, 'Italian','Meal 2'),
(2, 12, 'Italian','Meal 2'),
(2, 15, 'Italian','Meal 2'),
(3, 5, 'Turkish','Meal 3'),
(3, 17, 'Turkish','Meal 3'),
(3, 11, 'Turkish','Meal 3'),
(3, 16, 'Turkish','Meal 3');


insert into orders values
(1,1,'2022-10-10',1,2,60),
(2,2,'2022-11-12',2,1,40),
(3,3,'2022-10-11',1,2,80);
