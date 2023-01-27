SELECT
COUNT(s.music) AS 'cancoes',
COUNT(DISTINCT al.artists_id) AS 'artistas',
COUNT(DISTINCT al.title) AS 'albuns'
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.albuns AS al
ON s.albuns_id = al.albuns_id;