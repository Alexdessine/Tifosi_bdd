-- ===========================================================================
-- 01_create_tables.sql
-- Objectif :
--      - Créer le schéma marque
--      - Créer le schéma boisson
--      - Créer le schéma ingrédient
--      - Créer le schéma focaccia
--      - Créer le schéma focaccia_ingredient
-- ===========================================================================

USE tifosi;

-- ---------------------------------------------------------------------------
-- Création de la table marque
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS marque;
CREATE TABLE marque (
    id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom_marque VARCHAR(100) NOT NULL,
    CONSTRAINT uq_marque_nom UNIQUE (nom_marque)
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------------
-- Création de la table boisson (une boisson appartient à une marque)
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS boisson;
CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom_boisson VARCHAR(100) NOT NULL,
    marque INT NOT NULL,
    CONSTRAINT uq_boisson_nom UNIQUE (nom_boisson),
    CONSTRAINT fk_boisson_marque 
    FOREIGN KEY (marque) REFERENCES marque(id_marque)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE = InnoDB;
