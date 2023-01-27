SELECT
s.music AS 'cancao',
COUNT(p.songs_id) AS 'reproducoes'
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.playback_history AS p
ON s.songs_id = p.songs_id
GROUP BY p.songs_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;