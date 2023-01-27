SELECT music AS 'nome_musica',
CASE
	WHEN music = 'The Bard’s Song' THEN REPLACE(music, 'Bard', 'QA')
    WHEN music = 'O Medo de Amar é o Medo de Ser Livre' THEN REPLACE(music, 'Amar', 'Code Review')
    WHEN music = 'Como Nossos Pais' THEN REPLACE(music, 'Pais', 'Pull Requests')
    WHEN music = 'BREAK MY SOUL' THEN REPLACE(music, 'SOUL', 'CODE')
    WHEN music = 'ALIEN SUPERSTAR' THEN REPLACE(music, 'SUPERSTAR', 'SUPERDEV')
    ELSE music
END AS novo_nome
FROM SpotifyClone.songs
GROUP BY music
HAVING novo_nome IN('The QA’s Song', 'O Medo de Code Review é o Medo de Ser Livre',
'Como Nossos Pull Requests', 'BREAK MY CODE', 'ALIEN SUPERDEV')
ORDER BY novo_nome DESC;