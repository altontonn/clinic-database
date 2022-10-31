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

-- Day 4 --
SELECT vets.name AS vet_name, animals.name AS Last_seen_animal, date_of_visit AS visit_date FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 1 ORDER BY date_of_visit desc LIMIT 1;
SELECT COUNT (DISTINCT animals.name) as Animals_seen FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 3;
SELECT vets.name AS vet_name, species.name AS species_name FROM specializations RIGHT JOIN vets ON vets.id = specializations.vet_id LEFT JOIN species ON species.id = specializations.species_id;
SELECT COUNT (DISTINCT animals.name) as Animals_visited FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 3 AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-20';
SELECT animals.name, COUNT (animals_id) AS visits FROM visits JOIN animals ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id GROUP BY animals.name ORDER BY visits DESC LIMIT 1;
SELECT vets.name as vet_name, animals.name AS first_animal_visited, date_of_visit FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 2 ORDER BY date_of_visit LIMIT 1;
SELECT animals.name AS animal_name, animals.weight_kg AS weight, animals.escape_attempts AS escape_attempts, vets.name AS name, vets.age AS age, date_of_visit FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id ORDER BY date_of_visit;
SELECT species.name, COUNT(animals.species_id) FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id INNER JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(animals.species_id);
SELECT species.name, count(*) FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN species ON species.id = animals.species_id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets_id = 2 GROUP BY species.name;

-- Queries to check performance
SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';