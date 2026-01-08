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
-- Création de la table client
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS client;
CREATE TABLE client (
    id_client INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAT(150) NOT NULL, 
    code_postal INT UNSIGNED NOT NULL,
    CONSTRAINT uq_client_email UNIQUE (email)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- ---------------------------------------------------------------------------
-- Création de la table marque
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS marque;
CREATE TABLE marque (
    id_marque INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_marque VARCHAR(50) NOT NULL,
    CONSTRAINT uq_marque_nom UNIQUE (nom_marque)
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------------
-- Création de la table boisson (une boisson appartient à une marque)
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS boisson;
CREATE TABLE boisson (
    id_boisson INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_boisson VARCHAR(50) NOT NULL,
    marque INT UNSIGNED NOT NULL,
    CONSTRAINT uq_boisson_nom UNIQUE (nom_boisson),
    CONSTRAINT fk_boisson_marque 
    FOREIGN KEY (marque) REFERENCES marque(id_marque)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------------
-- Création de la table ingrédient
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS ingredient;
CREATE TABLE ingredient (
    id_ingredient INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_ingredient VARCHAR(50) NOT NULL,
    CONSTRAINT uq_ingredient_nom UNIQUE (nom_ingredient)
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------------
-- Création de la table Focaccia
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS focaccia;
CREATE TABLE focaccia (
    id_focaccia INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_focaccia VARCHAR(100) NOT NULL,
    prix DECIMAL(6,2) NOT NULL,
    CONSTRAINT uq_focaccia_nom UNIQUE (nom_focaccia),
    CONSTRAINT ck_focaccia_prix CHECK (prix > 0)
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------------
-- Création de la liaison Foccia <-> ingrédient (N:N)
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS focaccia_ingredient;
CREATE TABLE focaccia_ingredient (
    id_focaccia INT UNSIGNED NOT NULL,
    id_ingredient INT UNSIGNED NOT NULL,
    quantite INT UNSIGNED NOT NULL,
    CONSTRAINT pk_focaccia_ingredient PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_focaccia_ingredient_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    CONSTRAINT fk_focaccia_ingredient_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE = InnoDB;