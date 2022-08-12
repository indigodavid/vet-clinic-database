/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT name, date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT avg(weight_kg) FROM animals;
SELECT sum(escape_attempts), neutered 
FROM animals GROUP BY neutered ORDER BY sum(escape_attempts) DESC limit 1;
SELECT min(weight_kg), max(weight_kg) FROM animals;
SELECT species, avg(escape_attempts) FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.id, name, owner_id, full_name FROM animals 
LEFT JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';

SELECT animals.id, animals.name, species_id, species.name AS species FROM animals 
LEFT JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';

SELECT 
  owners.id, 
  full_name, 
  animals.id AS animal_id, 
  animals.name AS animal_name 
FROM owners 
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT 
  count(animals.name) AS animal_count,
  species.name AS species
FROM animals
LEFT JOIN species ON species_id = species.id
GROUP BY species.name;

SELECT 
  animals.name,
  owners.full_name AS owner_name,
  species.name AS species
FROM animals
LEFT JOIN owners ON owner_id = owners.id
LEFT JOIN species ON species_id = species.id
WHERE species.name = 'Digimon'
AND owners.full_name = 'Jennifer Orwell';

SELECT
  animals.name, 
  owners.full_name AS owner,
  escape_attempts 
FROM animals
LEFT JOIN owners ON owner_id = owners.id
WHERE escape_attempts = 0
AND owners.full_name = 'Dean Winchester';

SELECT 
  owners.full_name AS owner,
  count(animals.id) 
FROM animals 
RIGHT JOIN owners ON owner_id = owners.id
GROUP BY owners.full_name
ORDER BY count(animals.id) DESC LIMIT 1;

SELECT 
  animals.name,
  vets.name AS vet,
  date_of_visit
FROM visits
RIGHT JOIN animals ON animals_id = animals.id
RIGHT JOIN vets ON vets_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC LIMIT 1;

SELECT count(animals.name), vets.name AS vet FROM visits
RIGHT JOIN animals ON animals_id = animals.id
RIGHT JOIN vets ON vets_id = vets.id
GROUP BY vets.name
HAVING vets.name = 'Stephanie Mendez';

SELECT
  vets.name AS vets,
  species.name AS specialties
FROM specializations
RIGHT JOIN vets ON vets_id = vets.id
LEFT JOIN species ON species_id = species.id;

SELECT
  animals.name AS animals,
  vets.name AS vet,
  date_of_visit
FROM visits
LEFT JOIN animals ON animals_id = animals.id
LEFT JOIN vets ON vets_id = vets.id
GROUP BY animals.name, vets.name, date_of_visit
HAVING date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
AND vets.name = 'Stephanie Mendez';

SELECT
  animals.name,
  count(visits.animals_id) AS number_of_visits
FROM visits
LEFT JOIN animals ON animals_id = animals.id
GROUP BY animals.name
ORDER BY count(visits.animals_id) DESC LIMIT 1;

SELECT
  animals.name,
  vets.name AS vet,
  date_of_visit
FROM visits
RIGHT JOIN animals ON animals_id = animals.id
RIGHT JOIN vets ON vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit ASC LIMIT 1;

SELECT 
  date_of_visit,
  animals.name AS animal,
  animals.date_of_birth AS animal_birth,
  animals.escape_attempts,
  animals.neutered,
  animals.weight_kg,
  species.name AS species,
  owners.full_name AS owner,
  vets.name AS vet,
  vets.age AS vet_age,
  vets.date_of_graduation AS vet_graduation
FROM visits
LEFT JOIN animals ON animals_id = animals.id
LEFT JOIN vets ON vets_id = vets.id
LEFT JOIN species ON animals.species_id = species.id
LEFT JOIN owners ON animals.owner_id = owners.id
ORDER BY date_of_visit DESC LIMIT 1;

SELECT
  count(*) AS visits_to_non_specialist 
FROM visits
LEFT JOIN animals ON visits.animals_id = animals.id
LEFT JOIN vets ON visits.vets_id = vets.id
WHERE animals.species_id NOT IN (
  SELECT species_id FROM specializations
  WHERE vets_id = vets.id
);

SELECT 
  species.name, 
  count(*) 
FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN species ON animals.species_id = species.id
JOIN vets ON visits.vets_id = vets.id
GROUP BY species.name, vets.name HAVING vets.name = 'Maisy Smith'
ORDER BY count(*) DESC LIMIT 1;
