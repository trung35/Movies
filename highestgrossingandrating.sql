-- highest grossing table --

-- order from highest to lowest of times a producer has produced top 50 movies --
select count(title) as movie_title, producer from highest_grossing
group by producer
order by count(title) desc;

-- show above average movies and below average movies --
set @average = round((select avg(gross) from highest_grossing),2);
select @average;
-- show above average movies --
select * from highest_grossing
where gross > @average;
-- show below average movies --
select * from highest_grossing
where gross < @average;

-- show total movies produced ranked by year --
select count(title) as total_movies, year from highest_grossing
group by year
order by total_movies desc;

-- show gross amount by producer ranked highest to lowest -- 
select sum(gross) as gross_amount, producer from highest_grossing
group by producer
order by gross_amount desc;

-- highest rating table --

-- count total movies by rating rank from highest to lowest --
select count(title) as total_movies, rating from highest_rating
group by rating
order by total_movies desc;

-- show which year has the highest movie ratings  --
select round(avg(rating),1) as ratings, year from highest_rating
group by year
order by ratings desc;

-- show total movies produced by year --
select count(title) as total_movies, year from highest_rating
group by year
order by total_movies desc;

-- show which highest grossing movies are also highest rating --
select highest_grossing.rank, highest_grossing.title, gross, highest_grossing.year , highest_rating.rating from highest_grossing
join highest_rating
on highest_grossing.title = highest_rating.title;

