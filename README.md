### Streaming-TM 

<h2>Getting Started</h2>
<h3>Prérequis</h3>

Pour démarrer le projet streaming-tm, il vous faut ces logiciels d'installées :

- Docker
- MySQL Workbench ou un autre client SQL.

##

<h3>Comment initialiser le projet ?</h3>

Cloner le projet
```
git clone https://github.com/2023-cda-alt-devops-p4/streaming-tm.git
```
<br/>

Déployer le container (Attention d'être dans la racine du projet en exécutant la commande)
```
docker compose up
```
<br/>

Il vous faudra ensuite vous connecter à la base de données, vous pouvez modifier les accès à la base de données dans le fichier `.env`

Une fois connecté, exécuter le script SQL du fichier `streaming_tm_db.sql`, cela permettra de créer toutes les tables et les données.

Pour ajouter le trigger à la table Users, exécuter le script SQL du fichier `streaming_tm_trigger.sql`.

Pour ajouter la procédure afin de recherche les films d'un réalisateur en particulier, exécuter le script SQL du fichier `streaming_tm_procedure.sql`.

##

<h3>Comment utiliser la procédure ? Exécutez la requête SQL suivantes</h3>

```sql
USE streaming_tm_db;
CALL findMoviesByDirector('Christopher');
```

<br/>

##

<h3>Pour éteindre le projet (Attention d'être dans la racine du projet en exécutant la commande)</h3>

```
docker composer down
```

<br/>

##

<h3>Les configurations dans l'environnement</h3>

`MYSQL_ROOT_PASSWORD` : Le mot de passe par défaut du root est `password`, vous pouvez le changer si vous voulez avec cette variable d'environnement.

`MYSQL_DATABASE`: Il s'agit de la base de données créer par défaut, la base de données par défaut s'appelle `streaming_tm_db`, vous pouvez la changer mais n'oubliez pas de changer `USE streaming_tm_db;` dans le fichier `streaming_tm_db.sql`.

`MYSQL_USER`: Il s'agit du nom de l'utilisateur qui aura un accès complet à `MYSQL_DATABASE`, il ne s'agit pas du root ! L'utilisateur par défaut est `johndoe`

`MYSQL_PASSWORD`: Il s'agit du mot de passe pour `MYSQL_USER`, le mot de passe par défaut est `password`

`PORT`: Il s'agit du port du container et donc du port pour accéder à votre base de données, par défaut le port est `3306`

<br/>

<h2>Requêtes SQL</h2>

<h4>Les titres et dates de sortie des films du plus récent au plus ancien</h4>

```sql
SELECT * FROM Movies ORDER BY realizedAt DESC
```
##

<h4>Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique</h4>

```sql
SELECT firstname, lastname, birthday
FROM Actors
WHERE birthday <= DATE_SUB(CURRENT_DATE, INTERVAL 30 YEAR)
ORDER BY firstname ASC;
```
##

<h4>La liste des acteurs/actrices principaux pour un film donné</h4>

```sql
SELECT *
FROM Actors a
JOIN Casting c ON a.Id_Actors = c.Id_Actors
JOIN Movies m ON c.Id_Movies = m.Id_Movies
WHERE m.title = 'Inception';
```

<h4>La liste des films pour un acteur/actrice donné</h4>

```sql
SELECT m.*
FROM Movies m
JOIN Casting c ON m.Id_Movies = c.Id_Movies
JOIN Actors a ON c.Id_Actors = a.Id_Actors
WHERE a.firstname = "Leonardo" AND a.lastname = "DiCaprio";
```

<h4>Ajouter un film</h4>

```sql
INSERT INTO Movies (title, duration, realizedAt, Id_Directors) 
VALUES ('Film de test', '01:30:00', '2023-10-03', 2);
```

<h4>Ajouter un acteur/actrice</h4>

```sql
INSERT INTO Actors (firstname, lastname, birthday) 
VALUES ('John', 'Doe', '2000-01-10');
```

<h4>Modifier un film</h4>

```sql
UPDATE Movies
SET title = 'Nouveau titre'
WHERE Id_Movies = 1;
```

<h4>Supprimer un acteur/actrice</h4>

```sql
DELETE FROM Actors WHERE Id_Actors = 1;
```

<h4>Afficher les 3 derniers acteurs/actrices ajouté(e)s</h4>

```sql
SELECT *
FROM Actors
ORDER BY Id_Actors DESC
LIMIT 3;
```
