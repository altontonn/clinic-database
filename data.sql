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