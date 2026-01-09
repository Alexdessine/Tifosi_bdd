
# 🍕 Tifosi — Base de données MySQL

## 🎯 Objectif

Concevoir une base de données MySQL nommée `tifosi`, créer un utilisateur dédié, définir le schéma relationnel, insérer des données de test, puis exécuter des requêtes de vérification.

## 📁 Contenu du dépôt

- 🛠️ `sql/00_init.sql` : création de la base + utilisateur MySQL + droits
- 🧱 `sql/01_schema.sql` : création du schéma (tables, contraintes, clés)
- 📥 `sql/02_insert_data.sql` : insertion des données de test (issues des fichiers fournis)
- 🔍 `sql/03_test_queries.sql` : script regroupant les 10 requêtes de test + commentaires
- 📊 `data/` : fichiers `.xlsx` fournis (source des données)

## ▶️ Exécution (exemple via MySQL CLI)

1. ▶️ Lancer `00_init.sql`
2. ▶️ Lancer `01_schema.sql`
3. ▶️ Lancer `02_insert_data.sql`
4. ▶️ Lancer `03_test_queries.sql`

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
