SELECT
COUNT(*) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.playback_history AS p
ON u.users_id = p.users_id
WHERE u.fullname = 'Barbara Liskov'
GROUP BY u.users_id;