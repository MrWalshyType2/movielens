SELECT title, release_date 
FROM movies  
WHERE release_date BETWEEN '1983-01-01' AND '1993-12-31' 
ORDER BY release_date DESC;

SELECT movies.title, ratings.rating 
FROM ratings 
INNER JOIN movies ON movies.id=ratings.id 
ORDER BY rating ASC LIMIT 10;
OR
SELECT * FROM (
  SELECT DISTINCT movies.id, movies.title, avg(ratings.rating) AS avg_rating
  FROM movies
  JOIN ratings ON movies.id = ratings.movie_id
  GROUP BY movies.id
  ORDER BY avg_rating
  ) AS min_avg
  WHERE avg_rating = 1;

SELECT DISTINCT movies.title FROM movies 
JOIN genres_movies ON movies.id=genres_movies.movie_id 
JOIN ratings ON movies.id=ratings.movie_id 
JOIN users ON ratings.user_id=users.id 
JOIN occupations ON users.occupation_id=occupations.id
JOIN genres on genres.id = genres_movies.genre_id
WHERE ratings.rating=5 AND occupations.name=’Student’ AND users.gender=’M’ AND users.age=24 AND genres.name='Sci-Fi';

SELECT title FROM movies WHERE release_date = (SELECT release_date FROM movies GROUP BY release_date ORDER BY COUNT(*) DESC LIMIT 1);

SELECT DISTINCT genres.name FROM genres_movies 
LEFT JOIN movies ON movie_id = movies.id 
LEFT JOIN genres ON genre_id = genres.id 
ORDER BY genres.name ASC;
