---
author: François Gagnon
layout: page
title: 'Cadre opératoire'
permalink: /cadre-operatoire/
---

L’état des connaissances scientifiques dresse en quelque sorte l’agenda pour ce projet. La première étape est de tester les conclusions tirées de l’élection fédérale de 1988 ([Blais et Nadeau, 1996][bn1996]; [Blais et Bodet, 2006][bb2006]) avec les données des élections fédérales plus récentes (2004, 2006, 2008 et 2011). Plus précisément, la première ambition de cet essai est de tester les conclusions de [Blais et Bodet (2006)][bb2006], qui se base sur les données de l’[Étude électorale canadienne (ÉÉC)][eec], une vaste enquête dont plusieurs questions s’intéressent à la perception que les électeurs ont des candidats et de la course. Les auteurs avaient testé l’influence des facteurs objectifs et subjectifs sur la prédiction de victoire des partis politiques à l’élection fédérale de 1988. Plus précisément, les facteurs subjectifs étaient la sophistication politique et l’identification partisane des répondants alors que le facteur objectif était l’information disponible au répondant (sous forme de sondages pour la course nationale et sous forme de résultats électoraux passés pour la course locale). Il sera donc intéressant, tout d’abord, de tester ces facteurs subjectifs et objectifs pour les courses plus récentes.

Ce test sera immédiatement bonifié par l’ajout d’une variable, l’intérêt pour la politique et/ou pour la campagne électorale en cours.

Les hypothèses testées s’organisent donc en deux groupes, suivant l’influence des facteurs personnels et de l’information externe. La première hypothèse, la plus intuitive, est que les électeurs surestiment les chances de victoire des candidats dont ils partagent l’identification partisane. Afin d’approfondir, il sera testé si la sophistication du répondant mitige cet effet. La seconde hypothèse est que l’information externe disponible aux répondants influence leurs prédictions de victoire (locale et nationale). Dans ce cas, il est posé que l’intérêt pour la politique du répondant exacerbe cet effet, ce qui sera aussi examiné.

Dans le but de mettre à l’épreuve le modèle des quatre facteurs affectifs et cognitifs développé ci-haut, l’opérationnalisation des variables est cependant limitée par la disponibilité des données du corpus choisi. Le tableau ci-dessous résume les principales données colligées dans le cadre de l’ÉÉC et leur organisation dans les variables décrites ci-après.

<figure>
	<figcaption>Tableau 1 : Variables et indicateurs disponibles dans les Études électorales canadiennes</figcaption>

<table>

<tr>
	<th>Variable</th>
	<th>2004</th>
	<th>2006</th>
	<th>2008</th>
	<th>2011</th>
</tr>

<tr>
	<td>Prédiction nationale</td>
	<td>Chances de chaque parti de gagner</td>
	<td>Chances des trois premiers partis de gagner</td>
	<td>Parti gagnant et majorité</td>
	<td>Parti gagnant et majorité</td>
</tr>
	
<tr>
	<td>Prediction locale</td>
	<td>Chances de chaque parti de remporter</td>
	<td>Chances des deux premiers partis de remporter </td>
	<td>Vainqueur et deuxième </td>
	<td>Vainqueur et deuxième</td>
</tr>

<tr>
	<td>Sophistication</td>
	<td>chefs des partis<br />	pol étrangère<br />	PM province<br />	ministre <br />	autre question d’actualité canadienne<br /> 	évaluation subjective par l'intervieweur</td>
	
	<td>chefs des partis<br />pol étrangère<br />PM province<br />ministre<br />autre question d’actualité canadienne<br />vu campagne DGE<br />évaluation subjective par l'intervieweur</td>

	<td>chefs des partis<br />pol étrangère <br />PM province<br />ministre<br />autre question d’actualité canadienne<br />vu campagne DGE<br />évaluation subjective par l'intervieweur</td>
	
	<td>PM province<br />ministre<br />autre question d’actualité canadienne<br />vu campagne DGE<br />évaluation subjective par l'intervieweur<br/>qui est en avance dans les sondages?</td>
</tr>

<tr>
	<td>Information</td>
	<td>sondages</td>
	<td>sondages</td>
	<td>sondages</td>
	<td>sondages<br />résultat de l'élection précédente dans la circonscription</td>
</tr>

<tr>
	<td>Intérêt</td>
	<td>intérêt pour élection fédérale (0 à 10)<br />
		intérêt pour la politique en général (0 à 10)</td>
	<td>intérêt pour élection fédérale (0 à 10)<br />
		intérêt pour la politique en général (0 à 10)</td>
	<td>intérêt pour élection fédérale (0 à 10)<br />
		intérêt pour la politique en général (0 à 10)</td>
	<td>intérêt pour élection fédérale (0 à 10)<br />
		trouve que c'est une gaspillage ou inutile</td>
</tr>

<tr>
	<td>Identification partisane</td>
	<td>à quel parti vous identifiez-vous?</td>
	<td>à quel parti vous identifiez-vous?</td>
	<td>à quel parti vous identifiez-vous?</td>
	<td>à quel parti vous identifiez-vous?</td>
</tr>

</table>
</figure>




### Variable expliquée : chances de gagner	

La variable expliquée, dans les hypothèses 1 et 2, est la prédiction du résultat de l’élection. Pour les élections de 2004 et 2006, l’ÉÉC demandait à ses répondants d’évaluer les chances de chaque parti de remporter le plus de sièges, sur une échelle de 0 à 100. Cette formulation est avantageuse pour la présente analyse, puisqu’elle maximise les réponses et fournit une échelle très fine pour formuler une prédiction. Cependant, les réponses données ne sont pas nécessairement précises&nbsp;: les répondants peuvent fournir une approximation très grossière sans se soucier réellement de ce qu’elle signifie. Par exemple, quelqu’un pouvait très bien donner 50&nbsp;% de chances de victoire à chaque parti. Pour cette raison, avant toute analyse, les réponses ont été normalisées sur le total des chances données pour tous les partis (les réponses du répondant ayant donné 50&nbsp;% de chances aux trois principaux partis auraient donc été normalisées sur le total de 150&nbsp;% afin de totaliser 100&nbsp;%, donc 33&nbsp;% pour chaque parti). 

Une fois normalisées, les prédictions de victoire de chaque partie sont distribuées relativement normalement autour de la moyenne, avec cependant des pics aux extrêmes indiquant la certitude de défaite ou de victoire. La différence dans la distribution des données permet d’apprécier la différence contextuelle entre la campagne électorale de 2004 et celle de 2006&nbsp;: alors qu’en 2004, les répondants de l’ÉÉC faisaient preuve d’une plus grande certitude sur les chances des trois principaux partis, les prédictions émises en 2006 sont beaucoup moins catégoriques.

<figure>
    <figcaption>Graphique 2&nbsp;: Prédiction des chances de victoire des principaux partis nationaux, 2004 et 2006</figcaption>
    <img src="../graphiques/histchn2004-6.png" alt="" />
</figure>


Pour l’élection de 2008, le questionnaire de l’ÉÉC demandait plutôt «&nbsp;quel parti a le plus de chances de gagner&nbsp;?&nbsp;» Pour les besoins de l’analyse, ces réponses ont été reformulées en variables dichotomiques décrivant une prédiction de victoire pour chaque parti, permettant une meilleure comparaison avec les données de 2004 et 2006.
Une troisième façon de poser la question a été utilisée&nbsp;: l’ÉÉC de 2011 demandait quant à elle aux répondants de choisir entre un gouvernement libéral majoritaire, libéral minoritaire, conservateur majoritaire, conservateur minoritaire, néodémocrate ou autre. Ces réponses ont aussi été reformulées en variables dichotomiques selon chacun de ces scénarios.

En termes relatifs, une forte majorité des électeurs avait correctement prédit une victoire conservatrice en 2008 et en 2011, avec cependant une importante proportion de prédiction d’un gouvernement minoritaire pour 2011. 

<figure>
    <figcaption>Graphique 3&nbsp;: Prédiction des chances de victoire des principaux partis nationaux, 2008 et 2011 </figcaption>
    <img src="../graphiques/piepred8-11.png" alt="" />
</figure>

### Variables explicatives	

Alors que les questions demandant aux répondant leurs prédictions de chances de gagner ne sont pas nécessairement comparables d’une élection à l’autre, les autres variables pertinentes sont particulièrement constantes&nbsp;: l’ÉÉC a, dans plusieurs cas, maintenu la formulation exacte des questions.

Ainsi, pour l’identification partisane, l’ÉÉC posait la question «&nbsp;En politique fédérale, vous considérez-vous habituellement […]&nbsp;», permettant au répondant de choisir un des principaux partis, un autre parti ou aucune de ces réponses. On peut observer des différences dans la composition de l’identification partisane&nbsp;: beaucoup plus de «&nbsp;aucun&nbsp;» en 2004 et en 2011, plus de «&nbsp;autres&nbsp;» en 2006 et en 2008, mais une répartition entre les trois principaux partis nationaux qui est cohérente avec la tendance des résultats des élections, c’est-à-dire une progressive baisse des appuis au PLC et un appui grandissant au PCC, alors que le NPD ne pouvait se targuer d’avoir plus de partisans malgré un vote réel plus important.

<figure>
    <figcaption>Graphique 4&nbsp;: Identification partisane des répondants</figcaption>
    <img src="../graphiques/idp2004-6-8-11.png" alt="" />
</figure>

L’intérêt pour la politique canadienne est aussi une variable directement observée&nbsp;: chaque édition du questionnaire de l’ÉÉC demandait aux répondants de mesurer leur intérêt pour la campagne électorale en cours sur une échelle de 0 à 10. Comme le montre le graphique ci-dessous, malgré une baisse en 2006, l’intérêt déclaré pour la politique semble distribué de façon comparable d’une élection à l’autre.

<figure>
    <figcaption>Graphique 5&nbsp;: Intérêt des répondants pour la campagne et la politique </figcaption>
    <img src="../graphiques/i2004-6-8-11.png" alt="" />
</figure>

La variable de la sophistication est calculée d’après une moyenne de bonnes réponses à quelques questions de culture politique (nommer le premier ministre de sa province, quelques ministres et des personnes ayant marqué l’actualité) et de l'évaluation subjective de l’intervieweur. Cette mesure, bien qu’imparfaite pour bien évaluer la compréhension que le répondant a des enjeux politiques et de la campagne électorale en cours, permet à tout le moins de différencier ceux qui en ignorent jusqu’aux rudiments. Il n’est toutefois pas impossible que cette mesure sous-estime par exemple la connaissance des répondants qui sont plus à l’aise avec les enjeux et surestime celle de répondants qui n’ont qu’une connaissance superficielle des acteurs politiques. De 2004 à 2008, la distribution de cette variable est relativement uniforme, avec une légère tendance à la hausse au fil du temps.

<figure>
    <figcaption>Graphique 6&nbsp;: Sophistication politique des répondants</figcaption>
    <img src="../graphiques/s2004-6-8-11.png" alt="" />
</figure>

Comment justifier la présence des variables sophistication et intérêt, qui sont fortement liées&nbsp;? A priori, un plus grand intérêt pour la politique fédérale pourrait expliquer une plus grande sophistication des répondants. Cependant, comme leur corrélation n’est pas particulièrement forte et afin de ne pas écarter de potentielles explications, les deux variables sont gardées.

<figure>
    <figcaption>Graphique 7&nbsp;: Corrélation entre l’intérêt pour la politique et la sophistication politique</figcaption>
    <img src="../graphiques/si2004-6-8-11.png" alt="" />
</figure>

La variable de l’information qui est disponible pour les répondants est basée sur les sondages diffusés au cours de la campagne électorale (pour la course nationale). Pour les quatre élections étudiées, il est possible d’associer le moment des entrevues avec les sondages les plus récents. 

<figure>
    <figcaption>Graphique 8&nbsp;: Intentions de votes selon les sondages publiés pendant la campagne électorale</figcaption>
    <img src="../graphiques/sond2004-6-8-11.png" alt="" />
</figure>

Les sondages sont associés à chaque réponse selon la date de l’entrevue. Le principe est que le sondage le plus récent, celui qui a été publié la journée même, a fait l’objet d’une couverture médiatique et a pu être discuté dans l’environnement du répondant.

Pour l’élection de 2011, la disponibilité des données géographiques de l’ÉÉC permet de s’intéresser, en plus, à la prédiction des chances de gagner des candidats dans la course locale. Comme les sondages locaux sont beaucoup moins nombreux, c’est plutôt le vainqueur de l’élection précédente (en intégrant directement les données d’Élections Canada) dans la circonscription du répondant qui agira comme variable d’information.

Comme cet élément de la variable d’information faisait partie du modèle de [Blais et Bodet (2006)][bb2006] et que les questions de l’ÉÉC ont changé au fil des éditions, la réplication pour les élections de 2004, 2006 et 2008 ne pourra être que partielle. La formulation des hypothèses tente toutefois de suivre l’esprit de cette étude.


[bn1996]: http://www.sciencedirect.com/science/article/pii/026137949400014X "Blais, André et Richard Nadeau. 1996. «Measuring strategic voting: A two-step procedure.» Electoral Studies 15(1): 39–52."
[bb2006]: https://www.jstor.org/stable/42956137 "Blais, André, et Marc André Bodet. 2006. «How Do Voters Form Expectations about the Parties’ Chances of Winning the Election?». Social Science Quarterly. Vol. 87, n°3, p. 477–493."
[eec]: http://ces-eec.arts.ubc.ca/french-section/accueil/ "Étude électorale canadienne"




<p align="center">
* * *
</p>

Prochain chapitre&nbsp;: [Influence des facteurs personnels](/facteurs-personnels/)
