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

-- -----------------------------------------------------------------------------
-- Insertion des focaccias
-- Source : focaccia.xlsx
-- -----------------------------------------------------------------------------
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (1, 'Mozaccia', 9.80);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (2, 'Gorgonzollaccia', 10.80);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (3, 'Raclaccia', 8.90);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (4, 'Emmentalaccia', 9.80);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (5, 'Tradizione', 8.90);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (6, 'Hawaienne', 11.20);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (7, 'Américaine', 10.80);
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES (8, 'Paysanne', 12.80);

-- -----------------------------------------------------------------------------
-- Liaison focaccia <-> ingredient (N:N) + quantité
-- Source : focaccia.xlsx (colonne "ingrédients")
--
-- Règles : 
--  - une ligne par couple (focaccia, ingredient)
--  - quantité : 
--      * valeur entre parenthèse si présente
--      * sinon valeur par défaut définie dans le fichier
-- -----------------------------------------------------------------------------
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES 
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Base Tomate'), 200),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Mozarella'), 50),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Cresson'), 20),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Jambon fumé'), 80),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Ail'), 2),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Artichaut'), 20),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Champignon'), 40),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Parmesan'), 50),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Poivre'), 1),
(1, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Olive noire'), 20),
(2, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Base Tomate'), 200),
(2, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Gorgonzola'), 50),
(2, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Cresson'), 20),
(2, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Ail'), 2),
(2, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Champignon'), 40),
(2, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Parmesan'), 50),
(2, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Poivre'), 1),
(2, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Olive noire'), 20),
(3, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Base Tomate'), 200),
(3, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Gorgonzola'), 50),
(3, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Cresson'), 20),
(3, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Ail'), 2),
(3, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Champignon'), 40),
(3, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Parmesan'), 50),
(3, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Poivre'), 1),
(3, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Olive noire'), 20),
(4, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Base crème'), 200),
(4, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Emmental'), 50),
(4, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Cresson'), 20),
(4, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Champignon'), 40),
(4, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Parmesan'), 50),
(4, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Poivre'), 1),
(4, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Oignon'), 20),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Base Tomate'), 200),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Mozarella'), 50),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Cresson'), 20),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Jambon cuit'), 80),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Champignon'), 80),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Parmesan'), 50),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Poivre'), 1),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Olive noire'), 10),
(5, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Olive verte'), 10),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Base Tomate'), 200),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Mozarella'), 50),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Cresson'), 20),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Bacon'), 80),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Ananas'), 40),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Piment'), 2),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Parmesan'), 50),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Poivre'), 1),
(6, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Olive noire'), 20),
(7, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Base Tomate'), 200),
(7, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Mozarella'), 50),
(7, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Cresson'), 20),
(7, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Bacon'), 80),
(7, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Pomme de terre'), 40),
(7, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Parmesan'), 50),
(7, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Poivre'), 1),
(7, (SELECT id_ingredient FROM ingredient WHERE nom_ingredient = 'Olive noire'), 20);



-- COMMIT;

SELECT * FROM marque;
SELECT * FROM boisson;
SELECT * FROM ingredient;
SELECT * FROM focaccia;
SELECT f.nom_focaccia, i.nom_ingredient, fi.quantite
FROM focaccia_ingredient fi
    JOIN focaccia f ON f.id_focaccia = fi.id_focaccia
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.id_focaccia = 1
ORDER BY i.nom_ingredient;
SELECT f.nom_focaccia, i.nom_ingredient, fi.quantite
FROM focaccia_ingredient fi
    JOIN focaccia f ON f.id_focaccia = fi.id_focaccia
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.id_focaccia = 2
ORDER BY i.nom_ingredient;
SELECT f.nom_focaccia, i.nom_ingredient, fi.quantite
FROM focaccia_ingredient fi
    JOIN focaccia f ON f.id_focaccia = fi.id_focaccia
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.id_focaccia = 3
ORDER BY i.nom_ingredient;
SELECT f.nom_focaccia, i.nom_ingredient, fi.quantite
FROM focaccia_ingredient fi
    JOIN focaccia f ON f.id_focaccia = fi.id_focaccia
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.id_focaccia = 4
ORDER BY i.nom_ingredient;
SELECT f.nom_focaccia, i.nom_ingredient, fi.quantite
FROM focaccia_ingredient fi
    JOIN focaccia f ON f.id_focaccia = fi.id_focaccia
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.id_focaccia = 5
ORDER BY i.nom_ingredient;
SELECT f.nom_focaccia, i.nom_ingredient, fi.quantite
FROM focaccia_ingredient fi
    JOIN focaccia f ON f.id_focaccia = fi.id_focaccia
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.id_focaccia = 6
ORDER BY i.nom_ingredient;
SELECT f.nom_focaccia, i.nom_ingredient, fi.quantite
FROM focaccia_ingredient fi
    JOIN focaccia f ON f.id_focaccia = fi.id_focaccia
    JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE f.id_focaccia = 7
ORDER BY i.nom_ingredient;

--

ROLLBACK;