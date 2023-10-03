"# streaming-tm" 

<h1>Les requêtes</h1>

<h3>Les titres et dates de sortie des films du plus récent au plus ancien</h3>
<p>SELECT * FROM `Movies` ORDER BY realizedAt DESC</p>

<h3>Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique</h3>
<p>
    SELECT firstname, lastname, birthday
    FROM `Actors`
    WHERE birthday <= DATE_SUB(CURRENT_DATE, INTERVAL 30 YEAR)
    ORDER BY firstname ASC;
</p>

<h3>La liste des acteurs/actrices principaux pour un film donné</h3>
<p></p>

<h3></h3>
<p></p>

<h3></h3>
<p></p>

<h3></h3>
<p></p>