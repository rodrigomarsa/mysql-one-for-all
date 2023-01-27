DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plans(
      plans_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      name VARCHAR(255) NOT NULL,
      price DECIMAL(5,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
      users_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      fullname VARCHAR(255) NOT NULL,
      age INT NOT NULL,
      plans_id INT NOT NULL,
      signature_date DATE NOT NULL,
      FOREIGN KEY (plans_id) REFERENCES plans(plans_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artists(
      artists_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      names VARCHAR(255) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      albuns_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      title VARCHAR(255) NOT NULL,
      release_year YEAR NOT NULL,
      artists_id INT NOT NULL,
      FOREIGN KEY (artists_id) REFERENCES artists(artists_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.songs(
      songs_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      music VARCHAR(255) NOT NULL,
      duration INT NOT NULL,
      albuns_id INT NOT NULL,
      FOREIGN KEY (albuns_id) REFERENCES albuns(albuns_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.playback_history(
      users_id INTEGER,
      songs_id INTEGER,
      reproduction_date DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY(users_id, songs_id),
        FOREIGN KEY (users_id) REFERENCES users (users_id),
        FOREIGN KEY (songs_id) REFERENCES songs (songs_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.followers_artist(
      users_id INTEGER,
      artists_id INTEGER,
      CONSTRAINT PRIMARY KEY (users_id, artists_id),
        FOREIGN KEY (users_id) REFERENCES users (users_id),
        FOREIGN KEY (artists_id) REFERENCES artists (artists_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plans (name, price)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.users (fullname, age, plans_id, signature_date)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

  INSERT INTO SpotifyClone.artists (names)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albuns (title, release_year, artists_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.songs (music, duration, albuns_id)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard’s Song', 244, 7),
    ('Feeling Good', 100, 8);

  INSERT INTO SpotifyClone.playback_history(users_id, songs_id, reproduction_date)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2022-08-05 08:05:17'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.followers_artist(users_id, artists_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);