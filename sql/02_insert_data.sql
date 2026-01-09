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

-- -----------------------------------------------------------------------------
-- Insertion des ingrédients
-- source : ingredients.xlsx
-- -----------------------------------------------------------------------------
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (1, 'Ail');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (2, 'Ananas');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (3, 'Artichaut');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (4, 'Bacon');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (5, 'Base Tomate');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (6, 'Base crème');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (7, 'Champignon');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (8, 'Chèvre');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (9, 'Cresson');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (10, 'Emmental');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (11, 'Gorgonzola');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (12, 'Jambon cuit');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (13, 'Jambon fumé');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (14, 'Oeuf');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (15, 'Oignon');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (16, 'Olive noire');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (17, 'Olive verte');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (18, 'Parmesan');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (19, 'Piment');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (20, 'Poivre');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (21, 'Pomme de terre');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (22, 'Raclette');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (23, 'Salami');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (24, 'Tomate cerise');
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES (25, 'Mozarella');

-- COMMIT;

SELECT * FROM marque;
SELECT * FROM boisson;
SELECT * FROM ingredient;

--

ROLLBACK;