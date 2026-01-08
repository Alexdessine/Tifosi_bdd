
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

## 📝 Notes

- 🔒 Les contraintes d’intégrité et champs obligatoires sont définis dans `01_schema.sql`.
- ✅ Les requêtes de test et leurs commentaires sont regroupés dans `03_test_queries.sql`.
- 🔑 **Mot de passe de l’utilisateur MySQL `tifosi` (tests locaux uniquement)** : `tifosi`
