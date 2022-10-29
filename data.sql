/* Populate database with sample data. */

INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES(1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES(2, 'Gabumon', '2018-11-15', 2, true, 8.00);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES(3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (ID, NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES(4, 'Devimon', '2017-05-12', 5, true, 11.00);
INSERT INTO ANIMALS VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO ANIMALS VALUES (7, 'Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO ANIMALS VALUES (8, 'Angemon', '2005-06-12', 1, true, -45.00);
INSERT INTO ANIMALS VALUES (9, 'Boarmon', '2005-07-07', 7, true, 20.4);
INSERT INTO ANIMALS VALUES (10, 'Blossom', '1998-10-13', 3, true, 17.00);
INSERT INTO ANIMALS VALUES (11, 'Dito', '2022-05-14', 4, true, 22.00);

-- Multiple Tables --
INSERT INTO OWNERS (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwel', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
UPDATE ANIMALS SET SPECIES_ID = 2 WHERE NAME LIKE '%mon%';
UPDATE ANIMALS SET SPECIES_ID = 1 WHERE ID IN (3, 10, 11, 5, 7);
UPDATE ANIMALS SET OWNER_ID = 1 WHERE NAME = 'Agumon';
UPDATE ANIMALS SET OWNER_ID = 2 WHERE NAME IN ('Gabumon', 'Pikachu');
UPDATE ANIMALS SET OWNER_ID = 3 WHERE NAME IN ('Devimon', 'Plantmon');
UPDATE ANIMALS SET OWNER_ID = 4 WHERE NAME IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE ANIMALS SET OWNER_ID = 5 WHERE NAME IN ('Angemon', 'Boarmon');

-- Day 4 --
INSERT INTO VETS (NAME, AGE, DATE_OF_GRADUATION) VALUES('William Tatcher', 45, '2000-04-23');
INSERT INTO VETS (NAME, AGE, DATE_OF_GRADUATION) VALUES('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) VALUES (1, 1, '2020-05-24'), (1, 3, '2020-07-22'), (2, 4, '2021-02-02'), (3, 2, '2020-01-05'), (3, 2, '2020-03-08'), (3, 2, '2020-05-14'), (4, 3, '2021-05-04'), (5, 4, '20201-02-24'), (6, 2, '2019-12-21'), (6, 1, '2021-08-10'), (6, 3, '2021-04-07'), (7, 3, '2019-09-29'), (8, 4, '2020-10-3'), (8, 4, '2020-11-04'), (9, 3, '2019-01-24'), (9, 3, '2019-05-15'), (9, 3, '2020-02-27'), (9, 3, '2020-08-03'), (10, 3, '2020-05-24'), (10, 1, '2021-01-11');