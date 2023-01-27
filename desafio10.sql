SELECT
s.music AS 'nome',
COUNT(p.songs_id) AS 'reproducoes'
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.playback_history AS p
ON s.songs_id = p.songs_id
INNER JOIN SpotifyClone.users AS u
ON p.users_id = u.users_id
WHERE u.plans_id = 1 OR u.plans_id = 4
GROUP BY s.music
ORDER BY nome;