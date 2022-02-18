- CREATE DATABASE `Cinéma` CHARACTER SET utf8 COLLATE utf8_general_ci;

- CREATE TABLE Complexe (
    id_complexe CHAR(36) NOT NULL PRIMARY KEY
);

- CREATE TABLE Cinémas(
    id_cinema CHAR(36) NOT NULL PRIMARY KEY,
    nom_cinema VARCHAR(50) NOT NULL,
    contient CHAR(36) NULL,
    FOREIGN KEY (contient) REFERENCES complexe(id_complexe)
); 

- CREATE TABLE salle(
    id_salle CHAR(36) NOT NULL PRIMARY KEY,
    numero_salle INT(3) NOT NULL UNIQUE,
    nombre_places INT(3) NOT NULL,
    salle_pleine BOOLEAN NOT NULL,
    comporte CHAR(36) NULL,
    FOREIGN KEY (comporte) REFERENCES cinémas(id_cinéma)
);

- CREATE TABLE séance(
    id_seance CHAR(36) NOT NULL PRIMARY KEY,
    horaire_debut TIME NOT NULL,
    horaire_fin TIME NOT NULL,
    date DATE NOT NULL,
	propose CHAR(36) NULL,
    FOREIGN KEY (propose) REFERENCES salle(id_salle)
);

CREATE TABLE tarifs(
    id_tarif CHAR(36) NOT NULL PRIMARY KEY,
    plein_tarif FLOAT(2,2),
    etudiant FLOAT(2,2),
    enfant FLOAT(2,2),
    prix CHAR(36) NULL,
    FOREIGN KEY (prix) REFERENCES séance(id_séance)
);  

CREATE TABLE paiement_sur_place(
    id_surplace CHAR(36) NOT NULL PRIMARY KEY,
    tarif FLOAT NULL,
    surplace CHAR(36) NULL,
    FOREIGN KEY (surplace) REFERENCES tarifs(id_tarif)
);    

CREATE TABLE paiement_en_ligne(
    id_enligne CHAR(36) NOT NULL PRIMARY KEY,
    tarif FLOAT NULL,
    enligne CHAR(36) NULL,
    FOREIGN KEY (enligne) REFERENCES tarifs(id_tarif)
); 

CREATE TABLE film(
    id_film CHAR(36) NOT NULL PRIMARY KEY,
    nom_film VARCHAR(50) NOT NULL,
    passe CHAR(36) NULL,
    FOREIGN KEY (passe) REFERENCES séance(id_séance)
);    

CREATE TABLE clients(
    id_client CHAR(36) NOT NULL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    age INT(3) NOT NULL,
    etudiant BOOLEAN
);    

/* Paté */

INSERT INTO complexe SET 
id_complexe = uuid();

INSERT INTO cinémas SET 
id_cinéma = uuid(), 
nom_cinéma = "paté", 
contient = "0f1a878d-8fce-11ec-9fe4-00090ffe0001";

INSERT INTO salle SET 
id_salle = uuid(), 
numéro_salle = 1, 
nombre_places = 30, 
salle_pleine = false, 
comporte = "92d3bfb4-8ff6-11ec-9fe4-00090ffe0001";

INSERT INTO séance SET 
id_séance = uuid(), 
horaire_début = "21:00:00", 
horaire_fin = "22:30:00", 
date = "2022-02-05", 
propose = "6a098098-8ff7-11ec-9fe4-00090ffe0001";

INSERT INTO film SET 
id_film = uuid(), 
nom_film = "Avator", 
passe = "c58489c4-8ff8-11ec-9fe4-00090ffe0001";

INSERT INTO tarifs SET 
id_tarif = uuid(), 
prix = "c58489c4-8ff8-11ec-9fe4-00090ffe0001";

INSERT INTO paiement_en_ligne SET 
id_enligne = uuid(), 
enligne = "8ce37861-8ffd-11ec-9fe4-00090ffe0001";

INSERT INTO paiement_sur_place SET 
id_surplace = uuid(), 
surplace = "8ce37861-8ffd-11ec-9fe4-00090ffe0001";

/* Gromont */

INSERT INTO cinémas SET 
id_cinéma = uuid(), 
nom_cinéma = "Gromont", 
contient = "0f1a878d-8fce-11ec-9fe4-00090ffe0001";

INSERT INTO salle SET 
id_salle = uuid(),
numéro_salle = 2, 
nombre_places = 28, 
salle_pleine = false, 
comporte = "ce63fc67-8fff-11ec-9fe4-00090ffe0001";

INSERT INTO séance SET 
id_séance = uuid(), 
horaire_début = "18:00:00", 
horaire_fin = "19:30:00", 
date = "2022-02-06", 
propose = "5df9ffca-9000-11ec-9fe4-00090ffe0001";

INSERT INTO film SET 
id_film = uuid(), 
nom_film = "Retour vers le présent", 
passe = "c4150448-9000-11ec-9fe4-00090ffe0001";

INSERT INTO tarifs SET 
id_tarif = uuid(), 
prix = "c4150448-9000-11ec-9fe4-00090ffe0001";

INSERT INTO paiement_en_ligne SET 
id_enligne = uuid(), 
enligne = "19327f8c-9001-11ec-9fe4-00090ffe0001";

INSERT INTO paiement_sur_place SET 
id_surplace = uuid(), 
surplace = "19327f8c-9001-11ec-9fe4-00090ffe0001";

/* Ymax */

INSERT INTO cinémas SET 
id_cinéma = uuid(), 
nom_cinéma = "Ymax", 
contient = "0f1a878d-8fce-11ec-9fe4-00090ffe0001";

INSERT INTO salle SET 
id_salle = uuid(), 
numéro_salle = 3, 
nombre_places = 20, 
salle_pleine = false, 
comporte = "98348826-9001-11ec-9fe4-00090ffe0001";

INSERT INTO séance SET 
id_séance = uuid(), 
horaire_début = "10:00:00", 
horaire_fin = "13:30:00", 
date = "2022-02-04", 
propose = "b440ba2a-9001-11ec-9fe4-00090ffe0001";

INSERT INTO film SET 
id_film = uuid(), 
nom_film = "Indiana fonce", 
passe = "f7d46489-9001-11ec-9fe4-00090ffe0001";

INSERT INTO tarifs SET 
id_tarif = uuid(), 
prix = "f7d46489-9001-11ec-9fe4-00090ffe0001";

INSERT INTO paiement_en_ligne SET 
id_enligne = uuid(), 
enligne = "4296ff2f-9002-11ec-9fe4-00090ffe0001";

INSERT INTO paiement_sur_place SET 
id_surplace = uuid(), 
surplace = "4296ff2f-9002-11ec-9fe4-00090ffe0001";

INSERT INTO clients SET 
id_client = uuid(),
nom = "John Doe",
age = 25,
etudiant = true;

INSERT INTO clients SET
id_client = uuid(),
nom = "Jim Square",
age = 39,
etudiant = false;

INSERT INTO clients SET
id_client = uuid(),
nom = "Kevin Lamouche",
age = 13,
etudiant = true;

SELECT *
FROM cinémas
INNER JOIN complexe ON cinémas.contient = complexe.id_complexe

SELECT *
FROM salle
INNER JOIN cinémas ON salle.comporte = cinémas.id_cinema

SELECT *
FROM séance
INNER JOIN salle ON séance.propose = salle.id_salle

SELECT *
FROM film
INNER JOIN séance ON film.passe = séance.id_seance

SELECT *
FROM tarifs
INNER JOIN séance ON tarifs.prix = séance.id_seance

SELECT *
FROM paiement_en_ligne
INNER JOIN tarifs ON paiement_en_ligne.enligne = tarifs.id_tarif

SELECT *
FROM paiement_sur_place
INNER JOIN tarifs ON paiement_sur_place.surplace = tarifs.id_tarif
