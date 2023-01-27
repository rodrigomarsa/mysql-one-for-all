SELECT
u.fullname AS 'usuario',
IF(MAX(YEAR(p.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.playback_history AS p
ON u.users_id = p.users_id
GROUP BY u.users_id
ORDER BY u.fullname;