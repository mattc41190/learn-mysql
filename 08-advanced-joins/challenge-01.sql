select title, AVG(rating) as avg_rating from series join reviews on series.id = reviews.series_id group by title order by avg_rating;
