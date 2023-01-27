SELECT
ar.names AS 'artista',
al.title AS 'album'
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albuns AS al
ON ar.artists_id = al.artists_id
WHERE ar.names = 'Elis Regina'
GROUP BY ar.names, al.title
ORDER BY album;