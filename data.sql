/* Populate database with sample data. */

INSERT INTO animals VALUES (
  0, 
  'Agumon',
  '2020-02-03',
  0,
  true,
  10.23
);

INSERT INTO animals VALUES (
  1, 
  'Gabumon',
  '2018-11-15',
  2,
  true,
  8.0
);

INSERT INTO animals VALUES (
  2, 
  'Pikachu',
  '2021-01-07',
  1,
  false,
  15.04
);

INSERT INTO animals VALUES (
  3, 
  'Devimon',
  '2017-05-12',
  5,
  true,
  11.0
);

INSERT INTO animals 
(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Charmander', '2020-02-08', -11.0, false, 0);

INSERT INTO animals 
(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Plantmon', '2021-11-15', -5.7, true, 2);

INSERT INTO animals 
(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Squirtle', '1993-04-02', -12.13, false, 3);

INSERT INTO animals 
(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Angemon', '2005-06-12', -45, true, 1);

INSERT INTO animals 
(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Boarmon', '2005-06-07', 20.4, true, 7);

INSERT INTO animals 
(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Blossom', '1998-10-13', 17, true, 3);

INSERT INTO animals 
(name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Ditto', '2022-05-14', 22, true, 4);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES (1,1);
INSERT INTO specializations (vet_id, species_id) VALUES (3,1);
INSERT INTO specializations (vet_id, species_id) VALUES (3,2);
INSERT INTO specializations (vet_id, species_id) VALUES (4,2);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (0, 1, '2020-05-24');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (0, 3, '2020-07-22');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (1, 4, '2021-02-02');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (2, 2, '2020-01-05');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (2, 2, '2020-03-08');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (2, 2, '2020-05-14');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (3, 3, '2021-05-04');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (4, 4, '2021-02-24');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (5, 2, '2019-12-21');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (5, 1, '2020-08-10');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (5, 2, '2021-04-07');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (6, 3, '2019-09-29');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (7, 4, '2020-10-03');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (7, 4, '2020-11-04');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (8, 2, '2019-01-24');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (8, 2, '2019-05-15');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (8, 2, '2020-02-27');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (8, 2, '2020-08-03');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (9, 3, '2020-05-24');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (9, 1, '2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
