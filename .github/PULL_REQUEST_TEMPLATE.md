## 📌 Description

Décrire brièvement l’objectif de cette PR

(ex. création du schéma, ajout des données de test, écriture des requêtes de vérification, etc.).

---

## 🔗 Issue liée

Closes #XX

---

## 🧩 Type de changements

* [ ] Création / modification de script SQL
* [ ] Ajout ou modification du schéma de base de données
* [ ] Ajout de données de test (INSERT)
* [ ] Requêtes SQL de vérification
* [ ] Documentation (README, commentaires SQL)
* [ ] Autre (préciser)

---

## 🗄️ Scripts concernés

* [ ] `00_init.sql` (base + utilisateur + droits)
* [ ] `01_schema.sql` (tables, clés, contraintes)
* [ ] `02_insert_data.sql` (peuplement de la base)
* [ ] `03_test_queries.sql` (requêtes de vérification)
* [ ] README / documentation

---

## 🧪 Vérifications effectuées

* [ ] Scripts exécutés sans erreur
* [ ] Contraintes d’intégrité vérifiées (PK, FK, UNIQUE, NOT NULL)
* [ ] Ordre d’exécution des scripts respecté
* [ ] Données insérées cohérentes avec le schéma
* [ ] Requêtes de test exécutées avec succès

---

## ✅ Checklist avant merge

* [ ] Le script respecte le modèle conceptuel fourni
* [ ] Les champs obligatoires sont définis (`NOT NULL`)
* [ ] Les clés primaires et étrangères sont cohérentes
* [ ] Les valeurs uniques sont protégées (`UNIQUE`)
* [ ] Aucun accès inutile (utilisateur ≠ root)
* [ ] Aucun mot de passe réel ou sensible exposé
* [ ] Commentaires SQL clairs et explicites
* [ ] README mis à jour si nécessaire

---

## ⚠️ Points d’attention

* Écarts éventuels entre résultat attendu et obtenu
* Hypothèses faites à partir des données fournies
* Limitations connues du schéma ou des données
* Points à valider avec le modèle conceptuel
