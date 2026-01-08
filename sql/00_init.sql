-- ===========================================================================
-- 00_init.sql
-- Objectif : 
-- - Créer la base de données MySQL 'tifosi'
-- - Créer un utilisateur MySQL dédié 'tifosi'
-- - Attribuer les droits nécessaires sur la base 'tifosi'
--
-- Ce script doit être exécuté avec un compte administrateur MySQL (ex: root)
-- ===========================================================================


-- ---------------------------------------------------------------------------
-- Création de la base de données
-- ---------------------------------------------------------------------------
DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi
    CHARACTER SET 'utf8mb4'
    COLLATE 'utf8mb4_unicode_ci';

-- ---------------------------------------------------------------------------
-- Création de l'utilisateur MySQL dédié
-- ---------------------------------------------------------------------------
DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'tifosi';

-- ---------------------------------------------------------------------------
-- Attribution des privilèges sur la base tifosi
-- ---------------------------------------------------------------------------
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;


-- ---------------------------------------------------------------------------
-- TEST DE VALIDATION (à exécuter manuellement)
-- ---------------------------------------------------------------------------
-- 1) Exécuter ce script depuis un terminal :
--      mysql -u root -p < 00_init.sql
--
--      Résultat attendu : 
--       - Aucune erreur affichée (succès de l'exécution)
--
-- 2) Vérifier l'existence de la base de données :
--      mysql -u root -p
--      SHOW DATABASES;
--
--      Résultat attendu :
--       - La base 'tifosi' apparaît dans la liste
--
-- 3) Vérifier la création de l'utilisateur : 
--      SELECT user, host FROM mysql.user WHERE user = 'tifosi';
--
--      Résultat attendu :
--       - tifosi| localhost
--
-- 4) Tester la connexion avec l'utilisateur dédié : 
--      mysql -u tifosi -p tifosi
--
--      Résultat attendu :
--       - Connexion réussie sans message d'erreur
--       - Accès autorisé à la base 'tifosi'