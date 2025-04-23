-- Create DATABASE universe
CREATE DATABASE universe;


-- Create GALAXY table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_type TEXT,
  age_in_million_years INT NOT NULL,
  is_visible BOOLEAN NOT NULL
);

-- Create STAR table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  temperature INT NOT NULL,
  is_active BOOLEAN NOT NULL
);

-- Create PLANET table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT REFERENCES star(star_id),
  has_life BOOLEAN NOT NULL,
  diameter_km INT NOT NULL,
  gravity NUMERIC
);

-- Create MOON table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  is_spherical BOOLEAN NOT NULL,
  diameter_km INT NOT NULL
);

-- Add a 5th table: SPACE_STATION
CREATE TABLE space_station (
  space_station_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  purpose TEXT,
  crew_capacity INT NOT NULL,
  is_operational BOOLEAN NOT NULL
);

-- Insert data into GALAXY (6 rows)
INSERT INTO galaxy (name, galaxy_type, age_in_million_years, is_visible) VALUES
('Milky Way', 'Spiral', 13600, TRUE),
('Andromeda', 'Spiral', 10000, TRUE),
('Triangulum', 'Spiral', 8000, TRUE),
('Whirlpool', 'Spiral', 12000, FALSE),
('Messier 87', 'Elliptical', 13000, FALSE),
('Sombrero', 'Spiral', 11000, TRUE);

-- Insert data into STAR (6 rows)
INSERT INTO star (name, galaxy_id, temperature, is_active) VALUES
('Sun', 1, 5778, TRUE),
('Proxima Centauri', 1, 3042, TRUE),
('Sirius', 2, 9940, TRUE),
('Betelgeuse', 2, 3500, FALSE),
('Rigel', 3, 11000, TRUE),
('Vega', 4, 9602, TRUE);

-- Insert data into PLANET (12 rows)
INSERT INTO planet (name, star_id, has_life, diameter_km, gravity) VALUES
('Earth', 1, TRUE, 12742, 9.8),
('Mars', 1, FALSE, 6779, 3.7),
('Venus', 1, FALSE, 12104, 8.87),
('Proxima b', 2, FALSE, 11400, 10.5),
('Sirius B1', 3, FALSE, 15000, 7.2),
('Sirius B2', 3, FALSE, 9000, 6.5),
('Betel One', 4, FALSE, 14000, 5.1),
('Betel Two', 4, FALSE, 13000, 4.8),
('Rigel A', 5, FALSE, 12500, 5.9),
('Rigel B', 5, FALSE, 8000, 4.6),
('Vega Prime', 6, FALSE, 11000, 5.3),
('Vega Second', 6, FALSE, 10500, 5.1);

-- Insert data into MOON (20+ rows)
INSERT INTO moon (name, planet_id, is_spherical, diameter_km) VALUES
('Moon', 1, TRUE, 3474),
('Phobos', 2, FALSE, 22),
('Deimos', 2, FALSE, 12),
('Maxwell', 3, TRUE, 1200),
('Luna X', 4, TRUE, 800),
('Sirius Alpha', 5, TRUE, 500),
('Sirius Beta', 6, TRUE, 300),
('Sirius Gamma', 6, TRUE, 100),
('Betel 1a', 7, TRUE, 1500),
('Betel 1b', 7, FALSE, 700),
('Betel 2a', 8, FALSE, 450),
('Rigel 1', 9, TRUE, 900),
('Rigel 2', 9, FALSE, 400),
('Rigel 3', 10, TRUE, 700),
('Vega M1', 11, TRUE, 600),
('Vega M2', 11, TRUE, 300),
('Vega M3', 12, TRUE, 200),
('Nova', 12, FALSE, 150),
('Zeta', 3, FALSE, 90),
('Orion', 5, TRUE, 670),
('Helios', 1, TRUE, 1000);

-- Insert into SPACE_STATION (3 rows)
INSERT INTO space_station (name, purpose, crew_capacity, is_operational) VALUES
('ISS', 'Research', 6, TRUE),
('Hubble', 'Observation', 0, FALSE),
('Lunar Gateway', 'Moon Missions', 4, FALSE);
