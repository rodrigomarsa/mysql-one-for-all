SELECT
ar.names AS 'artista',
al.title AS 'album',
COUNT(f.users_id) AS 'seguidores'
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.followers_artist AS f
ON ar.artists_id = f.artists_id
INNER JOIN SpotifyClone.albuns AS al
ON f.artists_id = al.artists_id
GROUP BY ar.names, al.title
ORDER BY seguidores DESC, artista, album;