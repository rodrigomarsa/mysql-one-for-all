SELECT
u.fullname AS 'usuario',
COUNT(p.songs_id) AS 'qt_de_musicas_ouvidas',
ROUND(SUM(s.duration)/60, 2) AS 'total_minutos'
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.playback_history AS p
ON u.users_id = p.users_id
INNER JOIN SpotifyClone.songs AS s
ON p.songs_id = s.songs_id
GROUP BY u.users_id
ORDER BY u.fullname;