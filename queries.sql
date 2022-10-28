/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM ANIMALS WHERE name LIKE '%mon%';
SELECT NAME FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-12-31';
SELECT NAME FROM ANIMALS WHERE NEUTERED = 't' AND ESCAPE_ATTEMPTS < 3;
SELECT DATE_OF_BIRTH FROM ANIMALS WHERE NAME IN ('Agumon', 'Pikachu');
SELECT NAME, ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT_KG > 10.50;
SELECT NAME FROM ANIMALS WHERE NEUTERED = 't';
SELECT NAME FROM ANIMALS WHERE NAME NOT IN ('Gabumon');
SELECT NAME FROM ANIMALS WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;

-- Transaction--
BEGIN;
UPDATE ANIMALS SET SPECIES = 'UNSPECIFIED';
ROLLBACK;
BEGIN
UPDATE ANIMALS SET SPECIES = 'digimon' WHERE NAME LIKE '%mon%';
UPDATE ANIMALS SET species = 'pokemon' WHERE ID IN (3, 5, 7, 10, 11);
COMMIT;
DELETE FROM ANIMALS WHERE DATE_OF_BIRTH >= '1993-04-02';
ROLLBACK;
SELECT * FROM ANIMALS;
DELETE FROM ANIMALS WHERE DATE_OF_BIRTH > '2022-01-01';
SAVEPOINT SP1;
UPDATE ANIMALS SET WEIGHT_KG = WEIGHT_KG * -1;
ROLLBACK SP1;
UPDATE ANIMALS SET WEIGHT_KG = WEIGHT_KG * -1 WHERE ID IN (6, 8, 5, 7);
COMMIT;

SELECT COUNT(*) FROM ANIMALS;
SELECT COUNT(*) FROM ANIMALS WHERE ESCAPE_ATTEMPTS = 0;
SELECT AVG(WEIGHT_KG) FROM ANIMALS;
SELECT * FROM ANIMALS WHERE ESCAPE_ATTEMPTS = (SELECT MAX(ESCAPE_ATTEMPTS) FROM ANIMALS);
SELECT MAX(WEIGHT_KG) AS MAXWEIGHT, MIN(WEIGHT_KG) AS MINWEIGHT FROM ANIMALS;
SELECT CAST(AVG(ESCAPE_ATTEMPTS) AS DECIMAL(5,2)) FROM ANIMALS WHERE DATE_OF_BIRTH >= '1990-01-01' AND DATE_OF_BIRTH <= '2000-12-31';

-- Multiple Tables --
SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 4;
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT full_name, animals.name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;
SELECT SPECIES.NAME AS animal_type, COUNT (SPECIES_ID) FROM ANIMALS JOIN SPECIES ON SPECIES.ID = ANIMALS.SPECIES_ID GROUP BY SPECIES.NAME ORDER BY COUNT (SPECIES.ID);
SELECT ANIMALS.NAME FROM ANIMALS INNER JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID WHERE OWNERS.ID = 2;
SELECT ANIMALS.NAME, ANIMALS.ESCAPE_ATTEMPTS FROM ANIMALS INNER JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID WHERE OWNERS.ID = 5 AND ESCAPE_ATTEMPTS < 1;
SELECT OWNERS.FULL_NAME, COUNT (OWNERS.FULL_NAME) FROM ANIMALS JOIN OWNERS ON OWNERS.ID = ANIMALS.OWNER_ID GROUP BY FULL_NAME ORDER BY COUNT DESC LIMIT 1;