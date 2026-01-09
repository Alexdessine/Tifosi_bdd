-- =============================================================================
-- 02_insert_data.sql
-- Objectif : 
--  - Alimenter la base de données `tifosi` à partir des fichiers .xlsx fournis
--  - Insérer les données dans un ordre respectant les clés étrangères
--
-- Source : 
--  - data/marques.xlsx
--  - data/boisson.xlsx
--  - data/ingredient.xlsx
--  - data/focaccia.xlsx
--
-- Remarque :
--  Ce script doit être exécuté après :
--      1) 00_init.sql
--      2) 01_schema.sql
-- =============================================================================

USE tifosi;

START TRANSACTION;

-- -----------------------------------------------------------------------------
-- Insertion des marques
-- Sources : marque.xlsx
-- -----------------------------------------------------------------------------
INSERT INTO marque (id_marque, nom_marque) VALUES (1, 'Coca-Cola');
INSERT INTO marque (id_marque, nom_marque) VALUES (2, 'Cristalline');
INSERT INTO marque (id_marque, nom_marque) VALUES (3, 'Monster');
INSERT INTO marque (id_marque, nom_marque) VALUES (4, 'Pepsico');

-- -----------------------------------------------------------------------------
-- Insertion des boissons
-- Source : boisson.xlsx
-- Dépend de : Marque
-- -----------------------------------------------------------------------------
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (1, 'Coca-Cola zéro', 1);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (2, 'Coca-Cola original', 1);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (3, 'Fanta citron', 1);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (4, 'Fanta orange', 1);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (5, 'Capri-sun', 1);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (6, 'Pepsi', 4);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (7, 'Pepsi Max Zéro', 4);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (8, 'Lipton zéro citron', 4);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (9, 'Lipton Peach', 4);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (10, 'Monster energy ultra gold', 3);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (11, 'Monster energy ultra blue', 3);
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (12, 'Eau de source', 2);

COMMIT;