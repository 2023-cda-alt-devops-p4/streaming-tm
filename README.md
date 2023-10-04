# Streaming-TM 

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
DELETE FROM Casting WHERE Id_Actors = 1;
DELETE FROM Actors WHERE Id_Actors = 1;
```

<h4>Afficher les 3 derniers acteurs/actrices ajouté(e)s</h4>

```sql
SELECT *
FROM Actors
ORDER BY Id_Actors DESC
LIMIT 3;
```