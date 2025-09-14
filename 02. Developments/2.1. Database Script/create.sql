-- You can change name of database "tbdb" as you wish.
-- But remember to change it in other script files too.
-- Script run on SQL Server Management Studio (SSMS).
CREATE DATABASE tbdb;
GO


USE tbdb;
GO

-- 1. Accounts Table
CREATE TABLE Accounts
(
    account_id INT PRIMARY KEY IDENTITY(1,1) ,
    username VARCHAR(50) NOT NULL UNIQUE,
    hashed_password VARCHAR(60) NOT NULL,
    user_role VARCHAR(10) NOT NULL DEFAULT 'USER' CHECK (user_role IN ('USER', 'ADMIN'))
);
GO

-- 2. Seasons Table
CREATE TABLE Seasons
(
    season_name VARCHAR(10) NOT NULL
        CHECK (season_name IN ('WINTER', 'SPRING', 'SUMMER', 'FALL')),
    season_year SMALLINT NOT NULL
        CHECK (season_year >= 1950 AND season_year <= 2100),
    PRIMARY KEY (season_name, season_year)
)
GO


-- 3. Studios Table
CREATE TABLE Studios
(
    studio_id INT PRIMARY KEY IDENTITY(1,1),
    studio_name NVARCHAR(100) NOT NULL UNIQUE,
    logo_url VARCHAR(255),
    best_animes NVARCHAR(MAX)
);
GO

-- 4. Anime Table
CREATE TABLE Animes
(
    anime_id INT PRIMARY KEY IDENTITY(1,1),
    studio_id INT,
    season_name VARCHAR(10),
    season_year SMALLINT,

    title VARCHAR(50) NOT NULL,
    poster_url VARCHAR(255),
    introduction NVARCHAR(MAX),
    anime_status VARCHAR(15) DEFAULT 'ONGOING'
        CHECK (anime_status IN ('ONGOING', 'COMPLETED', 'HIATUS', 'CANCELLED', 'UPCOMING')),
    anime_type VARCHAR(10) DEFAULT 'TV'
        CHECK (anime_type IN ('TV', 'MOVIE', 'OVA','SPECIAL')),
    total_episodes SMALLINT CHECK (total_episodes > 0),
    schedule_day VARCHAR(10)
        CHECK (schedule_day IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
    schedule_time TIME(0),


    FOREIGN KEY (season_name, season_year) REFERENCES Seasons(season_name, season_year),
    FOREIGN KEY (studio_id) REFERENCES Studios(studio_id)
)
GO


-- 5. Episodes Table
CREATE TABLE Episodes
(
    episode_id INT PRIMARY KEY IDENTITY(1,1),
    anime_id INT,

    episode_number SMALLINT NOT NULL CHECK (episode_number > 0),
    episode_title VARCHAR(100),
    air_date DATETIME2(0),

    FOREIGN KEY (anime_id) REFERENCES Animes(anime_id)
)
GO

-- 6. Tracking Table
CREATE TABLE Tracking
(
    tracking_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    anime_id INT NOT NULL,


    tracking_status VARCHAR(15) DEFAULT 'WATCHING'
        CHECK (tracking_status IN ('WATCHING', 'COMPLETED', 'ON_HOLD', 'DROPPED', 'PLAN_TO_WATCH')),
    last_watched_episode SMALLINT
        CHECK (last_watched_episode > 0),
    rating TINYINT
        CHECK (rating >= 1 AND rating <= 5),
    note NVARCHAR(MAX)


    FOREIGN KEY (user_id) REFERENCES Accounts(account_id),
    FOREIGN KEY (anime_id) REFERENCES Animes(anime_id)
)
GO

-- 7. Notifications Table
CREATE TABLE Notifications
(
    notification_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    anime_id INT,

    title VARCHAR(50) NOT NULL,
    created_at DATETIME2(0) DEFAULT GETDATE(),
    is_read BIT DEFAULT 0,

    FOREIGN KEY (anime_id) REFERENCES Animes(anime_id),
    FOREIGN KEY (user_id) REFERENCES Accounts(account_id)
)
GO

