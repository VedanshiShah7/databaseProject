drop database if exists project;
create database project;
use project;

drop table if exists genre;
create table genre (
	genre_id INT PRIMARY KEY NOT NULL UNIQUE,
    genre_name VARCHAR(50) NOT NULL UNIQUE
    );

insert into genre values
(1, 'Science-fiction'),
(2, 'Comedy'),
(3, 'Romance'),
(4, 'Horror'),
(5, 'Action'),
(6, 'Animation'),
(7, 'Thriller'),
(8, 'Mystery'),
(9, 'Drama'),
(10, 'Romantic-Comedy'),
(11, 'Documentary'),
(12, 'Teen');

drop table if exists movie;
create table movie (
	movie_id INT PRIMARY KEY NOT NULL UNIQUE,
    title varchar(50) NOT NULL UNIQUE,
    plot longtext NOT NULL,
    release_date DATE NOT NULL,
    duration INT,
    movie_rating ENUM('G', 'PG', 'PG-13', 'R', 'NC-17'),
    genre_id INT,
	constraint foreign key (genre_id) references genre(genre_id)
    );
-- Rated G: General audiences – All ages admitted
-- Rated PG: Parental guidance suggested – Some material may not be suitable for children.
-- Rated PG-13: Parents strongly cautioned – Some material may be inappropriate for children under 13.
-- Rated R: Restricted – Under 17 requires accompanying parent or adult guardian.
-- Rated NC-17: Adults Only – No one 17 and under admitted.

insert into movie values
(1, 'Inception', 'A thief who steals corporate secrets through the use of dream-sharing
 technology is given the inverse task of planting an idea into the mind of a C.E.O.', '2010-07-16', 136.8, 'PG-13', 1),
(2, 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual 
redemption through acts of common decency.', '1994-10-14', 133.2, 'R', 9),
(3, 'The Dark Night', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must 
accept one of the greatest psychological and physical tests of his ability to fight injustice.', '2008-07-18', 139.2, 'PG-13', 5),
(4, 'The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on 
a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', '2001-12-19', 154.8, 'PG-13', 5),
(5, 'The Matrix', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war 
against its controllers.', '1999-03-31', 129.6, 'R', 1),
(6, 'The Wolf of Wall Street', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the
 high life to his fall involving crime, corruption and the federal government.', '2013-12-25', 180, 'R', 9),
(7, 'Avengers: Endgame', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the 
help of remaining allies, the Avengers assemble once more in order to reverse Thanos actions and restore balance to the universe.',
'2019-04-26', 181.2, 'PG-13', 9),
(8, 'Clueless', 'Shallow, rich and socially successful Cher is at the top of her Beverly Hills high schools pecking scale. Seeing
 herself as a matchmaker, Cher first coaxes two teachers into dating each other.', '1995-07-19', 82.2, 'PG-13', 12),
(9, 'Harry Potter and the Half-Blood Prince', 'As Harry Potter (Daniel Radcliffe) begins his sixth year at Hogwarts, he discovers
 an old book marked as "the property of the Half-Blood Prince" and begins to learn more about Lord Voldemorts (Ralph Fiennes) 
 dark past.', '2009-07-15', 139.8, 'PG', 5),
(10, 'The Edge of Seventeen', 'High-school life gets even more unbearable for Nadine when her best friend, Krista, starts dating 
her older brother.', '2016-11-18', 86.4, 'R', 2),
(11, 'The Princess Diaries', 'Mia Thermopolis has just found out that she is the heir apparent to the throne of Genovia. 
With her friends Lilly and Michael Moscovitz in tow, she tries to navigate through the rest of her sixteenth year.',
'2001-08-03', 90.6, 'G', 10),
(12, 'High School Musical', 'A popular high school athlete and an academically gifted girl get roles in the school musical and 
develop a friendship that threatens East Highs social order.', '2006-01-20', 82.8, 'PG', 10);


drop table if exists producing_company;
create table producing_company (
	producing_company_id INT PRIMARY KEY NOT NULL UNIQUE,
    producing_company VARCHAR(50) NOT NULL UNIQUE
    );

insert into producing_company values
(1, 'Walt Disney pictures'),
(2, 'Warner Bros'),
(3, 'Eros International'),
(4, 'Universal Studios'),
(5, 'Paramount pictures'),
(6, 'Lengendary entertainment'),
(7, 'Metro-Goldwyn-Mayer'),
(8, 'Sony Pictures Motion Picture Group'),
(9, '20th Century Fox'),
(10, 'Lionsgate Films'),
(11, 'DreamWorks pictures'),
(12, 'Columbia pictures'),
(13, 'New line cinema'),
(14, 'Marvel Entertainment'),
(15, 'STX Entertainment');

drop table if exists movie_producing_company;
create table movie_producing_company (
	producing_company_id INT NOT NULL,
    movie_id INT NOT NULL,
    constraint foreign key (producing_company_id) references producing_company(producing_company_id),
    constraint foreign key (movie_id) references movie(movie_id)
    );
    
insert into movie_producing_company values 
(2, 1),
(6, 1),
(12, 2),
(2, 3),
(13, 4),
(2, 5),
(5, 6),
(1, 7),
(14, 7),
(5, 8),
(2, 9),
(15, 10),
(1, 11),
(1, 12);

drop table if exists movie_platform;
create table movie_platform (
	platform ENUM('NETFLIX', 'AMAZON_PRIME', 'HULU', 'YouTube', 'Disney_+', 'HOTSTAR', 'OTHER') NOT NULL,
    movie_id INT NOT NULL,
    constraint foreign key (movie_id) references movie(movie_id)
    );

insert into movie_platform values
('NETFLIX', 1),
('NETFLIX', 2),
('AMAZON_PRIME', 2),
('HULU', 3),
('NETFLIX', 4),
('AMAZON_PRIME', 4),
('NETFLIX', 5),
('NETFLIX', 6),
('AMAZON_PRIME', 6),
('Disney_+', 7),
('HOTSTAR', 7),
('Disney_+', 8),
('NETFLIX', 8),
('HOTSTAR', 8),
('AMAZON_PRIME', 9),
('NETFLIX', 10),
('AMAZON_PRIME', 10),
('DISNEY_+', 11),
('NETFLIX', 11),
('AMAZON_PRIME', 11),
('HOTSTAR', 11),
('AMAZON_PRIME', 12),
('NETFLIX', 12),
('DISNEY_+', 12),
('HOTSTAR', 12);

drop table if exists nomination;
create table nomination (
	nomination_id INT PRIMARY KEY NOT NULL UNIQUE,
    award VARCHAR(50) NOT NULL,
    category VARCHAR(100) NOT NULL,
    date_received DATE NOT NULL,
    winner TINYINT
    );

insert into nomination values
(1, 'Oscar', 'Best Achievement in Cinematography', '2011-02-27', true),
(2, 'Oscar', 'Best Achievement in Sound Mixing', '2011-02-27', true),
(3, 'Oscar', 'Best Achievement in Sound Editing', '2011-02-27', true),
(4, 'Oscar', 'Best Achievement in Visual Effects', '2011-02-27', true),
(5, 'Oscar', 'Best Motion Picture of the Year', '2011-02-27', false),
(6, 'Oscar', 'Best Writing, Original Screenplay', '2011-02-27', false),
(7, 'Oscar', 'Best Achievement in Music Written for Motion Pictures, Original Score', '2011-02-27', false),
(8, 'Oscar', 'Best Achievement in Art Direction', '2011-02-27', false),
(9, 'Golden Globes', 'Best Director - Motion Pictures', '2011-01-16', false),
(10, 'Golden Globes', 'Best Screenplay - Motion Picture', '2011-01-16', false),
(11, 'Golden Globes', 'Best Original Score - Motion Picture', '2011-01-16', false),
(12, 'Golden Globes', 'Best Motion Picture - Drama', '2011-01-16', false), 
(13, 'Oscar', 'Best Picture', '1995-03-27', false),
(14, 'Oscar', 'Best Actor in a Leading Role', '1995-03-27', false),
(15, 'Oscar', 'Best Writing, Screenplay Based on Material Previously Produced or Published', '1995-03-27', false),
(16, 'Oscar', 'Best Film Editing', '1995-03-27', false),
(17, 'Oscar', 'Best Music, Original Score', '1995-03-27', false),
(18, 'Golden Globes', 'Best Performance by an Actor in a Motion Picture - Drama', '1995-01-21', false),
(19, 'Golden Globes', 'Best Screenplay - Motion Picture', '1995-01-21', false),
(20, 'Oscar', 'Best Performance by an Actor in a Supporting Role', '2009-02-22', true),
(21, 'Oscar', 'Best Achievement in Sound Editing', '2009-02-22', true),
(22, 'Oscar', 'Best Achievement in Cinematography', '2009-02-22', false),
(23, 'Oscar', 'Best Achievement in Film Editing', '2009-02-22', false),
(24, 'Oscar', 'Best Achievement in Art Direction', '2009-02-22', false),
(25, 'Oscar', 'Best Achievement in Makeup', '2009-02-22', false),
(26, 'Oscar', 'Best Achievement in Sound Mixing', '2009-02-22', false),
(27, 'Oscar', 'Best Achievement in Visual Effects', '2009-02-22', false),
(28, 'Golden Globes', 'Best Performance by an Actor in a Supporting Role in a Motion Picture', '2009-01-11', true),
(29, 'Critics Choice Movie Awards', 'Critics Choice Movie Award for Best Actor in a Comedy', '2014-01-16', true),
(30, 'Peoples Choice Award', 'Peoples Choice Award for Favorite Dramatic Movie Actor', '2014-01-08', true),
(31, 'AFI', 'AFI Movies of the Year', '2013-05-15', true),
(32, 'MTV Movie Awards', 'MTV Movie Award for Best Jaw Dropping Moment', '2014-04-13', true),
(33, 'Golden Globe', 'Golden Globe Award for Best Actor – Motion Picture Musical or Comedy', '2014-01-12', true),
(34, 'Empire Award', 'Empire Award for Best Actor', '2014-03-30', false),
(35, 'MTV Movie Award', 'MTV Movie Award for Best Shirtless Performance', '2014-04-13', false),
(36, 'MTV Movie Award', 'MTV Movie Award for Best On-Screen Duo', '2014-04-13', false),
(37, 'Academy Award', 'Academy Award for Best Picture', '2014-03-02', false),
(38, 'Satellite Award', 'Satellite Award for Best Actor – Motion Picture Drama', '2010-12-01', false),
(39, 'MTV Movie Award', 'MTV Movie Award for Best Musical Moment', '2014-04-13', false),
(40, 'Peoples Choice Award', 'Peoples Choice Award for Favorite On-Screen Chemistry', '2011-01-05', false),
(41, 'Teen Choice Award', 'Teen Choice Award for TV - Choice Actor', '1999-08-01', false),
(42, 'MTV Movie Award', 'MTV Movie Award for Most Frightened Performance', '2011-06-05', true),
(43, 'Saturn Award', 'Saturn Award for Best Director', '2011-06-23', true),
(44, 'Czech Lion Award', 'Czech Lion Award for Best Foreign Film', '2011-03-05', true),
(45, 'Robert Award', 'Robert Award for Best American Film', '2011-02-06', true),
(46, 'Hugo Award', 'Hugo Award for Best Dramatic Presentation, Long Form', '2011-08-20', true),
(47, 'Writers Guild of America Award', 'Writers Guild of America Award for Best Original Screenplay', '2012-02-19', true),
(48, 'Oscar', 'Best Sound', '1995-03-27', false);

drop table if exists movie_nomination;
create table movie_nomination (
    movie_id INT NOT NULL,
    nomination_id INT NOT NULL,
    constraint foreign key (movie_id) references movie(movie_id),
    constraint foreign key (nomination_id) references nomination(nomination_id)
    );

insert into movie_nomination values
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 48),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28);

drop table if exists actor_or_director;
create table actor_or_director (
	actor_or_director_id INT PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    dob DATETIME NOT NULL,
    nationality VARCHAR(50),
    instagram_handle VARCHAR(50),
    actor TINYINT NOT NULL
    );

insert into actor_or_director values
(1, 'Leonardo DiCaprio', '1974-11-11', 'American', 'leonardodicaprio', true),
(2, 'Joseph Gordon-Levitt', '1981-02-17', 'American', 'hitrecordjoe', true),
(3, 'Ellen Page', '1987-02-21', 'Canadian', 'ellenpage', true),
(4, 'Tom Hardy', '1977-09-15', 'British', 'tomhardy', true),
(5, 'Ken Watanabe', '1959-10-21', 'Japanese', '', true),
(6, 'Christopher Nolan', '1970-07-30', 'British-American', 'chrisnolanmusic', false),
(7, 'Tim Robbins', '1958-10-16', 'American', 'timrobbinshere', true),
(8, 'Morgan Freeman', '1937-06-01', 'American', 'morganfreeman', true),
(9, 'Bob Gunton', '1945-11-15', 'American', '', true),
(10, 'William Sadler', '1950-04-13', 'American', '', true),
(11, 'Frank Darabont', '1959-01-28', 'Hungarian-American', '', false),
(12, 'Christian Bale', '1974-01-30', 'British', '', true),
(13, 'Heath Ledger', '1979-04-04', 'Australian', '', true),
(14, 'Johnny Depp', '1963-06-09', 'American', 'johnnydepp', true),
(15, 'Aaron Eckhart', '1968-03-12', 'American', '', true),
(16, 'Michael Caine', '1933-03-14', 'British', '', true),
(17, 'Maggie Gyllenhaal', '1977-11-16', 'American', 'mgyllenhaal', true),
(18, 'Gary Oldman', '1958-03-21', 'British', '', true),
(19, 'Ian McKellen', '1939-05-25', 'British', 'ianmckellen', true),
(20, 'Elijah Wood', '1981-01-28', 'American', '', true),
(21, 'Sean Astin', '1971-02-25', 'American', 'seanastin', true),
(22, 'Billy Boyd', '1968-08-28', 'Scottish', 'boydbilly', true),
(23, 'Dominic Monaghan', '1976-12-08', 'British', 'Dominic Monaghan', true),
(24, 'Sean Bean', '1959-04-17', 'British', 'sean_bean_official', true),
(25, 'John Rhys-Davies', '1944-05-05', 'British', '', true),
(26, 'Viggo Mortensen', '1958-10-20', 'American-Danish',  '', true),
(27, 'Christopher Lee', '1922-05-27', 'British', '', true),
(28, 'Orlando Bloom', '1977-01-13', 'British', 'orlandobloom', true),
(29, 'Peter Jackson', '1961-10-31', 'New Zealand', 'peterjackson905', false),
(30, 'Keanu Reeves', '1964-09-02', 'Canadian', '', true),
(31, 'Carrie-Anne Moss', '1967-08-21', 'Candian', '', true),
(32, 'Laurence Fishburne', '1961-07-30', 'American', '', true),
(33, 'Hugo Weaving', '1960-04-04', 'British', '', true),
(34, 'Lana Wachowski', '1965-06-21', 'American', '', false),
(35, 'Lilly Wachowski', '1967-12-29', 'American', '', false),
(36, 'Jonah Hill', '1983-12-20', 'American', 'jonahhill', true),
(37, 'Margot Robbie', '1990-07-02', 'Australian', 'margotrobbie', true),
(38, 'Matthew McConaughey', '1969-11-04', 'American', 'officiallymcconaughey', true),
(39, 'Jon Favreau', '1966-10-19', 'American', 'jonfavreau', true),
(40, 'Rob Reiner', '1947-03-06', 'American', '', true),
(41, 'Jon Bernthal', '1976-09-20', 'American', 'jonnybernthal', true),
(42, 'Martin Scorsese', '1942-11-17', 'American', 'martinscorsese_m', false),
(43, 'James Cameron', '1954-08-16', 'Canadian', 'jamescameronofficial', false);

drop table if exists actor_or_director_movie;
create table actor_or_director_movie (
	actor_or_director_id INT NOT NULL,
    movie_id INT NOT NULL,
    role varchar(50),
    constraint foreign key (actor_or_director_id) references actor_or_director(actor_or_director_id),
    constraint foreign key (movie_id) references movie(movie_id)
    );
 
 insert into actor_or_director_movie values
 (1, 1, 'Cobb'),
 (2, 1, 'Arthur'),
 (3, 1, 'Ariadne'),
 (4, 1, 'Eames'),
 (5, 1, 'Saito'),
 (6, 1, ''),
 (7, 2, 'Andy Dufresne'),
 (8, 2, 'Ellis Boyd (Red) Redding'),
 (9, 2, 'Warden Norton'),
 (10, 2, 'Heywood'),
 (11, 2, ''),
 (12, 3, 'Bruce Wayne'),
 (13, 3, 'Joker'),
 (15, 3, 'Harvey Dent'),
 (16, 3, 'Alfred'),
 (17, 3, 'Rachel'),
 (18, 3, 'Gordon'),
 (6, 3, ''),
 (8, 3, 'Lucius Fox'),
 (19, 4, 'Gandalf'),
 (20, 4, 'Frodo'),
 (21, 4, 'Samwise Gamgee'),
 (22, 4, 'Pippin Took'),
 (23, 4, 'Merry Brandybuck'),
 (24, 4, 'Boromir'),
 (25, 4, 'Gimli'),
 (26, 4, 'Aragorn'),
 (27, 4, 'Saruman'),
 (28, 4, 'Legolas'),
 (29, 4, ''),
 (30, 5, 'Neo'),
 (31, 5, 'Morpheous'),
 (32, 5, 'Trinity'),
 (33, 5, 'Agent Smith'),
 (34, 5, ''),
 (35, 5, ''),
 (1, 6, 'Jordon Belfort'),
 (36, 6,'Donnie Azoff'),
 (37, 6, 'Naomi Lapaglia'),
 (38, 6, 'Mark Hanna'),
 (39, 6, 'Manny Riskin'),
 (40, 6, 'Max Belfort'),
 (41, 6, 'Brad'),
 (42, 6, '');
 
 
drop table if exists actor_or_director_nomination;
create table actor_or_director_nomination (
	actor_or_director_id INT NOT NULL,
    nomination_id INT NOT NULL,
    movie_id int,
    constraint foreign key (actor_or_director_id) references actor_or_director(actor_or_director_id),
    constraint foreign key (nomination_id) references nomination(nomination_id)
    );

insert into actor_or_director_nomination values
(1, 28, 6),
(1, 29, 6),
(1, 30, 6),
(1, 31, 6),
(1, 32, 6),
(1, 33, 6),
(1, 34, 6),
(1, 35, 6),
(1, 36, 6),
(1, 37, 6),
(1, 38, 1),
(1, 39, 1),
(1, 40, 1),
(2, 41, 0),
(3, 42, 1),
(6, 43, 1),
(6, 44, 1),
(6, 45, 1),
(6, 46, 1),
(6, 47, 1),
(6, 48, 1);

drop table if exists user;
create table user (
	user_id INT PRIMARY KEY NOT NULL UNIQUE,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL UNIQUE,
    dob DATETIME
    );

insert into user values
(1, 'moxlade0', 'dkimbley0@berkeley.edu', 'IE7fiO', '2019-09-03 14:13:41'),
(2, 'jcafferky1', 'lbevan1@cnbc.com', 'QqNuRjlqzUlW', '2019-08-20 19:47:25'),
(3, 'ttoms2', 'cgutowski2@icq.com', 'P1JePxkIEE6', '2020-02-09 12:54:22'),
(4, 'rdurrand3', 'jleisman3@scientificamerican.com', 'njMKzKNG1RhM', '2019-06-30 00:01:08'),
(5, 'gmowne4', 'stevelov4@gnu.org', 'pGFnqXfe', '2019-07-09 11:19:46'),
(6, 'rburke5', 'chardwicke5@cocolog-nifty.com', '6JGHNWdixF', '2019-11-21 16:58:23'),
(7, 'smullan6', 'ndeye6@yandex.ru', 'WDfEEjWtXG5', '2019-08-08 04:20:09'),
(8, 'wfulle7', 'cjeremaes7@sogou.com', 'XbYq3GW', '2019-06-22 10:24:07'),
(9, 'vwillmott8', 'vmanoch8@home.pl', 'CQ38Msb24Av', '2020-04-24 03:00:35'),
(10, 'ewestmoreland9', 'sruberti9@mayoclinic.com', 'QCAtvQSD', '2020-01-26 18:03:07');

drop table if exists rating;
create table rating (
	movie_id INT NOT NULL,
    user_id INT NOT NULL,
	rating decimal NOT NULL check (rating between 0 and 10),
    review VARCHAR(50),
    constraint foreign key (movie_id) references movie(movie_id),
    constraint foreign key (user_id) references user(user_id)
    );

insert into rating values
(1, 1, 10, 'The BEST movie!'),
(3, 1, 8, 'I LOVE THE MOVIE, very inspiring.'),
(5, 1, 9, 'i. have. no. words.'),
(5, 1, 8, ''),
(2, 2, 5, 'Took me back to the early ages'),
(7, 8, 8, 'DAYUM...');

drop table if exists follower_followee;
create table follower_followee (
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    constraint foreign key (follower_id) references user(user_id),
    constraint foreign key (followee_id) references user(user_id)
    );

insert into follower_followee values
(1, 4),
(2, 1),
(10, 10),
(5, 8),
(1, 2);

drop table if exists chat;
create table chat (
	chat_id INT PRIMARY KEY NOT NULL UNIQUE,
    message VARCHAR(500) NOT NULL,
    movie_id INT,
   constraint foreign key (movie_id) references movie(movie_id)
    );

insert into chat values
(1, 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 12),
(2, 'Mauris sit amet eros.', 5),
(3, 'In blandit ultrices enim.', 5),
(4, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', 11),
(5, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 8),
(6, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 10),
(7, 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 6),
(8, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 4),
(9, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', 8),
(10, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 9),
(11, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 5),
(12, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 1),
(13, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 2),
(14, 'Etiam justo. Etiam pretium iaculis justo.', 2),
(15, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', 1),
(16, 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 5),
(17, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 8),
(18, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 2),
(19, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 11),
(20, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 9);


drop table if exists user_chat;
create table user_chat (
	user_id INT NOT NULL,
    chat_id INT NOT NULL UNIQUE,
    constraint foreign key (user_id) references user(user_id),
    constraint foreign key (chat_id) references chat(chat_id)
    );

insert into user_chat values
(1, 5),
(1, 10),
(1, 15),
(1, 20),
(2, 2),
(2, 4),
(2, 6), 
(2, 8),
(3, 1),
(4, 3),
(5, 7),
(9, 9),
(10, 11),
(2, 12),
(7, 13),
(9, 19),
(8, 18),
(4, 14);


-- QUERIES --

-- find all the movies directed by 'Christopher Nolan'

select title
from movie
	join actor_or_director_movie using (movie_id)
    join actor_or_director using (actor_or_director_id)
where name = 'Christopher Nolan';

-- find all the actors that played in the movie: 'Inception'

select name
from actor_or_director
	join actor_or_director_movie using (actor_or_director_id)
    join movie using (movie_id)
where title = 'Inception' and actor = true;

-- find all american actors

select name
from actor_or_director
where nationality = 'American' and actor = true;

-- Write a query in SQL to find the name of those movies where one or 
-- more actors acted in two or more movies.
-- DO THIS !!! NIGHT!
SELECT title 
FROM movie 
WHERE movie_id IN (
	SELECT movie_id 
	FROM actor_or_director 
	WHERE actor_or_director_id IN (
		SELECT actor_or_director_id 
		FROM actor_or_director 
		WHERE actor_or_director_id IN (
			SELECT actor_or_director_id
			FROM movie GROUP BY actor_or_director_id 
			HAVING COUNT(actor_or_director_id)>1)));

-- find the number of awards won and nominated by an actor/director/movie. Order from highest to lowest.

(select name, count(actor_or_director_nomination.nomination_id) num_wins
from actor_or_director
	join actor_or_director_nomination using (actor_or_director_id)
    join nomination using (nomination_id)
where winner = true
group by name
order by num_wins DESC) 
union
(select name, count(actor_or_director_nomination.nomination_id) num_nomination
from actor_or_director
	join actor_or_director_nomination using (actor_or_director_id)
    join nomination using (nomination_id)
where winner = false
group by name
order by num_nomination DESC);

select name, count(winner = true) num_win, count(winner = false) num_nomination
from actor_or_director
	join actor_or_director_nomination using (actor_or_director_id)
    join nomination using (nomination_id)
group by name;

-- output movies with a rating more than 8 stars

select title, rating, review
from rating
	join movie using (movie_id)
where rating > 8;

-- find movies that have no ratings

select title
from movie
where movie_id not in (
		select movie_id
		from rating
		join movie using (movie_id)
);


-- Write a query in SQL to return the reviewer name, movie title, and stars for those 
-- movies which reviewed by a reviewer and must be rated. Sort the result by reviewer 
-- name, movie title, and number of stars.

select user_name, title, rating, review
from rating
	join movie using (movie_id)
    join user using (user_id);

-- all reviewers that rated 'The Matrix'

select user_name
from rating
	join movie using (movie_id)
    join user using (user_id)
where title = 'The Matrix';

-- For each genre output the average movie duration. Include genres without any movies.
select genre_name, avg(duration) avg_duration
from genre
	left join movie using (genre_id)
group by genre_name
order by avg_duration DESC;

-- find all the movies and their directors (if they have any) released before January 1, 2000.
select name, title, plot, release_date, duration, genre_name
from actor_or_director
	left join actor_or_director_movie using (actor_or_director_id)
	left join movie using (movie_id)
    left join genre using (genre_id)
where actor = false and release_date < '2000-01-01'
order by release_date DESC;

-- calculate the sum of the duration of all the movies in hours
select round(sum(duration)/60, 2) hours
from movie;