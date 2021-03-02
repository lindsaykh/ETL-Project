create table netflix_titles(show_id varchar(10) primary key, 
							title varchar(255), 
							release_year varchar(255), 
							rating varchar(10))
							
create table emmy_awards(award_id int primary key,
						 nominee varchar(255) foreign key,
						 year int, category varchar(255), 
						 company varchar(255), 
						 win boolean)
						 
create table tv_ratings(rating_id int primary key,
						year int,
						title varchar(255) foreign key,
					    imdb int, 
						rotten_tomatoes int)
					 