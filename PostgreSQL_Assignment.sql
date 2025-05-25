-- Active: 1747435044821@@127.0.0.1@5432@assignmen2
-- CREATE DATABASE Assignmen2 ;
-- table create and data insert start
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY ,
    name VARCHAR(100),
    region  VARCHAR(100)

) 
 

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY ,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    discovery_date DATE ,
    conservation_status VARCHAR(100)

)


CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY ,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
     sighting_time TIMESTAMP,
    location VARCHAR(150),
    notes TEXT
)

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');


SELECT * FROM rangers

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

SELECT * FROM species

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM sightings

DELETE FROM sightings;


-- table create and data insert end


-- 1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

-- task 1 start 

INSERT INTO rangers (name, region) VALUES 
('Derek Fox','Coastal Plains')

SELECT * FROM rangers

-- task 1 end 


-- 2️⃣ Count unique species ever sighted.
-- task 2 start

SELECT COUNT( DISTINCT species_id) from sightings

-- task 2 end





-- 3️⃣ Find all sightings where the location includes "Pass".

-- task 3 start 

SELECT * FROM sightings
    WHERE location like '%Pass%'

-- task 3 end


-- 4️⃣ List each ranger's name and their total number of sightings.

-- tast 4 start 

SELECT r.name, count(s.sighting_id) from rangers as r
join sightings as s  on r.ranger_id = s.ranger_id
    GROUP BY r.name , r.ranger_id


-- tast 4 start 


-- task 5 start 

SELECT A.common_name , A.species_id from species as A
left JOIN sightings as s on A.species_id = s.species_id
    WHERE s.species_id IS NULL
    
-- task 5 end

-- task 6 start

SELECT 
    sp.common_name, 
    s.sighting_time, 
    r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;

-- task 6 end 




-- task 7 start

UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

-- task 7 end

-- task 8 start 

SELECT 
  sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;

-- task 8 end

-- task 9 star

DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
);

-- task 9 end