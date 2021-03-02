--Data Queries--
--What Emmy award years are in the table?
select year, count(year) from emmy_awards 
	group by year 
	order by year asc

--How many Emmy wins by rating?
select n.rating, count(n.title) from netflix_titles as n
	join emmy_awards as e on n.title = e.nominee
	where e.win = true
	group by n.rating

--How many Netflix TV shows won and were nominated for Emmys out of the entire list?
select e.win, count(n.title) from netflix_titles as n
left join emmy_awards as e on n.title = e.nominee
group by e.win

--Which categories have the most wins for Netflix?
select e.category, count(n.title) from netflix_titles as n
join emmy_awards as e on n.title = e.nominee
where e.win = true
group by e.category
order by count(n.title) desc

--Do highly rated tv shows win Emmys?
--Rotten Tomatoes
select n.title, e.category, e.year, e.win, r.rotten_tomatoes from netflix_titles as n
join emmy_awards as e on n.title = e.nominee
join tv_ratings as r on e.nominee = r.title
where r.rotten_tomatoes >= 80
order by e.win desc, r.rotten_tomatoes desc

--IMDb
select n.title, e.category, e.year, e.win, r.imdb from netflix_titles as n
join emmy_awards as e on n.title = e.nominee
join tv_ratings as r on e.nominee = r.title
where r.imdb >= 8
order by e.win desc, r.imdb desc 
