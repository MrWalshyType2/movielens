SELECT title, release_date 
FROM movies  
WHERE release_date BETWEEN '1983-01-01' AND '1993-12-31' 
ORDER BY release_date DESC;

SELECT movies.title, ratings.rating 
FROM ratings 
INNER JOIN movies ON movies.id=ratings.id 
ORDER BY rating ASC LIMIT 10;

SELECT DISTINCT movies.title FROM movies 
JOIN genres_movies ON movies.id=genres_movies.movie_id 
JOIN ratings ON movies.id=ratings.movie_id 
JOIN users ON ratings.user_id=users.id 
JOIN occupations ON users.occupation_id=occupations.id 
WHERE ratings.rating=5 AND occupations.name=’Student’ AND users.gender=’M’ AND users.age=24;

SELECT title FROM movies WHERE release_date = (SELECT release_date FROM movies GROUP BY release_date ORDER BY COUNT(*) DESC LIMIT 1);

SELECT DISTINCT genres.name FROM genres_movies 
LEFT JOIN movies ON movie_id = movies.id 
LEFT JOIN genres ON genre_id = genres.id 
ORDER BY genres.name ASC;
