-- =============================================================================
-- 03_test_queries.sql
-- Objectif : 
--  - Regrouper les 10 requêtes de vérification demandées dans le brief.
--
-- Pour chaque requête, ce fichier contient : 
--  - Le numéro et le but de la requête
--  - Le code SQL
--  - Le résultat attendu
--  - Le résultat obtenu
--  - Un commentaire en cas d'écart
--
-- Remarque :
--  Ce script doit être exécuté après :
--      1) 00_init.sql
--      2) 01_schema.sql
--      3) 02_insert_data.sql
-- =============================================================================

USE tifosi;

-- -----------------------------------------------------------------------------
-- Requête #1 : Liste les noms des focaccias par ordre alphabétique croissant
-- -----------------------------------------------------------------------------
-- But : 
--  Afficher la liste des noms des focaccias triée par ordre alphabétique (ASC)
-- 
-- SQL : 
--  SELECT * FROM focaccia ORDER BY nom_focaccia ORDER BY ASC
-- -----------------------------------------------------------------------------
-- Résultat attentu : 
--  Une colonne contenant les noms des focaccias, triés de A à Z.
--
-- Résultat obtenu :
-- 
-- nom_focaccia
-- Am├®ricaine
-- Emmentalaccia
-- Gorgonzollaccia
-- Hawaienne
-- Mozaccia
-- Paysanne
-- Raclaccia
-- Tradizione
--  
-- Ecarts / commentaires : 
-- 
-- Absence des accents
--
-- -----------------------------------------------------------------------------

SELECT nom_focaccia FROM focaccia ORDER BY nom_focaccia ASC;

-- ---------------------------------------------------------------------------
-- Requête 2 : Nombre total d'ingrédients
-- ---------------------------------------------------------------------------
-- But :
--   Afficher le nombre total d’ingrédients présents dans la table `ingredient`.
--
-- SQL :
--   SELECT COUNT(*) FROM ingredient
-- ---------------------------------------------------------------------------
-- Résultat attendu :
--   Un entier correspondant au nombre total de lignes dans `ingredient`. (25)
-- 
-- Résultat obtenu :
--   
--  COUNT(*)
--  25
-- 
-- Ecarts / commentaires :
-- 
-- ---------------------------------------------------------------------------

SELECT COUNT(*) FROM ingredient;

-- ---------------------------------------------------------------------------
-- Requête 3 : Prix moyen des focaccias
-- ---------------------------------------------------------------------------
-- But :
--   Calculer et afficher le prix moyen des focaccias.
--
-- SQL :
--   Utilisation de la requête AVG
--   SELECT AVG(prix) FROM focaccia
-- ---------------------------------------------------------------------------
-- Résultat attendu :
--   Une valeur décimale correspondant à la moyenne des prix de `focaccia`.
--
-- Résultat obtenu :
--   AVG(prix)
--   10.375000
--
-- Écarts / commentaires :
--   (à compléter si différence entre attendu et obtenu)
-- ---------------------------------------------------------------------------

SELECT AVG(prix) FROM focaccia;

-- ---------------------------------------------------------------------------
-- Requête 4 : Liste des boissons avec leur marque, triée par nom de boisson
-- ---------------------------------------------------------------------------
-- But :
--   Afficher la liste des boissons avec leur marque associée, triée par nom de boisson.
--
-- SQL :
--   Récupérer le nom de la marque depuis le table marque avec JOIN marque On id_marque
-- ---------------------------------------------------------------------------
-- Résultat attendu :
--   Deux colonnes (boisson + marque), triées par nom de boisson (ASC).
--
-- Résultat obtenu :
--   nom_boisson                    nom_marque
--   Capri-sun                      Coca-Cola
--   Coca-Cola original             Coca-Cola
--   Coca-Cola z├®ro                Coca-Cola
--   Eau de source                  Cristalline
--   Fanta citron                   Coca-Cola
--   Fanta orange                   Coca-Cola
--   Lipton Peach                   Pepsico
--   Lipton z├®ro citron            Pepsico
--   Monster energy ultra blue      Monster
--   Monster energy ultra gold      Monster
--   Pepsi                          Pepsico
--   Pepsi Max Z├®ro                Pepsico

--
-- Écarts / commentaires :
--   Manque les accents, à corriger
-- ---------------------------------------------------------------------------

SELECT nom_boisson, b.nom_marque FROM boisson JOIN marque b ON boisson.id_marque = b.id_marque ORDER BY nom_boisson ASC;

-- ---------------------------------------------------------------------------
-- Requête 5 : Liste des ingrédients pour une Raclaccia
-- ---------------------------------------------------------------------------
-- But :
--   Afficher la liste des ingrédients utilisés dans la focaccia nommée "Raclaccia".
--
-- SQL :
--   (à compléter)
-- ---------------------------------------------------------------------------
-- Résultat attendu :
--   La liste des ingrédients associés à "Raclaccia" (via la table de liaison).
--   (Base tomate, raclette, cresson, ail, champignon, parmesan, poivre)
--
-- Résultat obtenu :
--   nom_ingredient
-- Ail
-- Base Tomate
-- Champignon
-- Cresson
-- Gorgonzola
-- Olive noire
-- Parmesan
-- Poivre
--
-- Écarts / commentaires :
--   (à compléter si différence entre attendu et obtenu)
-- ---------------------------------------------------------------------------

SELECT nom_ingredient FROM ingredient 
JOIN focaccia_ingredient ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient 
JOIN focaccia ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia WHERE focaccia.nom_focaccia = 'Raclaccia';

-- ---------------------------------------------------------------------------
-- Requête 6 : Nom et nombre d'ingrédients pour chaque focaccia
-- ---------------------------------------------------------------------------
-- But :
--   Afficher, pour chaque focaccia, son nom et le nombre total d’ingrédients associés.
--
-- SQL :
--   jointure entre les tables focaccia, focaccia_ingredient et ingredient,
--   Avec un comptage du nombre d'ingrédients par focaccia
-- ---------------------------------------------------------------------------
-- Résultat attendu :
--   Une ligne par focaccia : (nom_focaccia, nombre_ingredients).
--
-- Résultat obtenu :
--   nom_focaccia    nombre_ingredients
--   Am├®ricaine     8
--   Emmentalaccia   7
--   Gorgonzollaccia 8
--   Hawaienne       9
--   Mozaccia        10
--   Paysanne        12
--   Raclaccia       8
--   Tradizione      9
--
-- Écarts / commentaires :
--   Aucun écart fonctionnel entre le résultat attendu et le résultat obtenu
--   L'affichage problématique des accents est dû à un problème d'encodage des caractères accentués
--   lors de l'affichage dans le terminal.
-- ---------------------------------------------------------------------------
SELECT focaccia.nom_focaccia, COUNT(ingredient.id_ingredient) AS nombre_ingredients FROM focaccia 
JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia 
JOIN ingredient ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient 
GROUP BY focaccia.nom_focaccia;

-- ---------------------------------------------------------------------------
-- Requête 7 : Nom de la focaccia qui a le plus d'ingrédients
-- ---------------------------------------------------------------------------
-- But :
--   Identifier la focaccia qui possède le plus grand nombre d’ingrédients.
--
-- SQL :
--   Jointure entre les tables focaccia et focaccia_ingredient
--   Création d'une sous-requête qui compte le nombre d'ingrédients par focaccia
--   Récupération du nombre maximum d'ingrédient pour chaque focaccia
-- ---------------------------------------------------------------------------
-- Résultat attendu :
--   Une seule focaccia (ou plusieurs en cas d’égalité) avec le maximum d’ingrédients.
--      Paysanne (12)
--
-- Résultat obtenu :
--   nom_focaccia
--   Paysanne
--
-- Écarts / commentaires :
--   Aucun écart fonctionnel entre le résultat attendu et le résultat obtenu
-- ---------------------------------------------------------------------------
SELECT f.nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON fi.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
HAVING COUNT(*) = (
SELECT MAX(nb_ingredients)
FROM (
    SELECT COUNT(*) AS nb_ingredients
    FROM focaccia_ingredient
    GROUP BY id_focaccia
    ) t
);


-- ---------------------------------------------------------------------------
-- Requête 8 : Liste des focaccias qui contiennent de l'ail
-- ---------------------------------------------------------------------------
-- But :
--   Afficher la liste des focaccias contenant l’ingrédient "Ail".
--
-- SQL :
--   Jointure entre les tables focaccia et ingredient, 
--   Exclure les focaccias qui ne contiennent pas d'ail
-- ---------------------------------------------------------------------------
-- Résultat attendu :
--   Une liste de focaccias dont la liaison contient l’ingrédient "Ail".
--   Soit (Mozaccia, Gorgonzollaccia, Raclaccia et Paysanne)
--
-- Résultat obtenu :
--   nom_focaccia
--   Mozaccia
--   Gorgonzollaccia
--   Raclaccia
--   Paysanne
--
-- Écarts / commentaires :
--   Aucun écart fonctionnel entre le résultat attendu et le résultat obtenu
-- --------------------------------------------------------------------------
SELECT DISTINCT focaccia.nom_focaccia FROM focaccia 
JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
JOIN ingredient ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom_ingredient = 'Ail';

-- ---------------------------------------------------------------------------
-- Requête 9 : Liste des ingrédients inutilisés
-- ---------------------------------------------------------------------------
-- But :
--   Afficher la liste des ingrédients présents dans `ingredient` mais non utilisés
--   dans `focaccia_ingredient`.
--
-- SQL :
--   (à compléter)
-- ---------------------------------------------------------------------------
-- Résultat attendu :
--   Une liste d’ingrédients dont aucun enregistrement n’existe dans la table de liaison.
--    ingrédients jamais utilisé (Salami, tomate cerise)
--
-- Résultat obtenu :
--   nom_ingredient
--   Salami
--   Tomate cerise
--
-- Écarts / commentaires :
--   Aucun écart constaté entre le résultat attendu et le résultat obtenu
-- ---------------------------------------------------------------------------
SELECT ingredient.nom_ingredient FROM ingredient 
LEFT JOIN focaccia_ingredient ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient 
WHERE focaccia_ingredient.id_ingredient IS NULL;