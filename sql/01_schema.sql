-- ===========================================================================
-- 01_create_tables.sql
-- Objectif :
--   - Créer les tables selon le MCD : client, marque, boisson, ingredient,
--     focaccia, menu + tables de liaison :
--       focaccia_ingredient (comprend + quantite)
--       menu_boisson        (contient)
--       menu_achat          (achète + date_achat)
-- ===========================================================================

USE tifosi;

-- ---------------------------------------------------------------------------
-- Suppressions (ordre important à cause des clés étrangères)
-- ---------------------------------------------------------------------------
DROP TABLE IF EXISTS focaccia_ingredient;
DROP TABLE IF EXISTS menu_boisson;
DROP TABLE IF EXISTS menu_achat;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS focaccia;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS marque;

-- ---------------------------------------------------------------------------
-- Table client
-- ---------------------------------------------------------------------------
CREATE TABLE client
(
    id_client INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50)  NOT NULL,
    email VARCHAR(150) NOT NULL,
    code_postal INT UNSIGNED NOT NULL,
    CONSTRAINT uq_client_email UNIQUE(email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Table marque
-- ---------------------------------------------------------------------------
CREATE TABLE marque
(
    id_marque INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_marque VARCHAR(50) NOT NULL,
    CONSTRAINT uq_marque_nom UNIQUE(nom_marque)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Table boisson (une boisson appartient à une marque)
-- ---------------------------------------------------------------------------
CREATE TABLE boisson
(
    id_boisson INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_boisson VARCHAR(50) NOT NULL,
    id_marque   INT UNSIGNED NOT NULL,
    CONSTRAINT uq_boisson_nom UNIQUE(nom_boisson),
    CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Table ingredient
-- ---------------------------------------------------------------------------
CREATE TABLE ingredient
(
    id_ingredient INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_ingredient VARCHAR (50) NOT NULL,
    CONSTRAINT uq_ingredient_nom UNIQUE (nom_ingredient)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Table focaccia
-- ---------------------------------------------------------------------------
CREATE TABLE focaccia
(
    id_focaccia INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_focaccia VARCHAR (50) NOT NULL,
    prix         DECIMAL (5,2) NOT NULL,
    CONSTRAINT uq_focaccia_nom UNIQUE (nom_focaccia),
    CONSTRAINT ck_focaccia_prix CHECK (prix > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Table de liaison focaccia <-> ingredient (N:N) + quantite
-- ---------------------------------------------------------------------------
CREATE TABLE focaccia_ingredient
(
    id_focaccia INT UNSIGNED NOT NULL,
    id_ingredient INT UNSIGNED NOT NULL,
    quantite      INT UNSIGNED NOT NULL,

    CONSTRAINT pk_focaccia_ingredient PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT ck_focaccia_ingredient_quantite CHECK (quantite > 0),

    CONSTRAINT fk_fi_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    CONSTRAINT fk_fi_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Table menu
-- Selon le MCD : menu(id_menu, nom, prix)
-- + relation "est constitué" : menu -> focaccia (1,1 côté menu)
-- ---------------------------------------------------------------------------
CREATE TABLE menu
(
    id_menu INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_menu    VARCHAR (50) NOT NULL,
    prix        DECIMAL (5,2) NOT NULL,
    id_focaccia INT UNSIGNED NOT NULL,

    CONSTRAINT uq_menu_nom UNIQUE (nom_menu),
    CONSTRAINT ck_menu_prix CHECK (prix > 0),

    CONSTRAINT fk_menu_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Relation "contient" : menu <-> boisson (N:N)
-- Le MCD indique : menu (1,n) et boisson (0,n) => table de liaison
-- ---------------------------------------------------------------------------
CREATE TABLE menu_boisson
(
    id_menu INT
    UNSIGNED NOT NULL,
    id_boisson INT UNSIGNED NOT NULL,

    CONSTRAINT pk_menu_boisson PRIMARY KEY (id_menu, id_boisson),

    CONSTRAINT fk_mb_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    CONSTRAINT fk_mb_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Relation "achète" : client <-> menu (N:N) + date_achat
-- ---------------------------------------------------------------------------
CREATE TABLE menu_achat
(
    id_menu INT UNSIGNED NOT NULL,
    id_client  INT UNSIGNED NOT NULL,
    date_achat DATE NOT NULL,

    -- Option 1 (simple) : un client ne peut acheter un même menu qu'une seule fois
    -- CONSTRAINT pk_menu_achat PRIMARY KEY (id_menu, id_client),

    -- Option 2 (plus réaliste) : un client peut racheter le même menu à des dates différentes
    CONSTRAINT pk_menu_achat PRIMARY KEY (id_menu, id_client, date_achat),

    CONSTRAINT fk_ma_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    CONSTRAINT fk_ma_client FOREIGN KEY (id_client) REFERENCES client(id_client)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
