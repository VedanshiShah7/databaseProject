-- stuff removed from the project

drop table if exists director;
create table director (
	director_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    dob DATETIME NOT NULL,
    nationality VARCHAR(50),
    instagram_handle VARCHAR(50) UNIQUE
    );

drop table if exists director_movie;
create table director_movie (
	director_id INT NOT NULL,
    movie_id INT NOT NULL,
    constraint foreign key (director_id) references director(director_id),
    constraint foreign key (movie_id) references movie(movie_id)
    );
 
drop table if exists director_nomination;
create table director_nomination (
	director_id INT NOT NULL,
    nomination_id INT NOT NULL,
    constraint foreign key (director_id) references director(director_id),
    constraint foreign key (nomination_id) references nomination(nomination_id)
    );
    
    
    
drop table if exists platform;
create table platform (
	platform_id INT PRIMARY KEY NOT NULL UNIQUE,
    platform_name 
    );
