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

COMMIT;