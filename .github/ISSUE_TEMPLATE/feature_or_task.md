---
name: Feature / Task (BDD MySQL)
about: Décrire une fonctionnalité ou une tâche liée à la base de données MySQL
title: "[SQL] "
labels: ["status:ready"]
assignees: []
---

## 🎯 Objectif

Décrire clairement ce que cette issue doit apporter à la base de données  
(ex. création du schéma, ajout de contraintes, insertion de données, requêtes de test).

---

## 📍 Contexte

Pourquoi cette tâche est nécessaire ?
- Lien avec le brief du projet *Tifosi*
- Partie concernée (création de la base, utilisateur MySQL, schéma, peuplement, vérification)
- Référence éventuelle au modèle conceptuel fourni

---

## ✅ À faire

- [ ] Identifier les tables / scripts concernés
- [ ] Rédiger ou modifier le script SQL correspondant
- [ ] Ajouter les contraintes nécessaires (PK, FK, NOT NULL, UNIQUE, CHECK)
- [ ] Tester l’exécution du script sans erreur
- [ ] Documenter si nécessaire (commentaires SQL ou README)

---

## 🧪 Critères d’acceptation

- [ ] Script SQL exécutable sans erreur
- [ ] Respect du modèle conceptuel fourni
- [ ] Contraintes d’intégrité correctement appliquées
- [ ] Aucun impact négatif sur les autres scripts
- [ ] Conforme au brief du devoir

---

## 🗄️ Scripts concernés

- [ ] `00_init.sql` (base de données, utilisateur, droits)
- [ ] `01_schema.sql` (tables, relations, contraintes)
- [ ] `02_insert_data.sql` (données de test)
- [ ] `03_test_queries.sql` (requêtes de vérification)
- [ ] README / documentation

---

## 🔗 Références

- Brief du projet *Tifosi*
- Page du modèle conceptuel (page 2/3)
- Issue(s) liée(s)
- Documentation MySQL pertinente (si nécessaire)

---

## 📝 Notes techniques

- Tables impactées :
- Relations concernées :
- Ordre d’exécution des scripts :
- Points de vigilance (contraintes, dépendances, données manquantes) :
