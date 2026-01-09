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