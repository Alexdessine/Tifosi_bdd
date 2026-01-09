
# 🍕 Tifosi — Base de données MySQL

## 🎯 Objectif

Concevoir une base de données MySQL nommée `tifosi`, créer un utilisateur dédié, définir le schéma relationnel, insérer des données de test, puis exécuter des requêtes de vérification.

## ⚙️ Environnement de développement

- **SGBD** : MySQL Community Server  
- **Version utilisée** :  
  `mysql  Ver 8.4.3 for Win64 on x86_64 (MySQL Community Server - GPL)`
- **Encodage** : `utf8mb4`
- **Interface utilisée** : MySQL CLI (ligne de commande)

> ⚠️ Les contraintes `CHECK` sont effectives à partir de MySQL 8.x.  
> Le projet a été développé et testé avec MySQL 8.4.3.

## 📁 Contenu du dépôt

- 🛠️ `sql/00_init.sql` : création de la base + utilisateur MySQL + droits
- 🧱 `sql/01_schema.sql` : création du schéma (tables, contraintes, clés)
- 📥 `sql/02_insert_data.sql` : insertion des données de test (issues des fichiers fournis)
- 🔍 `sql/03_test_queries.sql` : script regroupant les 10 requêtes de test + commentaires
- 📊 `data/` : fichiers `.xlsx` fournis (source des données)

## ▶️ Exécution (exemple via MySQL CLI)

### 1️⃣ Accéder au dossier du projet

```bash
cd chemin/vers/le/projet/tifosi/sql
```
---

### 2️⃣ Création de la base et de l'utilisateur MySQL

```bash
mysql -u root -p < 00_init.sql
```

* Le mot de passe `root` est demandé.
* Le script `00_init.sql` est exécuté.
* Aucune sortie à l'écran = succès.

---

### 3️⃣ Création du schéma de la base de données

```bash
mysql -u tifosi -p --default-character-set=utf8mb4 < 01_schema.sql
```

* Création des tables, clé primaires, clés étrangères et contraintes.
* L'encodage UTF-8 est forcer pour garantir la gestion des accents.
* Le mot de passe `tifosi` est demandé.
* Le script `01_schema.sql` est exécuté.
* Aucune sortie à l'écran = succès.

---

### 4️⃣ Insertion des données de test

```bash
mysql -u tifosi -p --default-character-set=utf8mb4 < 02_insert_data.sql
```
Ce script :
* vide les tables avant insertion (`TRUNCATE`),
* respecte l'ordre des dépendances (clés étrangères),
* insère les données issues des fichiers `.xlsx` fournis,
* garantit le bon enregistrement des caractères accentués.

---

### 5️⃣ Exécution des requêtes de test

```bash
mysql -u tifosi -p --default-character-set=utf8mb4 -t < 03_test_queries.sql
```

Options utilisées :

* `-t`: affichage tabulaire lisible
* `--default-character-set=utf8mb4`: pour les caractères accentués.

---

## 📥 Préparation de l’import des données (.xlsx)

Les fichiers `.xlsx` fournis servent de **sources de données** pour alimenter la base `tifosi`.
Avant l'insertion en base, certaines données nécessitent une **transformation** afin de respecter le modèle relationnel.

### Fichiers sources et tables cibles

|       Fichier      | Tables concernés                                |
| ------------------ | ----------------------------------------------- |
| `ingredients.xlsx` | `ingredients`                                   |
| `marque.xlsx`      | `marque`                                        |
| `boisson.xlsx`     | `boisson`                                       |
| `focaccia.xlsx`    | `focaccia`, `ingredient`, `focaccia_ingredient` |

---

### Règles de transformation principales

- Les colonnes relationnelles simples (identifiants, nom, prix) snt insérées telles quelles.
- Les listes d'ingrédients présentes dans `focaccia.xlsx` sont tranformées en relations **N:N** via la table `focaccia_ingredient`.
- Les quantités associées aux ingrédients : 
  - sont définies par défau dans le fichier,
  - peuvent être surchargées lorsqu'une valeur est indiquée entre parenthèses (ex. `champignon(80)`),
- Les quantités sont stockées exclusivement dans la table liaison `focaccia_ingredient`.

---

### Ordre d'insertion des données

Afin de respecter les contraintes de clés étrangères, les données doivent être insérées dans l'ordre suivant:

1. `marque`
2. `boisson`
3. `ingredient`
4. `focaccia`
5. `focaccia_ingredient`
6. `menu`
7. `menu_boisson`
8. `menu_achat`

---

## 📝 Notes

- 🔒 Les contraintes d’intégrité et champs obligatoires sont définis dans `01_schema.sql`.
- ✅ Les requêtes de test et leurs commentaires sont regroupés dans `03_test_queries.sql`.
- 🔑 **Mot de passe de l’utilisateur MySQL `tifosi` (tests locaux uniquement)** : `tifosi`
