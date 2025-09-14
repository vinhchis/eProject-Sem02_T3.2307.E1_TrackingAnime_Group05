-- After you create a database with "tbdb" on Script-Create
-- Run this script to add first data
GO
USE tbdb;

-- 1. Accounts Table
-- username: admin1, admin2, user1, user2, user3
-- passs: 123 (Brypt(10))

INSERT INTO Accounts
    (username, hashed_password, user_role)
VALUES
    ('admin1', '$2y$10$RBDBkwOOhglMmYeP2POJJuGriIl3Paj.XxxOWIo2dm4baw2LGPXb6', 'ADMIN'),
    ('admin2', '$2y$10$RBDBkwOOhglMmYeP2POJJuGriIl3Paj.XxxOWIo2dm4baw2LGPXb6', 'ADMIN'),
    ('user1', '$2y$10$RBDBkwOOhglMmYeP2POJJuGriIl3Paj.XxxOWIo2dm4baw2LGPXb6', 'USER'),
    ('user2', '$2y$10$RBDBkwOOhglMmYeP2POJJuGriIl3Paj.XxxOWIo2dm4baw2LGPXb6', 'USER'),
    ('user3', '$2y$10$RBDBkwOOhglMmYeP2POJJuGriIl3Paj.XxxOWIo2dm4baw2LGPXb6', 'USER');
GO


-- 2. Seasons Table
-- From 2023 to 2024
INSERT INTO Seasons
    (season_name, season_year)
VALUES
    ('WINTER', 2023),
    ('SPRING', 2023),
    ('SUMMER', 2023),
    ('FALL', 2023),
    ('WINTER', 2024),
    ('SPRING', 2024),
    ('SUMMER', 2024),
    ('FALL', 2024);
GO

-- 3. Studios Table
INSERT INTO Studios
    (studio_name, best_animes)
VALUES
    ('Studio Ghibli' , 'Spirited Away, My Neighbor Totoro'),
    ('Madhouse', 'Death Note, One Punch');
GO



-- 4. Animes Table
INSERT INTO Animes
    (title, introduction, anime_status, anime_type, total_episodes, schedule_day, schedule_time, studio_id, season_name, season_year)
VALUES
    ('Naruto', 'A story about a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.', 'COMPLETED', 'TV', 220, 'Monday', '19:00:00', 1, 'FALL', 2024),
    ('Your Name', 'Two teenagers share a profound, magical connection upon discovering they are swapping bodies.', 'COMPLETED', 'MOVIE', 1, NULL, NULL, 1, 'SUMMER', 2023);
GO

-- 5. Episodes Table
INSERT INTO Episodes
    (anime_id, episode_number, episode_title, air_date)
VALUES
    (1, 1, 'Enter: Naruto Uzumaki!', '2002-10-03 19:00:00'),
    (1, 2, 'My Name is Konohamaru!', '2002-10-10 19:00:00'),
    (1, 3, 'Sasuke and Sakura: Friends or Foes?', '2002-10-17 19:00:00');
GO

-- 6. Trackings Table
INSERT INTO Tracking
    (user_id, anime_id, tracking_status, last_watched_episode, rating, note)
VALUES
    (3, 1, 'WATCHING', 50, 5, 'Great anime!'),
    (3, 2, 'COMPLETED', 1, 4, 'Beautiful movie with stunning visuals.');
GO

-- 7. Notifications Table
INSERT INTO Notifications
    (user_id, anime_id, title, created_at, is_read)
VALUES
    (3, 1, 'New Episode Released', '2024-10-01 10:00:00', 0),
    (3, 1, 'Anime Completed', '2024-09-15 14:30:00', 1);
GO